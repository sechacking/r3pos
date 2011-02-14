unit ObjGoodsInfo;

interface

uses
  SysUtils, zBase, Classes, AdoDb, ZIntf, ObjCommon, ZDataset,uDsUtil;

type
  {== 商品资料 ==}
  TGoodsInfo=class(TZFactory)
  public
    //判断是否是总店: (TENANT_ID+'0001'判断是否是总店)
    function IsRootShop: Boolean;
    //记录行集新增检测函数，返回值是True 测可以新增当前记录
    function BeforeInsertRecord(AGlobal:IdbHelp):Boolean;override;
    //记录行集修改检测函数，返回值是True 测可以修改当前记录
    function BeforeModifyRecord(AGlobal:IdbHelp):Boolean;override;
    //记录行集删除检测函数，返回值是True 测可以删除当前记录
    function BeforeDeleteRecord(AGlobal:IdbHelp):Boolean;override;
    procedure InitClass; override;
  end;

  {== 条码 ==}
  TPUB_BARCODE=class(TZFactory)
  public
    //记录行集新增检测函数，返回值是True 测可以新增当前记录
    function BeforeInsertRecord(AGlobal: IdbHelp):Boolean;override;
    //记录行集删除检测函数，返回值是True 测可以删除当前记录
    function BeforeDeleteRecord(AGlobal: IdbHelp):Boolean;override;
    procedure InitClass; override;
  end;

  {== 商品单价 ==}
  TGoodsPrice=class(TZFactory)
  public
    //记录行集新增检测函数，返回值是True 测可以新增当前记录
    function BeforeInsertRecord(AGlobal: IdbHelp):Boolean;override;
    //记录行集修改检测函数，返回值是True 测可以修改当前记录
    function BeforeModifyRecord(AGlobal:IdbHelp):Boolean;override;
    //记录行集删除检测函数，返回值是True 测可以删除当前记录
    function BeforeDeleteRecord(AGlobal: IdbHelp):Boolean;override;
    procedure InitClass; override;
  end;

  {== 商品单价修改日志 ==}
  TGoodsPriceLog=class(TZFactory)
  public
    procedure InitClass; override;
  end;
  
  

  {== 库存 ==}
  TGetStorage=class(TZFactory)
  public
    procedure InitClass; override;
  end;

  {== 入库 ==}
  TGetStockData=class(TZFactory)
  public
    procedure InitClass; override;
  end;

  {==  出库 ==}
  TGetSalesData=class(TZFactory)
  public
    procedure InitClass; override;
  end;

implementation

 { TGoodsInfo }

function TGoodsInfo.IsRootShop: Boolean;
var CurShop_ID: string;
begin
  result:=False;
  CurShop_ID:=trim(FieldbyName('SHOP_ID').AsString);
  CurShop_ID:=Copy(CurShop_ID,length(CurShop_ID)-3,4);
  result:=(CurShop_ID='0001');
end;

function TGoodsInfo.BeforeDeleteRecord(AGlobal: IdbHelp): Boolean;
var
  Str:string;
  rs: TZQuery;
begin
  result := true;
  try
    rs:=TZQuery.Create(nil);
    rs.SQL.Text:='select Count(*) as ReSum from STO_STORAGE where AMOUNT<>0 and GODS_ID=:GODS_ID ';
    rs.Params.ParamByName('GODS_ID').AsString:=trim(FieldByName('GODS_ID').AsOldString); 
    AGlobal.Open(rs);
    if rs.Fields[0].AsInteger> 0 then
      Raise Exception.Create('"'+FieldbyName('GODS_NAME').AsOldString+'"库存不为0不能删除.');      ;
  finally
    rs.Free;
  end;

  //软件删除商品资料:
  Str:='Update PUB_GOODSINFO Set COMM=''02'',TIME_STAMP='+GetTimeStamp(iDbType)+' where TENANT_ID=:OLD_TENANT_ID and GODS_ID=:OLD_GODS_ID ';
  AGlobal.ExecSQL(Str,self); 
  //删除商品条码:
  Str:='Update PUB_BARCODE Set COMM=''02'',TIME_STAMP='+GetTimeStamp(iDbType)+' where TENANT_ID=:OLD_TENANT_ID and GODS_ID=:OLD_GODS_ID ';
  AGlobal.ExecSQL(Str,self);
  //删除商品价格:
  Str:='Update PUB_GOODSPRICE Set COMM=''02'',TIME_STAMP='+GetTimeStamp(iDbType)+' where TENANT_ID=:OLD_TENANT_ID and SHOP_ID=:OLD_SHOP_ID and GODS_ID=:OLD_GODS_ID';
  AGlobal.ExecSQL(Str, self);
