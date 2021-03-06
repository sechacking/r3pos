unit uDevFactory;

interface
uses Windows,Classes,spComm,SysUtils,zPrinters,ufrmShowPanel;


  //2012.08.04 xhh修改调用API_COM.DLL
type
  TCom_Init=function(com:Integer; baud:Dword):integer;stdcall;  //初始化
  TCom_Send=function(buf:PChar; len:Integer):Boolean;stdcall;  //发送命令
  TCom_Rest=function():Boolean;stdcall; //关闭

type
TDevFactory=class
  private
    FPrepared: Boolean;
    FDisplayComm: Integer;
    FScanComm: Integer;
    FComm:TComm;
    FScanBaudRate: Integer;
    FDisplayBaudRate: Integer;
    FCashBox: Integer;
    FCashComm: TComm;
    FCashBoxRate: Integer;
    FLPT: integer;
    FLPTType: integer;
    FSavePrint: Boolean;
    FFooter: string;
    FTicketPrintName: integer;
    FTitle: string;
    FWidth: integer;
    FPrintNull: integer;
    FCloseDayPrinted: boolean;
    FCloseDayPrintFlag: integer;
    FCopys: integer;
    FPrintFormat: integer;
    CashBoxStart:Int64;
    //2012.08.04 xhh修改调用API_COM.DLL
    FComHandle:THandle; //api_com.dll句柄
    Com_Init:TCom_Init;  //初始化
    Com_Send:TCom_Send;  //发送命令
    Com_Rest:TCom_Rest;  //关闭

    procedure SetPrepared(const Value: Boolean);
    procedure SetDisplayComm(const Value: Integer);
    procedure SetScanComm(const Value: Integer);


    procedure OpenDisplayComm;
    procedure CloseComm;
    procedure OpenCashBoxComm;
    procedure SetDisplayBaudRate(const Value: Integer);
    procedure SetScanBaudRate(const Value: Integer);
    procedure SetCashBox(const Value: Integer);
    procedure SetLPT(const Value: integer);
    procedure SetLPTType(const Value: integer);
    procedure SetSavePrint(const Value: Boolean);
    procedure SetFooter(const Value: string);
    procedure SetTicketPrintName(const Value: integer);
    procedure SetTitle(const Value: string);
    procedure SetWidth(const Value: integer);
    procedure SetPrintNull(const Value: integer);
    function GetTitle: string;
    procedure SetCloseDayPrinted(const Value: boolean);
    procedure SetCloseDayPrintFlag(const Value: integer);
    procedure SetCopys(const Value: integer);
    function GetWidth: integer;
    procedure SetPrintFormat(const Value: integer);
  protected
    frmShowPanel:TfrmShowPanel;
    //2012.08.04 xhh修改调用API_COM.DLL
    procedure DoCallApi_Com(CmdStr: string); //调用Api_Com.dll方法
  public
    F:TextFile;
    constructor Create;
    destructor Destroy; override;
    procedure InitComm;

    Class procedure OpenCashBox;
    Class procedure ShowAPrice(Value:Real;ShowN:string=''); //单价
    Class procedure ShowAMoney(Value:Real);                 //收款
    Class procedure ShowATotal(Value:Real);                 //总计
    Class procedure ShowDibs(Value:Real);                   //找零

    //打印函数
    procedure BeginPrint;
    procedure WritePrint(s:string);
    procedure WritePrintNoEnter(s:string);
    procedure EndPrint;                                                                     

    function EncodeDivStr:string;
    function ReadDefine(Define:string;Def:string=''):string;

    procedure Clear;
    procedure SetLEDType(Value:Integer);
    procedure SetLEDNumber(Value:Real);
    property Prepared:Boolean read FPrepared write SetPrepared;
    property DisplayComm:Integer read FDisplayComm write SetDisplayComm;
    property ScanComm:Integer read FScanComm write SetScanComm;
    property DisplayBaudRate:Integer read FDisplayBaudRate write SetDisplayBaudRate;
    property CashBoxRate:Integer read FCashBoxRate write FCashBoxRate;
    property ScanBaudRate:Integer read FScanBaudRate write SetScanBaudRate;

    property CashBox:Integer read FCashBox write SetCashBox;

    property Comm:TComm read FComm;
    property CashComm:TComm read FCashComm;
    property LPT:integer read FLPT write SetLPT;
    //打印类型 1 LPT打印，2 Windows驱动打印
    property LPTType:integer read FLPTType write SetLPTType;
    // 保存时是否打印小票
    property SavePrint:Boolean read FSavePrint write SetSavePrint;
    property TicketPrintName:integer read FTicketPrintName write SetTicketPrintName;
    // 不票打印说明
    property Footer:string read FFooter write SetFooter;
    // 小票票题
    property Title:string read GetTitle write SetTitle;

    //小打印机可以打印字符数
    property Width:integer read GetWidth write SetWidth;
    //补空行数
    property PrintNull:integer read FPrintNull write SetPrintNull;

    //关账时是否打印小票
    property CloseDayPrinted:boolean read FCloseDayPrinted write SetCloseDayPrinted;
    //关账时打印类型 0只打金额 1打商品明细
    property CloseDayPrintFlag:integer read FCloseDayPrintFlag write SetCloseDayPrintFlag;
    //复制
    property Copys:integer read FCopys write SetCopys;
    //0 打印小票 1 打印单据
    property PrintFormat:integer read FPrintFormat write SetPrintFormat;
