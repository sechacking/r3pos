unit ObjCommon;

interface
uses SysUtils,ZBase,Classes,DB,uFnUtil,ZIntf,Variants,ZDataSet;
//COMM控制SQL
function GetCommStr(iDbType:integer;alias:string=''):string;
//处理简单SQL
function ParseSQL(iDbType:integer;SQL:string):string;
{======  2011.02.25 Add SQL语句函数转换处理 ======}
function  GetStrJoin(iDbType:Integer): string; {== 字符连接运算符号 ==}
{=== 模糊查询Like [] ===}
function  GetLikeCnd(iDbType:Integer; FieldName,KeyValue,JoinCnd: string; LikeType: string=''; IsParam: Boolean=true): string; overload;   //单个字段模糊查询
function  GetLikeCnd(iDbType:Integer; AryFieldName: array of string;KeyValue,JoinCnd: string; LikeType: string=''; IsParam: Boolean=true): string; overload; //多个字段模糊查询
//生成分段取数据SQL语句[默认: 600笔] ViewSQL: 数据表、视图、返回表组合SQL;     SortField: 排序字段;   SortType: 排序类型(desc|asc) ; 每批取记录数;
function  GetBatchSQL(iDbType:Integer; ViewSQL, SortField: string; SortType: string; RCount: string='600'): string;

//取时间的SQL
function  GetTimeStamp(iDbType:Integer):string;
function GetSysDateFormat(iDbType:integer):string;
//检查date 是否在可修改区间内,库存有关的
function GetReckOning(AGlobal:IdbHelp;TENANT_ID,SHOP_ID,pDate,timestamp:string):Boolean;
//检查date 是否在结账区间内,库存无关的
function GetAccountRange(AGlobal:IdbHelp;TENANT_ID,SHOP_ID,pDate:string):Boolean;
//读取最近没有结账日期
function GetReckDate(AGlobal:IdbHelp;TENANT_ID,SHOP_ID:string):string;
//读取系列号
function GetSequence(AGlobal:IdbHelp;SEQU_ID,TENANT_ID,FLAG_TEXT:string;nLen:Integer):String;
//更新库存
//flag 1 进货单，2 销售单 3 其他单
procedure IncStorage(AGlobal: IdbHelp;TENANT_ID, SHOP_ID, GODS_ID, PROPERTY_01, PROPERTY_02,BATCH_NO: String;amt,mny: Real;flag:integer);
procedure DecStorage(AGlobal: IdbHelp;TENANT_ID, SHOP_ID, GODS_ID, PROPERTY_01, PROPERTY_02,BATCH_NO:String; amt,mny:Real;flag:integer);
function GetCostPrice(AGlobal: IdbHelp;TENANT_ID, SHOP_ID, GODS_ID, PROPERTY_01, PROPERTY_02,BATCH_NO:string): Real;

function NewId(id:string): string;
//写日志
procedure WriteLogInfo(AGlobal: IdbHelp;userid:string;LogType:integer;ModId:string;LogName:string;LogInfo:string);
//组合数据变动说明
function EncodeLogInfo(Record_:TRecord_;TblName:string;dbState:TUpdateStatus):string;
type
TGetXDictInfo=class(TZProcFactory)
public
  function Execute(AGlobal:IdbHelp;Params:TftParamList):Boolean;override;
end;
const
  ComVersion='5.0.0.1';
var
  FldXdict:TZReadonlyQuery;
implementation
function NewId(id:string): string;
var
  g:TGuid;
begin
  if CreateGUID(g)=S_OK then
  begin
     result :=trim(GuidToString(g));
     result :=Copy(result,2,length(result)-2);  //去掉"{}"
  end else
     result :=id+'_'+formatDatetime('YYYYMMDDHHNNSS',now());
