unit ObjStkRetuOrder;

interface
uses Dialogs,SysUtils,ZBase,Classes,ZIntf,ObjCommon,DB,ZDataSet,math;
type
  TStkRetuOrder=class(TZFactory)
  private
    lock:boolean;
  public
    function CheckTimeStamp(aGlobal:IdbHelp;s:string;comm:boolean=true):boolean;
    function BeforeUpdateRecord(AGlobal:IdbHelp): Boolean;override;
    //记录行集新增检测函数，返回值是True 测可以新增当前记录
    function BeforeInsertRecord(AGlobal:IdbHelp):Boolean;override;
    //记录行集修改检测函数，返回值是True 测可以修改当前记录
    function BeforeModifyRecord(AGlobal:IdbHelp):Boolean;override;
    //记录行集删除检测函数，返回值是True 测可以删除当前记录
    function BeforeDeleteRecord(AGlobal:IdbHelp):Boolean;override;
    function BeforeCommitRecord(AGlobal:IdbHelp):Boolean;override;
    procedure InitClass; override;
  end;
  TStkRetuData=class(TZFactory)
  private
    IsZeroOut:Boolean;
    lock:boolean;
  public
    function BeforeUpdateRecord(AGlobal:IdbHelp): Boolean;override;
    //记录行集新增检测函数，返回值是True 测可以新增当前记录
    function BeforeInsertRecord(AGlobal:IdbHelp):Boolean;override;
    //记录行集修改检测函数，返回值是True 测可以修改当前记录
    function BeforeModifyRecord(AGlobal:IdbHelp):Boolean;override;
    //记录行集删除检测函数，返回值是True 测可以删除当前记录
    function BeforeDeleteRecord(AGlobal:IdbHelp):Boolean;override;
    function BeforeCommitRecord(AGlobal:IdbHelp):Boolean;override;
    procedure InitClass; override;
  end;
  TStkRetuOrderGetPrior=class(TZFactory)
  public
    procedure InitClass;override;
  end;
  TStkRetuOrderGetNext=class(TZFactory)
  public
    procedure InitClass;override;
  end;
  TStkRetuOrderAudit=class(TZProcFactory)
  public
    function Execute(AGlobal:IdbHelp;Params:TftParamList):Boolean;override;
  end;
  TStkRetuOrderUnAudit=class(TZProcFactory)
  public
    function Execute(AGlobal:IdbHelp;Params:TftParamList):Boolean;override;
  end;
  TStkRetuLocusNoAudit=class(TZProcFactory)
  public
    function Execute(AGlobal:IdbHelp;Params:TftParamList):Boolean;override;
  end;
  TStkRetuLocusNoUnAudit=class(TZProcFactory)
  public
    function Execute(AGlobal:IdbHelp;Params:TftParamList):Boolean;override;
  end;
  TStkRetuForLocusNoHeader=class(TZFactory)
  private
  public
    procedure InitClass;override;
  end;
  TStkRetuForLocusNo=class(TZFactory)
  private
  public
    procedure InitClass;override;
  end;
implementation

{ TStkRetuData }

function TStkRetuData.BeforeCommitRecord(AGlobal: IdbHelp): Boolean;
var
   rs:TZQuery;
   w:integer;
   s:string;