end;
var
  DevFactory:TDevFactory;
implementation
uses IniFiles,EncDec,Forms,uGlobal,uMsgBox;
{ TDevFactory }

procedure TDevFactory.BeginPrint;
begin
  if LPT<1 then Raise Exception.Create('没有安装小票打印机不能打小票');
  if DevFactory.LPT<5 then
     AssignFile(F,'LPT'+inttostr(DevFactory.LPT))
  else
  if DevFactory.LPT in [5..29] then
     AssignFile(F,'COM'+inttostr(DevFactory.LPT-4))
  else
  if DevFactory.LPT in [30] then
     begin
       AssignPrn(F);
       Printer.Canvas.Font := Application.MainForm.Font;
     end
  else
     AssignFile(F,ExtractFilePath(ParamStr(0))+'debug\prt.txt');
  rewrite(F);
end;

procedure TDevFactory.Clear;
var S:string;
begin
  if not DevFactory.Prepared then Exit;
  S:=Chr(12);
  DoCallApi_Com(S);
//  FComm.WriteCommData(Pchar(S),Length(Pchar(S))) ;
end;

procedure TDevFactory.CloseComm;
begin
  FComm.StopComm;
end;

constructor TDevFactory.Create;
begin
  inherited;
  FComm := TComm.Create(nil);
  frmShowPanel := TfrmShowPanel.Create(nil);
  //2012.08.04 xhh修改调用API_COM.DLL
  FComHandle:=0;
  FComHandle:=LoadLibrary(Pchar(ExtractFilePath(Application.ExeName)+'API_COM.DLL'));
  if FComHandle>0 then
  begin
    @Com_Init := GetProcAddress(FComHandle, Pchar('com_init'));  //初始化
    @Com_Send := GetProcAddress(FComHandle, Pchar('com_send'));  //发送命令
    @Com_Rest := GetProcAddress(FComHandle, Pchar('com_rest'));  //关闭
  end;
end;

destructor TDevFactory.Destroy;
begin
  FComm.StopComm;
  frmShowPanel.Free;
  FComm.Free;
  //2012.08.04 xhh修改调用API_COM.DLL
  if FComHandle>0 then
  begin
    Com_Rest;
    FreeLibrary(FComHandle);
  end;
  inherited;
end;

procedure TDevFactory.DoCallApi_Com(CmdStr: string);
var
  Msg: string;
  ReRun: Boolean;