end;
function ParseSQL(iDbType:integer;SQL:string):string;
begin
  {==判断null函数替换处理==}
  case iDbType of
  0:begin
     result := stringreplace(SQL,'ifnull','isnull',[rfReplaceAll]);
     result := stringreplace(result,'IfNull','isnull',[rfReplaceAll]);
     result := stringreplace(result,'IFNULL','isnull',[rfReplaceAll]);
     result := stringreplace(result,'nvl','isnull',[rfReplaceAll]);
     result := stringreplace(result,'Nvl','isnull',[rfReplaceAll]);
     result := stringreplace(result,'NVL','isnull',[rfReplaceAll]);
    end;
  1,4:begin
     result := stringreplace(SQL,'ifnull','nvl',[rfReplaceAll]);
     result := stringreplace(result,'IfNull','nvl',[rfReplaceAll]);
     result := stringreplace(result,'IFNULL','nvl',[rfReplaceAll]);
     result := stringreplace(result,'isnull','nvl',[rfReplaceAll]);
     result := stringreplace(result,'IsNull','nvl',[rfReplaceAll]);
     result := stringreplace(result,'ISNULL','nvl',[rfReplaceAll]);
    end;
  5:begin
     result := stringreplace(SQL,'nvl','ifnull',[rfReplaceAll]);
     result := stringreplace(result,'NVL','ifnull',[rfReplaceAll]);
     result := stringreplace(result,'Nvl','ifnull',[rfReplaceAll]);
     result := stringreplace(result,'isnull','ifnull',[rfReplaceAll]);
     result := stringreplace(result,'ISNULL','ifnull',[rfReplaceAll]);
     result := stringreplace(result,'IsNull','ifnull',[rfReplaceAll]);
    end;
  end;
  {== 2011.02.25 Add字符函数substring与substr函数替换处理 [substring |substr| mid] ==}
  case iDbType of
   0,2: //Ms SQL Server | SYSBASE  [substring]
    begin
      result := stringreplace(result,'substr(','substring(',[rfReplaceAll]);
      result := stringreplace(result,'SubStr(','substring(',[rfReplaceAll]);
      result := stringreplace(result,'SUBSTR(','substring(',[rfReplaceAll]);
      result := stringreplace(result,'mid(','substring(',[rfReplaceAll]);
      result := stringreplace(result,'Mid(','substring(',[rfReplaceAll]);
      result := stringreplace(result,'MID(','substring(',[rfReplaceAll]);
    end;
   3:  //ACCESS
    begin
      result := stringreplace(result,'substr(','mid(',[rfReplaceAll]);
      result := stringreplace(result,'SubStr(','mid(',[rfReplaceAll]);
      result := stringreplace(result,'SUBSTR(','mid(',[rfReplaceAll]);
      result := stringreplace(result,'substring(','mid(',[rfReplaceAll]);
      result := stringreplace(result,'SubString(','mid(',[rfReplaceAll]);
      result := stringreplace(result,'SUBSTRING(','mid(',[rfReplaceAll]);
    end;
   1,4,5: //Oracle | DB2 | SQLITE
    begin
      result := stringreplace(result,'substring(','substr(',[rfReplaceAll]);
      result := stringreplace(result,'SubString(','substr(',[rfReplaceAll]);
      result := stringreplace(result,'SUBSTRING(','substr(',[rfReplaceAll]);
      result := stringreplace(result,'mid(','substr(',[rfReplaceAll]);
      result := stringreplace(result,'Mid(','substr(',[rfReplaceAll]);
      result := stringreplace(result,'MID(','substr(',[rfReplaceAll]);
    end;
  end;
  {==2011.02.25 Add字符长度函数len()与length函数替换处理 [len |length|char_length] ==}
  case iDbType of
   0,3: //Ms SQL Server | Access [substring]
    begin
      result := stringreplace(result,'length(','len(',[rfReplaceAll]);
      result := stringreplace(result,'Length(','len(',[rfReplaceAll]);
      result := stringreplace(result,'LENGTH(','len(',[rfReplaceAll]);
      result := stringreplace(result,'char_length(','len(',[rfReplaceAll]);
      result := stringreplace(result,'Char_Length(','len(',[rfReplaceAll]);
      result := stringreplace(result,'CHAR_LENGTH(','len(',[rfReplaceAll]);
    end;
   2:  //SYSBASE [char_length] 字符长度（字节长度用：data_length）
    begin
      result := stringreplace(result,'length(','data_length(',[rfReplaceAll]);
      result := stringreplace(result,'Length(','data_length(',[rfReplaceAll]);
      result := stringreplace(result,'LENGTH(','data_length(',[rfReplaceAll]);
      result := stringreplace(result,'char_length(','data_length(',[rfReplaceAll]);
      result := stringreplace(result,'Char_Length(','data_length(',[rfReplaceAll]);
      result := stringreplace(result,'CHAR_LENGTH(','data_length(',[rfReplaceAll]);
    end;
   1,4,5: //Oracle | DB2 | SQLITE [length]  [Oracle字节长度:lengthb]
    begin
      result := stringreplace(result,'len(','length(',[rfReplaceAll]);
      result := stringreplace(result,'Len(','length(',[rfReplaceAll]);
      result := stringreplace(result,'LEN(','length(',[rfReplaceAll]);
      result := stringreplace(result,'char_length(','length(',[rfReplaceAll]);
      result := stringreplace(result,'Char_Length(','length(',[rfReplaceAll]);
      result := stringreplace(result,'CHAR_LENGTH(','length(',[rfReplaceAll]);
    end;
  end;    
end;

{====== 2011.02.25 Add 字符连接运算符号: ======}
function  GetStrJoin(iDbType:Integer): string;
begin  //SYSBASE数据库的字符连接符号: + 和 ||均可
  case iDbType of
   0,2,3: result:='+';
   1,4,5: result:='||';
   else result:='+';
  end; 
end;

{====== 2011.02.25 Add 单个字段模糊查询  ======}
//FieldName: 关键字段;   KeyValue: 关键值（参数或实际值） ；IsParam: 是否是传递参数或实际值
//JoinCnd 返回查询条件时：是否加条件关系: 如: and | or
//LikeType参数: 表示左侧或右侧加%,默认为空则 like '%关键字%'
function  GetLikeCnd(iDbType:Integer; FieldName,KeyValue,JoinCnd: string; LikeType: string='';IsParam: Boolean=true): string; overload;
var
  LStr,RStr: string;
