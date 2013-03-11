unit ObjSyncFactoryV60;

interface

uses Dialogs,SysUtils,zBase,Variants,Classes,DB,ZIntf,ZDataset,ObjCommon,ZDbcCache,ZDbcIntfs,Math;

type
  TSyncSingleTableV60=class(TZFactory)
  private
    InsertQuery:TZQuery;
    UpdateQuery:TZQuery;
    COMMIdx:integer;
    TIME_STAMPIdx:integer;
    Init:boolean;
    FMaxCol: integer;
    procedure SetMaxCol(const Value: integer);
  protected
    procedure InitSQL(AGlobal: IdbHelp;TimeStamp:boolean=true);virtual;
    function GetRowAccessor: TZRowAccessor;
    procedure FillParams(ZQuery: TZQuery);virtual;
  public
    function CheckUnique(s:string):boolean;
    function BeforeOpenRecord(AGlobal:IdbHelp):Boolean;override;
    function BeforeInsertRecord(AGlobal:IdbHelp):Boolean;override;
    function BeforeDeleteRecord(AGlobal:IdbHelp):Boolean;override;
    procedure InitClass;override;
    destructor Destroy;override;
    property RowAccessor:TZRowAccessor read GetRowAccessor;
    property MaxCol:integer read FMaxCol write SetMaxCol;
  end;

implementation

function TSyncSingleTableV60.BeforeDeleteRecord(AGlobal: IdbHelp): Boolean;
var js:string;
begin
  case AGlobal.iDbType of
  0:js := '+';
  1,4,5:js := '||';
  end;
  AGlobal.ExecSQL(ParseSQL(AGlobal.iDbType,'update '+Params.ParambyName('TABLE_NAME').AsString+' set COMM=''1'''+js+'substring(COMM,2,1) where TENANT_ID=:TENANT_ID and TIME_STAMP>:TIME_STAMP'),Params);
end;

procedure TSyncSingleTableV60.FillParams(ZQuery:TZQuery);
var
  i:integer;
  WasNull:boolean;
  Comm:string;
begin
  if MaxCol=0 then MaxCol := RowAccessor.ColumnCount;
  for i:= 0 to MaxCol-1 do
    begin
      case RowAccessor.GetColumnType(i+1) of
      stBoolean:
        begin
          ZQuery.Params[i].AsBoolean := RowAccessor.GetBoolean(i+1,WasNull);
        end;
      stShort,stByte:
        begin
          ZQuery.Params[i].AsSmallInt := RowAccessor.GetShort(i+1,WasNull);
        end;
      stInteger:
        begin
          ZQuery.Params[i].AsInteger := RowAccessor.GetInt(i+1,WasNull);
        end;
      stLong:
        begin
          ZQuery.Params[i].Value := RowAccessor.GetLong(i+1,WasNull);
        end;
      stFloat,stDouble,stBigDecimal:
        begin
          ZQuery.Params[i].AsFloat := RowAccessor.GetBigDecimal(i+1,WasNull);
        end;
      stString:
        begin
          ZQuery.Params[i].AsString := RowAccessor.GetString(i+1,WasNull);
        end;
      stUnicodeString,stUnicodeStream:
        begin
          ZQuery.Params[i].AsString := RowAccessor.GetUnicodeString(i+1,WasNull);
        end;
      stBytes:
        begin
          ZQuery.Params[i].AsString := RowAccessor.GetString(i+1,WasNull);
        end;
      stDate,stTime,stTimestamp:
        begin
          ZQuery.Params[i].AsDateTime := RowAccessor.GetTimestamp(i+1,WasNull);
        end;
      stAsciiStream,stBinaryStream:
        begin
          ZQuery.Params[i].AsBlob := RowAccessor.GetString(i+1,WasNull);
        end
      else
        Raise Exception.Create('不支持的数据类型');
      end;
      if (i=(COMMIdx-1)) and (Params.FindParam('COMM_LOCK')=nil) then //把通讯标志位改为 1
         begin
           Comm := ZQuery.Params[i].AsString;
           Comm[1] := '1';
           ZQuery.Params[i].AsString := Comm;
         end;
      if (i=(TIME_STAMPIdx-1)) then
         begin
           if ZQuery.Params[i].Value>2808566734 then
              ZQuery.Params[i].Value := 5497000;
           if (Params.FindParam('TIME_STAMP_NOCHG')<>nil) and (Params.ParamByName('TIME_STAMP_NOCHG').AsInteger = 0) and (ZQuery.Params[i].Value < Params.ParamByName('SYN_TIME_STAMP').Value) then
              ZQuery.Params[i].Value := Params.ParamByName('SYN_TIME_STAMP').Value;
         end;
      if WasNull then ZQuery.Params[i].Value := null;
    end;
  if ZQuery.Params.FindParam('LAST_TIME_STAMP')<>nil then
     ZQuery.Params.FindParam('LAST_TIME_STAMP').Value := Params.ParamByName('TIME_STAMP').Value;
end;

function TSyncSingleTableV60.BeforeInsertRecord(AGlobal: IdbHelp): Boolean;
var
  r:integer;
  WasNull:boolean;
  Comm:string;