begin
  Msg:='';
  try
    if FComHandle>0 then
      ReRun:=Com_Send(Pchar(CmdStr),Length(CmdStr))
    else
      Msg:=' 无效句柄，（请检查安装目录下是否有api_com.dll）';
  except
    on E:Exception do
    begin
      ReRun:=False;
      if Msg='' then Msg:='错误：'+E.Message;
    end;
  end;
  if (ReRun=False) and (trim(Msg)<>'') then
  begin
    MessageBox(Application.Handle,Pchar(Msg),'友情提示...',MB_OK+MB_ICONINFORMATION);
  end;
end;

function TDevFactory.EncodeDivStr: string;
var
  i:integer;
begin
  for i:=1 to Width-1 do result := result + '-';
end;

procedure TDevFactory.EndPrint;
begin
  CloseFile(F);
end;

function TDevFactory.GetTitle: string;
var s:string;
begin
  s := StringReplace(DevFactory.FTitle,'[门店名称]',Global.SHOP_NAME,[rfReplaceAll]);
  s := StringReplace(DevFactory.FTitle,'[企业名称]',Global.TENANT_NAME,[rfReplaceAll]);
  s := StringReplace(DevFactory.FTitle,'[企业简称]',Global.SHORT_TENANT_NAME,[rfReplaceAll]);
  if s='' then s := Global.TENANT_NAME;
  result := s;
end;

function TDevFactory.GetWidth: integer;
begin
  result := FWidth;
end;

procedure TDevFactory.InitComm;
var F:TIniFile;
begin
  F := TIniFile.Create(ExtractFilePath(Application.ExeName)+'dev.fty');
  try
     footer := DecStr(F.ReadString('SYS_DEFINE','FOOTER',EncStr('敬请保留小票,以作售后依据',ENC_KEY)),ENC_KEY);
     title := DecStr(F.ReadString('SYS_DEFINE','TITLE',EncStr('[门店名称]',ENC_KEY)),ENC_KEY);
     SavePrint := F.ReadString('SYS_DEFINE','SAVEPRINT','0')='1';
     ScanComm := F.ReadInteger('SYS_DEFINE','ScanCOMM',0);
     DisplayComm := F.ReadInteger('SYS_DEFINE','BUYERDISPLAY',0);
     ScanBaudRate := F.ReadInteger('SYS_DEFINE','ScanBaudRate',9600);
     DisplayBaudRate := F.ReadInteger('SYS_DEFINE','DISPLAYBAUDRATE',9600);
     CashBox := F.ReadInteger('SYS_DEFINE','CashBox',0);
     CashBoxRate := F.ReadInteger('SYS_DEFINE','CASHBOXRATE',9600);
     Lpt := F.ReadInteger('SYS_DEFINE','PRINTERCOMM',1);
     LPTType := F.ReadInteger('SYS_DEFINE','PRINT_TYPE',1);
     TicketPrintName := F.ReadInteger('SYS_DEFINE','TICKET_PRINT_NAME',0);

     Width := F.ReadInteger('SYS_DEFINE','PRINTERWIDTH',33)-3;
     PrintNull :=  F.ReadInteger('SYS_DEFINE','PRINTNULL',0);

     PrintFormat := F.ReadInteger('SYS_DEFINE','PRINTFORMAT',0);
     CloseDayPrinted :=  F.ReadBool('SYS_DEFINE','CLOSEDAYPRINTED',false);
     CloseDayPrintFlag :=  F.ReadInteger('SYS_DEFINE','CLOSEDAYPRINTFLAG',0);

     Copys := F.ReadInteger('SYS_DEFINE','TICKETCOPY',1);
  finally
    try
      F.Free;
    except
    end;
  end;

  //2012.08.05Add设置端口速率
  if (FComHandle>0)and(DisplayComm>0)then 
  begin
    Com_Init(DisplayComm,DisplayBaudRate);  
  end;
end;