begin
  result:='';
  LStr:='%';
  RStr:='%';
  if (trim(LikeType)='L') or (trim(LikeType)='l') then RStr:='';
  if (trim(LikeType)='R') or (trim(LikeType)='r') then LStr:='';
  case iDbType of
   0,3:  //MS SQL Server 、Access、SYSBASE
    begin
      if IsParam then //传入关键字
      begin
        if (LStr<>'') and (RStr='') then
          result := '('+FieldName+' like '''+LStr+''' + '+KeyValue+')'
        else if (LStr='') and (RStr<>'') then
          result:= '('+FieldName+' like '+KeyValue+' + '''+RStr+''')'
        else if (LStr<>'') and (RStr<>'') then
          result:= '('+FieldName+' like '''+LStr+''' + '+KeyValue+' + '''+RStr+''')'; 
      end else
        result := '('+FieldName+' like '''+LStr+KeyValue+RStr+''')';
    end;
   1,4,5: // Oracle 、DB2 与 SQLITE
    begin
      if IsParam then //传入关键字
      begin
        if (LStr<>'') and (RStr='') then
          result := '('+FieldName+' like '''+LStr+''' || '+KeyValue+')'
        else if (LStr='') and (RStr<>'') then
          result:= '('+FieldName+' like '+KeyValue+' || '''+RStr+''')'
        else if (LStr<>'') and (RStr<>'') then
          result:= '('+FieldName+' like '''+LStr+''' || '+KeyValue+' || '''+RStr+''')'; 
      end else
        result := '('+FieldName+' like '''+LStr+KeyValue+RStr+''')';
    end;
  end;
  if (result<>'') and (trim(JoinCnd)<>'') then
    result:=' '+JoinCnd+result;
end;

{====== 2011.02.25 Add 多个字段模糊查询 ======}
function  GetLikeCnd(iDbType:Integer; AryFieldName: array of string;KeyValue,JoinCnd: string; LikeType: string='';IsParam: Boolean=true): string; overload;
var
  i: integer;
  CurStr,ReStr: string;
begin
  result:='';
  CurStr:='';
  ReStr:='';
  for i:=Low(AryFieldName) to High(AryFieldName) do
  begin
    CurStr:=trim(AryFieldName[i]);
    if CurStr='' then continue;
    CurStr:=GetLikeCnd(iDbType,CurStr,KeyValue,'',LikeType,IsParam);
    if CurStr<>'' then
    begin
      if ReStr='' then ReStr:=CurStr
      else ReStr:=ReStr+' or '+CurStr;
    end;
  end;
  if ReStr<>'' then ReStr:='('+ReStr+')';
  if ReStr<>'' then
    result:=' '+JoinCnd+ReStr;
end;

{=== 2011.02.26 生成分段取数据SQL语句[默认: 600笔] ===}
function GetBatchSQL(iDbType:Integer; ViewSQL, SortField: string; SortType: string; RCount: string='600'): string;
begin
  case iDbType of
   0,2,3: //2: SYSBASE数据库只支持12.3以上版本
      result:='select top '+trim(RCount)+' * from ('+ViewSQL+') as tmp  order by '+SortField+' '+SortType;  //（SYSBASE仅仅支持12.3以上版本）
   1: result:='select * from (select * From ('+ViewSQL+')as tmp order by '+SortField+' '+SortType+') where rownum<= '+trim(RCount)+' order by rownum '+SortType;
   4: result:='select tp.* from (select * From ('+ViewSQL+') as tmp order by '+SortField+' '+SortType+') tp fetch first '+trim(RCount)+' rows only ';
   5: result:='select * from ('+ViewSQL+') as tmp order by '+SortField+' '+SortType+' limit '+RCount;
  end; 
end;


//读取系列号
function GetSequence(AGlobal:IdbHelp;SEQU_ID,TENANT_ID,FLAG_TEXT:string;nLen:Integer):String;
  function GetFormat:string;
    var i:Integer;
    begin
      Result := '';
      for i:=1 to nLen do
        Result := Result +'0';
    end;
var Temp:TZQuery;
    Str,flag:string;
    n:integer;
begin
  Temp := TZQuery.Create(nil);
  try
       case AGlobal.iDbType of
       0:Temp.SQL.Text := 'select FLAG_TEXT,SEQU_NO from SYS_SEQUENCE with (UPDLOCK) where TENANT_ID='+TENANT_ID+' and SEQU_ID='''+SEQU_ID+''' ';
       1:Temp.SQL.Text := 'select FLAG_TEXT,SEQU_NO from SYS_SEQUENCE where TENANT_ID='+TENANT_ID+' and SEQU_ID='''+SEQU_ID+''' for update';
       else
         begin
          AGlobal.ExecSQL('update SYS_SEQUENCE set SEQU_NO=SEQU_NO+1,COMM=' + GetCommStr(AGlobal.iDbType) + ',TIME_STAMP='+GetTimeStamp(AGlobal.iDbType)+' where TENANT_ID='+TENANT_ID+' and SEQU_ID='''+SEQU_ID+'''');
          Temp.SQL.Text := 'select FLAG_TEXT,SEQU_NO from SYS_SEQUENCE where TENANT_ID='+TENANT_ID+' and SEQU_ID='''+SEQU_ID+''' ';
         end;
       end;
       AGlobal.Open(Temp);
       if Temp.IsEmpty then
          begin
            Result := FLAG_TEXT+FormatFloat(GetFormat,1);
            Str := 'insert into SYS_SEQUENCE(TENANT_ID,SEQU_ID,FLAG_TEXT,SEQU_NO,COMM,TIME_STAMP) values('''+TENANT_ID+''','''+SEQU_ID+''','''+FLAG_TEXT+''',1,''00'','+GetTimeStamp(AGlobal.iDbType)+')';
          end
       else
       if (Temp.FieldbyName('FLAG_TEXT').AsString<FLAG_TEXT) then
          begin
            Result := FLAG_TEXT+FormatFloat(GetFormat,1);
            Str := 'update SYS_SEQUENCE set FLAG_TEXT='''+FLAG_TEXT+''',SEQU_NO=1,COMM=' + GetCommStr(AGlobal.iDbType) + ',TIME_STAMP='+GetTimeStamp(AGlobal.iDbType)+' where TENANT_ID='''+TENANT_ID+''' and SEQU_ID='''+SEQU_ID+'''';
          end
       else
          begin
            if Temp.FieldbyName('FLAG_TEXT').AsString=FLAG_TEXT then
               flag := FLAG_TEXT
            else
               flag := Temp.FieldbyName('FLAG_TEXT').AsString;
            n := 1;
            if not (AGlobal.iDbType in [0,1]) then
               begin
                 Result := flag+FormatFloat(GetFormat,Temp.FieldbyName('SEQU_NO').AsInteger);
                 n := 0;
               end
            else
               Result := flag+FormatFloat(GetFormat,Temp.FieldbyName('SEQU_NO').AsInteger+1);
            Str := 'update SYS_SEQUENCE set FLAG_TEXT='''+flag+''',SEQU_NO='+Inttostr(Temp.FieldbyName('SEQU_NO').AsInteger+n)+',COMM=' + GetCommStr(AGlobal.iDbType) + ',TIME_STAMP='+GetTimeStamp(AGlobal.iDbType)+' where TENANT_ID='+TENANT_ID+' and SEQU_ID='''+SEQU_ID+'''';
          end;
       AGlobal.ExecSQL(Str);
  finally
     Temp.Free;
  end;
end;
//COMM控制SQL
function GetCommStr(iDbType:integer;alias:string=''):string;
begin
  case iDbType of
  0:result := 'case when substring('+alias+'COMM,1,1)=''1'' then ''01'' else ''00'' end';
  3:result := 'case when mid('+alias+'COMM,1,1)=''1'' then ''01'' else ''00'' end';
  1,5:result := 'case when substr('+alias+'COMM,1,1)=''1'' then ''01'' else ''00'' end';
  4:result := 'case when substr('+alias+'COMM,1,1)=''1'' then ''01'' else ''00'' end';
  else
    result := '''00''';
  end;
end;
function GetSysDateFormat(iDbType:integer):string;
begin
  case iDbType of
   0:Result := 'convert(varchar(19),getdate(),120)';
   3:Result := 'format(now(),''YYYY-MM-DD HH:NN:SS'')';
   4:Result := 'format(now(),''YYYY-MM-DD HH:NN:SS'')';
   5:Result := 'strftime(''%Y-%m-%d %H:%M:%S'',''now'',''localtime'')';
   else Result := 'convert(varchar(19),getdate(),120)';
  end;
end;
function  GetTimeStamp(iDbType:Integer):string;
begin
  case iDbType of
   0:Result := 'convert(bigint,(convert(float,getdate())-40542.0)*86400)';
   4:result := '86400*(DAYS(CURRENT DATE)-DAYS(DATE(''2011-01-01'')))+MIDNIGHT_SECONDS(CURRENT TIMESTAMP)';
   5:result := 'strftime(''%s'',''now'',''localtime'')-1293840000';
   else Result := 'convert(bigint,(convert(float,getdate())-40542.0)*86400)';
  end;
end;
//读取合法日期
function GetReckDate(AGlobal:IdbHelp;TENANT_ID,SHOP_ID:string):string;
var Temp:TZQuery;
  B:string;
begin
  Temp := TZQuery.Create(nil);
  try
     Temp.SQL.Text :=
         'select max(CREA_DATE) from ('+
         'select max(CREA_DATE) as CREA_DATE from RCK_DAYS_CLOSE where TENANT_ID='+TENANT_ID+' and SHOP_ID='''+SHOP_ID+''' '+
         ') j';
     AGlobal.Open(Temp);
     if Temp.Fields[0].AsString = '' then
        begin
           Temp.close;
           Temp.SQL.Text := 'select VALUE from SYS_DEFINE where  TENANT_ID='+TENANT_ID+' and DEFINE=''USING_DATE''';
           AGlobal.Open(Temp);
           if Temp.IsEmpty then
              B := FormatDatetime('YYYYMMDD',Date()-1)
           else
              B := FormatDatetime('YYYYMMDD',FnTime.fnStrtoDate(Temp.Fields[0].AsString)-1);
        end
     else
        B := Temp.Fields[0].AsString;
     Result := formatDatetime('YYYYMMDD',fnTime.fnStrtoDate(B)+1);
  finally
     Temp.Free;
  end;