begin
  InitSQL(AGlobal);
  Comm := RowAccessor.GetString(COMMIdx,WasNull);
  if (Comm='00') and (Params.ParamByName('KEY_FLAG').AsInteger in [0,2]) then
     begin
       FillParams(InsertQuery);
       try
         AGlobal.ExecQuery(InsertQuery);
       except
         on E:Exception do
            begin
              if CheckUnique(E.Message) then
                 begin
                   if Params.ParamByName('KEY_FLAG').AsInteger=2 then Exit;
                   FillParams(UpdateQuery);
                   AGlobal.ExecQuery(UpdateQuery);
                 end
              else
                 Raise;
            end;
       end;
     end
  else
     begin
       if (Params.ParamByName('KEY_FLAG').AsInteger in [0,1]) then
       begin
         FillParams(UpdateQuery);
         r := AGlobal.ExecQuery(UpdateQuery);
       end else r := 0;
       if r=0 then
          begin
            if (Comm='02') or (Comm='12') then Exit;
            FillParams(InsertQuery);
            try
              AGlobal.ExecQuery(InsertQuery);
            except
               on E:Exception do
                  begin
                    if not CheckUnique(E.Message) then
                       Raise;
                  end;
            end;
          end;
     end;
end;

function TSyncSingleTableV60.BeforeOpenRecord(AGlobal: IdbHelp): Boolean;
var Str:string;
begin
  if Params.ParambyName('TABLE_FIELDS').AsString = '' then
    Str := 'select * from '+Params.ParambyName('TABLE_NAME').AsString+ ' where TENANT_ID=:TENANT_ID and TIME_STAMP>:TIME_STAMP'
  else
    Str := 'select '+Params.ParambyName('TABLE_FIELDS').AsString+' from '+Params.ParambyName('TABLE_NAME').AsString+ ' where TENANT_ID=:TENANT_ID and TIME_STAMP>:TIME_STAMP';

  if Params.ParamByName('SYN_COMM').AsBoolean then
     Str := Str +ParseSQL(AGlobal.iDbType,' and substring(COMM,1,1)<>''1''');

  SelectSQL.Text := Str + ' order by TIME_STAMP asc';
end;

function TSyncSingleTableV60.CheckUnique(s: string): boolean;
begin
  result :=
    (pos('unique',lowercase(s))>0)
    or
    (pos('primary',lowercase(s))>0)
    or                                                      
    (pos('sql0803',lowercase(s))>0)
    or
    (pos('主健',s)>0)
    or
    (pos('关健字',s)>0)
    or
    (pos('重复键',s)>0)
    or
    (pos('唯一约束',s)>0);
end;

function TSyncSingleTableV60.GetRowAccessor: TZRowAccessor;
begin
  if assigned(DataSet) and assigned(TZQuery(DataSet).UpdateObject) then
     result := TZQuery(DataSet).UpdateObject.ZNewRowAccessor
  else
     Raise Exception.Create('没有指定同步对像，不能完成同步操作.');
end;

procedure TSyncSingleTableV60.InitClass;
begin
  inherited;
  Init := false;
  InsertQuery := nil;
  UpdateQuery := nil;
end;

procedure TSyncSingleTableV60.InitSQL(AGlobal: IdbHelp;TimeStamp:boolean=true);
var
  i:integer;
  InsertFld,UpdateFld,ValueFld,WhereStr:string;
  KeyFields:TStringList;
begin
  if Init then Exit;
  if MaxCol=0 then MaxCol := RowAccessor.ColumnCount;
  for i:=1 to MaxCol do
    begin
      if InsertFld<>'' then InsertFld := InsertFld + ',';
      InsertFld := InsertFld+RowAccessor.GetColumnName(i);
      if ValueFld<>'' then ValueFld := ValueFld + ',';
      ValueFld := ValueFld+':'+RowAccessor.GetColumnName(i);
      if UpdateFld<>'' then UpdateFld := UpdateFld + ',';
      UpdateFld := UpdateFld+RowAccessor.GetColumnName(i)+'=:'+RowAccessor.GetColumnName(i);
      if RowAccessor.GetColumnName(i)='COMM' then
         COMMIdx := i;
      if RowAccessor.GetColumnName(i)='TIME_STAMP' then
         TIME_STAMPIdx := i;
    end;
  KeyFields:=TStringList.Create;
  try
    KeyFields.Delimiter := ';';
    KeyFields.DelimitedText := Params.ParambyName('KEY_FIELDS').AsString;
    for i:=0 to KeyFields.Count -1 do
      begin
        if WhereStr<>'' then WhereStr := WhereStr + ' and ';
        WhereStr := WhereStr+KeyFields[i]+'=:'+KeyFields[i];
      end;
  finally
    KeyFields.Free;
  end;
  if Assigned(InsertQuery) then freeandnil(InsertQuery);
  InsertQuery := TZQuery.Create(nil);
  InsertQuery.SQL.Text := 'insert into '+Params.ParambyName('TABLE_NAME').AsString+'('+InsertFld+') values('+ValueFld+')';
  if Assigned(UpdateQuery) then freeandnil(UpdateQuery);
  UpdateQuery := TZQuery.Create(nil);
  if TimeStamp and (Params.ParambyName('KEY_FLAG').AsInteger=0) then
     begin
       if Params.FindParam('LAST_TIME_STAMP') <> nil then
         begin
           if WhereStr <> '' then WhereStr := WhereStr + ' and ';
           WhereStr :=WhereStr+' TIME_STAMP <= :LAST_TIME_STAMP';
         end;
     end;
  UpdateQuery.SQL.Text := 'update '+Params.ParambyName('TABLE_NAME').AsString+' set '+UpdateFld+' where '+WhereStr;

  Init := true;
end;

procedure TSyncSingleTableV60.SetMaxCol(const Value: integer);
begin
  FMaxCol := Value;
end;

destructor TSyncSingleTableV60.Destroy;
begin
  if InsertQuery<>nil then InsertQuery.Free;
  if UpdateQuery<>nil then UpdateQuery.Free;
  inherited;
end;

initialization
  RegisterClass(TSyncSingleTableV60);
finalization
  UnRegisterClass(TSyncSingleTableV60);
end.