class procedure TDevFactory.OpenCashBox;
var F:TextFile;
    S:string;
begin
  if DevFactory.CashBox=0 then Exit;
  if (GetTickCount-DevFactory.CashBoxStart)<5000 then Exit;
  DevFactory.CashBoxStart := GetTickCount;
  if DevFactory.CashBox=1 then
     begin
        DevFactory.BeginPrint;
        try
          if not (DevFactory.LPT in [30]) then
             DevFactory.WritePrintNoEnter(CHR(27)+'p'+CHR(0)+CHR(60)+CHR(255))
          else
             DevFactory.WritePrintNoEnter(' ');
        finally
          DevFactory.EndPrint;
        end;
     end;
  if DevFactory.CashBox>1 then
     begin
        DevFactory.OpenCashBoxComm;
     end;
end;

procedure TDevFactory.OpenCashBoxComm;
var S:string;
begin
  try
     if CashBox<=1 then Exit;
     FComm.StopComm;
     FComm.CommName := 'COM'+Inttostr(CashBox-1);
     FComm.BaudRate := CashBoxRate;
     FComm.StartComm;
     S:=CHR(27)+'p'+CHR(0)+CHR(60)+CHR(255);
     FComm.WriteCommData(Pchar(S),Length(S)) ;
  except
     ShowMsgBox(Pchar('打开钱箱'+FComm.CommName+'端口出错,是否正确设置参数？'),Pchar(Application.Title),MB_OK+MB_ICONINFORMATION);
  end;
end;

procedure TDevFactory.OpenDisplayComm;
var S:string;
begin
  try
    if DisplayComm<=0 then Exit;
    FComm.StopComm;
    FComm.CommName := 'COM'+Inttostr(DisplayComm);
    FComm.BaudRate := DisplayBaudRate;
    FComm.StartComm;
    S:=Chr(27)+Chr(64);
    FComm.WriteCommData(Pchar(S),Length(S)) ;
  except
    ShowMsgBox(Pchar('打开顾客显示屏'+FComm.CommName+'端口出错,是否正确设置参数？'),Pchar(Application.Title),MB_OK+MB_ICONINFORMATION);
  end;
end;

function TDevFactory.ReadDefine(Define: string;Def:string=''): string;
var F:TIniFile;
begin
  F := TIniFile.Create(ExtractFilePath(Application.ExeName)+'dev.fty');
  try
    result := F.ReadString('SYS_DEFINE',Define,Def);
  finally
    try
      F.Free;
    except
    end;
  end;
end;

procedure TDevFactory.SetCashBox(const Value: Integer);
begin
  FCashBox := Value;
end;

procedure TDevFactory.SetCloseDayPrinted(const Value: boolean);
begin
  FCloseDayPrinted := Value;
end;

procedure TDevFactory.SetCloseDayPrintFlag(const Value: integer);
begin
  FCloseDayPrintFlag := Value;
end;

procedure TDevFactory.SetCopys(const Value: integer);
begin
  FCopys := Value;
end;

procedure TDevFactory.SetDisplayBaudRate(const Value: Integer);
begin
  FDisplayBaudRate := Value;
end;

procedure TDevFactory.SetDisplayComm(const Value: Integer);
begin
  FDisplayComm := Value;
end;

procedure TDevFactory.SetFooter(const Value: string);
begin
  FFooter := Value;
end;

procedure TDevFactory.SetLEDNumber(Value: Real);
var S:string;
begin
  if DisplayComm<=0 then Exit;

  //2012.08.04修改用api_com.dll调用
  S:=Chr(27)+Chr(81)+Chr(65)+FloatToStr(Value)+Chr(13);
  DoCallApi_Com(S);
 {
  FComm.StopComm;
  FComm.CommName := 'COM'+Inttostr(DisplayComm);
  FComm.BaudRate := DisplayBaudRate;
  FComm.StartComm;
  S:=Chr(27)+Chr(81)+Chr(65)+FloatToStr(Value)+Chr(13);
  FComm.WriteCommData(Pchar(S),Length(S)) ;
  }