end;
//检查date 是否在结账区间内
function GetAccountRange(AGlobal:IdbHelp;TENANT_ID,SHOP_ID,pDate:string):Boolean;
var Temp:TZQuery;
  B:string;
begin
  Result := False;
  if pDate>formatDatetime('YYYYMMDD',date+7) then Raise Exception.Create('只能开一周以内的单据，请检查是否日期有错...');
  Temp := TZQuery.Create(nil);
  try
     Temp.SQL.Text :=
         'select max(CREA_DATE) from ('+
         'select max(CREA_DATE) as CREA_DATE from RCK_DAYS_CLOSE where TENANT_ID='+TENANT_ID+' and SHOP_ID='''+SHOP_ID+''' '+
         ') j';
     AGlobal.Open(Temp);
     if Temp.Fields[0].AsString = '' then
        begin
           Temp.close;
           Temp.SQL.Text := 'select VALUE from SYS_DEFINE where  TENANT_ID='+TENANT_ID+' and DEFINE=''USING_DATE''';
           AGlobal.Open(Temp);
           if Temp.IsEmpty then
              B := FormatDatetime('YYYYMMDD',Date()-1)
           else
              B := FormatDatetime('YYYYMMDD',FnTime.fnStrtoDate(Temp.Fields[0].AsString)-1);
        end
     else
        B := Temp.Fields[0].AsString;
     Result := (pDate>B);
     if not Result then Raise Exception.Create('系统已经结帐到'+b+'号，不能对此之前的单据进行操作');
  finally
     Temp.Free;
  end;