begin
   Result := true;
   //对整单库存进行检测
   if (Params.FindParam('SyncFlag')=nil) or (Params.FindParam('SyncFlag').asInteger=0) then
      begin
        if IsZeroOut then Exit;
        rs := TZQuery.Create(nil);
        try
          rs.SQL.Text :=
              'select jp2.*,p2.COLOR_NAME as COLOR_NAME from ('+
              'select jp1.*,p1.SIZE_NAME as SIZE_NAME from ('+
              'select b.GODS_CODE,b.GODS_NAME,j.TENANT_ID,j.PROPERTY_01,j.PROPERTY_02,j.BATCH_NO,j.IS_PRESENT,j.LOCUS_NO,j.BOM_ID from ('+
              'select A.TENANT_ID,A.SHOP_ID,A.GODS_ID,A.PROPERTY_01,A.PROPERTY_02,A.BATCH_NO,B.IS_PRESENT,B.LOCUS_NO,B.BOM_ID from STO_STORAGE A,STK_STOCKDATA B '+
              'where A.SHOP_ID=B.SHOP_ID and A.TENANT_ID=B.TENANT_ID and A.GODS_ID=B.GODS_ID and A.PROPERTY_01=B.PROPERTY_01 and A.PROPERTY_02=B.PROPERTY_02 and A.BATCH_NO=B.BATCH_NO '+
              ' and A.AMOUNT<0 and B.STOCK_ID=:STOCK_ID and B.SHOP_ID=:SHOP_ID and A.TENANT_ID=:TENANT_ID '+
              ') j inner join VIW_GOODSINFO b on j.GODS_ID=b.GODS_ID and j.TENANT_ID=b.TENANT_ID '+
              ') jp1 left join VIW_SIZE_INFO p1 on jp1.PROPERTY_01=p1.SIZE_ID  and jp1.TENANT_ID=p1.TENANT_ID '+
              ') jp2 left join VIW_COLOR_INFO p2 on jp2.PROPERTY_02=p2.COLOR_ID  and jp2.TENANT_ID=p2.TENANT_ID ';
          rs.Params.ParamByName('TENANT_ID').AsInteger := FieldbyName('TENANT_ID').AsInteger;
          rs.Params.ParamByName('SHOP_ID').AsString := FieldbyName('SHOP_ID').AsString;
          rs.Params.ParamByName('STOCK_ID').AsString := FieldbyName('STOCK_ID').AsString;
          AGlobal.Open(rs);
          w := 0;
          s := '';
          rs.first;
          while not rs.Eof do
            begin
              inc(w);
              if s<>'' then s := s + #10;
              s := s +'('+rs.FieldbyName('GODS_CODE').AsString+')'+rs.FieldbyName('GODS_NAME').AsString;
              if rs.FieldbyName('IS_PRESENT').AsString='1' then
                 s := s + '(赠品)';
              if rs.FieldbyName('BOM_ID').AsString <> '' then
                 s := s+ '(礼盒)';
              if rs.FieldbyName('SIZE_NAME').AsString <> '' then
                 s := s+ '  尺码:'+rs.FieldbyName('SIZE_NAME').AsString+'';
              if rs.FieldbyName('COLOR_NAME').AsString <> '' then
                 s := s+ '  颜色:'+rs.FieldbyName('COLOR_NAME').AsString+'';
              if rs.FieldbyName('BATCH_NO').AsString <> '#' then
                 s := s+ '  批号:'+rs.FieldbyName('COLOR_NAME').AsString+'';
              if rs.FieldbyName('LOCUS_NO').AsString <> '' then
                 s := s+ '  跟踪号:'+rs.FieldbyName('LOCUS_NO').AsString+'';
              if w>5 then break;
              rs.Next;
            end;
          if s<>'' then
            Raise Exception.Create(s+#10+'--商品库存不足,请核对是否输入正确？'); 
        finally
          rs.Free;
        end;
      end;
end;

function TStkRetuData.BeforeDeleteRecord(AGlobal: IdbHelp): Boolean;
var Str:string;
begin
  try
  if FieldbyName('BATCH_NO').asString='' then FieldbyName('BATCH_NO').asString := '#';
  DecStorage(AGlobal,FieldbyName('TENANT_ID').asOldString,FieldbyName('SHOP_ID').asOldString,
             FieldbyName('GODS_ID').asOldString,
             FieldbyName('PROPERTY_01').asOldString,
             FieldbyName('PROPERTY_02').asOldString,
             FieldbyName('BATCH_NO').asOldString,
             -FieldbyName('CALC_AMOUNT').asOldFloat,
             -(FieldbyName('CALC_MONEY').asOldFloat-roundto(FieldbyName('CALC_MONEY').asOldFloat/(1+FieldbyName('TAX_RATE').asOldFloat)*FieldbyName('TAX_RATE').asOldFloat,-2)),3);
//  if not lock then
//     WriteLogInfo(AGlobal,Parant.FieldbyName('CREA_USER').AsString,2,'400018','删除【单号'+Parant.FieldbyName('GLIDE_NO').asString+'】的“'+FieldbyName('GODS_NAME').asOldString+'”',EncodeLogInfo(self,'STK_STOCKDATA',usDeleted));
  Result := True;
  except
    on E:Exception do
      begin
        Result := False;
        Raise;
      end;
  end;
end;

function TStkRetuData.BeforeInsertRecord(AGlobal: IdbHelp): Boolean;
var
  Str:string;
  n:integer;
begin
  try
  if FieldbyName('BATCH_NO').asString='' then FieldbyName('BATCH_NO').asString := '#';
  IncStorage(AGlobal,FieldbyName('TENANT_ID').asString,FieldbyName('SHOP_ID').asString,
             FieldbyName('GODS_ID').asString,
             FieldbyName('PROPERTY_01').asString,
             FieldbyName('PROPERTY_02').asString,
             FieldbyName('BATCH_NO').asString,
             -FieldbyName('CALC_AMOUNT').asFloat,
             -(FieldbyName('CALC_MONEY').asFloat-roundto(FieldbyName('CALC_MONEY').asFloat/(1+FieldbyName('TAX_RATE').AsFloat)*FieldbyName('TAX_RATE').AsFloat,-2)),1);
  Result := True;
  except
    on E:Exception do
      begin
        Result := False;
        Raise;
      end;
  end;
end;

function TStkRetuData.BeforeModifyRecord(AGlobal: IdbHelp): Boolean;
begin
  lock := true;
  try
    result := BeforeDeleteRecord(AGlobal);
    result := BeforeInsertRecord(AGlobal);
  finally
    lock := false;
  end;
//  WriteLogInfo(AGlobal,Parant.FieldbyName('CREA_USER').AsString,2,'400018','修改【单号'+Parant.FieldbyName('GLIDE_NO').asString+'】的“'+FieldbyName('GODS_NAME').asOldString+'”',EncodeLogInfo(self,'STK_STOCKDATA',usModified));
end;

function TStkRetuData.BeforeUpdateRecord(AGlobal: IdbHelp): Boolean;
var Temp:TZQuery;
begin
  Result := true;
  Temp := TZQuery.Create(nil);
  try
     Temp.close;
     Temp.SQL.Text := 'select VALUE from SYS_DEFINE where TENANT_ID='+FieldbyName('TENANT_ID').AsString+' and DEFINE=''ZERO_OUT''';
     AGlobal.Open(Temp);
     IsZeroOut := (Temp.Fields[0].AsString = '1');
  finally
     Temp.free;
  end;
  case AGlobal.iDbType of
  0:AGlobal.ExecSQL('select count(*) from STO_STORAGE with(UPDLOCK) where TENANT_ID=:TENANT_ID and SHOP_ID=:SHOP_ID',self);
  1:AGlobal.ExecSQL('select count(*) from STO_STORAGE  where TENANT_ID=:TENANT_ID and SHOP_ID=:SHOP_ID for update',self);
  4:AGlobal.ExecSQL('select count(*) from STO_STORAGE  where TENANT_ID=:TENANT_ID and SHOP_ID=:SHOP_ID WITH RS USE AND KEEP UPDATE LOCKS',self);
  end;

end;

procedure TStkRetuData.InitClass;
var
  Str: string;
begin
  inherited;
  lock := false;
  SelectSQL.Text :=
      ' select jb.*,b.GODS_NAME as GODS_NAME,b.GODS_CODE as GODS_CODE from ('+
      ' select j.TENANT_ID,j.SHOP_ID,j.STOCK_ID,j.SEQNO,j.GODS_ID,j.PROPERTY_01,'+
      ' j.PROPERTY_02,j.BATCH_NO,j.LOCUS_NO,j.BOM_ID,j.UNIT_ID,-j.AMOUNT as AMOUNT,j.ORG_PRICE,j.IS_PRESENT,j.APRICE,-j.AMONEY as AMONEY,j.AGIO_RATE,-j.AGIO_MONEY as AGIO_MONEY,-j.CALC_AMOUNT as CALC_AMOUNT,-j.CALC_MONEY as CALC_MONEY,'+
      ' j.REMARK,-j.ORG_PRICE*j.AMOUNT as RTL_MONEY,h.TAX_RATE,j.LOCATION_ID from STK_STOCKDATA j,STK_STOCKORDER h where j.TENANT_ID=h.TENANT_ID and j.STOCK_ID=h.STOCK_ID and j.TENANT_ID=:TENANT_ID and j.STOCK_ID=:STOCK_ID) jb inner join VIW_GOODSINFO b '+
      ' on jb.TENANT_ID=b.TENANT_ID and jb.GODS_ID=b.GODS_ID order by jb.SEQNO';
  IsSQLUpdate := True;
  Str := 'insert into STK_STOCKDATA(TENANT_ID,SHOP_ID,SEQNO,STOCK_ID,GODS_ID,BATCH_NO,LOCUS_NO,BOM_ID,PROPERTY_01,PROPERTY_02,UNIT_ID,AMOUNT,ORG_PRICE,IS_PRESENT,APRICE,AMONEY,AGIO_RATE,AGIO_MONEY,CALC_AMOUNT,CALC_MONEY,REMARK,LOCATION_ID) '
    + 'VALUES(:TENANT_ID,:SHOP_ID,:SEQNO,:STOCK_ID,:GODS_ID,:BATCH_NO,:LOCUS_NO,:BOM_ID,:PROPERTY_01,:PROPERTY_02,:UNIT_ID,- :AMOUNT,:ORG_PRICE,:IS_PRESENT,:APRICE,- :AMONEY,:AGIO_RATE,- :AGIO_MONEY,- :CALC_AMOUNT,- :CALC_MONEY,:REMARK,:LOCATION_ID)';
  InsertSQL.Text := Str;
  Str := 'update STK_STOCKDATA set TENANT_ID=:TENANT_ID,SHOP_ID=:SHOP_ID,SEQNO=:SEQNO,STOCK_ID=:STOCK_ID,GODS_ID=:GODS_ID,BATCH_NO=:BATCH_NO,LOCUS_NO=:LOCUS_NO,BOM_ID=:BOM_ID,'+
         'PROPERTY_01=:PROPERTY_01,PROPERTY_02=:PROPERTY_02,UNIT_ID=:UNIT_ID,AMOUNT=- :AMOUNT,ORG_PRICE=:ORG_PRICE,'+
         'IS_PRESENT=:IS_PRESENT,APRICE=:APRICE,AMONEY=- :AMONEY,AGIO_RATE=:AGIO_RATE,AGIO_MONEY=- :AGIO_MONEY,CALC_AMOUNT=- :CALC_AMOUNT,CALC_MONEY=- :CALC_MONEY,REMARK=:REMARK,LOCATION_ID=:LOCATION_ID '
    + 'where TENANT_ID=:OLD_TENANT_ID and STOCK_ID=:OLD_STOCK_ID and SEQNO=:OLD_SEQNO';
  UpdateSQL.Text := str;
  Str := 'delete from STK_STOCKDATA where TENANT_ID=:OLD_TENANT_ID and STOCK_ID=:OLD_STOCK_ID and SEQNO=:OLD_SEQNO';
  DeleteSQL.Text := str;
end;

{ TStkRetuOrder }

function TStkRetuOrder.BeforeCommitRecord(AGlobal: IdbHelp): Boolean;
begin
end;

function TStkRetuOrder.BeforeDeleteRecord(AGlobal: IdbHelp): Boolean;
var rs:TZQuery;
begin
  if not Lock and not CheckTimeStamp(AGlobal,FieldbyName('TIME_STAMP').AsString,true) then Raise Exception.Create('当前单据已经被另一用户修改，你不能再保存。');
  if FieldbyName('STOCK_MNY').AsOldFloat <> 0 then
     begin
       rs := TZQuery.Create(nil);
       try
         rs.SQL.Text := 'select PAYM_MNY from ACC_PAYABLE_INFO where TENANT_ID=:TENANT_ID and STOCK_ID=:STOCK_ID and ABLE_TYPE=''5''';
         rs.ParamByName('TENANT_ID').AsInteger := FieldbyName('TENANT_ID').AsOldInteger;
         rs.ParamByName('STOCK_ID').AsString := FieldbyName('STOCK_ID').AsOldString;
         AGlobal.Open(rs);
         if (rs.Fields[0].AsFloat <>0) then Raise Exception.Create('已经收款的采购退货单不能修改...');
       finally
         rs.Free;
       end;
       AGlobal.ExecSQL('delete from ACC_PAYABLE_INFO where STOCK_ID=:OLD_STOCK_ID and TENANT_ID=:OLD_TENANT_ID and ABLE_TYPE=''5''',self);
     end;
//  if not lock then
//     WriteLogInfo(AGlobal,FieldbyName('CREA_USER').AsString,2,'400018','删除【单号'+FieldbyName('GLIDE_NO').asString+'】',EncodeLogInfo(self,'STK_STOCKORDER',usDeleted));
  result := true;
end;

function TStkRetuOrder.BeforeInsertRecord(AGlobal: IdbHelp): Boolean;
begin
  if (Params.FindParam('SyncFlag')=nil) or (Params.FindParam('SyncFlag').asInteger=0) then
  begin
     if (FieldbyName('GLIDE_NO').AsString='') or (pos('新增',FieldbyName('GLIDE_NO').AsString)>0) then
     FieldbyName('GLIDE_NO').asString := trimright(FieldbyName('SHOP_ID').AsString,4)+GetSequence(AGlobal,'GNO_2_'+FieldbyName('SHOP_ID').AsString,FieldbyName('TENANT_ID').AsString,formatDatetime('YYMMDD',now()),5);
     if (FieldbyName('STOCK_MNY').AsFloat <> 0) then
     begin
       if FieldbyName('ADVA_MNY').AsString = '' then FieldbyName('ADVA_MNY').AsFloat := 0;
       AGlobal.ExecSQL(
           'insert into ACC_PAYABLE_INFO(ABLE_ID,TENANT_ID,SHOP_ID,DEPT_ID,CLIENT_ID,ACCT_INFO,ABLE_TYPE,ACCT_MNY,PAYM_MNY,REVE_MNY,RECK_MNY,ABLE_DATE,STOCK_ID,CREA_DATE,CREA_USER,COMM,TIME_STAMP) '
         + 'VALUES('''+newid(FieldbyName('SHOP_ID').asString)+''',:TENANT_ID,:SHOP_ID,:DEPT_ID,:CLIENT_ID,'''+'进货退款【退货单号'+FieldbyName('GLIDE_NO').AsString+'】'+''',''5'',- :STOCK_MNY,0,- :ADVA_MNY,- :STOCK_MNY,:STOCK_DATE,:STOCK_ID,:CREA_DATE,:CREA_USER,''00'','+GetTimeStamp(iDbType)+')'
      ,self);
     end;
  end;
  result := true;
end;

function TStkRetuOrder.BeforeModifyRecord(AGlobal: IdbHelp): Boolean;
begin
  if not CheckTimeStamp(AGlobal,FieldbyName('TIME_STAMP').AsString,false) then Raise Exception.Create('当前单据已经被另一用户修改，你不能再保存。');
  lock := true;
  try
    result := BeforeDeleteRecord(AGlobal);
    result := BeforeInsertRecord(AGlobal);
  finally
    lock := true;
  end;
  //WriteLogInfo(AGlobal,FieldbyName('CREA_USER').AsString,2,'400018','修改【单号'+FieldbyName('GLIDE_NO').asString+'】',EncodeLogInfo(self,'STK_STOCKORDER',usModified));
end;

function TStkRetuOrder.BeforeUpdateRecord(AGlobal: IdbHelp): Boolean;
begin
   if (Params.FindParam('SyncFlag')=nil) or (Params.FindParam('SyncFlag').asInteger=0) then
      begin
        Result := GetReckOning(AGlobal,FieldbyName('TENANT_ID').asString,FieldbyName('SHOP_ID').asString,FieldbyName('STOCK_DATE').AsString,FieldbyName('TIME_STAMP').AsString);
        if FieldbyName('STOCK_DATE').AsOldString <> '' then
           Result := GetReckOning(AGlobal,FieldbyName('TENANT_ID').AsOldString,FieldbyName('SHOP_ID').AsOldString,FieldbyName('STOCK_DATE').AsOldString,FieldbyName('TIME_STAMP').AsOldString);
        result := true;
      end
   else
      Result := true;
end;

function TStkRetuOrder.CheckTimeStamp(aGlobal:IdbHelp;s:string;comm:boolean=true): boolean;
var
  rs:TZQuery;
begin
  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text := 'select TIME_STAMP,COMM from STK_STOCKORDER where STOCK_ID='''+FieldbyName('STOCK_ID').AsString+''' and TENANT_ID='+FieldbyName('TENANT_ID').AsString;
    aGlobal.Open(rs);
    result := (rs.Fields[0].AsString = s);
    if comm and result and
    (
       (copy(rs.Fields[1].asString,1,1)='1')
       or
       (copy(rs.Fields[1].asString,2,1)<>'0')
    )
    then Raise Exception.Create('已经同步的数据不能删除..');
  finally
    rs.Free;
  end;
end;

procedure TStkRetuOrder.InitClass;
var
  Str: string;
begin
  inherited;
  SelectSQL.Text :=
               'select jh.*,h.DEPT_NAME as DEPT_ID_TEXT from ('+
               'select jg.*,g.GLIDE_NO as STK_GLIDE_NO from ('+
               'select jf.*,f.USER_NAME as CREA_USER_TEXT from ('+
               'select je.*,e.SHOP_NAME as SHOP_ID_TEXT from ('+
               'select jd.*,d.USER_NAME as CHK_USER_TEXT from ('+
               'select jc.*,c.USER_NAME as GUIDE_USER_TEXT from ('+
               'select jb.*,b.CLIENT_NAME as CLIENT_ID_TEXT from '+
               '(select TENANT_ID,SHOP_ID,DEPT_ID,STOCK_ID,GLIDE_NO,STOCK_TYPE,STOCK_DATE,GUIDE_USER,CLIENT_ID,CHK_DATE,CHK_USER,FROM_ID,FIG_ID,INVOICE_FLAG,'+
               '-STOCK_MNY as STOCK_MNY,-STOCK_AMT as STOCK_AMT,-ADVA_MNY as ADVA_MNY,TAX_RATE,REMARK,COMM,CREA_DATE,CREA_USER,TIME_STAMP,LOCUS_STATUS '+
               'from STK_STOCKORDER where TENANT_ID=:TENANT_ID and STOCK_ID=:STOCK_ID) jb '+
               ' left outer join VIW_CLIENTINFO b on jb.TENANT_ID=b.TENANT_ID and jb.CLIENT_ID=b.CLIENT_ID ) jc '+
               ' left outer join VIW_USERS c on jc.TENANT_ID=c.TENANT_ID and jc.GUIDE_USER=c.USER_ID ) jd '+
               ' left outer join VIW_USERS d on jd.TENANT_ID=d.TENANT_ID and jd.CHK_USER=d.USER_ID ) je '+
               ' left outer join CA_SHOP_INFO e on  je.TENANT_ID=e.TENANT_ID and je.SHOP_ID=e.SHOP_ID ) jf '+
               ' left outer join VIW_USERS f on jf.TENANT_ID=f.TENANT_ID and jf.CREA_USER=f.USER_ID ) jg '+
               ' left outer join STK_STOCKORDER g on jg.TENANT_ID=g.TENANT_ID and jg.FROM_ID=g.STOCK_ID ) jh '+
               ' left outer join CA_DEPT_INFO h on jh.TENANT_ID=h.TENANT_ID and jh.DEPT_ID=h.DEPT_ID';
  IsSQLUpdate := True;
  Str := 'insert into STK_STOCKORDER(TENANT_ID,SHOP_ID,DEPT_ID,STOCK_ID,GLIDE_NO,STOCK_TYPE,STOCK_DATE,GUIDE_USER,CLIENT_ID,STOCK_MNY,STOCK_AMT,ADVA_MNY,CHK_DATE,CHK_USER,FROM_ID,FIG_ID,INVOICE_FLAG,TAX_RATE,REMARK,COMM,CREA_DATE,CREA_USER,TIME_STAMP) '
    + 'VALUES(:TENANT_ID,:SHOP_ID,:DEPT_ID,:STOCK_ID,:GLIDE_NO,:STOCK_TYPE,:STOCK_DATE,:GUIDE_USER,:CLIENT_ID,- :STOCK_MNY,- :STOCK_AMT,- :ADVA_MNY,:CHK_DATE,:CHK_USER,:FROM_ID,:FIG_ID,:INVOICE_FLAG,:TAX_RATE,:REMARK,''00'',:CREA_DATE,:CREA_USER,'+GetTimeStamp(iDbType)+')';
  InsertSQL.Text := str;
  Str := 'update STK_STOCKORDER set TENANT_ID=:TENANT_ID,SHOP_ID=:SHOP_ID,DEPT_ID=:DEPT_ID,STOCK_ID=:STOCK_ID,GLIDE_NO=:GLIDE_NO,STOCK_TYPE=:STOCK_TYPE,STOCK_DATE=:STOCK_DATE,GUIDE_USER=:GUIDE_USER,CLIENT_ID=:CLIENT_ID,CHK_DATE=:CHK_DATE,CHK_USER=:CHK_USER,'+
         'FROM_ID=:FROM_ID,FIG_ID=:FIG_ID,INVOICE_FLAG=:INVOICE_FLAG,TAX_RATE=:TAX_RATE,STOCK_MNY=- :STOCK_MNY,STOCK_AMT=- :STOCK_AMT,ADVA_MNY=- :ADVA_MNY,REMARK=:REMARK,'
    + 'COMM=' + GetCommStr(iDbType) + ','
    + 'TIME_STAMP='+GetTimeStamp(iDbType)+' '
    + 'where TENANT_ID=:OLD_TENANT_ID and STOCK_ID=:OLD_STOCK_ID';
  UpdateSQL.Text := str;
  Str := 'delete from STK_STOCKORDER where TENANT_ID=:OLD_TENANT_ID and STOCK_ID=:OLD_STOCK_ID';
  DeleteSQL.Text := str;
end;

{ TStkRetuOrderGetPrior }

procedure TStkRetuOrderGetPrior.InitClass;
begin
  inherited;
  case iDbType of
  0,3:SelectSQL.Text := 'select top 1 STOCK_ID from STK_STOCKORDER where SHOP_ID=:SHOP_ID and TENANT_ID=:TENANT_ID and CREA_USER=:CREA_USER and GLIDE_NO<:GLIDE_NO and STOCK_TYPE=:STOCK_TYPE order by GLIDE_NO desc';
  1:SelectSQL.Text := 'select * from (select STOCK_ID from STK_STOCKORDER where SHOP_ID=:SHOP_ID and TENANT_ID=:TENANT_ID and CREA_USER=:CREA_USER and GLIDE_NO<:GLIDE_NO and STOCK_TYPE=:STOCK_TYPE order by GLIDE_NO desc) where ROWNUM=1';
  4:SelectSQL.Text := 'select * from (select STOCK_ID from STK_STOCKORDER where SHOP_ID=:SHOP_ID and TENANT_ID=:TENANT_ID and CREA_USER=:CREA_USER and GLIDE_NO<:GLIDE_NO and STOCK_TYPE=:STOCK_TYPE order by GLIDE_NO desc) tp fetch first 1 rows only';
  5:SelectSQL.Text := 'select STOCK_ID from STK_STOCKORDER where SHOP_ID=:SHOP_ID and TENANT_ID=:TENANT_ID and CREA_USER=:CREA_USER and GLIDE_NO<:GLIDE_NO and STOCK_TYPE=:STOCK_TYPE order by GLIDE_NO desc limit 1';
  end;
end;

{ TStkRetuOrderGetNext }

procedure TStkRetuOrderGetNext.InitClass;
begin
  inherited;
  case iDbType of
  0,3:SelectSQL.Text := 'select top 1 STOCK_ID from STK_STOCKORDER where SHOP_ID=:SHOP_ID and TENANT_ID=:TENANT_ID and SHOP_ID=:SHOP_ID and CREA_USER=:CREA_USER and GLIDE_NO>:GLIDE_NO and STOCK_TYPE=:STOCK_TYPE order by GLIDE_NO';
  1:SelectSQL.Text := 'select * from (select STOCK_ID from STK_STOCKORDER where SHOP_ID=:SHOP_ID and TENANT_ID=:TENANT_ID and SHOP_ID=:SHOP_ID and CREA_USER=:CREA_USER and GLIDE_NO>:GLIDE_NO and STOCK_TYPE=:STOCK_TYPE order by GLIDE_NO) where ROWNUM=1';
  4:SelectSQL.Text := 'select * from (select STOCK_ID from STK_STOCKORDER where SHOP_ID=:SHOP_ID and TENANT_ID=:TENANT_ID and SHOP_ID=:SHOP_ID and CREA_USER=:CREA_USER and GLIDE_NO>:GLIDE_NO and STOCK_TYPE=:STOCK_TYPE order by GLIDE_NO) tp fetch first 1 rows only';
  5:SelectSQL.Text := 'select STOCK_ID from STK_STOCKORDER where SHOP_ID=:SHOP_ID and TENANT_ID=:TENANT_ID and SHOP_ID=:SHOP_ID and CREA_USER=:CREA_USER and GLIDE_NO>:GLIDE_NO and STOCK_TYPE=:STOCK_TYPE order by GLIDE_NO limit 1';
  end;
end;

{ TStkRetuOrderAudit }

function TStkRetuOrderAudit.Execute(AGlobal: IdbHelp;
  Params: TftParamList): Boolean;
var
  Str:string;
  n:Integer;
  rs:TZQuery;
begin
  AGlobal.BeginTrans;
  try
    Str := 'update STK_STOCKORDER set CHK_DATE='''+Params.FindParam('CHK_DATE').asString+''',CHK_USER='''+Params.FindParam('CHK_USER').asString+''',COMM=' + GetCommStr(AGlobal.iDbType) + ',TIME_STAMP='+GetTimeStamp(AGlobal.iDbType)+' where TENANT_ID='+Params.FindParam('TENANT_ID').asString+' and STOCK_ID='''+Params.FindParam('STOCK_ID').asString+''' and CHK_DATE IS NULL';
    n := AGlobal.ExecSQL(Str);
    if n=0 then
       Raise Exception.Create('没找到待审核单据，是否被另一用户删除或已审核。')
    else
    if n>1 then
       Raise Exception.Create('删除指令会影响多行，可能数据库中数据误。');
    rs := TZQuery.Create(nil);
    try
      rs.SQL.Text := 'select TENANT_ID,SHOP_ID,GODS_ID,LOCATION_ID,BATCH_NO,CALC_AMOUNT from STK_STOCKDATA where TENANT_ID=:TENANT_ID and STOCK_ID=:STOCK_ID';
      rs.ParamByName('TENANT_ID').AsInteger := Params.ParambyName('TENANT_ID').AsInteger;
      rs.ParamByName('STOCK_ID').AsString := Params.ParambyName('STOCK_ID').AsString;
      AGlobal.Open(rs);
      case AGlobal.iDbType of
      0:AGlobal.ExecSQL('select count(*) from STO_GOODS_LOCATION with(UPDLOCK) where TENANT_ID=:TENANT_ID',Params);
      1:AGlobal.ExecSQL('select count(*) from STO_GOODS_LOCATION where TENANT_ID=:TENANT_ID for update',Params);
      4:AGlobal.ExecSQL('select count(*) from STO_GOODS_LOCATION where TENANT_ID=:TENANT_ID  WITH RS USE AND KEEP UPDATE LOCKS',Params);
      end;
      rs.First;
      while not rs.Eof do
        begin
          DecLocation(AGlobal,rs.Fields[0].AsString,rs.Fields[1].AsString,rs.Fields[2].AsString,rs.Fields[3].AsString,rs.Fields[4].AsString,rs.Fields[5].AsFloat);
          rs.Next;
        end;
    finally
      rs.Free;
    end;
    AGlobal.CommitTrans;
    Result := true;
    Msg := '审核单据成功';
  except
    on E:Exception do
      begin
        AGlobal.RollbackTrans;
        Result := false;
        Msg := '审核错误'+E.Message;
      end;
  end;
end;

{ TStkRetuOrderUnAudit }

function TStkRetuOrderUnAudit.Execute(AGlobal: IdbHelp;
  Params: TftParamList): Boolean;
var Str:string;
    n:Integer;
  rs:TZQuery;
begin
  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text :=
      'select LOCUS_STATUS from STK_STOCKORDER where TENANT_ID='+Params.FindParam('TENANT_ID').asString+' and STOCK_ID='''+Params.FindParam('STOCK_ID').asString+'''';
    AGlobal.Open(rs);
    if rs.Fields[0].AsString='3' then Raise Exception.Create('已经扫码出库完毕，不能弃审..');
  finally
    rs.Free;
  end;
  AGlobal.BeginTrans; 
   try
    Str := 'update STK_STOCKORDER set CHK_DATE=null,CHK_USER=null,COMM=' + GetCommStr(AGlobal.iDbType) + ',TIME_STAMP='+GetTimeStamp(AGlobal.iDbType)+' where TENANT_ID='+Params.FindParam('TENANT_ID').asString+' and STOCK_ID='''+Params.FindParam('STOCK_ID').asString+''' and CHK_DATE IS NOT NULL';
    n := AGlobal.ExecSQL(Str);
    if n=0 then
       Raise Exception.Create('没找到已审核单据，是否被另一用户删除或反审核。')
    else
    if n>1 then
       Raise Exception.Create('删除指令会影响多行，可能数据库中数据误。');
    rs := TZQuery.Create(nil);
    try
      rs.SQL.Text := 'select TENANT_ID,SHOP_ID,GODS_ID,LOCATION_ID,BATCH_NO,CALC_AMOUNT from STK_STOCKDATA where TENANT_ID=:TENANT_ID and STOCK_ID=:STOCK_ID';
      rs.ParamByName('TENANT_ID').AsInteger := Params.ParambyName('TENANT_ID').AsInteger;
      rs.ParamByName('STOCK_ID').AsString := Params.ParambyName('STOCK_ID').AsString;
      AGlobal.Open(rs);
      case AGlobal.iDbType of
      0:AGlobal.ExecSQL('select count(*) from STO_GOODS_LOCATION with(UPDLOCK) where TENANT_ID=:TENANT_ID',Params);
      1:AGlobal.ExecSQL('select count(*) from STO_GOODS_LOCATION where TENANT_ID=:TENANT_ID for update',Params);
      4:AGlobal.ExecSQL('select count(*) from STO_GOODS_LOCATION where TENANT_ID=:TENANT_ID  WITH RS USE AND KEEP UPDATE LOCKS',Params);
      end;
      rs.First;
      while not rs.Eof do
        begin
          IncLocation(AGlobal,rs.Fields[0].AsString,rs.Fields[1].AsString,rs.Fields[2].AsString,rs.Fields[3].AsString,rs.Fields[4].AsString,rs.Fields[5].AsFloat);
          rs.Next;
        end;
    finally
      rs.Free;
    end;
    AGlobal.CommitTrans;
    MSG := '反审核单据成功。';
    Result := True;
  except
    on E:Exception do
       begin
         AGlobal.RollbackTrans;
         Result := False;
         Msg := '反审核错误:'+E.Message;
       end;
  end;
end;

{ TStkRetuForLocusNo }

procedure TStkRetuForLocusNo.InitClass;
var
  Str: string;
begin
  inherited;
  SelectSQL.Text :=
      'select TENANT_ID,SHOP_ID,STOCK_ID,SEQNO,GODS_ID,PROPERTY_01,PROPERTY_02,BATCH_NO,LOCUS_DATE,LOCUS_NO,UNIT_ID,- AMOUNT as AMOUNT,-CALC_AMOUNT as CALC_AMOUNT,CREA_DATE,CREA_USER,COMM,TIME_STAMP '+
      'from STK_LOCUS_FORSTCK j where j.TENANT_ID=:TENANT_ID and j.STOCK_ID=:STOCK_ID order by SEQNO';
  IsSQLUpdate := True;
  Str := 'insert into STK_LOCUS_FORSTCK(TENANT_ID,SHOP_ID,STOCK_ID,SEQNO,GODS_ID,PROPERTY_01,PROPERTY_02,BATCH_NO,LOCUS_DATE,LOCUS_NO,UNIT_ID,AMOUNT,CALC_AMOUNT,CREA_DATE,CREA_USER,COMM,TIME_STAMP) '
    + 'VALUES(:TENANT_ID,:SHOP_ID,:STOCK_ID,:SEQNO,:GODS_ID,:PROPERTY_01,:PROPERTY_02,:BATCH_NO,:LOCUS_DATE,:LOCUS_NO,:UNIT_ID,- :AMOUNT,- :CALC_AMOUNT,:CREA_DATE,:CREA_USER,''00'','+GetTimeStamp(iDbType)+')';
  InsertSQL.Text := str;
  Str := 'update STK_LOCUS_FORSTCK set TENANT_ID=:TENANT_ID,SHOP_ID=:SHOP_ID,STOCK_ID=:STOCK_ID,SEQNO=:SEQNO,GODS_ID=:GODS_ID,PROPERTY_01=:PROPERTY_01,PROPERTY_02=:PROPERTY_02,BATCH_NO=:BATCH_NO,'+
      'LOCUS_DATE=:LOCUS_DATE,LOCUS_NO=:LOCUS_NO,UNIT_ID=:UNIT_ID,AMOUNT=- :AMOUNT,CALC_AMOUNT=- :CALC_AMOUNT,CREA_DATE=:CREA_DATE,CREA_USER=:CREA_USER, '
    + 'COMM=' + GetCommStr(iDbType) + ','
    + 'TIME_STAMP='+GetTimeStamp(iDbType)+' '
    + 'where TENANT_ID=:OLD_TENANT_ID and STOCK_ID=:OLD_STOCK_ID and SEQNO=:OLD_SEQNO';
  UpdateSQL.Text := str;
  Str := 'delete from STK_LOCUS_FORSTCK where TENANT_ID=:OLD_TENANT_ID and STOCK_ID=:OLD_STOCK_ID and SEQNO=:OLD_SEQNO';
  DeleteSQL.Text := str;
end;

{ TStkRetuForLocusNoHeader }

procedure TStkRetuForLocusNoHeader.InitClass;
var
  Str: string;
begin
  inherited;
  SelectSQL.Text :=
               'select jh.*,h.DEPT_NAME as DEPT_ID_TEXT from ('+
               'select jg.*,g.GLIDE_NO as STK_GLIDE_NO from ('+
               'select jf.*,f.USER_NAME as CREA_USER_TEXT from ('+
               'select je.*,e.SHOP_NAME as SHOP_ID_TEXT from ('+
               'select jd.*,d.USER_NAME as CHK_USER_TEXT from ('+
               'select jc.*,c.USER_NAME as GUIDE_USER_TEXT from ('+
               'select jb.*,b.CLIENT_NAME as CLIENT_ID_TEXT from '+
               '(select TENANT_ID,SHOP_ID,DEPT_ID,STOCK_ID,GLIDE_NO,STOCK_TYPE,STOCK_DATE,GUIDE_USER,CLIENT_ID,CHK_DATE,CHK_USER,FROM_ID,FIG_ID,INVOICE_FLAG,'+
               '-STOCK_MNY as STOCK_MNY,-STOCK_AMT as STOCK_AMT,-ADVA_MNY as ADVA_MNY,TAX_RATE,REMARK,COMM,CREA_DATE,CREA_USER,TIME_STAMP,'+
               'LOCUS_STATUS,LOCUS_USER,LOCUS_DATE,-LOCUS_AMT as LOCUS_AMT,LOCUS_CHK_DATE,LOCUS_CHK_USER '+
               'from STK_STOCKORDER where TENANT_ID=:TENANT_ID and STOCK_ID=:STOCK_ID) jb '+
               ' left outer join VIW_CLIENTINFO b on jb.TENANT_ID=b.TENANT_ID and jb.CLIENT_ID=b.CLIENT_ID ) jc '+
               ' left outer join VIW_USERS c on jc.TENANT_ID=c.TENANT_ID and jc.GUIDE_USER=c.USER_ID ) jd '+
               ' left outer join VIW_USERS d on jd.TENANT_ID=d.TENANT_ID and jd.CHK_USER=d.USER_ID ) je '+
               ' left outer join CA_SHOP_INFO e on  je.TENANT_ID=e.TENANT_ID and je.SHOP_ID=e.SHOP_ID ) jf '+
               ' left outer join VIW_USERS f on jf.TENANT_ID=f.TENANT_ID and jf.CREA_USER=f.USER_ID ) jg '+
               ' left outer join STK_STOCKORDER g on jg.TENANT_ID=g.TENANT_ID and jg.FROM_ID=g.STOCK_ID ) jh '+
               ' left outer join CA_DEPT_INFO h on jh.TENANT_ID=h.TENANT_ID and jh.DEPT_ID=h.DEPT_ID';
  Str :=
      'update STK_STOCKORDER set LOCUS_STATUS=:LOCUS_STATUS,LOCUS_USER=:LOCUS_USER,LOCUS_DATE=:LOCUS_DATE,LOCUS_AMT=- :LOCUS_AMT,LOCUS_CHK_DATE=:LOCUS_CHK_DATE,LOCUS_CHK_USER=:LOCUS_CHK_USER,'
    + 'COMM=' + GetCommStr(iDbType) + ','
    + 'TIME_STAMP='+GetTimeStamp(iDbType)+' '
    + 'where TENANT_ID=:OLD_TENANT_ID and STOCK_ID=:OLD_STOCK_ID';
  UpdateSQL.Text := Str;
end;

{ TStkRetuLocusNoAudit }

function TStkRetuLocusNoAudit.Execute(AGlobal: IdbHelp;
  Params: TftParamList): Boolean;
var
  Str:string;
  n:Integer;
  rs:TZQuery;
begin
  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text :=
      'select LOCUS_STATUS from STK_STOCKORDER where TENANT_ID='+Params.FindParam('TENANT_ID').asString+' and STOCK_ID='''+Params.FindParam('STOCK_ID').asString+'''';
    AGlobal.Open(rs);
    if rs.Fields[0].AsString<>'3' then Raise Exception.Create('没有发货完毕，不能审核..');
  finally
    rs.Free;
  end;
  try
    Str := 'update STK_STOCKORDER set LOCUS_CHK_DATE='''+Params.FindParam('LOCUS_CHK_DATE').asString+''',LOCUS_CHK_USER='''+Params.FindParam('LOCUS_CHK_USER').asString+''',COMM=' + GetCommStr(AGlobal.iDbType) + ',TIME_STAMP='+GetTimeStamp(AGlobal.iDbType)+' where TENANT_ID='+Params.FindParam('TENANT_ID').asString+' and STOCK_ID='''+Params.FindParam('STOCK_ID').asString+''' and LOCUS_CHK_DATE IS NULL';
    n := AGlobal.ExecSQL(Str);
    if n=0 then
       Raise Exception.Create('没找到待审核单据，是否被另一用户删除或已审核。')
    else
    if n>1 then
       Raise Exception.Create('删除指令会影响多行，可能数据库中数据误。');
    Result := true;
    Msg := '审核单据成功';
  except
    on E:Exception do
      begin
        Result := false;
        Msg := '审核错误'+E.Message;
      end;
  end;
end;

{ TStkRetuLocusNoUnAudit }

function TStkRetuLocusNoUnAudit.Execute(AGlobal: IdbHelp;
  Params: TftParamList): Boolean;
var Str:string;
    n:Integer;
  rs:TZQuery;
begin
   try
    Str := 'update STK_STOCKORDER set LOCUS_CHK_DATE=null,LOCUS_CHK_USER=null,LOCUS_STATUS=''1'',COMM=' + GetCommStr(AGlobal.iDbType) + ',TIME_STAMP='+GetTimeStamp(AGlobal.iDbType)+' where TENANT_ID='+Params.FindParam('TENANT_ID').asString+' and STOCK_ID='''+Params.FindParam('STOCK_ID').asString+''' and LOCUS_CHK_DATE IS NOT NULL';
    n := AGlobal.ExecSQL(Str);
    if n=0 then
       Raise Exception.Create('没找到已审核单据，是否被另一用户删除或反审核。')
    else
    if n>1 then
       Raise Exception.Create('删除指令会影响多行，可能数据库中数据误。');
    MSG := '反审核单据成功。';
    Result := True;
  except
    on E:Exception do
       begin
         Result := False;
         Msg := '反审核错误:'+E.Message;
       end;
  end;
end;

initialization
  RegisterClass(TStkRetuOrder);
  RegisterClass(TStkRetuData);
  RegisterClass(TStkRetuOrderGetPrior);
  RegisterClass(TStkRetuOrderGetNext);
  RegisterClass(TStkRetuOrderAudit);
  RegisterClass(TStkRetuOrderUnAudit);
  RegisterClass(TStkRetuForLocusNo);
  RegisterClass(TStkRetuForLocusNoHeader);
  RegisterClass(TStkRetuLocusNoAudit);
  RegisterClass(TStkRetuLocusNoUnAudit);
finalization
  UnRegisterClass(TStkRetuOrder);
  UnRegisterClass(TStkRetuData);
  UnRegisterClass(TStkRetuOrderGetPrior);
  UnRegisterClass(TStkRetuOrderGetNext);
  UnRegisterClass(TStkRetuOrderAudit);
  UnRegisterClass(TStkRetuOrderUnAudit);
  UnRegisterClass(TStkRetuForLocusNo);
  UnRegisterClass(TStkRetuForLocusNoHeader);
  UnRegisterClass(TStkRetuLocusNoAudit);
  UnRegisterClass(TStkRetuLocusNoUnAudit);
end.