end;

procedure TDevFactory.SetLEDType(Value: Integer);
var S:string;
begin
  if DisplayComm<=0 then Exit;

  //2012.07.14修改用api_com.dll调用
  S:= Chr(27)+Chr(115)+IntToStr(Value);
  DoCallApi_Com(S);

 {
  FComm.StopComm;
  FComm.CommName := 'COM'+Inttostr(DisplayComm);
  FComm.BaudRate := DisplayBaudRate;
  FComm.StartComm;
  S:=Chr(27)+Chr(115)+Inttostr(Value);
  FComm.WriteCommData(Pchar(S),Length(S)) ;
  }
end;

procedure TDevFactory.SetLPT(const Value: integer);
begin
  FLPT := Value;
end;

procedure TDevFactory.SetLPTType(const Value: integer);
begin
  FLPTType := Value;
end;

procedure TDevFactory.SetPrepared(const Value: Boolean);
begin
  FPrepared := Value;
end;

procedure TDevFactory.SetPrintFormat(const Value: integer);
begin
  FPrintFormat := Value;
end;

procedure TDevFactory.SetPrintNull(const Value: integer);
begin
  FPrintNull := Value;
end;

procedure TDevFactory.SetSavePrint(const Value: Boolean);
begin
  FSavePrint := Value;
end;

procedure TDevFactory.SetScanBaudRate(const Value: Integer);
begin
  FScanBaudRate := Value;
end;

procedure TDevFactory.SetScanComm(const Value: Integer);
begin
  FScanComm := Value;
end;

procedure TDevFactory.SetTicketPrintName(const Value: integer);
begin
  FTicketPrintName := Value;
end;

procedure TDevFactory.SetTitle(const Value: string);
begin
  FTitle := Value;
end;

procedure TDevFactory.SetWidth(const Value: integer);
begin
  FWidth := Value;
end;

class procedure TDevFactory.ShowAMoney(Value: Real);
begin
  DevFactory.SetLEDType(3);
  DevFactory.SetLEDNumber(Value);
  if Screen.MonitorCount>1 then
     begin
       DevFactory.frmShowPanel.sText := '实收:'+formatFloat('#0.0##',Value)+'元';
       DevFactory.frmShowPanel.StartScreen;
     end;
end;

class procedure TDevFactory.ShowAPrice(Value: Real;ShowN:string='');
begin
  DevFactory.SetLEDType(1);
  DevFactory.SetLEDNumber(Value);
  if Screen.MonitorCount>1 then
     begin
       DevFactory.frmShowPanel.sText := '单价:'+formatFloat('#0.0##',Value)+'元';
       DevFactory.frmShowPanel.StartScreen;
     end;
end;

class procedure TDevFactory.ShowATotal(Value: Real);
begin
  DevFactory.SetLEDType(2);
  DevFactory.SetLEDNumber(Value);
  if Screen.MonitorCount>1 then
     begin
       DevFactory.frmShowPanel.sText := '总价:'+formatFloat('#0.0##',Value)+'元';
       DevFactory.frmShowPanel.StartScreen;
     end;
end;

class procedure TDevFactory.ShowDibs(Value: Real);
begin
  DevFactory.SetLEDType(4);
  DevFactory.SetLEDNumber(Value);
  if Screen.MonitorCount>1 then
     begin
       DevFactory.frmShowPanel.sText := '找零:'+formatFloat('#0.0##',Value)+'元';
       DevFactory.frmShowPanel.StartScreen;
     end;
end;

procedure TDevFactory.WritePrint(s: string);
begin
  Writeln(F,s);
end;

procedure TDevFactory.WritePrintNoEnter(s: string);
begin
  Write(F,s);
end;

initialization
  DevFactory := TDevFactory.Create;
  DevFactory.InitComm;
finalization
  DevFactory.Free;
end.