end;

function TGoodsInfo.BeforeInsertRecord(AGlobal: IdbHelp): Boolean;
var
  Str:string;
  r:integer;
begin
  result := true;
  Str:='Insert Into PUB_GOODSINFO(GODS_ID,TENANT_ID,GODS_CODE,GODS_NAME,GODS_SPELL,GODS_TYPE,SORT_ID1,SORT_ID2,SORT_ID3,SORT_ID4,'+
    'SORT_ID5,SORT_ID6,SORT_ID7,SORT_ID8,BARCODE,CALC_UNITS,SMALL_UNITS,BIG_UNITS,SMALLTO_CALC,BIGTO_CALC,NEW_INPRICE,NEW_OUTPRICE,'+
    'NEW_LOWPRICE,USING_PRICE,HAS_INTEGRAL,USING_BATCH_NO,USING_BARTER,BARTER_INTEGRAL,REMARK,COMM,TIME_STAMP)'+
    ' Values (:GODS_ID,:TENANT_ID,:GODS_CODE,:GODS_NAME,:GODS_SPELL,:GODS_TYPE,:SORT_ID1,:SORT_ID2,:SORT_ID3,:SORT_ID4,'+
    ':SORT_ID5,:SORT_ID6,:SORT_ID7,:SORT_ID8,:BARCODE,:CALC_UNITS,:SMALL_UNITS,:BIG_UNITS,:SMALLTO_CALC,:BIGTO_CALC,:NEW_INPRICE,'+
    ':RTL_OUTPRICE,:NEW_LOWPRICE,:USING_PRICE,:HAS_INTEGRAL,:USING_BATCH_NO,:USING_BARTER,:BARTER_INTEGRAL,:REMARK,''00'','+GetTimeStamp(iDbType)+')';
  AGlobal.ExecSQL(Str, self);
end;

function TGoodsInfo.BeforeModifyRecord(AGlobal: IdbHelp): Boolean;
var
  Str: string;
begin
  result:=true;
  Str:=
    'Update PUB_GOODSINFO Set GODS_CODE=:GODS_CODE,GODS_NAME=:GODS_NAME,GODS_SPELL=:GODS_SPELL,GODS_TYPE=:GODS_TYPE,SORT_ID1=:SORT_ID1,'+
    'SORT_ID2=:SORT_ID2,SORT_ID3=:SORT_ID3,SORT_ID4=:SORT_ID4,SORT_ID5=:SORT_ID5,SORT_ID6=:SORT_ID6,SORT_ID7=:SORT_ID7,SORT_ID8=:SORT_ID8,'+
    'BARCODE=:BARCODE,USING_PRICE=:USING_PRICE,HAS_INTEGRAL=:HAS_INTEGRAL,USING_BATCH_NO=:USING_BATCH_NO,USING_BARTER=:USING_BARTER,BARTER_INTEGRAL=:BARTER_INTEGRAL,REMARK=:REMARK,COMM='+ GetCommStr(iDbType)+
    ',TIME_STAMP='+GetTimeStamp(iDbType)+
    ' Where TENANT_ID=:OLD_TENANT_ID and GODS_ID=:OLD_GODS_ID ';
  AGlobal.ExecSQL(Str,self);
  {==只有总店才能修改价格==}
  if IsRootShop then
  begin
    Str:=
      'Update PUB_GOODSINFO Set CALC_UNITS=:CALC_UNITS,SMALL_UNITS=:SMALL_UNITS,BIG_UNITS=:BIG_UNITS,SMALLTO_CALC=:SMALLTO_CALC,BIGTO_CALC=:BIGTO_CALC,'+
      ' NEW_INPRICE=:NEW_INPRICE,NEW_OUTPRICE=:RTL_OUTPRICE,NEW_LOWPRICE=:NEW_LOWPRICE,COMM='+ GetCommStr(iDbType)+',TIME_STAMP='+GetTimeStamp(iDbType)+
      ' Where TENANT_ID=:OLD_TENANT_ID and GODS_ID=:OLD_GODS_ID ';
    AGlobal.ExecSQL(Str,self);
  end;   
