--为桌面菜单添加资源包定义
alter table CA_MODULE add ACTION_RES varchar(50);

--快捷菜单定义
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('3','桌  面','MODU_TYPE','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('4','工具条','MODU_TYPE','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('5','导航栏','MODU_TYPE','00',5497000);

--产品对应的资料包信息
alter table CA_PROD_INFO add RES_VERSION varchar(10);
alter table CA_PROD_INFO add RES_DESKTOP varchar(255);
alter table CA_PROD_INFO add RES_IMAGES varchar(255);

--// 添加收支项目 “固定保证金”、“滚动保证金”、“销售返利”、“市场费用”
insert into PUB_CODE_INFO(tenant_id,code_id,code_name,code_spell,code_type,seq_no,comm,time_stamp)
select TENANT_ID,'6E3CB7C8-C3B8-48D6-B508-F8D98ED6253C','市场费用','SCFY','3',6,'00',5497000 from CA_TENANT;
insert into PUB_CODE_INFO(tenant_id,code_id,code_name,code_spell,code_type,seq_no,comm,time_stamp)
select TENANT_ID,'206FEBCB-6550-4EA0-A8E6-E8728AADA1BA','销售返利','XSFL','3',6,'00',5497000 from CA_TENANT;
insert into PUB_CODE_INFO(tenant_id,code_id,code_name,code_spell,code_type,seq_no,comm,time_stamp)
select TENANT_ID,'B43EF134-66A1-41DF-A921-EFD76198307F','固定保证金','GDBZJ','3',6,'00',5497000 from CA_TENANT;
insert into PUB_CODE_INFO(tenant_id,code_id,code_name,code_spell,code_type,seq_no,comm,time_stamp)
select TENANT_ID,'E9AED0B1-050C-4EFB-AA7A-0A64FE45EF97','滚动保证金','GDBZJ','3',6,'00',5497000 from CA_TENANT;

--指标类型
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('1','返利考核','IDX_TYPE','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('2','计提考核','IDX_TYPE','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('3','业绩考核','IDX_TYPE','00',5497000);

--考核类型
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('1','年度考核','KPI_TYPE','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('2','季度考核','KPI_TYPE','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('3','按实销量','KPI_TYPE','00',5497000);

--考核标准
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('1','按销量完成率','KPI_DATA','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('2','按金额完成率','KPI_DATA','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('3','按毛利完成率','KPI_DATA','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('4','按完成销量','KPI_DATA','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('5','按完成金额','KPI_DATA','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('6','按完成毛利','KPI_DATA','00',5497000);
--计算标准
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('1','按销量<线性>','KPI_CALC','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('2','按金额<线性>','KPI_CALC','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('3','按毛利<线性>','KPI_CALC','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('4','按销量<累进>','KPI_CALC','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('5','按金额<累进>','KPI_CALC','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('6','按毛利<累进>','KPI_CALC','00',5497000);

--是否启用阶梯考核
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('1','启用','KPI_OPTN','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('2','禁用','KPI_OPTN','00',5497000);

--应收账款 ACC_RECVABLE_INFO
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('5','其他收入','RECV_TYPE','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('6','其他支出','RECV_TYPE','00',5497000);
--应付账款 ACC_PAYABLE_INFO
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('7','其他收入','ABLE_TYPE','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('8','其他支出','ABLE_TYPE','00',5497000);


--考核指标
CREATE TABLE MKT_KPI_INDEX (
        --企业代码
	TENANT_ID int NOT NULL ,
        --指标ID号
	KPI_ID char(36) NOT NULL ,
        --指标名称
	KPI_NAME varchar(50) NOT NULL ,
        --拼音码
	KPI_SPELL varchar(50) NOT NULL ,
        --指标类型
	IDX_TYPE char (1) NOT NULL ,
        --计算标准
	KPI_CALC char(1) NOT NULL ,
        --考核类型
	KPI_TYPE char(1) NOT NULL ,
        --显示单位
	UNIT_NAME varchar(10) NOT NULL ,
        --考核标准
	KPI_DATA char(1) NOT NULL ,
	
	        --标准系数
	KPI_AGIO decimal(18, 3) NOT NULL ,
	        --是否启用
	KPI_OPTN char(1) NOT NULL ,

        --备注
	REMARK varchar (100) ,
        --通讯标志
	COMM varchar (2) NOT NULL DEFAULT '00',
        --时间戳 当前系统日期*86400000
  TIME_STAMP bigint NOT NULL,
	CONSTRAint PK_MKT_KPI_INDEX PRIMARY KEY  
	(
		TENANT_ID,
		KPI_ID
	)
)  IN R3TB4K_BAS;

--是否允许借量
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('1','允许','USING_BRRW','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('2','禁止','USING_BRRW','00',5497000);

--考核指标标准
CREATE TABLE MKT_KPI_OPTION (
        --企业代码
	TENANT_ID int NOT NULL ,
        --考核指标
	KPI_ID char (36) NOT NULL ,
        --考核周期(年度时 1是上半年 2是下半年 季时 1,2,3,4表示4个季度,其他情况为0)
	KPI_LV char (36) NOT NULL ,
        --级别，每个指标重 1 开始计数
	SEQNO int NOT NULL ,
	      --达标率
	KPI_RATE decimal(18, 3) ,
	      --达标量
	KPI_AMT decimal(18, 3) ,
	      --考时段
	KPI_DATE1 int ,
	KPI_DATE2 int ,
        --达标后折扣
	KPI_AGIO decimal(18, 3) ,
	      --是否允许借量
	USING_BRRW char(1) ,
        --通讯标志
	COMM varchar (2) NOT NULL DEFAULT '00',
        --时间戳 当前系统日期*86400000
  TIME_STAMP bigint NOT NULL,
	CONSTRAint PK_MKT_KPI_OPTION PRIMARY KEY 
	(
		TENANT_ID,
		KPI_ID,
		KPI_LV,
		SEQNO
	) 
)  IN R3TB4K_BAS;
CREATE INDEX IX_MKPO_KPI_ID ON MKT_KPI_OPTION(TENANT_ID,KPI_ID);

--考核指标对应商品清单
CREATE TABLE MKT_KPI_GOODS (
        --企业代码
	TENANT_ID int NOT NULL ,
        --考核指标
	KPI_ID char (36) NOT NULL ,
        --商品编码
	GODS_ID char (36) NOT NULL ,
        --考核单位
	UNIT_ID char (36) NOT NULL ,
        --通讯标志
	COMM varchar (2) NOT NULL DEFAULT '00',
        --时间戳 当前系统日期*86400000
  TIME_STAMP bigint NOT NULL,
	CONSTRAint PK_MKT_KPI_GOODS PRIMARY KEY 
	(
		TENANT_ID,
		KPI_ID,
		GODS_ID
	) 
)  IN R3TB4K_BAS;
CREATE INDEX IX_MKPG_KPI_ID ON MKT_KPI_GOODS(TENANT_ID,KPI_ID);

--是否允许借量
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('1','经销合同','PLAN_TYPE','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('2','年度目标','PLAN_TYPE','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('3','市 场 费','PLAN_TYPE','00',5497000);
--销售计划
CREATE TABLE MKT_PLANORDER (
        --企业代码
	TENANT_ID int NOT NULL ,
        --单  号
	PLAN_ID char (36) NOT NULL ,
        --门店代码
	SHOP_ID varchar (13) NOT NULL ,
        --流水号
	GLIDE_NO varchar (20) NOT NULL ,
        --合同号 <后几位查询>
	FILES_NO varchar (50),
        --年度
	KPI_YEAR int NOT NULL ,
        --签约日期
	PLAN_DATE int NOT NULL ,
        --开始日期
	BEGIN_DATE varchar (10) NOT NULL ,
        --结束日期
	END_DATE varchar (10) NOT NULL ,
        --经销商
	CLIENT_ID varchar (36) NOT NULL ,
        --所属部门
	DEPT_ID varchar (12) NOT NULL ,
        --计划类型
	PLAN_TYPE char (1) NOT NULL ,
        --经手人
	PLAN_USER varchar (36) ,
        --审核日期
	CHK_DATE varchar (10) ,
        --审核人员
	CHK_USER varchar (36) ,
        --数量汇总
	PLAN_AMT decimal(18, 3) ,
        --金额汇总
	PLAN_MNY decimal(18, 3) ,
        --保证金-收取
	BOND_MNY decimal(18, 3) ,
        --保证金-退还
	BOND_RET decimal(18, 3) ,
        --市场费预算
	BUDG_MNY decimal(18, 3) ,
        --备注
	REMARK varchar (100) ,
        --操作时间
	CREA_DATE varchar (30) ,
        --操作人员
	CREA_USER varchar (36) ,
        --通讯标志
	COMM varchar (2) NOT NULL DEFAULT '00',
        --时间戳 当前系统日期*86400000
  TIME_STAMP bigint NOT NULL,
	CONSTRAint PK_MKT_PLANORDER PRIMARY KEY 
	(
		TENANT_ID,
		PLAN_ID
	) 
)  IN R3TB32K_BIZ INDEX IN R3IX32K_DEF

CREATE INDEX IX_M_PNR_TENANT_ID ON MKT_PLANORDER(TENANT_ID);
CREATE INDEX IX_M_PNR_TIME_STAMP ON MKT_PLANORDER(TENANT_ID,TIME_STAMP);
CREATE INDEX IX_M_PNR_SHOP_ID ON MKT_PLANORDER(TENANT_ID,SHOP_ID);
CREATE INDEX IX_M_PNR_PLAN_DATE ON MKT_PLANORDER(PLAN_DATE);

--销售计划明细
CREATE TABLE MKT_PLANDATA (
        --企业代码
	TENANT_ID int NOT NULL ,
        --序号
	SEQNO int NOT NULL ,
        --订单号
	PLAN_ID char (36) NOT NULL ,
        --门店代码
	SHOP_ID varchar (13) NOT NULL ,
        --指标代码
	KPI_ID char (36) NOT NULL ,
        --订划销量
	AMOUNT decimal(18, 3) ,
        --计划金额
	AMONEY decimal(18, 3) ,
        --保证金
	BOND_MNY decimal(18, 3) ,
        --备注
	REMARK varchar (100) NULL ,
	CONSTRAint PK_MKT_PLANDATA PRIMARY KEY  
	(
		TENANT_ID,
		PLAN_ID,
		KPI_ID
	)
)  IN R3TB32K_BIZ INDEX IN R3IX32K_DEF

CREATE INDEX IX_M_PND_TENANT_ID ON MKT_PLANDATA(TENANT_ID);
CREATE INDEX IX_M_PND_PLAN_ID ON MKT_PLANDATA(TENANT_ID,PLAN_ID);
CREATE INDEX IX_M_PND_SHOP_ID ON MKT_PLANDATA(TENANT_ID,SHOP_ID);
CREATE INDEX IX_M_PND_GODS_ID ON MKT_PLANDATA(TENANT_ID,KPI_ID);

--考核结果
CREATE TABLE MKT_KPI_RESULT (
        --企业代码
	TENANT_ID int NOT NULL ,
        --计划单号
	PLAN_ID char (36) NOT NULL ,
        --门店代码
	SHOP_ID varchar (13) NOT NULL ,
        --指标类型
	IDX_TYPE char (1) NOT NULL ,
        --计算标准
	KPI_CALC char(1) NOT NULL ,
        --考核类型
	KPI_TYPE char (1) NOT NULL ,
        --考核标准
	KPI_DATA char(1) NOT NULL ,
        --考核ID
	KPI_ID char (36) NOT NULL ,
        --年度
	KPI_YEAR int NOT NULL ,
        --开始日期
	BEGIN_DATE varchar (10) ,
        --结束日期
	END_DATE varchar (10) ,
        --经销商
	CLIENT_ID varchar (36) NOT NULL ,
        --审核日期
	CHK_DATE varchar (10) ,
        --审核人员
	CHK_USER varchar (36) ,
	
        --计划销量
	PLAN_AMT decimal(18, 3) ,
        --计划金额 
	PLAN_MNY decimal(18, 3) ,
	
        --完成销量
	FISH_AMT decimal(18, 3) ,
        --完成金额 
	FISH_MNY decimal(18, 3) ,
	
        --考核结果<元>
	KPI_MNY decimal(18, 3) ,
        --提取返利
	WDW_MNY decimal(18, 3) ,
        --备注
	REMARK varchar (100) ,
        --操作时间
	CREA_DATE varchar (30) ,
        --操作人员
	CREA_USER varchar (36) ,
        --通讯标志
	COMM varchar (2) NOT NULL DEFAULT '00',
        --时间戳 当前系统日期*86400000
  TIME_STAMP bigint NOT NULL,
	CONSTRAint PK_MKT_KPI_RESULT PRIMARY KEY 
	(
		TENANT_ID,
		PLAN_ID,
		KPI_ID
	) 
)  IN R3TB32K_BIZ INDEX IN R3IX32K_DEF

CREATE INDEX IX_MKPIR_TENANT_ID ON MKT_KPI_RESULT(TENANT_ID);
CREATE INDEX IX_MKPIR_TIME_STAMP ON MKT_KPI_RESULT(TENANT_ID,TIME_STAMP);
CREATE INDEX IX_MKPIR_KPI_YEAR ON MKT_KPI_RESULT(TENANT_ID,KPI_YEAR);
CREATE INDEX IX_MKPIR_KPI_ID ON MKT_KPI_RESULT(TENANT_ID,KPI_ID);
CREATE INDEX IX_MKPIR_PLAN_ID ON MKT_KPI_RESULT(TENANT_ID,PLAN_ID);
CREATE INDEX IX_MKPIR_SHOP_ID ON MKT_KPI_RESULT(TENANT_ID,SHOP_ID);

--考核计算清单
CREATE TABLE MKT_KPI_RESULT_LIST (
        --企业代码
	TENANT_ID int NOT NULL ,
        --计划单号
	PLAN_ID char (36) NOT NULL ,
        --考核指标
	KPI_ID char (36) NOT NULL ,
        --考核周期(年度时 1是上半年 2是下半年 季时 1,2,3,4表示4个季度,其他情况为0)
	KPI_LV char (36) NOT NULL ,
        --级别，每个指标重 1 开始计数
	SEQNO int NOT NULL ,
	      --达标率
	KPI_RATE decimal(18, 3) ,
	      --达标量
	KPI_AMT decimal(18, 3) ,
	      --考时段
	KPI_DATE1 int ,
	KPI_DATE2 int ,
        --达标后折扣
	KPI_AGIO decimal(18, 3) ,

        --完成量
	FSH_VLE decimal(18, 3) ,
	      --考核结果
	KPI_MNY decimal(18, 3) ,
	
	CONSTRAint PK_MKT_KPI_R_LIST PRIMARY KEY 
	(
		TENANT_ID,
		PLAN_ID,
		KPI_ID,
		KPI_LV,
		SEQNO
	) 
)  IN R3TB32K_BIZ INDEX IN R3IX32K_DEF

--需求类型
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('1','市场返利','REQU_TYPE','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('2','市场计提','REQU_TYPE','00',5497000);

--费用申领单
CREATE TABLE MKT_REQUORDER (
        --企业代码
	TENANT_ID int NOT NULL ,
        --门店代码
	SHOP_ID varchar (13) NOT NULL ,
        --单号
	REQU_ID char (36) NOT NULL ,
        --生成其他收入支出单
	IORO_ID char (36) ,
        --所属部门
	DEPT_ID varchar (12) NOT NULL ,
        --费用类型
	REQU_TYPE char (36) NOT NULL ,
        --流水号
	GLIDE_NO varchar (20) NOT NULL ,
        --填报日期
	REQU_DATE int NOT NULL ,
        --经销商
	CLIENT_ID varchar (36) NOT NULL ,
        --填报人
	REQU_USER varchar (36) ,
        --审核日期
	CHK_DATE varchar (10) ,
        --审核人员
	CHK_USER varchar (36) ,
        --申领金额
	REQU_MNY decimal(18, 3) ,
        --备注
	REMARK varchar (100) ,
        --操作时间
	CREA_DATE varchar (30) ,
        --操作人员
	CREA_USER varchar (36) ,
        --通讯标志
	COMM varchar (2) NOT NULL DEFAULT '00',
        --时间戳 当前系统日期*86400000
  TIME_STAMP bigint NOT NULL,
	CONSTRAint PK_MKT_REQUORDER PRIMARY KEY 
	(
		TENANT_ID,
		REQU_ID
	) 
)  IN R3TB32K_BIZ INDEX IN R3IX32K_DEF

CREATE INDEX IX_MRQD_TENANT_ID ON MKT_REQUORDER(TENANT_ID);
CREATE INDEX IX_MRQD_TIME_STAMP ON MKT_REQUORDER(TENANT_ID,TIME_STAMP);
CREATE INDEX IX_MRQD_DEMA_DATE ON MKT_REQUORDER(REQU_DATE);

--费用申领明细
CREATE TABLE MKT_REQUDATA (
        --企业代码
	TENANT_ID int NOT NULL ,
        --门店代码
	SHOP_ID varchar (13) NOT NULL ,
        --序号
	SEQNO int NOT NULL ,
        --单号
	REQU_ID char (36) NOT NULL ,
        --计划单号
	PLAN_ID char (36) NOT NULL ,
        --考核ID
	KPI_ID char (36) NOT NULL ,
        --年度
	KPI_YEAR int ,
        --申领金额
	REQU_MNY decimal(18, 3) ,
        --摘要
	REMARK varchar (100) ,
	CONSTRAint PK_MKT_REQUDATA PRIMARY KEY  
	(
		TENANT_ID,
		REQU_ID,
		SEQNO
	)
)  IN R3TB32K_BIZ INDEX IN R3IX32K_DEF

CREATE INDEX IX_M_RQR_TENANT_ID ON MKT_REQUDATA(TENANT_ID);
CREATE INDEX IX_M_RQR_REQU_ID ON MKT_REQUDATA(TENANT_ID,REQU_ID);
CREATE INDEX IX_M_RQR_KPI_ID ON MKT_REQUDATA(TENANT_ID,PLAN_ID,KPI_YEAR,KPI_ID);
CREATE INDEX IX_M_RQR_KPI_YEAR ON MKT_REQUDATA(TENANT_ID,KPI_YEAR);

--添加门店档案其他资料信息

--产权类型
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('1','自主产权','CATEGORY','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('2','合同租赁','CATEGORY','00',5497000);

--产权类型
alter table CA_SHOP_INFO add CATEGORY char(1);
--签约日期/产权开始时间
alter table CA_SHOP_INFO add BEGIN_DATE varchar(10);
--到期日期/产权有效时间
alter table CA_SHOP_INFO add END_DATE varchar(10);
--单价多少钱/平方米）
alter table CA_SHOP_INFO add SHOP_PRC decimal(18, 3);
--租金/购买总价
alter table CA_SHOP_INFO add SHOP_MNY decimal(18, 3);
--建筑面积（平方米）
alter table CA_SHOP_INFO add BUIL_AREA decimal(18, 3);

--保证金-收取
alter table SAL_INDENTORDER add BOND_MNY decimal(18, 3);
--保证金-退还
alter table SAL_INDENTORDER add BOND_RET decimal(18, 3);

--其他费用,名称PUB_CODE_INFO定义
alter table SAL_INDENTORDER add OTH1_MNY decimal(18, 3);
alter table SAL_INDENTORDER add OTH2_MNY decimal(18, 3);
alter table SAL_INDENTORDER add OTH3_MNY decimal(18, 3);
alter table SAL_INDENTORDER add OTH4_MNY decimal(18, 3);
alter table SAL_INDENTORDER add OTH5_MNY decimal(18, 3);
alter table SAL_INDENTORDER add OTH6_MNY decimal(18, 3);

--保证金-收取
alter table STK_INDENTORDER add BOND_MNY decimal(18, 3);
--保证金-退还
alter table STK_INDENTORDER add BOND_RET decimal(18, 3);

--其他费用,名称PUB_CODE_INFO定义
alter table STK_INDENTORDER add OTH1_MNY decimal(18, 3);
alter table STK_INDENTORDER add OTH2_MNY decimal(18, 3);
alter table STK_INDENTORDER add OTH3_MNY decimal(18, 3);
alter table STK_INDENTORDER add OTH4_MNY decimal(18, 3);
alter table STK_INDENTORDER add OTH5_MNY decimal(18, 3);
alter table STK_INDENTORDER add OTH6_MNY decimal(18, 3);

--需求类型
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('1','固定保证金','BOND_TYPE','00',5497000);
insert into PUB_PARAMS(CODE_ID,CODE_NAME,TYPE_CODE,COMM,TIME_STAMP) values('2','滚存保证金','BOND_TYPE','00',5497000);
--保证金申领单
CREATE TABLE MKT_BONDORDER (
        --企业代码
	TENANT_ID int NOT NULL ,
        --单号
	BOND_ID char (36) NOT NULL ,
        --门店代码
	SHOP_ID varchar (13) NOT NULL ,
        --生成其他收入支出单
	IORO_ID char (36) ,
        --所属部门
	DEPT_ID varchar (12) NOT NULL ,
        --费用类型 1.固定保证金 2.滚存保证金
	BOND_TYPE char (36) NOT NULL ,
        --流水号
	GLIDE_NO varchar (20) NOT NULL ,
        --填报日期
	BOND_DATE int NOT NULL ,
        --经销商
	CLIENT_ID varchar (36) NOT NULL ,
        --填报人
	BOND_USER varchar (36) ,
        --审核日期
	CHK_DATE varchar (10) ,
        --审核人员
	CHK_USER varchar (36) ,
        --申领金额
	BOND_MNY decimal(18, 3) ,
        --备注
	REMARK varchar (100) ,
        --操作时间
	CREA_DATE varchar (30) ,
        --操作人员
	CREA_USER varchar (36) ,
        --通讯标志
	COMM varchar (2) NOT NULL DEFAULT '00',
        --时间戳 当前系统日期*86400000
  TIME_STAMP bigint NOT NULL,
	CONSTRAint PK_MKT_BONDORDER PRIMARY KEY 
	(
		TENANT_ID,
		BOND_ID
	) 
)  IN R3TB32K_BIZ INDEX IN R3IX32K_DEF

CREATE INDEX IX_MBND_TENANT_ID ON MKT_BONDORDER(TENANT_ID);
CREATE INDEX IX_MBND_TIME_STAMP ON MKT_BONDORDER(TENANT_ID,TIME_STAMP);
CREATE INDEX IX_MBND_DEMA_DATE ON MKT_BONDORDER(BOND_DATE);

--费用申领明细
CREATE TABLE MKT_BONDDATA (
        --企业代码
	TENANT_ID int NOT NULL ,
        --单号
	BOND_ID char (36) NOT NULL ,
        --门店代码
	SHOP_ID varchar (13) NOT NULL ,
        --序号
	SEQNO int NOT NULL ,
        --对应单号
	FROM_ID char (36) NOT NULL ,
        --申领金额
	BOND_MNY decimal(18, 3) ,
        --摘要
	REMARK varchar (100) ,
	CONSTRAint PK_MKT_BONDDATA PRIMARY KEY  
	(
		TENANT_ID,
		BOND_ID,
		SEQNO
	)
)  IN R3TB32K_BIZ INDEX IN R3IX32K_DEF

CREATE INDEX IX_MBNR_TENANT_ID ON MKT_BONDDATA(TENANT_ID);
CREATE INDEX IX_MBNR_BOND_ID ON MKT_BONDDATA(TENANT_ID,BOND_ID);
CREATE INDEX IX_MBNR_FROM_ID ON MKT_BONDDATA(TENANT_ID,BOND_ID,FROM_ID);

--为收款单添加部门
alter table ACC_RECVORDER add DEPT_ID varchar(12);
--为付款单添加部门
alter table ACC_PAYORDER add DEPT_ID varchar(12);

--为收款单添加部门
alter table ACC_RECVABLE_INFO add DEPT_ID varchar(12);
--为付款单添加部门
alter table ACC_PAYABLE_INFO add DEPT_ID varchar(12);

update ACC_RECVORDER set DEPT_ID=(select DEPT_ID from VIW_USERS where TENANT_ID=ACC_RECVORDER.TENANT_ID and USER_ID=ACC_RECVORDER.RECV_USER);
update ACC_PAYORDER set DEPT_ID=(select DEPT_ID from VIW_USERS where TENANT_ID=ACC_PAYORDER.TENANT_ID and USER_ID=ACC_PAYORDER.PAY_USER);

update ACC_RECVABLE_INFO set DEPT_ID=(select DEPT_ID from SAL_SALESORDER where TENANT_ID=ACC_RECVABLE_INFO.TENANT_ID and SALES_ID=ACC_RECVABLE_INFO.SALES_ID) where RECV_TYPE in ('1','2');
update ACC_RECVABLE_INFO set DEPT_ID=(select DEPT_ID from SAL_INDENTORDER where TENANT_ID=ACC_RECVABLE_INFO.TENANT_ID and INDE_ID=ACC_RECVABLE_INFO.SALES_ID) where RECV_TYPE in ('3');
update ACC_RECVABLE_INFO set DEPT_ID=(select DEPT_ID from VIW_USERS where TENANT_ID=ACC_RECVABLE_INFO.TENANT_ID and USER_ID=ACC_RECVABLE_INFO.CREA_USER) where RECV_TYPE in ('4');

update ACC_PAYABLE_INFO set DEPT_ID=(select DEPT_ID from STK_STOCKORDER where TENANT_ID=ACC_PAYABLE_INFO.TENANT_ID and STOCK_ID=ACC_PAYABLE_INFO.STOCK_ID) where ABLE_TYPE in ('4','5');
update ACC_PAYABLE_INFO set DEPT_ID=(select DEPT_ID from STK_INDENTORDER where TENANT_ID=ACC_PAYABLE_INFO.TENANT_ID and INDE_ID=ACC_PAYABLE_INFO.STOCK_ID) where ABLE_TYPE in ('6');
