unit ObjAccount;

interface
uses Dialogs,SysUtils,zBase,Classes,DB,ZIntf,ZDataset,ObjCommon;
type
  TAccount=class(TZFactory)
  public
    procedure InitClass; override;
    function CheckReck(AGlobal:IdbHelp):boolean;
    function BeforeInsertRecord(AGlobal:IdbHelp):Boolean;override;
    //记录行集修改检测函数，返回值是True 测可以修改当前记录
    function BeforeModifyRecord(AGlobal:IdbHelp):Boolean;override;
    //记录行集删除检测函数，返回值是True 测可以删除当前记录
    function BeforeDeleteRecord(AGlobal:IdbHelp):Boolean;override;
  end;

implementation
{ TAccount }

function TAccount.BeforeDeleteRecord(AGlobal: IdbHelp): Boolean;
var rs,rs1:TZQuery;
begin
  Result := False;
  rs := TZQuery.Create(nil);
  rs1 := TZQuery.Create(nil);
  try
    rs.SQL.Text := 'select OUT_MNY,IN_MNY,BALANCE from ACC_ACCOUNT_INFO where COMM not in (''02'',''12'') and TENANT_ID=:TENANT_ID and ACCOUNT_ID=:ACCOUNT_ID and SHOP_ID=:SHOP_ID';
    rs.ParamByName('TENANT_ID').AsString := FieldByName('TENANT_ID').AsString;
    rs.ParamByName('ACCOUNT_ID').AsString := FieldByName('ACCOUNT_ID').AsOldString;
    rs.ParamByName('SHOP_ID').AsString := FieldByName('SHOP_ID').AsOldString;
    rs1.SQL.Text := 'select count(*) from RCK_DAYS_CLOSE where TENANT_ID=:TENANT_ID';
    rs1.ParamByName('TENANT_ID').AsString := FieldbyName('TENANT_ID').AsString;
    AGlobal.Open(rs);
    AGlobal.Open(rs1);
    if (rs.FieldByName('OUT_MNY').AsFloat <> 0) or (rs.FieldByName('IN_MNY').AsFloat <> 0) or (rs1.Fields[0].AsInteger > 0) then
      Raise Exception.Create('此账户金额有变动,不能删除!');
  finally
    rs.Free;
    rs1.Free;
  end;
  result := true;
end;

function TAccount.BeforeInsertRecord(AGlobal: IdbHelp): Boolean;
var rs:TZQuery;
begin
  Result := False;
  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text := 'select ACCT_NAME from ACC_ACCOUNT_INFO where COMM not in (''02'',''12'') and ACCT_NAME=:ACCT_NAME and TENANT_ID=:TENANT_ID and SHOP_ID=:SHOP_ID';
    rs.ParamByName('TENANT_ID').AsInteger := FieldByName('TENANT_ID').AsInteger;
    rs.ParamByName('ACCT_NAME').AsString := FieldByName('ACCT_NAME').AsString;
    rs.ParamByName('SHOP_ID').AsString := FieldByName('SHOP_ID').AsString;
    AGlobal.Open(rs);
    if rs.FieldByName('ACCT_NAME').AsString = '' then
      Raise Exception.Create('此账户名已经存在,请重新输入..');
  finally
    rs.Free;
  end;
  Result:=True;
end;

function TAccount.BeforeModifyRecord(AGlobal: IdbHelp): Boolean;
var rs,rs1:TZQuery;
begin
  Result := False;
  rs := TZQuery.Create(nil);
  rs1 := TZQuery.Create(nil);
  try
    rs.SQL.Text := 'select OUT_MNY,IN_MNY from ACC_ACCOUNT_INFO where COMM not in (''02'',''12'') and TENANT_ID=:TENANT_ID and ACCOUNT_ID=:ACCOUNT_ID and SHOP_ID=:SHOP_ID';
    rs.ParamByName('TENANT_ID').AsString := FieldByName('TENANT_ID').AsString;
    rs.ParamByName('ACCOUNT_ID').AsString := FieldByName('ACCOUNT_ID').AsOldString;
    rs.ParamByName('SHOP_ID').AsString := FieldByName('SHOP_ID').AsOldString;
    rs1.SQL.Text := 'select count(*) from RCK_DAYS_CLOSE where TENANT_ID=:TENANT_ID';
    rs1.ParamByName('TENANT_ID').AsString := FieldbyName('TENANT_ID').AsString;
    AGlobal.Open(rs);
    AGlobal.Open(rs1);
    if ((rs.FieldByName('OUT_MNY').AsFloat <> 0) or (rs.FieldByName('OUT_MNY').AsFloat <> 0) or (rs1.Fields[0].AsInteger > 0))
      and
       (FieldbyName('ORG_MNY').AsFloat<>FieldbyName('ORG_MNY').AsOldFloat)
     then
      Raise Exception.Create('已经存在结账记录不能修改期初金额...');
  finally
    rs.Free;
    rs1.Free;
  end;

