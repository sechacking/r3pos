--2011.06.13中午修改过滤类型；
--创建视图：RIM_SD_CO (订单主表)
drop view RIM_SD_CO;
create view RIM_SD_CO
as
select 
  CO_NUM,      --订单号ID
  COM_ID,      --供应商公司ID
  CUST_ID,     --客户编号（零售户）ID
  CRT_DATE,    --创建日期
  BORN_DATE,   --生效日期 为客户保留库存
  ARR_DATE,    --送达日期, 承诺订单的商品送达到客户手中的日期
  QTY_SUM,     --数量合计  
  AMT_SUM,     --应收金额合计
  STATUS       --单据状态		
from SD_CO
where STATUS in ('05','06') ;


 
--2011.06.16 增加设置RimLink分布式事务参数：
ALTER SERVER RIMLINK OPTIONS (ADD DB2_TWO_PHASE_COMMIT 'Y' ) ; 

--修改对照的视图：RIM_GOODS_RELATION
drop view RIM_GOODS_RELATION;
create view RIM_GOODS_RELATION
as
select
  e.com_id as TENANT_ID,      --企业（公司）ID（包括省级、地市公司）
  a.item_id as GODS_ID,       --商品内码
  a.item_code as GODS_CODE,   --商品编码
  a.item_name as GODS_NAME,   --商品名称
  a.short_name as GODS_SNAME, --商品简称 
  b.kind as SORT_ID2,         --烟分类（1：一类烟..6:无价类）
  b.BRD_KIND as SORT_ID4,     --是否重点品牌(0:否;1：是) 
  b.IS_IMPORTED as SORT_ID6,  --省内外烟 
  b.spec as GODS_SPEC,        --商品规格
  '条' as CALC_UNIT,          --单位
  PACK_BAR as PACK_BARCODE,   --条条码
  BOX_BAR as BOX_BARCODE,     --盒条码
  um2.UM_ID as PACK_UNIT_ID,  --条单位ID
  um1.UM_ID as BOX_UNIT_ID,   --盒单位ID
  um2.um_size/um1.um_size as CAlC_AMT, --条换算成合的换算关系
  c.pri as PACK_INPRICE,      --批发价
  d.pri as PACK_OUTPRICE      --零售价
from sd_item a,sd_item_tobacco b,
     (SELECT A.ITEM_ID,A.UM_ID,COALESCE(B.UM_SIZE,A.UM_SIZE) UM_SIZE FROM (SELECT I.ITEM_ID,U.UM_ID,U.UM_SIZE FROM SD_ITEM I,SD_UM U) A 
       LEFT JOIN SD_ITEM_UM B ON A.ITEM_ID=B.ITEM_ID AND A.UM_ID=B.UM_ID )um1,
     (SELECT A.ITEM_ID,A.UM_ID,COALESCE(B.UM_SIZE,A.UM_SIZE) UM_SIZE FROM (SELECT I.ITEM_ID,U.UM_ID,U.UM_SIZE FROM SD_ITEM I,SD_UM U) A 
       LEFT JOIN SD_ITEM_UM B ON A.ITEM_ID=B.ITEM_ID AND A.UM_ID=B.UM_ID)um2,
     sd_item_pri c,
     sd_item_pri d,
     sd_item_com e
where e.com_id=d.com_id and e.com_id=c.com_id and c.com_id=d.com_id and a.item_id=b.item_id and a.item_id=um1.item_id and a.item_id=um2.item_id 
      and um1.UM_ID='02' and um2.UM_ID='03' and
      a.item_id=c.item_id and a.item_id=d.item_id and a.item_id=e.item_id and  c.pri_type='03' and d.pri_type='04' and a.is_mrb='1' and 
      c.is_mrb='1' and e.is_mrb='1';    


--修改视图：RIM_MESSAGE
DROP NICKNAME RIM_MESSAGE_TAB;
CREATE NICKNAME RIM_MESSAGE_TAB FOR RIMLINK.DB2ADMIN.RIM_MESSAGE;
Create VIEW RIM_MESSAGE as   
select
  COM_ID,MSG_ID,TYPE,TITLE,CONTENT,USE_DATE,INVALID_DATE,OPERATOR,REC_TYPE,RECEIVER,STATUS,UPD_DATE,UPD_TIME,RECEIVER_TYPE, saleorg_id, 
  slsman_id,sale_center_id   
from RIM_MESSAGE_TAB

--修改创建：RIM_RM_CUST
drop view RIM_RM_CUST;
create view RIM_RM_CUST as select * from RM_CUST; 