end;
function GetReckOning(AGlobal:IdbHelp;TENANT_ID,SHOP_ID,pDate,timestamp:string):Boolean;
var Temp:TZQuery;
  B:string;
begin
  Result := False;
  if pDate>formatDatetime('YYYYMMDD',date+7) then Raise Exception.Create('只能开一周以内的单据，请检查是否日期有错...');
  if timestamp='' then timestamp := '9223372036854775800';
  Temp := TZQuery.Create(nil);
  try
     Temp.SQL.Text :=
         'select max(CREA_DATE) from ('+
         'select max(CREA_DATE) as CREA_DATE from RCK_DAYS_CLOSE where TENANT_ID='+TENANT_ID+' and SHOP_ID='''+SHOP_ID+''' '+
         'union all '+
         'select max(PRINT_DATE) as CREA_DATE from STO_PRINTORDER where TENANT_ID='+TENANT_ID+' and SHOP_ID='''+SHOP_ID+''' and TIME_STAMP>'+timestamp+' '+
         ') j';
     AGlobal.Open(Temp);
     if Temp.Fields[0].AsString = '' then
        begin
           Temp.close;
           Temp.SQL.Text := 'select VALUE from SYS_DEFINE where TENANT_ID='+TENANT_ID+' and DEFINE=''USING_DATE''';
           AGlobal.Open(Temp);
           if Temp.IsEmpty then
              B := FormatDatetime('YYYYMMDD',Date()-1)
           else
              B := FormatDatetime('YYYYMMDD',FnTime.fnStrtoDate(Temp.Fields[0].AsString)-1);
        end
     else
        B := Temp.Fields[0].AsString;
     Result := (pDate>B);
     if not Result then Raise Exception.Create('系统已经结帐到'+b+'号，不能对此之前的单据进行操作');
  finally
     Temp.Free;
  end;
end;
procedure IncStorage(AGlobal: IdbHelp;TENANT_ID, SHOP_ID, GODS_ID, PROPERTY_01, PROPERTY_02,BATCH_NO: String; amt,mny: Real;flag:integer);
var Str:string;
    n:Integer;
    CostPrice:Real;