end;

{------------------------------------------------------------------------------
 说明:
   (1)门店销售价格: 计量单位售价\包装1售价\包装2售价
   (2)没有设置销售价的门店的单价默认从总店设置价格取，若总店的没有设置销售单价
     （则直接读取:标准售价）
   (3)(select * from VIW_GOODSPRICE where POLICY_TYPE=2 and TENANT_ID=:TENANT_ID and SHOP_ID=:SHOP_ID and GODS_ID=:GODS_ID //本店定价
       union all
       select A.* from VIW_GOODSPRICE A,VIW_GOODSPRICE B     //总店定价
       where B.POLICY_TYPE=1 and A.TENANT_ID=B.TENANT_ID and A.GODS_ID=B.GODS_ID and B.SHOP_ID=:SHOP_ID and A.SHOP_ID=:SHOP_ID_ROOT and A.TENANT_ID=:TENANT_ID and A.GODS_ID=:GODS_ID )  
   备注: VIW_GOODSPRICE为
 ------------------------------------------------------------------------------}

procedure TGoodsInfo.InitClass;
var
  Str: string;
begin
  inherited;
  KeyFields:='TENANT_ID;GODS_ID';
  case iDbType of
   0,5: //此语句在SQLITE下调试通过，MS SQL Server语法一样
    Str:=
      'select 0 as selFlag,case when RELATION_ID=0 then 2 else 1 end as RELATION_FLAG,J.TENANT_ID as TENANT_ID,J.PRICE_METHOD as PRICE_METHOD,'+
      ' J.GODS_ID as GODS_ID,J.SHOP_ID as SHOP_ID,GODS_CODE,BARCODE,GODS_SPELL,GODS_NAME,CALC_UNITS,SMALL_UNITS,BIG_UNITS,SMALLTO_CALC,BIGTO_CALC,'+
      ' case when C.NEW_INPRICE is null then J.NEW_INPRICE else C.NEW_INPRICE end as NEW_INPRICE,'+
      ' case when C.NEW_INPRICE is null then J.NEW_INPRICE*J.SMALLTO_CALC else C.NEW_INPRICE1 end as NEW_INPRICE1,'+
      ' case when C.NEW_INPRICE is null then J.NEW_INPRICE*J.BIGTO_CALC else C.NEW_INPRICE2 end as NEW_INPRICE2,'+
      ' RTL_OUTPRICE, '+  //标准售价
      ' NEW_LOWPRICE, '+  //最低售价
      ' NEW_OUTPRICE, '+
      ' NEW_OUTPRICE1, '+
      ' NEW_OUTPRICE2, '+
      ' NEW_LOWPRICE,'+
      ' SORT_ID1,SORT_ID2,SORT_ID3,SORT_ID4,SORT_ID5,SORT_ID6,SORT_ID7,SORT_ID8,GODS_TYPE,'+
      ' USING_BARTER,BARTER_INTEGRAL,USING_PRICE,HAS_INTEGRAL,USING_BATCH_NO,REMARK,'+
      ' case when NEW_OUTPRICE<>0 then (case when C.NEW_INPRICE is null then J.NEW_INPRICE else C.NEW_INPRICE end)*100/NEW_OUTPRICE else null end as PROFIT_RATE '+
      'from (select * from VIW_GOODSPRICE where POLICY_TYPE=2  and TENANT_ID=:TENANT_ID and SHOP_ID=:SHOP_ID and GODS_ID=:GODS_ID '+
      ' union all '+
      ' select A.* from VIW_GOODSPRICE A,VIW_GOODSPRICE B '+
      ' where B.POLICY_TYPE=1 and A.TENANT_ID=B.TENANT_ID and A.GODS_ID=B.GODS_ID and B.SHOP_ID=:SHOP_ID and A.SHOP_ID=:SHOP_ID_ROOT and A.TENANT_ID=:TENANT_ID and A.GODS_ID=:GODS_ID ) J '+
      ' left join PUB_GOODSINFOEXT C on J.GODS_ID=C.GODS_ID and J.TENANT_ID=C.TENANT_ID '+
      ' where J.COMM not in (''02'',''12'') order by J.GODS_CODE ';
   1: Str:='';
   4: Str:='';
  end;
  SelectSQL.Text:=Str;
  IsSQLUpdate := True;