end;


function TAccount.CheckReck(AGlobal: IdbHelp): boolean;
var rs:TZQuery;
begin
  Result := False;
  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text := 'select * from ACC_RECVORDER where TENANT_ID=:TENANT_ID and SHOP_ID=:SHOP_ID and ACCOUNT_ID=:ACCOUNT_ID';
    rs.FieldByName('TENANT_ID').AsString := FieldbyName('TENANT_ID').AsOldString;
    rs.FieldByName('SHOP_ID').AsString := FieldbyName('SHOP_ID').AsOldString;
    rs.FieldByName('ACCOUNT_ID').AsString := FieldbyName('ACCOUNT_ID').AsOldString;
    AGlobal.Open(rs);
    if not rs.IsEmpty then
      Raise Exception.Create('此账户在收款单据中有使用,不能删除!');

    rs.SQL.Text := 'select * from ACC_PAYORDER where TENANT_ID=:TENANT_ID and SHOP_ID=:SHOP_ID and ACCOUNT_ID=:ACCOUNT_ID';
    rs.FieldByName('TENANT_ID').AsString := FieldbyName('TENANT_ID').AsOldString;
    rs.FieldByName('SHOP_ID').AsString := FieldbyName('SHOP_ID').AsOldString;
    rs.FieldByName('ACCOUNT_ID').AsString := FieldbyName('ACCOUNT_ID').AsOldString;
    AGlobal.Open(rs);
    if not rs.IsEmpty then
      Raise Exception.Create('此账户在付款单据中有使用,不能删除!');

    rs.SQL.Text := 'select * from ACC_TRANSORDER where TENANT_ID=:TENANT_ID and SHOP_ID=:SHOP_ID and IN_ACCOUNT_ID=:ACCOUNT_ID or OUT_ACCOUNT_ID=:ACCOUNT_ID';
    rs.FieldByName('TENANT_ID').AsString := FieldbyName('TENANT_ID').AsOldString;
    rs.FieldByName('SHOP_ID').AsString := FieldbyName('SHOP_ID').AsOldString;
    rs.FieldByName('ACCOUNT_ID').AsString := FieldbyName('ACCOUNT_ID').AsOldString;
    AGlobal.Open(rs);
    if not rs.IsEmpty then
      Raise Exception.Create('此账户在存取款单据中有使用,不能删除!');

  finally
    rs.Free;
  end;
  Result := True;
end;

procedure TAccount.InitClass;
var
  Str: string;
begin
  inherited;
  KeyFields:='ACCOUNT_ID;TENANT_ID';

  Str := 'select TENANT_ID,ACCOUNT_ID,SHOP_ID,ACCT_NAME,ACCT_SPELL,PAYM_ID,ORG_MNY,OUT_MNY,IN_MNY,BALANCE '+
  'from ACC_ACCOUNT_INFO where COMM not in (''02'',''12'') and TENANT_ID=:TENANT_ID and ACCOUNT_ID=:ACCOUNT_ID ';
  SelectSQL.Text := Str;
  IsSQLUpdate := True;
  Str := 'insert into ACC_ACCOUNT_INFO(TENANT_ID,ACCOUNT_ID,SHOP_ID,ACCT_NAME,ACCT_SPELL,PAYM_ID,ORG_MNY,OUT_MNY,IN_MNY,BALANCE,COMM,TIME_STAMP) '+
  'values(:TENANT_ID,:ACCOUNT_ID,:SHOP_ID,:ACCT_NAME,:ACCT_SPELL,:PAYM_ID,:ORG_MNY,:OUT_MNY,:IN_MNY,:BALANCE,''00'','+GetTimeStamp(iDbType)+')';
  InsertSQL.Text := Str;

  Str := 'update ACC_ACCOUNT_INFO set ACCT_NAME=:ACCT_NAME,ACCT_SPELL=:ACCT_SPELL,PAYM_ID=:PAYM_ID,ORG_MNY=:ORG_MNY,'+
  'OUT_MNY=:OUT_MNY,IN_MNY=:IN_MNY,BALANCE=:BALANCE,COMM='+GetCommStr(iDbType)+',TIME_STAMP='+GetTimeStamp(iDbType)+
  ' where COMM not in (''02'',''12'') and TENANT_ID=:OLD_TENANT_ID and ACCOUNT_ID=:OLD_ACCOUNT_ID and SHOP_ID=:OLD_SHOP_ID ';
  UpdateSQL.Text := Str;

  Str := 'update ACC_ACCOUNT_INFO set COMM=''02'',TIME_STAMP='+GetTimeStamp(iDbType)+
  ' where COMM not in (''02'',''12'') and TENANT_ID=:OLD_TENANT_ID and ACCOUNT_ID=:OLD_ACCOUNT_ID and SHOP_ID=:OLD_SHOP_ID ';
  DeleteSQL.Text := Str;
end;

initialization
  RegisterClass(TAccount);
finalization
  UnRegisterClass(TAccount);

end.