begin
    if (amt=0) and (mny=0) then Exit;
    if amt <>0 then
       CostPrice := mny / amt
    else
       CostPrice := 0;
    if trim(PROPERTY_01)='' then PROPERTY_01 := '#';
    if trim(PROPERTY_02)='' then PROPERTY_02 := '#';
    if trim(BATCH_NO)='' then BATCH_NO := '#';

     case AGlobal.iDbType of
       0: Str :=
              'update STO_STORAGE set '+
              'AMOUNT=IsNull(AMOUNT,0)+'+FormatFloat('#0.000',amt)+','+
              'AMONEY=case when (IsNull(AMOUNT,0)+'+FormatFloat('#0.000',amt)+')=0 then 0 else IsNull(AMONEY,0)+'+FormatFloat('#0.000',Mny)+' end,'+
              'NEAR_INDATE=case when '+inttostr(flag)+'=1 then '''+formatDatetime('YYYY-MM-DD',Date())+''' else NEAR_INDATE end,'+
              'NEAR_OUTDATE=case when '+inttostr(flag)+'=2 then '''+formatDatetime('YYYY-MM-DD',Date())+''' else NEAR_OUTDATE end,'+
              'COST_PRICE= round(case when (IsNull(AMOUNT,0)+'+FormatFloat('#0.000',amt)+')<>0 then (IsNull(AMONEY,0)+'+FormatFloat('#0.000',Mny)+')/(IsNull(AMOUNT,0)+'+FormatFloat('#0.000',Amt)+') else  '+FormatFloat('#0.000000',CostPrice)+' end,6) ,'+
              'COMM='+GetCommStr(AGlobal.iDbType)+',TIME_STAMP='+GetTimeStamp(AGlobal.iDbType)+' '+
              'where SHOP_ID='''+SHOP_ID +''' and TENANT_ID='+TENANT_ID+' and GODS_ID='''+GODS_ID+''' and PROPERTY_01='''+PROPERTY_01+''' and PROPERTY_02='''+PROPERTY_02+''' and BATCH_NO='''+BATCH_NO+''' ';
       3: Str := 'update STO_STORAGE set '+
              'AMOUNT=IIF(IsNull(AMOUNT),0,AMOUNT)+'+FormatFloat('#0.000',Amt)+','+
              'AMONEY=IIF((IIF(IsNull(AMOUNT),0,AMOUNT)+'+FormatFloat('#0.000',Amt)+')=0,0,IIF(IsNull(AMONEY),0,AMONEY)+'+FormatFloat('#0.000',Mny)+'),'+
              'NEAR_INDATE=IIF('+inttostr(flag)+'=1,'''+formatDatetime('YYYY-MM-DD',Date())+''',NEAR_INDATE),'+
              'NEAR_OUTDATE=IIF('+inttostr(flag)+'=2,'''+formatDatetime('YYYY-MM-DD',Date())+''',NEAR_OUTDATE),'+
              'COST_PRICE=round(IIF(IIF(IsNull(AMOUNT),0,AMOUNT)+'+FormatFloat('#0.000',Amt)+'=0,'+FormatFloat('#0.000000',CostPrice)+ ',(IIF(IsNull(AMONEY),0,AMONEY)+'+FormatFloat('#0.000',Mny)+')/(IIF(IsNull(AMOUNT),0,AMOUNT)+'+FormatFloat('#0.000',Amt)+')),6),'+
              'COMM='+GetCommStr(AGlobal.iDbType)+',TIME_STAMP='+GetTimeStamp(AGlobal.iDbType)+' '+
              'where SHOP_ID='''+SHOP_ID +''' and TENANT_ID='+TENANT_ID+' and GODS_ID='''+GODS_ID+''' and PROPERTY_01='''+PROPERTY_01+''' and PROPERTY_02='''+PROPERTY_02+''' and BATCH_NO='''+BATCH_NO+''' ';
       1,4: Str :=
              'update STO_STORAGE set '+
              'AMOUNT=nvl(AMOUNT,0)+'+FormatFloat('#0.000',amt)+','+
              'AMONEY=case when (nvl(AMOUNT,0)+'+FormatFloat('#0.000',amt)+')=0 then 0 else nvl(AMONEY,0)+'+FormatFloat('#0.000',Mny)+' end,'+
              'NEAR_INDATE=case when '+inttostr(flag)+'=1 then '''+formatDatetime('YYYY-MM-DD',Date())+''' else NEAR_INDATE end,'+
              'NEAR_OUTDATE=case when '+inttostr(flag)+'=2 then '''+formatDatetime('YYYY-MM-DD',Date())+''' else NEAR_OUTDATE end,'+
              'COST_PRICE= round(case when (nvl(AMOUNT,0)+'+FormatFloat('#0.000',amt)+')<>0 then (nvl(AMONEY,0)+'+FormatFloat('#0.000',Mny)+')/(nvl(AMOUNT,0)+'+FormatFloat('#0.000',Amt)+') else  '+FormatFloat('#0.000000',CostPrice)+' end ,6),'+
              'COMM='+GetCommStr(AGlobal.iDbType)+',TIME_STAMP='+GetTimeStamp(AGlobal.iDbType)+' '+
              'where SHOP_ID='''+SHOP_ID +''' and TENANT_ID='+TENANT_ID+' and GODS_ID='''+GODS_ID+''' and PROPERTY_01='''+PROPERTY_01+''' and PROPERTY_02='''+PROPERTY_02+''' and BATCH_NO='''+BATCH_NO+''' ';
       5: Str :=
              'update STO_STORAGE set '+
              'AMOUNT=IfNull(AMOUNT,0)+'+FormatFloat('#0.000',amt)+','+
              'AMONEY=case when (IfNull(AMOUNT,0)+'+FormatFloat('#0.000',amt)+')=0 then 0 else IfNull(AMONEY,0)+'+FormatFloat('#0.000',Mny)+' end,'+
              'NEAR_INDATE=case when '+inttostr(flag)+'=1 then '''+formatDatetime('YYYY-MM-DD',Date())+''' else NEAR_INDATE end,'+
              'NEAR_OUTDATE=case when '+inttostr(flag)+'=2 then '''+formatDatetime('YYYY-MM-DD',Date())+''' else NEAR_OUTDATE end,'+
              'COST_PRICE= round(case when (IfNull(AMOUNT,0)+'+FormatFloat('#0.000',amt)+')<>0 then (IfNull(AMONEY,0)+'+FormatFloat('#0.000',Mny)+')/(IfNull(AMOUNT,0)+'+FormatFloat('#0.000',Amt)+') else  '+FormatFloat('#0.000000',CostPrice)+' end,6) ,'+
              'COMM='+GetCommStr(AGlobal.iDbType)+',TIME_STAMP='+GetTimeStamp(AGlobal.iDbType)+' '+
              'where SHOP_ID='''+SHOP_ID +''' and TENANT_ID='+TENANT_ID+' and GODS_ID='''+GODS_ID+''' and PROPERTY_01='''+PROPERTY_01+''' and PROPERTY_02='''+PROPERTY_02+''' and BATCH_NO='''+BATCH_NO+''' ';
     end;
     n := AGlobal.ExecSQL(Str) ;
     if n=0 then
        begin
           Str := 'insert into STO_STORAGE(ROWS_ID,GODS_ID,TENANT_ID,SHOP_ID,PROPERTY_01,PROPERTY_02,BATCH_NO,NEAR_INDATE,AMONEY,AMOUNT,COST_PRICE,COMM,TIME_STAMP) '+
                  'values('''+NewId(SHOP_ID)+''','''+GODS_ID+''','+TENANT_ID+','''+SHOP_ID+''','''+PROPERTY_01+''','''+PROPERTY_02+''','''+BATCH_NO+''','''+formatDatetime('YYYYMMDD',Date())+''','+
                  FormatFloat('#0.000',Mny) +','+FormatFloat('#0.000',Amt)+','+FormatFloat('#0.000000',CostPrice)+',''00'','+GetTimeStamp(AGlobal.iDbType)+')';
           AGlobal.ExecSQL(Str);
        end;
end;
procedure DecStorage(AGlobal: IdbHelp;TENANT_ID, SHOP_ID, GODS_ID, PROPERTY_01, PROPERTY_02,BATCH_NO:String; amt,mny:Real;flag:integer);
var Str:string;
    n:Integer;
    CostPrice:Real;
begin
    if (amt=0) and (mny=0) then Exit;
    if amt <>0 then
       CostPrice := mny / amt
    else
       CostPrice := 0;
    if trim(PROPERTY_01)='' then PROPERTY_01 := '#';
    if trim(PROPERTY_02)='' then PROPERTY_02 := '#';
    if trim(BATCH_NO)='' then BATCH_NO := '#';

     case AGlobal.iDbType of
       0: Str := 'update STO_STORAGE set '+
              'AMOUNT=IsNull(AMOUNT,0)- '+FormatFloat('#0.000',amt)+','+
              'AMONEY=case when (IsNull(AMOUNT,0)- '+FormatFloat('#0.000',amt)+')=0 then 0 else IsNull(AMONEY,0)- '+FormatFloat('#0.000',Mny)+' end,'+
              'NEAR_INDATE=case when '+inttostr(flag)+'=1 then '''+formatDatetime('YYYY-MM-DD',Date())+''' else NEAR_INDATE end,'+
              'NEAR_OUTDATE=case when '+inttostr(flag)+'=2 then '''+formatDatetime('YYYY-MM-DD',Date())+''' else NEAR_OUTDATE end,'+
              'COST_PRICE= Case when (IsNull(AMOUNT,0)- '+FormatFloat('#0.000',amt)+')<>0 then (IsNull(AMONEY,0)- '+FormatFloat('#0.000',Mny)+')/(IsNull(AMOUNT,0)- '+FormatFloat('#0.000',Amt)+') else  '+FormatFloat('#0.000000',CostPrice)+' end ,'+
              'COMM='+GetCommStr(AGlobal.iDbType)+',TIME_STAMP='+GetTimeStamp(AGlobal.iDbType)+' '+
              'where SHOP_ID='''+SHOP_ID +''' and TENANT_ID='+TENANT_ID+' and GODS_ID='''+GODS_ID+''' and PROPERTY_01='''+PROPERTY_01+''' and PROPERTY_02='''+PROPERTY_02+''' and BATCH_NO='''+BATCH_NO+''' ';
       3: Str := 'update STO_STORAGE set '+
              'AMOUNT=IIF(IsNull(AMOUNT),0,AMOUNT)- '+FormatFloat('#0.000',Amt)+','+
              'AMONEY=IIF((IIF(IsNull(AMOUNT),0,AMOUNT)- '+FormatFloat('#0.000',Amt)+')=0,0,IIF(IsNull(AMONEY),0,AMONEY)- '+FormatFloat('#0.000',Mny)+'),'+
              'NEAR_INDATE=IIF('+inttostr(flag)+'=1,'''+formatDatetime('YYYY-MM-DD',Date())+''',NEAR_INDATE),'+
              'NEAR_OUTDATE=IIF('+inttostr(flag)+'=2,'''+formatDatetime('YYYY-MM-DD',Date())+''',NEAR_OUTDATE),'+
              'COST_PRICE=IIF(IIF(IsNull(AMOUNT),0,AMOUNT)- '+FormatFloat('#0.000',Amt)+'=0,'+FormatFloat('#0.000000',CostPrice)+ ',(IIF(IsNull(AMONEY),0,AMONEY)- '+FormatFloat('#0.000',Mny)+')/(IIF(IsNull(AMOUNT),0,AMOUNT)- '+FormatFloat('#0.000',Amt)+')),'+
              'COMM='+GetCommStr(AGlobal.iDbType)+',TIME_STAMP='+GetTimeStamp(AGlobal.iDbType)+' '+
              'where SHOP_ID='''+SHOP_ID +''' and TENANT_ID='+TENANT_ID+' and GODS_ID='''+GODS_ID+''' and PROPERTY_01='''+PROPERTY_01+''' and PROPERTY_02='''+PROPERTY_02+''' and BATCH_NO='''+BATCH_NO+''' ';
       4: Str := 'update STO_STORAGE set '+
              'AMOUNT=nvl(AMOUNT,0)- '+FormatFloat('#0.000',amt)+','+
              'AMONEY=case when (nvl(AMOUNT,0)- '+FormatFloat('#0.000',amt)+')=0 then 0 else nvl(AMONEY,0)- '+FormatFloat('#0.000',Mny)+' end,'+
              'NEAR_INDATE=case when '+inttostr(flag)+'=1 then '''+formatDatetime('YYYY-MM-DD',Date())+''' else NEAR_INDATE end,'+
              'NEAR_OUTDATE=case when '+inttostr(flag)+'=2 then '''+formatDatetime('YYYY-MM-DD',Date())+''' else NEAR_OUTDATE end,'+
              'COST_PRICE= Case when (nvl(AMOUNT,0)- '+FormatFloat('#0.000',amt)+')<>0 then (nvl(AMONEY,0)- '+FormatFloat('#0.000',Mny)+')/(nvl(AMOUNT,0)- '+FormatFloat('#0.000',Amt)+') else  '+FormatFloat('#0.000000',CostPrice)+' end ,'+
              'COMM='+GetCommStr(AGlobal.iDbType)+',TIME_STAMP='+GetTimeStamp(AGlobal.iDbType)+' '+
              'where SHOP_ID='''+SHOP_ID +''' and TENANT_ID='+TENANT_ID+' and GODS_ID='''+GODS_ID+''' and PROPERTY_01='''+PROPERTY_01+''' and PROPERTY_02='''+PROPERTY_02+''' and BATCH_NO='''+BATCH_NO+''' ';
       5: Str := 'update STO_STORAGE set '+
              'AMOUNT=IfNull(AMOUNT,0)- '+FormatFloat('#0.000',amt)+','+
              'AMONEY=case when (IfNull(AMOUNT,0)- '+FormatFloat('#0.000',amt)+')=0 then 0 else IfNull(AMONEY,0)- '+FormatFloat('#0.000',Mny)+' end,'+
              'NEAR_INDATE=case when '+inttostr(flag)+'=1 then '''+formatDatetime('YYYY-MM-DD',Date())+''' else NEAR_INDATE end,'+
              'NEAR_OUTDATE=case when '+inttostr(flag)+'=2 then '''+formatDatetime('YYYY-MM-DD',Date())+''' else NEAR_OUTDATE end,'+
              'COST_PRICE= Case when (IfNull(AMOUNT,0)- '+FormatFloat('#0.000',amt)+')<>0 then (IfNull(AMONEY,0)- '+FormatFloat('#0.000',Mny)+')/(IfNull(AMOUNT,0)- '+FormatFloat('#0.000',Amt)+') else  '+FormatFloat('#0.000000',CostPrice)+' end ,'+
              'COMM='+GetCommStr(AGlobal.iDbType)+',TIME_STAMP='+GetTimeStamp(AGlobal.iDbType)+' '+
              'where SHOP_ID='''+SHOP_ID +''' and TENANT_ID='+TENANT_ID+' and GODS_ID='''+GODS_ID+''' and PROPERTY_01='''+PROPERTY_01+''' and PROPERTY_02='''+PROPERTY_02+''' and BATCH_NO='''+BATCH_NO+''' ';
     end;
     n := AGlobal.ExecSQL(Str) ;
     if n=0 then
        begin
           Str := 'insert into STO_STORAGE(ROWS_ID,GODS_ID,TENANT_ID,PROPERTY_01,PROPERTY_02,BATCH_NO,NEAR_OUTDATE,SHOP_ID,AMONEY,AMOUNT,COST_PRICE,COMM,TIME_STAMP) '+
                  'values('''+NewId(SHOP_ID)+''','''+GODS_ID+''','''+TENANT_ID+''','''+PROPERTY_01+''','''+PROPERTY_02+''','''+BATCH_NO+''','''+formatDatetime('YYYYMMDD',Date())+''','''+SHOP_ID+''','+
                  FormatFloat('#0.000',-Mny) +','+FormatFloat('#0.000',-Amt)+','+FormatFloat('#0.000000',CostPrice)+',''00'','+GetTimeStamp(AGlobal.iDbType)+')';
           AGlobal.ExecSQL(Str);
        end;
end;
function GetCostPrice(AGlobal: IdbHelp;TENANT_ID, SHOP_ID, GODS_ID, PROPERTY_01, PROPERTY_02,BATCH_NO:string): Real;
var Temp:TZQuery;
begin
   Temp := TZQuery.Create(nil);
   try
      Temp.SQL.Text := 'select COST_PRICE from STO_STORAGE where SHOP_ID='''+SHOP_ID+''' and TENANT_ID='+TENANT_ID+' and GODS_ID='''+GODS_ID+''' and PROPERTY_01='''+PROPERTY_01+''' and PROPERTY_02='''+PROPERTY_02+''' and BATCH_NO='''+BATCH_NO+''' ';
      AGlobal.Open(Temp);
      Result := Temp.Fields[0].AsFloat;
   finally
      Temp.Free;
   end;
end;

procedure WriteLogInfo(AGlobal: IdbHelp;userid:string;LogType:integer;ModId:string;LogName:string;LogInfo:string);
begin
  if LogInfo='' then Exit;
  AGlobal.ExecSQL(
    'insert into SYS_LOG_INFO(LOG_ID,USER_ID,LOG_TYPE,MODU_ID,LOG_NAME,LOG_INFO,CREA_DATE,CREA_TIME,COMM,TIME_STAMP) '+
    'values(newid(),'''+UserId+''','''+inttostr(LogType)+''','''+ModId+''','+QuotedStr(LogName)+','+QuotedStr(LogInfo)+','''+formatDatetime('YYYY-MM-DD',date())+''','''+formatDatetime('HH:NN:SS',now())+''',''00'','+GetTimeStamp(AGlobal.iDbType)+')');
end;
function EncodeLogInfo(Record_:TRecord_;TblName:string;dbState:TUpdateStatus):string;
var
  i:integer;
  s:string;
  fld:string;
begin
  s := '';
  for i:=0 to Record_.Count -1 do
    begin
      if fldXDict.Active and fldXDict.Locate('XDICT_ID',TblName+'.'+Record_.Fields[i].FieldName,[]) then
         fld := fldXDict.Fields[1].AsString
      else
         Continue;     
      case dbState of
      usInserted: s := s+fld+':'+Record_.Fields[i].AsString+#13;
      usModified: if (VarCompareValue(Record_.Fields[i].NewValue,Record_.Fields[i].OldValue)<>vrEqual) then s := s + fld+':'+Record_.Fields[i].AsOldString +'->'+ Record_.Fields[i].AsString+#13;
      usDeleted: s := s+fld+':'+Record_.Fields[i].AsString+#13;
      end;
    end;
  result := copy(s,1,255);
end;

{ TGetXDictInfo }

function TGetXDictInfo.Execute(AGlobal: IdbHelp;
  Params: TftParamList): Boolean;
begin
  if FldXdict=nil then FldXdict := TZReadonlyQuery.Create(nil); 
  FldXdict.Close;
  FldXdict.SQL.Text :='select XDICT_ID,XDICT_NAME from SYS_XDICT_INFO where XDICT_TYPE=4';
  AGlobal.Open(FldXdict);
  result := true;
end;

initialization
  RegisterClass(TGetXDictInfo);
  FldXdict := nil;
finalization
  if FldXdict<>nil then FldXdict.Free;
  UnRegisterClass(TGetXDictInfo);
end.