end;

{ TPUB_BARCODE1 }

function TPUB_BARCODE.BeforeDeleteRecord(AGlobal: IdbHelp): Boolean;
var
  str: string;
begin
  result:=True;
  Str:='delete from PUB_BARCODE where TENANT_ID=:OLD_TENANT_ID and BARCODE=:OLD_BARCODE and GODS_ID=:OLD_GODS_ID';
  AGlobal.ExecSQL(Str,Self);
end;

function TPUB_BARCODE.BeforeInsertRecord(AGlobal: IdbHelp): Boolean;
var
  str: string;
begin
  result:=True;
  Str := 'delete from PUB_BARCODE where TENANT_ID=:OLD_TENANT_ID and GODS_ID=:OLD_GODS_ID and BARCODE=:OLD_BARCODE ';
  AGlobal.ExecSQL(Str,Self);
end;    

procedure TPUB_BARCODE.InitClass;
var
  Str: string;
begin
  inherited;
  //条码不是核心资料，可直接物理删除
  KeyFields:='BARCODE;COMP_ID;GODS_ID';
  SelectSQL.Text := 'select ROWS_ID,TENANT_ID,GODS_ID,PROPERTY_01,PROPERTY_02,UNIT_ID,BARCODE_TYPE,BATCH_NO,BARCODE from PUB_BARCODE '+
    ' where TENANT_ID=:TENANT_ID and GODS_ID=:GODS_ID  and COMM not in (''02'',''12'') order by BARCODE';
  IsSQLUpdate := True;
  Str:='Insert Into PUB_BARCODE (ROWS_ID,TENANT_ID,GODS_ID,PROPERTY_01,PROPERTY_02,UNIT_ID,BARCODE_TYPE,BATCH_NO,BARCODE,COMM,TIME_STAMP)'+
       ' Values (:ROWS_ID,:TENANT_ID,:GODS_ID,:PROPERTY_01,:PROPERTY_02,:UNIT_ID,:BARCODE_TYPE,:BATCH_NO,:BARCODE,''00'','+GetTimeStamp(iDbType)+')';
  InsertSQL.Add(Str);
  Str := 'update PUB_BARCODE set BATCH_NO=:BATCH_NO,PROPERTY_01=:PROPERTY_01,PROPERTY_02=:PROPERTY_02,'
    + ' UNIT_ID=:UNIT_ID,BARCODE=:BARCODE,COMM='+ GetCommStr(iDbType)+',TIME_STAMP='+GetTimeStamp(iDbType)
    + ' where TENANT_ID=:OLD_TENANT_ID and BARCODE=:OLD_BARCODE and GODS_ID=:OLD_GODS_ID';
  UpdateSQL.Add(Str);
