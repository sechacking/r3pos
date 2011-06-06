{------------------------------------------------------------------------------
  插件共用函数单元

  
 ------------------------------------------------------------------------------}
unit uRimSyncFactory;

interface

uses
  DB,
  zDataSet,
  SysUtils,
  Variants,
  Classes,
  Windows,
  Forms,
  zBase,
  uBaseSyncFactory;

//第三方系统数据对接的基类
type
  TRimSyncFactory=class(TBaseSyncFactory)
  private
    FMaxStmp: string;    //最大时间戳
    FUpMaxStmp: string;  //更新最大时间戳
    FSyncType: integer;  //同步类型
    FLogInfo: TLogShopInfo; //门店日志
    procedure SetMaxStmp(const Value: string);
    procedure SetSyncType(const Value: Integer);
  public
    constructor Create; override;
    destructor Destroy;override;  
    // 同步类型
    function GetSyncType: integer; //同步类型   
    //1、返回RIM_R3_NUM表的上次时间戳和当前最大时间戳:
    function GetMaxNUM(BillType, COM_ID,CUST_ID, SHOP_ID: string): string;
    //2、返回Rim烟草公司ID(COM_ID):
    function GetRimCOM_ID(TENANT_ID: string): string;
    //4、返回Rim零售户CUST_ID:
    function GetRimCUST_ID(COM_ID,LICENSE_CODE: string): string;
    //5、返回Rim零售户CUST_ID及零售户所属的COM_ID:
    function SetRimORGAN_CUST_ID(const InTENANT_ID,InSHOP_ID: string; var InCOM_ID,InCUST_ID: string): Boolean;
    //6、返回上报的门店List
    function GetR3ReportShopList(var ShopList: TZQuery): Boolean;
    //7、写上报日志
    procedure BeginLogRun; virtual;  //开始上报
    procedure WriteLogRun(ReportName: string=''); virtual;  //结束上报
    //8、写RIM_BAL_LOG日志
    function WriteToRIM_BAL_LOG(LICENSE_CODE,CustID,LogType,LogNote,LogStatus: string; USER_ID: string='auto'): Boolean;

    property MaxStmp: string read FMaxStmp write SetMaxStmp;              //最大时间戳
    property UpMaxStmp: string read FUpMaxStmp;                           //更新最大时间戳
    property SyncType: integer read FSyncType write SetSyncType;          //上报方式:（0: 调度执行； 3：前台传入执行)
    property LogInfo: TLogShopInfo read FLogInfo;
  end;

implementation




{ TRimSyncFactory }

 
constructor TRimSyncFactory.Create;
begin
  inherited;
  FLogInfo:=TLogShopInfo.Create;
end;

destructor TRimSyncFactory.Destroy;
begin
  FLogInfo.Free;
  inherited;
end;

function TRimSyncFactory.GetSyncType: integer; //同步类型
begin
  result:=0;
  if (Params.FindParam('FLAG')<>nil) then
    FSyncType:=Params.FindParam('FLAG').AsInteger;
  result:=FSyncType;
end;

function TRimSyncFactory.GetMaxNUM(BillType, COM_ID, CUST_ID, SHOP_ID: string): string;
var
  iRet: integer;
  Str: string;
  Rs: TZQuery;
