unit ObjSysDefine;

interface

uses SysUtils, ZBase, Classes, AdoDB,zIntf,ObjCommon;

type
  TSysDefine = class(TZFactory)
  private
    procedure InitClass; override;
    function BeforeDeleteRecord(AGlobal: IdbHelp): Boolean; override;
    function BeforeInsertRecord(AGlobal: IdbHelp): Boolean; override;
    function BeforeModifyRecord(AGlobal: IdbHelp): Boolean; override;
  public
  end;

implementation

{ TSysDefine }

function TSysDefine.BeforeDeleteRecord(AGlobal: IdbHelp): Boolean;
begin
  if FieldbyName('DEFINE').AsString <> 'USING_DATE' then
  begin
  AGlobal.ExecSQL('delete from SYS_DEFINE where DEFINE=:OLD_DEFINE and COMP_ID in (select COMP_ID from CA_COMPANY where UPCOMP_ID=:OLD_COMP_ID and COMP_TYPE=2)',self);
  end;
  Result := True;
end;

function TSysDefine.BeforeInsertRecord(AGlobal: IdbHelp): Boolean;
begin
  Result := True;
  {if FieldbyName('DEFINE').AsString <> 'USING_DATE' then
  begin
  AGlobal.ExecSQL('delete from SYS_DEFINE where [DEFINE]=:DEFINE and COMP_ID in (select COMP_ID from CA_COMPANY where UPCOMP_ID=:COMP_ID and COMP_TYPE=2)',self);
  AGlobal.ExecSQL('insert into SYS_DEFINE(COMP_ID,DEFINE,VALUE,VALUE_TYPE,COMM,TIME_STAMP) '+
                   'select COMP_ID,:DEFINE,:VALUE,:VALUE_TYPE,''00'','+GetTimeStamp(iDbType)+' '+
                   'from CA_COMPANY where UPCOMP_ID=:COMP_ID and COMP_TYPE=2',self);
  end; }
end;

function TSysDefine.BeforeModifyRecord(AGlobal: IdbHelp): Boolean;
begin
  {if FieldbyName('DEFINE').AsString <> 'USING_DATE' then
  begin
  AGlobal.ExecSQL('update SYS_DEFINE set DEFINE=:DEFINE,VALUE=:VALUE,VALUE_TYPE=:VALUE_TYPE,'+
                   'COMM='+GetCommStr(iDbType)+',TIME_STAMP='+GetTimeStamp(iDbType)+' '+
                   'where DEFINE=:OLD_DEFINE and COMP_ID in (select COMP_ID from CA_COMPANY where UPCOMP_ID=:OLD_COMP_ID and COMP_TYPE=2)',self);
  AGlobal.ExecSQL('insert into SYS_DEFINE(COMP_ID,DEFINE,VALUE,VALUE_TYPE,COMM,TIME_STAMP)  '+
                  'select B.COMP_ID,DEFINE,VALUE,VALUE_TYPE,''00'','+GetTimeStamp(iDbType)+' from SYS_DEFINE A,CA_COMPANY B where A.COMP_ID=:OLD_COMP_ID and B.COMP_ID in (select COMP_ID from CA_COMPANY where UPCOMP_ID=:OLD_COMP_ID and COMP_TYPE=2)'+
                  'and not Exists(select * from SYS_DEFINE where DEFINE=A.DEFINE and COMP_ID=B.COMP_ID)',self);
  end;}
  Result := True;
end;

procedure TSysDefine.InitClass;
var Str: string;  //,l,r
begin
  inherited;
  KeyFields := 'TENANT_ID;DEFINE';

  IsSQLUpdate := True;
  {case iDbType of
  0,3:begin l:='[';r:=']';end;
  1:begin l:='"';r:='"';end;
  end;}

  //SelectSQL.Text := 'select TENANT_ID,DEFINE,'+l+'VALUE'+r+',VALUE_TYPE from SYS_DEFINE where TENANT_ID=:TENANT_ID';
  SelectSQL.Text := 'select TENANT_ID,DEFINE,[VALUE],VALUE_TYPE from SYS_DEFINE where TENANT_ID=:TENANT_ID';

  Str := 'insert into SYS_DEFINE(TENANT_ID,DEFINE,[VALUE],VALUE_TYPE,COMM,TIME_STAMP) '+
  'values(:TENANT_ID,:DEFINE,:VALUE,:VALUE_TYPE,''00'','+GetTimeStamp(iDbType)+')';
  InsertSQL.Text := Str;
  Str := 'update SYS_DEFINE set TENANT_ID=:TENANT_ID,DEFINE=:DEFINE,[VALUE]=:VALUE,VALUE_TYPE=:VALUE_TYPE,'+
  'COMM='+GetCommStr(iDbType)+',TIME_STAMP='+GetTimeStamp(iDbType)+' where TENANT_ID=:OLD_TENANT_ID and DEFINE=:OLD_DEFINE';
  UpdateSQL.Text := Str;
  {case iDbType of
  0,1: Str := 'delete SYS_DEFINE where COMP_ID=:OLD_COMP_ID and DEFINE=:OLD_DEFINE';
    3: Str := 'delete from SYS_DEFINE where COMP_ID=:OLD_COMP_ID and DEFINE=:OLD_DEFINE';
  end;}
  Str := 'delete SYS_DEFINE where TENANT_ID=:OLD_TENANT_ID and DEFINE=:OLD_DEFINE';
  DeleteSQL.Text := Str;
end;

initialization
  RegisterClass(TSysDefine);
finalization
  UnRegisterClass(TSysDefine);
end.