end;

{ TGetStockData }

procedure TGetStockData.InitClass;
begin
  inherited;
  SelectSQL.Text:='select jh.*,I.COMP_NAME from   '+
  '(select jf.*,H.CLIENT_NAME from   '+
  '(select je.*,F.CODE_NAME COLORNAME from  '+
  '(select jd.*,E.CODE_NAME SIZENAME from    '+
  '(select jc.*,D.UNIT_NAME  from(select A.STOCK_TYPE,A.COMP_ID,A.GLIDE_NO,A.STOCK_DATE,A.CLIENT_ID,B.AMOUNT,  '+
  ' B.APRICE,B.AMONEY,B.PROPERTY_01,B.PROPERTY_02,B.UNIT_ID from STK_STOCKORDER A,STK_STOCKDATA B  '+
  'where A.COMP_ID in  (select A.COMP_ID from (select COMP_ID from VIW_COMPRIGHT where USER_ID=:USER_ID) A,  '+
  '(select COMP_ID from CA_COMPANY where (UPCOMP_ID=:COMP_ID and COMP_TYPE=2) or (COMP_ID=:COMP_ID) )B   where A.COMP_ID=B.COMP_ID)  '+
  'and A.STOCK_ID=B.STOCK_ID and A.STOCK_TYPE<>2 and B.GODS_ID=:GODS_ID )jc  '+
  'left outer join (select UNIT_ID,UNIT_NAME from PUB_MEAUNITS)D on jc.UNIT_ID=D.UNIT_ID)jd  '+
  'left outer join (select CODE_ID,CODE_NAME from PUB_CODE_INFO  '+
  'where  CODE_TYPE=''2'' and len(CODE_ID)=3)E on jd.PROPERTY_01=E.CODE_ID)je  '+
  'left outer join (select CODE_ID,CODE_NAME from PUB_CODE_INFO  '+
  'where CODE_TYPE=''4'' and len(CODE_ID)=3)F on je.PROPERTY_02=F.CODE_ID)jf  '+
  'left outer join VIW_CLIENTINFO H on jf.CLIENT_ID=H.CLIENT_ID)jh  '+
  'left outer join CA_COMPANY I on jh.COMP_ID=I.COMP_ID  order by jh.STOCK_DATE DESC';
  IsSQLUpdate:=True;
end;


{ TGetSalesData }

procedure TGetSalesData.InitClass;
begin
  inherited;

  SelectSQL.Text:='select jh.*,I.COMP_NAME from  '+
  '(select jf.*,H.CUST_NAME from   '+
  '(select je.*,F.CODE_NAME COLORNAME from    '+
  '(select jd.*,E.CODE_NAME SIZENAME from   '+
  '(select jc.*,D.UNIT_NAME from     '+
  '(select A.SALES_TYPE,A.COMP_ID,A.GLIDE_NO,A.SALES_DATE,A.CUST_ID,B.AMOUNT,   '+
  'B.APRICE,B.AMONEY,B.PROPERTY_01,B.PROPERTY_02,B.UNIT_ID from SAL_SALESORDER A,SAL_SALESDATA B      '+
  'where A.COMP_ID in  (select A.COMP_ID from (select COMP_ID from VIW_COMPRIGHT where USER_ID=:USER_ID) A,   '+
  '(select COMP_ID from CA_COMPANY where (UPCOMP_ID=:COMP_ID and COMP_TYPE=2) or (COMP_ID=:COMP_ID) )B   where A.COMP_ID=B.COMP_ID)    '+
  'and A.SALES_ID=B.SALES_ID and A.SALES_TYPE<>2 and B.GODS_ID=:GODS_ID)jc  '+
  'left outer join (select UNIT_ID,UNIT_NAME from PUB_MEAUNITS)D on jc.UNIT_ID=D.UNIT_ID)jd    '+
  'left outer join (select CODE_ID,CODE_NAME from PUB_CODE_INFO    '+
  'where  CODE_TYPE=''2'' and len(CODE_ID)=3)E on jd.PROPERTY_01=E.CODE_ID)je    '+
  'left outer join (select CODE_ID,CODE_NAME from PUB_CODE_INFO   '+
  'where CODE_TYPE=''4'' and len(CODE_ID)=3)F on je.PROPERTY_02=F.CODE_ID)jf    '+
  'left outer join VIW_CUSTOMER H on jf.CUST_ID=H.CUST_ID)jh   '+
  'left outer join CA_COMPANY I on jh.COMP_ID=I.COMP_ID order by jh.SALES_DATE DESC';
  IsSQLUpdate:=True;