--2011.08.29 PM：订单中间主表增加预计到货日期：
alter table INF_INDEORDER Add ARR_DATE varchar(10);
   
--修改对照的视图：RIM_GOODS_RELATION
drop view RIM_GOODS_RELATION;
create view RIM_GOODS_RELATION
as
select
  e.com_id as TENANT_ID,      --企业（公司）ID（包括省级、地市公司）
  a.item_id as GODS_ID,       --商品内码
  a.item_code as GODS_CODE,   --商品编码
  a.item_name as GODS_NAME,   --商品名称
  a.short_name as GODS_SNAME, --商品简称 
  b.kind as SORT_ID2,         --烟分类（1一类烟..6无价类）
  b.BRD_KIND as SORT_ID4,     --是否重点品牌(0否1是) 
  b.IS_IMPORTED as SORT_ID6,  --省内外烟 
  e.BRD_TYPE as SORT_ID10,    --品牌(1是新品,2紧俏,3顺销)
  b.spec as GODS_SPEC,        --商品规格
  '条' as CALC_UNIT,          --单位
  (case when a.ITEM_KIND='4' and length(coalesce(PACK_BAR,''))>0 then 
    (case when substr(PACK_BAR,1,1)='F' then 'f'||substr(PACK_BAR,2,length(PACK_BAR)-1) when substr(PACK_BAR,1,1)='f' then PACK_BAR else 'f'||PACK_BAR end) 
   else PACK_BAR end) as PACK_BARCODE,   --条条码
  (case when a.ITEM_KIND='4' and length(coalesce(BOX_BAR,''))>0 then 
    (case when substr(BOX_BAR,1,1)='F' then 'f'||substr(BOX_BAR,2,length(BOX_BAR)-1) when substr(BOX_BAR,1,1)='f' then BOX_BAR else 'f'||BOX_BAR end) 
   else BOX_BAR end) as BOX_BARCODE,     --盒条码  
  um2.UM_ID as PACK_UNIT_ID,  --条单位ID
  um1.UM_ID as BOX_UNIT_ID,   --盒单位ID
  um2.um_size/um1.um_size as CAlC_AMT, --条换算成合的换算关系
  c.pri as PACK_INPRICE,      --批发价
  d.pri as PACK_OUTPRICE      --零售价
from sd_item a,sd_item_tobacco b,
     (SELECT A.ITEM_ID,A.UM_ID,COALESCE(B.UM_SIZE,A.UM_SIZE) UM_SIZE FROM (SELECT I.ITEM_ID,U.UM_ID,U.UM_SIZE FROM SD_ITEM I,SD_UM U) A 
       LEFT JOIN SD_ITEM_UM B ON A.ITEM_ID=B.ITEM_ID AND A.UM_ID=B.UM_ID )um1,
     (SELECT A.ITEM_ID,A.UM_ID,COALESCE(B.UM_SIZE,A.UM_SIZE) UM_SIZE FROM (SELECT I.ITEM_ID,U.UM_ID,U.UM_SIZE FROM SD_ITEM I,SD_UM U) A 
       LEFT JOIN SD_ITEM_UM B ON A.ITEM_ID=B.ITEM_ID AND A.UM_ID=B.UM_ID)um2,
     sd_item_pri c,
     sd_item_pri d,
     sd_item_com e
where e.com_id=d.com_id and e.com_id=c.com_id and c.com_id=d.com_id and a.item_id=b.item_id and a.item_id=um1.item_id and a.item_id=um2.item_id 
      and um1.UM_ID='02' and um2.UM_ID='03' and
      a.item_id=c.item_id and a.item_id=d.item_id and a.item_id=e.item_id and  c.pri_type='03' and d.pri_type='04' and a.is_mrb='1' and 
      c.is_mrb='1' and e.is_mrb='1';    

--创建视图：RIM_SD_CO_LINE ( 订单明明细表)
drop view RIM_SD_CO_LINE;
create view RIM_SD_CO_LINE
as
select 
  CO_NUM,   --订单编号
  LINE_NUM, --行号
  ITEM_ID,  --商品编号
  UM_ID,    --计量单位
  QTY_NEED, --需求数量
  QTY_VFY,  --审核数量
  QTY_ORD,  --订购数量
  PRI,      --折扣价格
  PRI3,     --三级批发价
  AMT,      --含税金额, 金额=订购数量*折扣价格
  RET_AMT,  --折扣额
  NOTE as NOTE   --备注					
from SD_CO_LINE
where QTY_ORD<>0; 
 
 
 
 