begin
  result:='';
  try
    Rs:=TZQuery.Create(nil);                  
    Rs.SQL.Text:='select MAX_NUM,'+GetTimeStamp(DbType)+' as UPMAX_NUM  from RIM_R3_NUM where COM_ID='''+COM_ID+''' and CUST_ID='''+Cust_ID+''' and TYPE='''+BillType+''' and TERM_ID='''+SHOP_ID+''' ';
    if Open(Rs) then
    begin
      result:=trim(Rs.Fields[0].AsString);
      FUpMaxStmp:=trim(Rs.Fields[1].AsString);
    end;
    if result='' then result:='0';
    if Rs.IsEmpty then
    begin
      str:='insert into RIM_R3_NUM(COM_ID,CUST_ID,TYPE,TERM_ID,MAX_NUM) values ('''+COM_ID+''','''+Cust_ID+''','''+BillType+''','''+SHOP_ID+''',''0'')';
      if PlugIntf.ExecSQL(Pchar(str),iRet)<>0 then Raise Exception.Create('RIM_R3_NUM执行插入初值错误！（'+str+'）');

      //重新在取一次：最大时间戳：
      Rs.Close;
      Rs.SQL.Text:='select MAX_NUM,'+GetTimeStamp(DbType)+' as UPMAX_NUM  from RIM_R3_NUM where COM_ID='''+COM_ID+''' and CUST_ID='''+Cust_ID+''' and TYPE='''+BillType+''' and TERM_ID='''+SHOP_ID+''' ';
      if Open(Rs) then
      begin
        result:=trim(Rs.Fields[0].AsString);
        FUpMaxStmp:=trim(Rs.Fields[1].AsString);
      end;
    end;
  finally
    Rs.Free;
  end;
end;

function TRimSyncFactory.GetR3ReportShopList(var ShopList: TZQuery): Boolean;
var
  Str: string;
  IsFlag: Boolean;
begin
  result:=False;
  if SyncType=3 then  //前台门店终端提交上报
  begin
    //(企业名称,门店ID,门店名称,门店许可证号):
    Str:='select TE.TENANT_ID,TE.TENANT_NAME,SH.SHOP_ID,SH.SHOP_NAME,SH.LICENSE_CODE from CA_SHOP_INFO SH,CA_TENANT TE '+
         ' where SH.TENANT_ID=TE.TENANT_ID and  SH.TENANT_ID='+Params.ParamByName('TENANT_ID').AsString+' and '+
         ' SH.SHOP_ID='''+Params.ParamByName('SHOP_ID').AsString+''' ';
  end else //Rsp调度上报：烟草公司企业
  begin
    //供应链关系表[返回传入企业所有下级企业]:
    Str:='select T.TENANT_ID,T.TENANT_NAME from CA_TENANT T,CA_RELATIONS R '+
         ' where T.TENANT_ID=R.RELATI_ID and T.COMM not in (''02'',''12'') and R.TENANT_ID='+Params.ParamByName('TENANT_ID').AsString+
         ' and R.RELATION_ID=1000006';

    //(企业名称,门店ID,门店名称,门店许可证号):
    Str:='select TE.TENANT_ID,TE.TENANT_NAME,SH.SHOP_ID,SH.SHOP_NAME,SH.LICENSE_CODE '+
         ' from CA_SHOP_INFO SH,('+Str+') TE where SH.TENANT_ID=TE.TENANT_ID order by TE.TENANT_ID,SH.SHOP_ID ';
  end;

  ShopList.Close;
  ShopList.SQL.Text:=Str;
  result:=Open(ShopList);
end;

function TRimSyncFactory.SetRimORGAN_CUST_ID(const InTENANT_ID, InSHOP_ID: string; var InCOM_ID,InCUST_ID: string): Boolean;
var
  str: string;
  Rs: TZQuery;
begin
  result:=False;
  InCOM_ID:='';
  InCUST_ID:='';
  try
    Rs:=TZQuery.Create(nil);
    try
      Rs.SQL.Text:='select A.COM_ID as COM_ID,A.CUST_ID as CUST_ID from RM_CUST A,CA_SHOP_INFO B '+
                   ' where A.LICENSE_CODE=B.LICENSE_CODE and B.TENANT_ID='+InTENANT_ID+' and B.SHOP_ID='''+InSHOP_ID+''' ';
      if Open(Rs) then
      begin
        InCOM_ID:=trim(Rs.fieldbyName('COM_ID').AsString);
        InCUST_ID:=trim(Rs.fieldbyName('CUST_ID').AsString);
      end;
    except
      on E:Exception do
      begin
        str:='企业ID('+InTENANT_ID+'),门店ID('+InSHOP_ID+')，返回Rim的供应商ID、零售户ID出错：'+E.Message;
        Raise Exception.Create(Pchar(str));
      end;
    end;
  finally
    rs.Free;
  end;
end;

//2011.05.25 获取Rim零售户IDCust_ID
function TRimSyncFactory.GetRimCUST_ID(COM_ID,LICENSE_CODE: string): string;
var
  Rs: TZQuery;
begin
  try
    Rs:=TZQuery.Create(nil);
    Rs.SQL.Text:='select CUST_ID from RM_CUST where COM_ID='''+COM_ID+''' and LICENSE_CODE='''+LICENSE_CODE+'''';
    if Open(Rs) then
      result:=trim(Rs.Fields[0].AsString);
  finally
    Rs.Free;
  end;
end;

function TRimSyncFactory.GetRimCOM_ID(TENANT_ID: string): string;
var
  Rs: TZQuery;
begin
  try
    try
      Rs:=TZQuery.Create(nil);
      Rs.SQL.Text:='select A.ORGAN_ID as ORGAN_ID from RIM_PUB_ORGAN A,CA_TENANT B where B.LOGIN_NAME=A.ORGAN_CODE and B.TENANT_ID='+TENANT_ID+' ';
      if Open(Rs) then
        result:=trim(Rs.Fields[0].AsString)
    except
      on E:Exception do
      begin
        Raise Exception.Create('传入R3企业ID:('+TENANT_ID+') 返回Rim烟草公司ID出错：'+E.Message);
      end;
    end;
  finally
    Rs.Free;
  end;
end;

function TRimSyncFactory.WriteToRIM_BAL_LOG(LICENSE_CODE, CustID, LogType, LogNote, LogStatus, USER_ID: string): Boolean;
var
  str: string;
  iRet: integer;
begin
  Str:='insert into RIM_BAL_LOG(LOG_SEQ,REF_TYPE,REF_ID,BAL_DATE,BAL_TIME,NOTE,USER_ID,STATUS) values '+
       '('''+LICENSE_CODE+Formatdatetime('YYYYMMDDHHNNSSZZZ',now())+''','''+LogType+''','''+CustID+''','''+Formatdatetime('YYYYMMDD',date())+''','''+formatdatetime('HH:NN:SS',now())+''','''+LogNote+''',''auto'','''+LogStatus+''')' ;
  if PlugIntf.ExecSQL(Pchar(Str),iRet)<>0 then
   Raise Exception.Create('写日志执行失败:'+PlugIntf.GetLastError);  
end;

procedure TRimSyncFactory.SetSyncType(const Value: Integer);
begin
  FSyncType := Value;
end;

procedure TRimSyncFactory.SetMaxStmp(const Value: string);
begin
  FMaxStmp := Value;
end;

procedure TRimSyncFactory.WriteLogRun(ReportName: string);
var
  i: integer;
  LogDir,LogFile,Str,ReportTitle: string;
  LogFileList: TStringList;
begin
  inherited;
  LogDir:=ExtractShortPathName(ExtractFilePath(Application.ExeName))+'log\REPORT';
  //默认保留最近1个月的日志文件
  try
    for i:=1 to 1000 do
    begin
      LogFile:=LogDir+FormatDatetime('YYYYMMDD',Date()-i)+'.log';
      if FileExists(LogFile) then
        DeleteFile(Pchar(LogFile));
    end;
  except
  end;
  if trim(ReportName)='' then
    ReportTitle:=' 开始'
  else
    ReportTitle:='【'+ReportName+'】 开始';
  FRunInfo.BegTick:=GetTickCount-FRunInfo.BegTick; //总执行多少秒
  LogFile := LogDir+FormatDatetime('YYYYMMDD',Date())+'.log';
  try
    LogFileList:=TStringList.Create;
    if FileExists(LogFile) then
    begin
      LogFileList.LoadFromFile(LogFile);
      LogFileList.Add('    ');
    end;

    //输出日志:
    Str:='开始执行时间：'+FRunInfo.BegTime+'  共执行'+FormatFloat('#0.00',FRunInfo.BegTick/1000)+'秒，'+
                 '门店总数：'+inttoStr(FRunInfo.AllCount)+'，其中：上报成功数：'+inttoStr(FRunInfo.RunCount)+'，';
    if FRunInfo.ErrorCount>0 then Str:=Str+'异常门店数：'+inttoStr(FRunInfo.ErrorCount);
    if FRunInfo.NotCount>0 then Str:=Str+'，没有对应Rim零售户门店数：'+inttoStr(FRunInfo.NotCount);

    if SyncType=3 then  //客户端单个门店日志
    begin
      LogFileList.Add('------------- R3终端上报 '+ReportTitle+' ---------------------');
      LogFileList.Add(Str);
      for i:=0 to LogList.Count-1 do
      begin
        LogFileList.Add(LogList.Strings[i]);
      end; 
      LogFileList.Add('------------- R3终端上报 [结束]-----------------------');
    end else
    begin
      LogFileList.Add('------------- RSP调度上报 '+ReportTitle+' -----------------------');
      LogFileList.Add(Str);
      for i:=0 to LogList.Count-1 do
      begin
        LogFileList.Add(LogList.Strings[i]);
      end;
      LogFileList.Add('------------- RSP调度上报[结束]-----------------------');
    end;
  finally
    LogFileList.SaveToFile(LogFile);
  end; 
end;

procedure TRimSyncFactory.BeginLogRun;
begin
  LogList.Clear;
  FRunInfo.BegTime:=GetTickTime;
  FRunInfo.BegTick:=GetTickCount;
  FRunInfo.AllCount:=0;
  FRunInfo.RunCount:=0;
  FRunInfo.NotCount:=0;
  FRunInfo.ErrorCount:=0;
  FRunInfo.ErrorStr:=''
end;


end.