end;

{ TGetStorage }

procedure TGetStorage.InitClass;
begin
  inherited;
  SelectSQL.Text:=' select je.*,F.COMP_NAME from (select jd.*,E.CODE_NAME COLORNAME from   '+
  ' (select jc.*,D.CODE_NAME SIZENAME from  '+
  ' (select A.COMP_ID,A.PROPERTY_01,A.PROPERTY_02,A.AMOUNT,A.COST_PRICE,isnull(A.AMOUNT,0)*isnull(A.COST_PRICE,0) COST_AMONEY   '+
  ' ,isnull(A.AMOUNT,0)*isnull(H.NEW_OUTPRICE,0) OUT_AMONEY,isnull(A.AMOUNT,0)*isnull(H.NEW_INPRICE,0) IN_AMONEY   '+
  ' from STO_STORAGE A left outer join VIW_PRICE_INFO H  on H.GODS_ID=:GODS_ID and A.GODS_ID=H.GODS_ID and H.COMP_ID=A.COMP_ID  '+
  ' where A.GODS_ID=:GODS_ID and A.COMP_ID in (select A.COMP_ID from (select COMP_ID from VIW_COMPRIGHT where USER_ID=:USER_ID) A, '+
  ' (select COMP_ID from CA_COMPANY where (UPCOMP_ID=:COMP_ID and COMP_TYPE=2) or (COMP_ID=:COMP_ID) )B   where A.COMP_ID=B.COMP_ID))jc    '+
  ' left outer join  (select CODE_ID,CODE_NAME from PUB_CODE_INFO   '+
  ' where  CODE_TYPE=''2'' and len(CODE_ID)=3)D on jc.PROPERTY_01=D.CODE_ID )jd   '+
  ' left outer join (select CODE_ID,CODE_NAME from PUB_CODE_INFO    '+
  ' where  CODE_TYPE=''4'' and len(CODE_ID)=3)E on jd.PROPERTY_02=E.CODE_ID)je'+
  ' left outer join CA_COMPANY F on je.COMP_ID=F.COMP_ID';
  IsSQLUpdate:=True;
end;

{ TGoodsPrice }

function TGoodsPrice.BeforeDeleteRecord(AGlobal: IdbHelp): Boolean;
begin

end;

function TGoodsPrice.BeforeInsertRecord(AGlobal: IdbHelp): Boolean;
begin

end;

function TGoodsPrice.BeforeModifyRecord(AGlobal: IdbHelp): Boolean;
begin

end;

procedure TGoodsPrice.InitClass;
var
  Str: string;
begin
  inherited;
  //条码不是核心资料，可直接物理删除
  KeyFields:='TENANT_ID,GODS_ID,SHOP_ID,PRICE_ID';
  SelectSQL.Text:='select TENANT_ID,PRICE_ID,SHOP_ID,GODS_ID,PRICE_METHOD,NEW_OUTPRICE,NEW_OUTPRICE1,NEW_OUTPRICE2 from PUB_GOODSPRICE '+
    ' where TENANT_ID=:TENANT_ID and COMM not in (''02'',''12'') and GODS_ID=:GODS_ID and SHOP_ID=:SHOP_ID '+
    ' order by PRICE_ID';
  IsSQLUpdate := True;
  Str:='insert Into PUB_GOODSPRICE(TENANT_ID,PRICE_ID,SHOP_ID,GODS_ID,PRICE_METHOD,NEW_OUTPRICE,NEW_OUTPRICE1,NEW_OUTPRICE2,COMM,TIME_STAMP) '+
    ' Values (:TENANT_ID,:PRICE_ID,:SHOP_ID,:GODS_ID,:PRICE_METHOD,:NEW_OUTPRICE,:NEW_OUTPRICE1,:NEW_OUTPRICE2,''00'','+GetTimeStamp(iDbType)+') ';
  InsertSQL.Add(Str);
  Str:='update PUB_GOODSPRICE set TENANT_ID=:TENANT_ID,PRICE_ID=:PRICE_ID,SHOP_ID=:SHOP_ID,GODS_ID=:GODS_ID,PRICE_METHOD=:PRICE_METHOD,'+
    ' NEW_OUTPRICE=:NEW_OUTPRICE,NEW_OUTPRICE1=:NEW_OUTPRICE1,NEW_OUTPRICE2=:NEW_OUTPRICE2,'+
    ' COMM='+ GetCommStr(iDbType)+',TIME_STAMP='+GetTimeStamp(iDbType)+
    ' where TENANT_ID=:OLD_TENANT_ID and COMM not in (''02'',''12'') and GODS_ID=:OLD_GODS_ID and '+
    ' SHOP_ID=:OLD_SHOP_ID and PRICE_ID=:OLD_PRICE_ID ';
  UpdateSQL.Add(Str);
end;

{ TGoodsPriceLog }

procedure TGoodsPriceLog.InitClass;
var
  Str: string;
begin
  //插入价格变动日志表:
  KeyFields:='TENANT_ID,GODS_ID,SHOP_ID,PRICE_ID';
  SelectSQL.Text:='select * from LOG_PRICING_INFO '+
    ' Where TENANT_ID=:TENANT_ID and COMM not in (''02'',''12'') and ROWS_ID=:ROWS_ID and SHOP_ID=:SHOP_ID ';
  IsSQLUpdate := True;
  Str:='Insert Into LOG_PRICING_INFO (ROWS_ID,PRICING_DATE,PRICING_USER,TENANT_ID,PRICE_ID,SHOP_ID,GODS_ID,PRICE_METHOD,'+
       ' ORG_OUTPRICE,ORG_OUTPRICE1,ORG_OUTPRICE2,NEW_OUTPRICE,NEW_OUTPRICE1,NEW_OUTPRICE2,COMM,TIME_STAMP)'+
       'Values (:ROWS_ID,:PRICING_DATE,:PRICING_USER,:TENANT_ID,:PRICE_ID,:SHOP_ID,:GODS_ID,:PRICE_METHOD,'+
       ':ORG_OUTPRICE,:ORG_OUTPRICE1,:ORG_OUTPRICE2,:NEW_OUTPRICE,:NEW_OUTPRICE1,:NEW_OUTPRICE2,''00'','+GetTimeStamp(iDbType)+')';
  InsertSQL.Add(Str);
end;

initialization
  RegisterClass(TGoodsInfo);
  RegisterClass(TPUB_BARCODE);
  RegisterClass(TGoodsPrice);
  RegisterClass(TGetStockData);
  RegisterClass(TGetSalesData);
  RegisterClass(TGetStorage);
  RegisterClass(TGoodsPriceLog); 
finalization
  UnRegisterClass(TGoodsInfo);
  UnRegisterClass(TPUB_BARCODE);
  UnRegisterClass(TGoodsPrice);
  UnRegisterClass(TGetStockData);
  UnRegisterClass(TGetSalesData);
  UnRegisterClass(TGetStorage);
  UnRegisterClass(TGoodsPriceLog);   
end.



  {
  Str:='Insert Into PUB_GOODSINFO(GODS_ID,TENANT_ID,GODS_CODE,GODS_NAME,GODS_SPELL,GODS_TYPE,SORT_ID1,SORT_ID2,SORT_ID3,SORT_ID4,'+
    'SORT_ID5,SORT_ID6,SORT_ID7,SORT_ID8,BARCODE,CALC_UNITS,SMALL_UNITS,BIG_UNITS,SMALLTO_CALC,BIGTO_CALC,NEW_INPRICE,NEW_OUTPRICE,'+
    'NEW_LOWPRICE,USING_PRICE,HAS_INTEGRAL,USING_BATCH_NO,USING_BARTER,BARTER_INTEGRAL,REMARK,COMM,TIME_STAMP)'+
    ' Values (:GODS_ID,:TENANT_ID,:GODS_CODE,:GODS_NAME,:GODS_SPELL,:GODS_TYPE,:SORT_ID1,:SORT_ID2,:SORT_ID3,:SORT_ID4,'+
    ':SORT_ID5,:SORT_ID6,:SORT_ID7,:SORT_ID8,:BARCODE,:CALC_UNITS,:SMALL_UNITS,:BIG_UNITS,:SMALLTO_CALC,:BIGTO_CALC,:NEW_INPRICE,'+
    ':NEW_OUTPRICE,:NEW_LOWPRICE,:USING_PRICE,:HAS_INTEGRAL,:USING_BATCH_NO,:USING_BARTER,:BARTER_INTEGRAL,:REMARK,''00'','+GetTimeStamp(iDbType)+')';
  InsertSQL.Add(Str);

  Str:='Update PUB_GOODSINFO Set GODS_CODE=:GODS_CODE,GODS_NAME=:GODS_NAME,GODSb_SPELL=:GODS_SPELL,GODS_TYPE=:GODS_TYPE,SORT_ID1=:SORT_ID1,'+
    'SORT_ID2=:SORT_ID2,SORT_ID3=:SORT_ID3,SORT_ID4=:SORT_ID4,SORT_ID5=:SORT_ID5,SORT_ID6=:SORT_ID6,SORT_ID7=:SORT_ID7,SORT_ID8=:SORT_ID8,'+
    'BARCODE=:BARCODE,CALC_UNITS=:CALC_UNITS,SMALL_UNITS=:SMALL_UNITS,BIG_UNITS=:BIG_UNITS,SMALLTO_CALC=:SMALLTO_CALC,BIGTO_CALC=:BIGTO_CALC,'+
    'NEW_INPRICE=:NEW_INPRICE,NEW_OUTPRICE=:NEW_OUTPRICE,NEW_LOWPRICE=:NEW_LOWPRICE,USING_PRICE=:USING_PRICE,HAS_INTEGRAL=:HAS_INTEGRAL,'+
    'USING_BATCH_NO=:USING_BATCH_NO,USING_BARTER=:USING_BARTER,BARTER_INTEGRAL=:BARTER_INTEGRAL,REMARK=:REMARK,COMM='+ GetCommStr(iDbType)+
    ',TIME_STAMP='+GetTimeStamp(iDbType)+' Where TENANT_ID=:OLD_TENANT_ID and GODS_ID=:OLD_GODS_ID ';
  UpdateSQL.Add(Str);

  Str:='Update PUB_GOODSINFO Set COMM=''02'',TIME_STAMP='+GetTimeStamp(iDbType)+
       ' where TENANT_ID=:OLD_TENANT_ID and GODS_ID=:OLD_GODS_ID ';
  //AGlobal.ExecSQL(Str,self);
  DeleteSQL.Add(Str);
  }
