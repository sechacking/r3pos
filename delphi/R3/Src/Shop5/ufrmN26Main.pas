unit ufrmN26Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmMain, ExtCtrls, Menus, ActnList, ComCtrls, StdCtrls, jpeg,
  RzBmpBtn, RzLabel,MultInst, RzBckgnd, Buttons, RzPanel, ufrmBasic, ToolWin,
  RzButton, ZBase, ufrmInstall, RzStatus, RzTray, ShellApi, ZdbFactory,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalc, ObjCommon,RzGroupBar,ZDataSet, ImgList, RzTabs, OleCtrls, SHDocVw,
  DB, ZAbstractRODataset, ZAbstractDataset,ufrmHintMsg;
const
  WM_LOGIN_REQUEST=WM_USER+10;
  WM_CHECK_MSG=WM_USER+2565;
type
  TfrmN26Main = class(TfrmMain)
    mnuWindow: TMenuItem;
    Panel5: TPanel;
    Image3: TImage;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    fdsfds1: TMenuItem;
    rzLeft: TRzPanel;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    N41: TMenuItem;
    N42: TMenuItem;
    N43: TMenuItem;
    N44: TMenuItem;
    N45: TMenuItem;
    N46: TMenuItem;
    N47: TMenuItem;
    N49: TMenuItem;
    N51: TMenuItem;
    N48: TMenuItem;
    N52: TMenuItem;
    N53: TMenuItem;
    N54: TMenuItem;
    N56: TMenuItem;
    N57: TMenuItem;
    N58: TMenuItem;
    N59: TMenuItem;
    N60: TMenuItem;
    N55: TMenuItem;
    N61: TMenuItem;
    N62: TMenuItem;
    N63: TMenuItem;
    N64: TMenuItem;
    N65: TMenuItem;
    N66: TMenuItem;
    N67: TMenuItem;
    N68: TMenuItem;
    N69: TMenuItem;
    N70: TMenuItem;
    N71: TMenuItem;
    N72: TMenuItem;
    N74: TMenuItem;
    N75: TMenuItem;
    N76: TMenuItem;
    N77: TMenuItem;
    N78: TMenuItem;
    RzVersionInfo: TRzVersionInfo;
    N79: TMenuItem;
    N80: TMenuItem;
    N81: TMenuItem;
    N82: TMenuItem;
    Timer1: TTimer;
    N83: TMenuItem;
    N84: TMenuItem;
    N86: TMenuItem;
    N87: TMenuItem;
    N88: TMenuItem;
    N89: TMenuItem;
    N91: TMenuItem;
    N92: TMenuItem;
    N50: TMenuItem;
    N93: TMenuItem;
    N23: TMenuItem;
    N39: TMenuItem;
    N40: TMenuItem;
    N73: TMenuItem;
    N85: TMenuItem;
    N94: TMenuItem;
    N95: TMenuItem;
    N96: TMenuItem;
    N97: TMenuItem;
    N98: TMenuItem;
    N99: TMenuItem;
    N90: TMenuItem;
    N22: TMenuItem;
    N100: TMenuItem;
    N101: TMenuItem;
    N102: TMenuItem;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Image15: TImage;
    ImageList1: TImageList;
    Image19: TImage;
    RzGroupBar1: TRzGroupBar;
    actfrmMeaUnits: TAction;
    actfrmDutyInfoList: TAction;
    actfrmRoleInfoList: TAction;
    actfrmDeptInfoList: TAction;
    actfrmUsers: TAction;
    actfrmBrandInfo: TAction;
    actfrmFactoryInfo: TAction;
    actfrmStockOrderList: TAction;
    actfrmSalesOrderList: TAction;
    actfrmChangeOrderList1: TAction;
    actfrmChangeOrderList2: TAction;
    actfrmGoodsSort: TAction;
    actfrmGoodsInfoList: TAction;
    actfrmCodeInfo3: TAction;
    actfrmSortInfo: TAction;
    actfrmImplInfo: TAction;
    actfrmAreaInfo: TAction;
    actfrmSaleStyle: TAction;
    actfrmSettleCode: TAction;
    actfrmShopGroup: TAction;
    actfrmRecvOrderList: TAction;
    actfrmPayOrderList: TAction;
    actfrmClient: TAction;
    actfrmSupplier: TAction;
    actfrmSalRetuOrderList: TAction;
    actfrmStkRetuOrderList: TAction;
    actfrmPosMain: TAction;
    actfrmPriceGradeInfo: TAction;
    actfrmSalIndentOrderList: TAction;
    actfrmStkIndentOrderList: TAction;
    actfrmSalInvoiceList: TAction;
    actfrmCustomer: TAction;
    actfrmCostCalc: TAction;
    actfrmSysDefine: TAction;
    actfrmDaysClose: TAction;
    actfrmMonthClose: TAction;
    actfrmCloseForDay: TAction;
    actfrmPriceOrderList: TAction;
    actfrmCheckOrderList: TAction;
    actfrmTransOrderList: TAction;
    actfrmDbOrderList: TAction;
    actfrmShopInfoList: TAction;
    actfrmXsmBrowser: TAction;
    actfrmAccount: TAction;
    actfrmIoroOrderList1: TAction;
    actfrmIoroOrderList2: TAction;
    actfrmDevFactory: TAction;
    actfrmIntfSetup: TAction;
    actfrmStorageTracking: TAction;
    actfrmRckMng: TAction;
    actfrmCheckTablePrint: TAction;
    actfrmJxcTotalReport: TAction;
    actfrmStockDayReport: TAction;
    actfrmSaleDayReport: TAction;
    actfrmChange1DayReport: TAction;
    actfrmChange2DayReport: TAction;
    actfrmLockScreen: TAction;
    actfrmStorageDayReport: TAction;
    actfrmRecvDayReport: TAction;
    actfrmRckDayReport: TAction;
    actfrmRelation: TAction;
    Label2: TLabel;
    Panel21: TPanel;
    Image2: TImage;
    Panel22: TPanel;
    Image13: TImage;
    Image22: TImage;
    Panel23: TPanel;
    Image23: TImage;
    Image24: TImage;
    Image25: TImage;
    toolButton: TRzBmpButton;
    Panel24: TPanel;
    Image26: TImage;
    Panel26: TPanel;
    Image28: TImage;
    actfrmPayDayReport: TAction;
    actfrmPayAbleReport: TAction;
    actfrmRecvAbleReport: TAction;
    actfrmDbDayReport: TAction;
    actfrmGodsRunningReport: TAction;
    tlbPage: TPopupMenu;
    tlbClose: TMenuItem;
    N33: TMenuItem;
    N103: TMenuItem;
    actfrmIoroDayReport: TAction;
    actfrmMessage: TAction;
    actfrmNewPaperReader: TAction;
    actfrmQuestionnaire: TAction;
    RzLabel1: TRzLabel;
    actfrmInLocusOrderList: TAction;
    actfrmOutLocusOrderList: TAction;
    actfrmDownIndeOrder: TAction;
    actfrmRecvForDay: TAction;
    actfrmImpeach: TAction;
    actfrmClearData: TAction;
    actfrmSaleAnaly: TAction;
    actfrmNetForOrder: TAction;
    actfrmSaleManSaleReport: TAction;
    actfrmClientSaleReport: TAction;
    actfrmSaleTotalReport: TAction;
    actfrmStgTotalReport: TAction;
    actfrmStockTotalReport: TAction;
    RzTrayIcon1: TRzTrayIcon;
    actfrmSaleMonthTotalReport: TAction;
    RzPanel1: TRzPanel;
    Panel1: TPanel;
    Panel4: TPanel;
    Image5: TImage;
    Image6: TImage;
    Panel2: TPanel;
    Image4: TImage;
    Label1: TLabel;
    Panel6: TPanel;
    Panel19: TPanel;
    Image20: TImage;
    lblUserInfo: TRzLabel;
    Panel18: TPanel;
    Image17: TImage;
    Panel17: TPanel;
    Image7: TImage;
    Image8: TImage;
    RzBmpButton10: TRzBmpButton;
    RzBmpButton9: TRzBmpButton;
    RzBmpButton8: TRzBmpButton;
    RzBmpButton1: TRzBmpButton;
    RzBmpButton2: TRzBmpButton;
    RzBmpButton5: TRzBmpButton;
    RzBmpButton6: TRzBmpButton;
    RzBmpButton4: TRzBmpButton;
    rzTool: TPanel;
    Image21: TImage;
    Panel12: TPanel;
    Image14: TImage;
    Panel14: TPanel;
    Image9: TImage;
    Panel13: TPanel;
    Image1: TImage;
    Panel15: TPanel;
    Image10: TImage;
    Image11: TImage;
    rzChildTitle: TRzLabel;
    RzBmpButton3: TRzBmpButton;
    Panel3: TPanel;
    Panel16: TPanel;
    Image16: TImage;
    rzToolButton: TPanel;
    Image27: TImage;
    Panel20: TPanel;
    Image12: TImage;
    Panel9: TPanel;
    ImageList4: TImageList;
    RzPanel2: TRzPanel;
    rzPage: TRzTabControl;
    Panel25: TPanel;
    actfrmN26Net: TAction;
    actfrmGoodsMonth: TAction;
    CA_MODULE: TZQuery;
    actfrmSimpleSaleDayReport: TAction;
    actfrmIEOpen: TAction;
    actfrmDemandOrderList1: TAction;
    actfrmDemandOrderList2: TAction;
    actfrmInitGuide: TAction;
    Image18: TImage;
    RzBmpButton7: TRzBmpButton;
    RzBmpButton11: TRzBmpButton;
    actfrmAllRckReport: TAction;
    actfrmSyncAll: TAction;
    actfrmBomOrderList: TAction;
    actfrmKpiIndex: TAction;
    actfrmMktPlanOrderList: TAction;
    actfrmMktRequOrderList: TAction;
    actfrmMktKpiResult: TAction;
    procedure FormActivate(Sender: TObject);
    procedure fdsfds1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure miCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rem(Sender: TObject; var CanClose: Boolean);
    procedure N68Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure N90Click(Sender: TObject);
    procedure UpdateTimerTimer(Sender: TObject);
    procedure RzBmpButton10Click(Sender: TObject);
    procedure RzBmpButton8Click(Sender: TObject);
    procedure RzTabChange(Sender: TObject);
    procedure Image19Click(Sender: TObject);
    procedure RzBmpButton9Click(Sender: TObject);
    procedure toolButtonClick(Sender: TObject);
    procedure actfrmMeaUnitsExecute(Sender: TObject);
    procedure actfrmDutyInfoListExecute(Sender: TObject);
    procedure actfrmRoleInfoListExecute(Sender: TObject);
    procedure actfrmDeptInfoListExecute(Sender: TObject);
    procedure actfrmUsersExecute(Sender: TObject);
    procedure actfrmBrandInfoExecute(Sender: TObject);
    procedure actfrmStockOrderListExecute(Sender: TObject);
    procedure actfrmSalesOrderListExecute(Sender: TObject);
    procedure actfrmChangeOrderList1Execute(Sender: TObject);
    procedure actfrmChangeOrderList2Execute(Sender: TObject);
    procedure actfrmGoodsInfoListExecute(Sender: TObject);
    procedure actfrmGoodsSortExecute(Sender: TObject);
    procedure actfrmCodeInfo3Execute(Sender: TObject);
    procedure actfrmSortInfoExecute(Sender: TObject);
    procedure actfrmImplInfoExecute(Sender: TObject);
    procedure actfrmAreaInfoExecute(Sender: TObject);
    procedure actfrmSaleStyleExecute(Sender: TObject);
    procedure actfrmSettleCodeExecute(Sender: TObject);
    procedure actfrmShopGroupExecute(Sender: TObject);
    procedure actfrmRecvOrderListExecute(Sender: TObject);
    procedure actfrmPayOrderListExecute(Sender: TObject);
    procedure actfrmClientExecute(Sender: TObject);
    procedure actfrmSupplierExecute(Sender: TObject);
    procedure actfrmSalRetuOrderListExecute(Sender: TObject);
    procedure actfrmStkRetuOrderListExecute(Sender: TObject);
    procedure actfrmPosMainExecute(Sender: TObject);
    procedure actfrmPriceGradeInfoExecute(Sender: TObject);
    procedure actfrmSalIndentOrderListExecute(Sender: TObject);
    procedure actfrmStkIndentOrderListExecute(Sender: TObject);
    procedure actfrmSalInvoiceListExecute(Sender: TObject);
    procedure actfrmCustomerExecute(Sender: TObject);
    procedure actfrmCostCalcExecute(Sender: TObject);
    procedure actfrmSysDefineExecute(Sender: TObject);
    procedure actfrmDaysCloseExecute(Sender: TObject);
    procedure actfrmMonthCloseExecute(Sender: TObject);
    procedure actfrmCloseForDayExecute(Sender: TObject);
    procedure actfrmPriceOrderListExecute(Sender: TObject);
    procedure actfrmCheckOrderListExecute(Sender: TObject);
    procedure actfrmDbOrderListExecute(Sender: TObject);
    procedure actfrmShopInfoListExecute(Sender: TObject);
    procedure actfrmAccountExecute(Sender: TObject);
    procedure actfrmTransOrderListExecute(Sender: TObject);
    procedure actfrmDevFactoryExecute(Sender: TObject);
    procedure actfrmIoroOrderList1Execute(Sender: TObject);
    procedure actfrmIoroOrderList2Execute(Sender: TObject);
    procedure actfrmCheckTablePrintExecute(Sender: TObject);
    procedure actfrmRckMngExecute(Sender: TObject);
    procedure actfrmJxcTotalReportExecute(Sender: TObject);
    procedure actfrmStockDayReportExecute(Sender: TObject);
    procedure actfrmSaleDayReportExecute(Sender: TObject);
    procedure actfrmChange1DayReportExecute(Sender: TObject);
    procedure actfrmChange2DayReportExecute(Sender: TObject);
    procedure actfrmLockScreenExecute(Sender: TObject);
    procedure actfrmStorageDayReportExecute(Sender: TObject);
    procedure actfrmRckDayReportExecute(Sender: TObject);
    procedure actfrmRelationExecute(Sender: TObject);
    procedure RzBmpButton3Click(Sender: TObject);
    procedure actfrmRecvDayReportExecute(Sender: TObject);
    procedure actfrmPayDayReportExecute(Sender: TObject);
    procedure actfrmRecvAbleReportExecute(Sender: TObject);
    procedure actfrmPayAbleReportExecute(Sender: TObject);
    procedure actfrmStorageTrackingExecute(Sender: TObject);
    procedure actfrmDbDayReportExecute(Sender: TObject);
    procedure actfrmGodsRunningReportExecute(Sender: TObject);
    procedure RzBmpButton2Click(Sender: TObject);
    procedure tlbCloseClick(Sender: TObject);
    procedure N103Click(Sender: TObject);
    procedure actfrmIoroDayReportExecute(Sender: TObject);
    procedure actfrmMessageExecute(Sender: TObject);
    procedure actfrmNewPaperReaderExecute(Sender: TObject);
    procedure actfrmQuestionnaireExecute(Sender: TObject);
    procedure RzBmpButton11Click(Sender: TObject);
    procedure RzBmpButton12Click(Sender: TObject);
    procedure RzBmpButton7Click(Sender: TObject);
    procedure RzBmpButton13Click(Sender: TObject);
    procedure RzBmpButton14Click(Sender: TObject);
    procedure RzBmpButton15Click(Sender: TObject);
    procedure sDeskPageClick(Sender: TObject);
    procedure RzBmpButton6Click(Sender: TObject);
    procedure actfrmInLocusOrderListExecute(Sender: TObject);
    procedure actfrmOutLocusOrderListExecute(Sender: TObject);
    procedure lblUserInfoClick(Sender: TObject);
    procedure actfrmDownIndeOrderExecute(Sender: TObject);
    procedure actfrmRecvForDayExecute(Sender: TObject);
    procedure rzUserInfoClick(Sender: TObject);
    procedure actfrmImpeachExecute(Sender: TObject);
    procedure actfrmClearDataExecute(Sender: TObject);
    procedure actfrmSaleAnalyExecute(Sender: TObject);
    procedure actfrmNetForOrderExecute(Sender: TObject);
    procedure actfrmSaleManSaleReportExecute(Sender: TObject);
    procedure actfrmClientSaleReportExecute(Sender: TObject);
    procedure actfrmSaleTotalReportExecute(Sender: TObject);
    procedure actfrmStgTotalReportExecute(Sender: TObject);
    procedure actfrmStockTotalReportExecute(Sender: TObject);
    procedure RzTrayIcon1LButtonDblClick(Sender: TObject);
    procedure actfrmSaleMonthTotalReportExecute(Sender: TObject);
    procedure rzPageChange(Sender: TObject);
    procedure actfrmN26NetExecute(Sender: TObject);
    procedure RzBmpButton1Click(Sender: TObject);
    procedure RzTrayIcon1MinimizeApp(Sender: TObject);
    procedure RzTrayIcon1RestoreApp(Sender: TObject);
    procedure RzButton1Click(Sender: TObject);
    procedure actfrmGoodsMonthExecute(Sender: TObject);
    procedure actfrmSimpleSaleDayReportExecute(Sender: TObject);
    procedure actfrmIEOpenExecute(Sender: TObject);
    procedure actfrmDemandOrderList1Execute(Sender: TObject);
    procedure actfrmDemandOrderList2Execute(Sender: TObject);
    procedure actfrmInitGuideExecute(Sender: TObject);
    procedure RzBmpButton5Click(Sender: TObject);
    procedure actfrmAllRckReportExecute(Sender: TObject);
    procedure actfrmSyncAllExecute(Sender: TObject);
    procedure RzBmpButton4Click(Sender: TObject);
    procedure actfrmBomOrderListExecute(Sender: TObject);
    procedure actfrmKpiIndexExecute(Sender: TObject);
    procedure actfrmMktPlanOrderListExecute(Sender: TObject);
    procedure actfrmMktRequOrderListExecute(Sender: TObject);
    procedure actfrmMktKpiResultExecute(Sender: TObject);
    procedure actfrmClientKpiReportExecute(Sender: TObject);
    procedure actfrmManKpiReportExecute(Sender: TObject);
    procedure actfrmBondRequReportExecute(Sender: TObject);
    procedure actfrmMktRequReportExecute(Sender: TObject);
    procedure actfrmMktCostTotalReportExecute(Sender: TObject);
    procedure actfrmMktKpiTotalReportExecute(Sender: TObject);
    procedure actfrmMktMarketCostOrderListExecute(Sender: TObject);
    procedure actfrmMktActiveListExecute(Sender: TObject);
    procedure actfrmMktGodsReportExecute(Sender: TObject);
    procedure actfrmMktBudgOrderListExecute(Sender: TObject);
    procedure actfrmMktBudgReportExecute(Sender: TObject);
    procedure actfrmPlanOrderList3Execute(Sender: TObject);
    procedure actfrmStkInvoiceListExecute(Sender: TObject);
    procedure actfrmInvoiceExecute(Sender: TObject);
    procedure actfrmMktAtthOrderListExecute(Sender: TObject);
    procedure actfrmSalIndentDayReportExecute(Sender: TObject);
  private
    { Private declarations }
    FList:TList;
    PageList:TList;
    FLogined: boolean;
    frmInstall:TfrmInstall;
    FLoging: boolean;
    FSystemShutdown: boolean;
    sflag:string;
    IsXsm:Boolean;
    FdeskFlag: integer;
    FleftVisible: boolean;
    procedure DoLoadMsg(Sender:TObject);
    procedure DoActiveForm(Sender:TObject);
    procedure DoFreeForm(Sender:TObject);
    procedure DoActiveChange(Sender:TObject);
    procedure SortToolButton;
    procedure SortPageButton;
    procedure WMQUERYENDSESSION(var msg:Tmessage);Message  WM_QUERYENDSESSION;
    procedure wm_Login(var Message: TMessage); message WM_LOGIN_REQUEST;
    procedure wm_desktop(var Message: TMessage); message WM_DESKTOP_REQUEST;
    procedure wm_message(var Message: TMessage); message MSC_MESSAGE;
    procedure wm_check(var Message: TMessage); message WM_CHECK_MSG;
    procedure SetLogined(const Value: boolean);
    function  CheckVersion:boolean;
    function  ConnectToDb:boolean;
    //p1 -rsp
    //p2 连接串
    //p3 企业号
    //p4 产品号
    //p5 行业号
    function  ConnectToRsp:boolean;
    function  ConnectToXsm:boolean;
    function  UpdateDbVersion:boolean;
    procedure SetLoging(const Value: boolean);
    procedure SetSystemShutdown(const Value: boolean);
    procedure InitTenant;
    procedure DoPageClick(Sender:TObject);
    procedure SetdeskFlag(const Value: integer);
    procedure SetleftVisible(const Value: boolean);
  public
    { Publicdeclarations }
    destructor Destroy; override;
    procedure LoadPic32;
    procedure LoadMenu(Sender:TObject);
    procedure LoadFrame;
    procedure InitVersioin;
    function GetDeskFlag:string;
    procedure CheckEnabled;
    procedure DoConnectError(Sender:TObject);
    function Login(Locked:boolean=false;Exited:boolean=true):boolean;
    procedure WriteAction(s:string;flag:integer);
    procedure AddFrom(form:TForm);
    procedure RemoveFrom(form:TForm);
    property Logined:boolean read FLogined write SetLogined;
    property Loging:boolean read FLoging write SetLoging;
    property SystemShutdown:boolean read FSystemShutdown write SetSystemShutdown;
    property deskFlag:integer read FdeskFlag write SetdeskFlag;
    property leftVisible:boolean read FleftVisible write SetleftVisible;
  end;

var
  frmN26Main: TfrmN26Main;

implementation
uses
  uDsUtil,uRcFactory,ufrmBomOrderList,uFnUtil,ufrmLogo,uTimerFactory,ufrmTenant,ufrmN26Desk, ufrmDbUpgrade, uShopGlobal, udbUtil, uGlobal, IniFiles, ufrmLogin,
  ufrmDesk,ufrmPswModify,ufrmDutyInfoList,ufrmRoleInfoList,ufrmMeaUnits,ufrmDeptInfo,ufrmUsers,ufrmStockOrderList,
  ufrmSalesOrderList,ufrmChangeOrderList,ufrmGoodsSortTree,ufrmGoodsSort,ufrmGoodsInfoList,ufrmCodeInfo,ufrmRecvOrderList,
  ufrmPayOrderList,ufrmClient,ufrmSupplier,ufrmSalRetuOrderList,ufrmStkRetuOrderList,ufrmPosMain,uDevFactory,ufrmPriceGradeInfo,
  ufrmSalIndentOrderList,ufrmStkIndentOrderList,ufrmInvoice,ufrmCustomer,ufrmCostCalc,ufrmSysDefine,ufrmPriceOrderList,
  ufrmCheckOrderList,ufrmCloseForDay,ufrmDbOrderList,ufrmShopInfoList,ufrmIEWebForm,ufrmAccount,ufrmTransOrderList,ufrmDevFactory,
  ufrmIoroOrderList,ufrmCheckTablePrint,ufrmRckMng,ufrmJxcTotalReport,ufrmStockDayReport,ufrmDeptInfoList,ufrmSaleDayReport,
  ufrmChangeDayReport,ufrmStorageDayReport,ufrmRckDayReport,ufrmRelation,uSyncFactory,ufrmRecvDayReport,ufrmPayDayReport,
  ufrmRecvAbleReport,ufrmPayAbleReport,ufrmStorageTracking,ufrmDbDayReport,ufrmGodsRunningReport,uCaFactory,ufrmIoroDayReport,
  ufrmMessage,ufrmNewsPaperReader,ufrmShopInfo,ufrmQuestionnaire,ufrmInLocusOrderList,ufrmOutLocusOrderList,uPrainpowerJudge,
  ufrmDownStockOrder,ufrmRecvPosList,ufrmHostDialog,ufrmImpeach,ufrmClearData,EncDec,ufrmSaleAnaly,ufrmClientSaleReport,
  ufrmSaleManSaleReport,ufrmSaleTotalReport,ufrmStgTotalReport,ufrmStockTotalReport,ufrmPrgBar,ufrmSaleMonthTotalReport,
  ufrmInitialRights,ufrmN26Browser,ufrmInitGuide,uLoginFactory,ufrmGoodsMonth,uSyncThread,uCommand,uMsgBox,uN26Factory,
  ufrmDemandOrderList,ufrmAllRckReport,ufrmSalInvoiceList,ufrmKpiIndex,ufrmMktPlanOrderList,ufrmMktRequOrderList,ufrmMktKpiResult,
  ufrmClientKpiReport,ufrmManKpiReport,ufrmBondRequReport,ufrmMktRequReport,ufrmMktCostTotalReport,ufrmMktKpiTotalReport,
  ufrmMktMarketCostOrderList,ufrmMktActiveList,ufrmMktGodsReport,ufrmMktBudgOrderList,ufrmMktBudgReport,ufrmMktPlanOrderList3,
  ufrmStkInvoiceList,ufrmMktAtthOrderList,ufrmSalIndentDayReport;
{$R *.dfm}

function CheckXsmPassWord(uid, pwd: string): boolean;
begin
  xsm_username := uid;
  xsm_password := pwd;
  result := N26Factory.coLogin(uid,pwd);
end;
procedure TfrmN26Main.FormActivate(Sender: TObject);
begin
  inherited;
  //if not systemShutdown and not Application.Terminated then WindowState := wsMaximized;
end;

procedure TfrmN26Main.fdsfds1Click(Sender: TObject);
begin
  inherited;
  self.Cascade;
end;


procedure TfrmN26Main.FormCreate(Sender: TObject);
var
  F:TextFile;
  i:integer;
begin
  inherited;
  IsXsm := false;
  LoadPic32;
  FList := TList.Create;
//  PagePanel.Visible := (sflag='s1_');
  PageList := TList.Create;
  frmLogo := TfrmLogo.Create(nil);
  frmPrgBar := TfrmPrgBar.Create(nil);
  ForceDirectories(ExtractFilePath(ParamStr(0))+'temp');
  ForceDirectories(ExtractFilePath(ParamStr(0))+'debug');
  SystemShutdown := false;
  Loging :=false;
  frmInstall := TfrmInstall.Create(self);
  XsmCheckPassWord := CheckXsmPassWord;
  screen.OnActiveFormChange := DoActiveChange;
  RzVersionInfo.FilePath := ParamStr(0);
  LoadFrame;
  TimerFactory := nil;
end;

procedure TfrmN26Main.FormDestroy(Sender: TObject);
var
  i:integer;
begin
  Timer1.Enabled := false;
  if TimerFactory<>nil then TimerFactory.Free;
  frmLogo.Free;
  frmPrgBar.Free;
  if frmInstall<>nil then frmInstall.free;
  screen.OnActiveFormChange := nil;
  for i:=0 to FList.Count - 1 do TObject(FList[i]).Free;
  inherited;
  FList.Free;
  PageList.Free;
end;

procedure TfrmN26Main.AddFrom(form: TForm);
var
  button:TrzBmpButton;
begin
//  if FList.Count > 5 then Exit;
  button := TrzBmpButton.Create(rzToolButton);
  button.GroupIndex := 999;
  button.Bitmaps.Up.Assign(toolButton.Bitmaps.Up);
  button.Bitmaps.Down.Assign(toolButton.Bitmaps.Down);
  button.Font.Assign(toolButton.Font);
  button.Caption := form.Caption;
  button.Tag := Integer(Pointer(form));
  button.OnClick := DoActiveForm;
  button.Visible := true;
  button.Parent := rzToolButton;
  button.PopupMenu := tlbPage;
  FList.Add(button);
  SortToolButton;
  button.Down := true;
  TfrmBasic(Form).OnFreeForm := DoFreeForm;
  TfrmBasic(Form).PageHandle := Integer(Button);
  rzChildTitle.Caption := '当前位置->'+form.Caption;
  if Screen.width<=800 then
  begin
    rzLeft.Width := 29;
    Panel12.Width := 31;
    Panel24.Width := 23;
    frmMain.OnResize(nil);
  end;
//  leftVisible := true;
//  case deskFlag of
//  1:begin
//       if rzLeft.Enabled then
//          begin
//            rzLeft.Width := 29;
//            Panel12.Width := 31;
//            Panel24.Width := 23;
//          end;
//    end;
//  end;
end;

procedure TfrmN26Main.RemoveFrom(form: TForm);
var
  i:integer;
begin
  for i:=0 to FList.Count -1 do
    begin
      if integer(FList[i])=integer(pointer(form)) then
         begin
           TObject(FList[i]).Free;
           FList.Delete(i);
           break;
         end;
    end;
  SortToolButton;
end;

procedure TfrmN26Main.DoActiveForm(Sender: TObject);
begin
  TForm(TrzBmpButton(Sender).tag).WindowState := wsMaximized;
  TForm(TrzBmpButton(Sender).tag).BringToFront;
  TrzBmpButton(Sender).Down := true;
end;

procedure TfrmN26Main.SortToolButton;
var
  i:Integer;
  button:TrzBmpButton;
begin
  for i:=0 to FList.Count -1 do
    begin
      button := TrzBmpButton(FList[i]);
      button.Top := 0;
      if i=0 then
         button.Left := 0
      else
         button.Left := TrzBmpButton(FList[i-1]).Left+TrzBmpButton(FList[i-1]).width+5;
    end;
end;

procedure TfrmN26Main.DoActiveChange(Sender: TObject);
var
  i:integer;
  SOn:TNotifyEvent;
begin
  for i:=0 to FList.Count -1 do
    begin
      if TrzBmpButton(FList[i]).tag=integer(pointer(screen.ActiveForm)) then
         begin
           TrzBmpButton(FList[i]).Caption :=  screen.ActiveForm.Caption;
           TrzBmpButton(FList[i]).Down := true;
           rzChildTitle.Caption := '当前位置->'+Screen.ActiveForm.Caption;
           break;
         end;
      if TrzBmpButton(FList[i]).tag=integer(Pointer(Sender)) then
         begin
           TrzBmpButton(FList[i]).Caption :=  TForm(Sender).Caption;
           TrzBmpButton(FList[i]).Down := true;
           rzChildTitle.Caption := '当前位置->'+TForm(Sender).Caption;
         end;
    end;
end;

procedure TfrmN26Main.DoFreeForm(Sender: TObject);
var
  i:integer;
begin
  for i:=0 to FList.Count -1 do
    begin
      if TrzBmpButton(FList[i]).tag=integer(pointer(Sender)) then
         begin
           TrzBmpButton(FList[i]).Tag := 0;
           TObject(FList[i]).Free;
           FList.Delete(i);
           break;
         end;
    end;
  SortToolButton;
end;

function TfrmN26Main.CheckVersion:boolean;
function GetFileNameFromURL(url: string): string;
var ts : TStrings;
begin
  //从url取得文件名
  ts := TStringList.create;
  try
    ts.Delimiter :='/';
    ts.DelimitedText := url;
    if ts.Count > 0 then
       Result := ts[ts.Count - 1];
  finally
    ts.Free;
  end;
end;
var
  filename:string;
  r:integer;
  frmInstall:TfrmInstall;
  CaUpgrade:TCaUpgrade;
begin
  result := false;
  try
  CaUpgrade := CaFactory.CheckUpgrade(inttostr(Global.TENANT_ID),ProductId,RzVersionInfo.FileVersion);
  if CaUpgrade.UpGrade in [1,2] then
  begin
     if (ShowMsgBox(pchar('系统检测的新版本'+CaUpgrade.Version+'，是否立即升级？'),'友情提示...',MB_YESNO+MB_ICONQUESTION)<>6) then
     begin
       if (CaUpgrade.UpGrade=1) then
          begin
            ShowMsgBox(pchar('你使用的软件版本过旧，没有升级无法继续使用.'),'友情提示...',MB_OK+MB_ICONQUESTION);
            Exit
          end else CaUpgrade.UpGrade := 3;
     end;
  end
  else
     CaUpgrade.UpGrade := 3;
  if CaUpgrade.UpGrade<>3 then
    begin
      frmInstall := TfrmInstall.Create(Application);
      try
        frmInstall.Show;
        frmInstall.CurVersion := RzVersionInfo.FileVersion;
        frmInstall.NewVersion := CaUpgrade.Version;
        frmInstall.Update;
        filename := GetFileNameFromURL(CaUpgrade.URL);
        frmInstall.Url := copy(CaUpgrade.URL,1,length(CaUpgrade.URL)-length(filename));
        frmInstall.Path := ExtractFilePath(ParamStr(0));
        if frmInstall.DownFile(filename) then
           begin
             result := false;
             ShellExecute(application.handle,'open',pchar(ExtractFilePath(ParamStr(0))+'install\'+filename),pchar(ExtractFilePath(ParamStr(0))+'install\'),nil,SW_SHOWNORMAL);
             Exit;
           end
        else
           Raise Exception.Create('下载升级文件失败，系统无法完成升级');
      finally
        frmInstall.free;
      end;
     end;
     result := true;
  except
    on E:Exception do
       begin
         ShowMsgBox(pchar('升级失败,错误:'+E.Message),'友情提示...',MB_OK+MB_ICONQUESTION);
         result := false;
       end;
  end;
end;
function TfrmN26Main.Login(Locked:boolean=false;Exited:boolean=true):boolean;
var
  Params:ufrmLogin.TLoginParam;
  lDate:TDate;
  AObj:TRecord_;
begin
  LoginFactory.Version := RzVersionInfo.FileVersion;
  if TimerFactory<>nil then TimerFactory.Free;
  try
  if (not Logined and not (CaFactory.Audited and N26Factory.Logined)) or Locked then
     begin
       Logined := TfrmLogin.doLogin(SysId,Locked,Params,lDate);
       if Logined then
       begin
         Global.SHOP_ID := Params.ShopId;
         Global.SHOP_NAME := Params.ShopName;
         Global.UserID := Params.UserID;
         Global.UserName := Params.UserName;
         Global.Roles := Params.Roles;
         Global.CloseAll;
         Global.SysDate := lDate;
         result := true;
       end;
     end
  else
     begin
       if N26Factory.Logined then Logined := true;
       result := true;
     end;
  if Locked then Exit;
  if Logined then
     begin
       //CommandPush.ExecuteCommand;
       Loging := false;
       frmLogo.Show;
       try
         if CaFactory.Audited then
            begin
              if not FindCmdLineSwitch('DEBUG',['-','+'],false) then //同步门店专用资料
                 begin
                   if Global.RemoteFactory.Connected and SyncFactory.CheckDBVersion then SyncFactory.SyncBasic(false);
                 end;
            end;
         frmLogo.Show;
         frmLogo.BringToFront;
         Global.LoadBasic();
         frmLogo.ShowTitle := '初始化权限,请稍候...';
         ShopGlobal.LoadRight;
         CheckEnabled;
         CA_MODULE.Close;
         frmLogo.ShowTitle := '初始化菜单,请稍候...';
         LoadMenu(nil);
         ShopGlobal.SyncTimeStamp;
         frmLogo.ShowTitle := '初始化广告,请稍候...';
         N26Factory.coPlayList;
         frmN26Desk.loadDesk;
         if not Locked and (DevFactory.ReadDefine('AUTORUNPOS','0')='1') and (ParamStr(1)<>'-xsm') and ShopGlobal.GetChkRight('500028') then
         begin
            PostMessage(Handle,WM_DESKTOP_REQUEST,13100001,0);
         end;
         PostMessage(Handle,WM_CHECK_MSG,0,0);
       finally
         frmLogo.Close;
       end;
     end
  else
     begin
       Logined := false;
       result := Logined;
       if Global.TENANT_ID = 0 then
          begin
            PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,1,1);
            Exit;
          end
       else
          begin
            if Exited then Application.Terminate;
          end;
     end;
  finally
     LoadFrame;
     if Logined then TimerFactory := TTimerFactory.Create(DoLoadMsg,StrtoIntDef(ShopGlobal.GetParameter('INTERVALTIME'),10)*60000);
     if Logined then StartSyncTask;
     Timer1.Enabled := Logined;
     frmLogo.Close;
  end;
end;

procedure TfrmN26Main.wm_Login(var Message: TMessage);
var prm:string;
  F:TIniFile;
begin
  if Logined then Exit;
  CaFactory.DownModule := true;
  try
    if (ParamStr(1)='-rsp') then
       begin
         if not ConnectToRsp then
           begin
             Application.Terminate;
             Exit;
           end
         else
           Logined := true;
       end
    else
    if (ParamStr(1)='-xsm') then
       begin
         if not ConnectToXsm then
           begin
             Application.Terminate;
             Exit;
           end
         else
           Logined := true;
       end
    else
       begin
         if not ConnectToDb then
           begin
             Application.Terminate;
             Exit;
           end
         else
           Logined := false;
       end;
    Logined := Login(false);
    if not frmN26Main.Visible and Logined and not IsXsm then
    begin
      Application.Minimize;
      frmN26Main.Show;
      frmN26Main.WindowState := wsMaximized;
      Application.Restore;
    end;
  F := TIniFile.Create(ExtractFilePath(ParamStr(0))+'r3.cfg');
  try
    deskFlag := F.ReadInteger('soft','deskFlag',0);
    case deskFlag of
    0:begin
        RzBmpButton6.Visible := true;
        RzBmpButton1.Visible := true;
        RzBmpButton2.Visible := true;
        RzBmpButton4.Visible := true;
        leftVisible := true;
      end;
    1:begin
        Image19Click(nil);
        RzBmpButton7.Visible := true;
        RzBmpButton11.Visible := true;
        leftVisible := false;
      end;
    end;
  finally
    F.Free;
  end;
  except
    on E:Exception do
       begin
         ShowMsgBox(pchar(E.Message),'友情提示...',MB_OK+MB_ICONWARNING);
         Application.Terminate;
         Exit;
       end;
  end;
end;

procedure TfrmN26Main.SetLogined(const Value: boolean);
var s:string;
begin
  FLogined := Value;
  if not Value then Timer1.Enabled := Value;
  if Value then
     lblUserInfo.Caption := '用户名:'+Global.UserName
  else
     lblUserInfo.Caption := '未登录...';
end;

procedure TfrmN26Main.miCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmN26Main.FormShow(Sender: TObject);
begin
  inherited;
  UpdateTimer.Enabled := true;
end;

procedure TfrmN26Main.CheckEnabled;
var
  i:integer;
  rs:TZQuery;
begin
  for i:=0 to actList.ActionCount -1 do
    begin
      TAction(actList.Actions[i]).Enabled := (TAction(actList.Actions[i]).Tag=0);
      if TAction(actList.Actions[i]).Tag > 0 then
         TAction(actList.Actions[i]).Enabled := ShopGlobal.GetChkRight(inttostr(TAction(actList.Actions[i]).tag),1);
    end;
  actfrmDbOrderList.Enabled := actfrmDbOrderList.Enabled and (ShopGlobal.NetVersion or ShopGlobal.ONLVersion);
  actfrmDbDayReport.Enabled := actfrmDbDayReport.Enabled and (ShopGlobal.NetVersion or ShopGlobal.ONLVersion);
  rs := Global.GetZQueryFromName('CA_TENANT');
  if rs.Locate('TENANT_ID',Global.TENANT_ID,[]) then
     actfrmRelation.Enabled := actfrmRelation.Enabled and (rs.FieldbyName('TENANT_TYPE').asInteger<>3)
  else
     actfrmRelation.Enabled := false;
end;

procedure TfrmN26Main.rem(Sender: TObject;
  var CanClose: Boolean);
function CheckUpdateStatus:boolean;
begin
  result := (Factor.ExecProc('TGetLastUpdateStatus')='1'); 
end;
begin
  if PrainpowerJudge.Locked>0 then
     begin
       ShowMsgBox('正在执行消息同步，请稍等再重试退出软件..','友情提示..',MB_OK+MB_ICONINFORMATION);
       CanClose := false;
       Exit;
     end;
  if not SystemShutdown and (ShowMsgBox('为保障您的数据安全，退出时系统将为您的数据进行备份整理，是否退出系统？','友情提示..',MB_YESNO+MB_ICONQUESTION)<>6) then
     begin
       CanClose := false;
       Exit;
       //Application.Minimize;
     end;
  try
    LoginFactory.Logout;
    Timer1.Enabled := false;
    StopSyncTask;
    if TimerFactory<>nil then TimerFactory.Free;
    if Global.UserID='system' then exit;
    if CaFactory.CheckDebugSync then Exit;
  except
    on E:Exception do
       begin
         ShowMsgBox(Pchar(E.Message),'友情提示...',MB_OK+MB_ICONINFORMATION);
         Exit;
       end;
  end;
  if not ShopGlobal.ONLVersion then
     begin
        try
          if not Global.RemoteFactory.Connected then ShowMsgBox('请检查你的网络状态是否正常，接通网络后点击确认按钮!','友情提示...',MB_OK);
          Global.TryRemateConnect;
        except
          Exit;
        end;
        try
          if not SyncFactory.CheckDBVersion then Raise Exception.Create('你本机使用的软件版本过旧，请升级程序后再使用。');
          if not ShopGlobal.NetVersion and not SyncFactory.SyncLockCheck then Exit;
          if not ShopGlobal.NetVersion and TfrmCostCalc.CheckSyncReck(self) then TfrmCostCalc.TryCalcMthGods(self);
          SyncFactory.SyncAll;
        except
          on E:Exception do
             ShowMsgBox(Pchar(E.Message),'友情提示...',MB_OK+MB_ICONINFORMATION);
        end;
     end
  else
     begin
        try
          if not ShopGlobal.NetVersion and TfrmCostCalc.CheckSyncReck(self) then TfrmCostCalc.TryCalcMthGods(self);
          SyncFactory.SyncRim;
        except
          on E:Exception do
             ShowMsgBox(Pchar(E.Message),'友情提示...',MB_OK+MB_ICONINFORMATION);
        end;
     end;
end;

procedure TfrmN26Main.N68Click(Sender: TObject);
begin
  inherited;
  if Logined then
  begin
    frmN26Main.Show;
    frmN26Main.WindowState := wsMaximized;
    Application.Restore;
  end;
end;

procedure TfrmN26Main.wm_desktop(var Message: TMessage);
var
  i:integer;
  Form:TfrmBasic;
begin
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Form := FindChildForm(TfrmPosMain);
  if Form<>nil then Form.WindowState := wsMinimized;
  if Message.WParam=0 then
     begin
       RzBmpButton3Click(nil);
       Exit;
     end;
  IsXsm := (Message.LParam=1);
  if IsXsm then
     begin
       Application.MainForm.Visible := false;
       Application.Minimize;
     end;
  for i:=0 to actList.ActionCount -1 do
    begin
      if actList.Actions[i].Tag = Message.WParam then
         begin
           actList.Actions[i].OnExecute(nil);
           Exit;
         end;
    end;   
end;

procedure TfrmN26Main.WMQUERYENDSESSION(var msg: Tmessage);
begin
  SystemShutdown := true;
  if frmInstall<>nil then FreeAndNil(frmInstall);
  Factor.DisConnect;
  inherited;
end;

function TfrmN26Main.UpdateDbVersion: boolean;
var
  Factory:TCreateDbFactory;
begin
  result := true;
  Factory := TCreateDbFactory.Create;
  try
    if Factory.CheckVersion(DBVersion,Global.LocalFactory) then
       result := TfrmDbUpgrade.DbUpgrade(Factory,Global.LocalFactory);
  finally
    Factory.Free;
  end;
end;

procedure TfrmN26Main.Timer1Timer(Sender: TObject);
var
  P:PMsgInfo;
  w:integer;
  IsFirst:boolean;
begin
  inherited;
  w := StrtoIntDef(ShopGlobal.GetParameter('INTERVALTIME'),10)*60;
  if PrainpowerJudge.Locked>0 then Exit;
  if SystemShutdown then Exit;
  if not Logined then Exit;
  if not Visible then Exit;
  if not Factor.Connected then Exit;
  IsFirst := false;
  if (not MsgFactory.Loaded and (Timer1.Tag>5)) or (MsgFactory.Loaded and (Timer1.Tag>0) and
     (MsgFactory.UnRead=0) and ((Timer1.Tag mod w)=0)
     )
  then
     begin
       MsgFactory.Load;
       IsFirst := true;
     end;

  if Timer1.Tag >= w then Timer1.Tag := 0 else Timer1.Tag := Timer1.Tag + 1;
  if MsgFactory.Count > 0 then
     begin
       lblUserInfo.Caption := ShopGlobal.UserName + ' 您有('+inttostr(MsgFactory.UnRead)+')条消息';
       case Timer1.Tag mod 2 of
       0:begin
           lblUserInfo.Font.Color := clRed;
           lblUserInfo.Font.Style := [fsBold];
         end;
       1:begin
           lblUserInfo.Font.Color := clWhite;
           lblUserInfo.Font.Style := [];
         end;
       end;
     end
  else
     begin
       lblUserInfo.Caption := ShopGlobal.UserName + ' 您没有消息';
     end;
  if (MsgFactory.Loaded and ((Timer1.Tag mod w)=0)) or IsFirst or MsgFactory.Opened then
     begin
       P := MsgFactory.ReadMsg;
       if P<>nil then MsgFactory.HintMsg(P);
     end;
end;

procedure TfrmN26Main.LoadFrame;
var
  F:TIniFile;
begin
  inherited;
  F := TIniFile.Create(ExtractFilePath(ParamStr(0))+'r3.cfg');
  try
    Caption :=  F.ReadString('soft','name','rspcn.com')+' 版本:'+RzVersionInfo.FileVersion;
    if ShopGlobal.offline then
       Caption := Caption +'【脱机使用】门店：'+ Global.SHOP_NAME
    else
       Caption := Caption +'【联机使用】门店：'+ Global.SHOP_NAME;
    Application.Title :=  F.ReadString('soft','name','rspcn.com');
    RzLabel1.Caption := F.ReadString('soft','copyright','rspcn.com')+' | 使用单位:'+Global.TENANT_NAME;
    if not FindCmdLineSwitch('rsp',['-','+'],false) then
       begin
          SFVersion := F.ReadString('soft','SFVersion','.NET');
          CLVersion := F.ReadString('soft','CLVersion','.MKT');
          ProductID := F.ReadString('soft','ProductID','R3_RYC');
       end;
  finally
    try
      F.Free;
    except
    end;
  end;
  if FileExists(ExtractFilePath(ParamStr(0))+'logo_lt.jpg') then
    Image5.Picture.LoadFromFile(ExtractFilePath(ParamStr(0))+'logo_lt.jpg');
end;

procedure TfrmN26Main.SetLoging(const Value: boolean);
begin
  FLoging := Value;
end;

procedure TfrmN26Main.SetSystemShutdown(const Value: boolean);
begin
  FSystemShutdown := Value;
end;

procedure TfrmN26Main.InitVersioin;
begin

end;

procedure TfrmN26Main.N90Click(Sender: TObject);
var
  HWndCalculator : HWnd;
begin
  // 查找已存在的计算器窗口
  HWndCalculator :=FindWindow(nil, '计算器');
  if HWndCalculator <> 0 then SendMessage(HWndCalculator, WM_CLOSE, 0, 0);// close the exist Calculator
  ShellExecute(Handle,'open','calc.exe',nil,nil,SW_SHOW);

end;

procedure TfrmN26Main.UpdateTimerTimer(Sender: TObject);
begin
  inherited;
  Label2.Caption := '当前时间:'+formatDatetime('YYYY-MM-DD HH:NN:SS',now());
end;

procedure TfrmN26Main.RzBmpButton10Click(Sender: TObject);
begin
  inherited;
  TfrmPswModify.ShowExecute(Global.UserId,Global.UserName);

end;

procedure TfrmN26Main.LoadMenu(Sender:TObject);
function FindAction(cName:string):TAction;
var i:integer;
begin
  result := nil;
  for i:=0 to actList.ActionCount-1 do
    begin
      if (lowercase(actList.Actions[i].Name)=lowercase(cName)) and TAction(actList.Actions[i]).Enabled then
         begin
           result := TAction(actList.Actions[i]);
           break;
         end;
    end;
end;
function CheckRight(btn:TRzTabCollectionItem):boolean;
var
  rs:TZQuery;
  lvid:string;
begin
  result := false;
  rs := CA_MODULE;
  if not rs.Locate('MODU_ID',inttostr(btn.Tag),[]) then Exit;
  lvid := rs.FieldbyName('LEVEL_ID').AsString;
  rs.First;
  while not rs.Eof do
    begin
      if (copy(rs.FieldbyName('LEVEL_ID').AsString,1,length(lvid))=lvid) and (rs.FieldbyName('LEVEL_NUM').AsInteger =3) then
         begin
           if FindAction(rs.FieldbyName('ACTION_NAME').AsString)<>nil then
           begin
             result := true;
             Exit;
           end;
         end;
      rs.Next;
    end;
end;
procedure CreatePageButton(Id,Title:string);
var
  btn:TRzTabCollectionItem;
  w:widestring;
  i:integer;
begin
  btn := rzPage.Tabs.Add;
  btn.ImageIndex := 0;
  btn.Tag := StrtoInt(Id);
  btn.Caption := ' '+Title;
end;
procedure CreatePageMenu;
var
  i:integer;
begin
  rzPage.Tabs.Clear;
  CA_MODULE.First;
  while not CA_MODULE.Eof do
    begin
      if CA_MODULE.FieldbyName('LEVEL_NUM').AsInteger =1 then
      begin
        CreatePageButton(CA_MODULE.FieldbyName('MODU_ID').AsString,CA_MODULE.FieldbyName('MODU_NAME').AsString);
      end;
      CA_MODULE.Next;
    end;
  for i:=0 to rzPage.Tabs.Count -1 do
     begin
       CheckRight(rzPage.Tabs.Items[i]);
     end;
  if rzPage.Tabs.Count >0 then
     begin
       rzPage.TabIndex := 0;
       rzPage.OnChange(rzPage);
     end;
end;
var
  rs:TZQuery;
  g:TrzGroup;
  b:TrzGroupItem;
  i,r:integer;
  lvid:string;
begin
  for i:=RzGroupBar1.GroupCount -1 downto 0 do
    begin
      RzGroupBar1.RemoveGroup(RzGroupBar1.Groups[i]);
    end;
  if not CA_MODULE.Active then
     begin
       CA_MODULE.Filtered := false;
       CA_MODULE.Close;
       CA_MODULE.SQL.Text := ParseSQL(Factor.iDbType,'select MODU_ID,MODU_NAME,ACTION_NAME,len(LEVEL_ID)/3 as LEVEL_NUM,LEVEL_ID,ACTION_URL from CA_MODULE where PROD_ID='''+ProductID+''' and MODU_TYPE in (1,3) and COMM not in (''02'',''12'') order by LEVEL_ID');
       Factor.Open(CA_MODULE);
       CreatePageMenu;
     end;
  if Sender=nil then Exit;
  rs := CA_MODULE;
  try
  if not rs.Locate('MODU_ID',inttostr(TRzTabCollectionItem(Sender).Tag),[]) then Exit;
  lvid := rs.FieldbyName('LEVEL_ID').AsString;
  rs.First;
  while not rs.Eof do
    begin
      if (copy(rs.FieldbyName('LEVEL_ID').AsString,1,length(lvid))=lvid) and (rs.FieldbyName('LEVEL_NUM').AsInteger =2) then
         begin
           g := TrzGroup.Create(RzGroupBar1);
           g.Caption := rs.FieldbyName('MODU_NAME').AsString;
           g.CaptionColor := clWhite;
           g.Color := clWhite;
//           g.CaptionColor := $00E4D2AD;
           g.CaptionHeight := 35;
           g.DividerVisible := true;
           g.CaptionImageIndex := 0;
           RzGroupBar1.AddGroup(g);
           inc(r);
           // if r>3 then g.Close;
         end
      else
      if (copy(rs.FieldbyName('LEVEL_ID').AsString,1,length(lvid))=lvid) and (rs.FieldbyName('LEVEL_NUM').AsInteger =3) then
         begin
           if FindAction(rs.FieldbyName('ACTION_NAME').AsString)<>nil then
           begin
             b := g.Items.Add;
             b.OnClick := FindAction(rs.FieldbyName('ACTION_NAME').AsString).OnExecute;
             b.tag := strtoint(rs.FieldbyName('MODU_ID').asString);
             b.Caption := rs.FieldbyName('MODU_NAME').AsString;
             b.ImageIndex := 1;
           end;
         end;
      rs.Next;
    end;
  finally
  end;
  for i:=RzGroupBar1.GroupCount -1 downto 0 do
    begin
      if RzGroupBar1.Groups[i].Items.Count =0 then
         RzGroupBar1.RemoveGroup(RzGroupBar1.Groups[i]);
    end;
end;

procedure TfrmN26Main.RzBmpButton8Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmN26Main.RzTabChange(Sender: TObject);
begin
  inherited;
//  if rzLeft.Width = 33 then rzLeft.Width := 172;
//  if Logined then LoadMenu;
end;

procedure TfrmN26Main.Image19Click(Sender: TObject);
begin
  inherited;
  rzLeft.Visible := true;
  if rzLeft.Width <= 29 then
     begin
       rzLeft.Width := 172;
       Panel12.Width := 174;
       Panel24.Width := 166;
     end
  else
     begin
       rzLeft.Width := 29;
       Panel12.Width := 31;
       Panel24.Width := 23;
     end;

  frmMain.OnResize(nil);
end;

procedure TfrmN26Main.RzBmpButton9Click(Sender: TObject);
var i:integer;
  sN26Logined:boolean;
begin
  inherited;
  if FindChildForm(TfrmPosMain)<>nil then Raise Exception.Create('收款机模块没有退出不能切换用户...');
  if FList.Count > 0 then
     begin
       if ShowMsgBox('是否关闭当前打开的所有模块？','友情提示..',MB_YESNO+MB_ICONQUESTION)<>6 then Exit;
       for i:= FList.Count -1 downto 0 do
         TForm(TrzBmpButton(FList[i]).tag).free;
     end;
  if PrainpowerJudge.Locked>0 then
     begin
       ShowMsgBox('正在执行消息同步，请稍等切换用户..','友情提示..',MB_OK+MB_ICONINFORMATION);
     end;
  if FList.Count=0 then
     begin
       Logined := false;
       sN26Logined := N26Factory.Logined;
       try
         N26Factory.Logined := false;
         Logined := Login(false,false);
       finally
         N26Factory.Logined :=  sN26Logined;
       end;
     end;
end;

procedure TfrmN26Main.toolButtonClick(Sender: TObject);
begin
  inherited;
  frmDesk.ForeBringtoFront;
  rzLeft.Width := 147;
  frmDesk.OnResize(nil);
end;

procedure TfrmN26Main.DoConnectError(Sender: TObject);
begin

end;

function TfrmN26Main.GetDeskFlag: string;
begin

end;

procedure TfrmN26Main.InitTenant;
var
  Params:TftParamList;
begin
  Params := TftParamList.Create(nil);
  try
    frmLogo.Label1.Caption := '正在初始化默认数据...';
    frmLogo.Label1.Update;
    Params.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
    Factor.ExecProc('TTenantInit',Params);
    TfrmInitialRights.Rights(self);
  finally
    Params.Free;
  end;
end;
function TfrmN26Main.ConnectToDb:boolean;
var RspComVersion:string;
begin
  frmLogo.Show;
  try
    result := false;
    Global.MoveToLocal;
    Global.Connect;
  finally
    frmLogo.Close;
  end;
  if not UpdateDbVersion then
     begin
       result := false;
       Exit;
     end;
  result := TfrmTenant.coRegister(self);
  if result then LoadFrame;
  if result and CaFactory.Audited then result := CheckVersion;
  if not result then Exit;
  if result then
     begin
      Global.RemoteFactory.DisConnect;
      if CaFactory.Audited and (ShopGlobal.NetVersion or ShopGlobal.ONLVersion) then
         begin
           frmLogo.Show;
           try
             frmLogo.ShowTitle := '检测远程应用服务器...';
             Global.MoveToRemate;
             try
               if not Global.RemoteFactory.Connected then Global.Connect;
               CaFactory.Audited := true;
               with TCreateDbFactory.Create do
               begin
                 try
                    RspComVersion := Factor.ExecProc('TGetComVersion');
                    if CheckVersion(DBVersion,Global.RemoteFactory) or CompareVersion(ComVersion,RspComVersion) then
                    begin
                      if ShopGlobal.ONLVersion then
                         begin
                           ShowMsgBox('服务器的版本过旧，请联系管理员升级后台服务器..','友情提示...',MB_OK+MB_ICONINFORMATION);
                           result := false;
                           Exit;
                         end;
                      result := (ShowMsgBox('服务器的版本过旧，请联系管理员升级后台服务器，是否转脱机使用？','友情提示..',MB_YESNO+MB_ICONQUESTION)=6);
                      if result then
                         begin
                           Global.MoveToLocal;
                           Global.Connect;
                         end;
                    end;   
                 finally
                    free;
                 end;
               end;
             except
               if ShopGlobal.ONLVersion then
                  begin
                    if ShowMsgBox('连接数据库服务器失败,请检查网络是否正常,是否重新选择连接主机？','友情提示...',MB_YESNO+MB_ICONQUESTION)=6 then
                       TfrmHostDialog.HostDialog(self);
                    result := false;
                    Exit;
                  end;
               result := (ShowMsgBox('连接远程数据库失败,是否转脱机操作?','友情提示...',MB_YESNO+MB_ICONQUESTION)=6);
               if result then
                  begin
                    CaFactory.Audited := false;
                    Global.MoveToLocal;
                    Global.Connect;
                  end;
             end;
           finally
             frmLogo.Close;
           end;
         end
         else
           begin
              if not CaFactory.Audited then
                 begin
                    ShowMsgBox('连接认证服务器失败,系统转脱机使用','友情提示...',MB_OK+MB_ICONINFORMATION);
                    if (ShopGlobal.NetVersion or ShopGlobal.ONLVersion) then
                       begin
                         Global.MoveToLocal;
                         Global.Connect;
                       end;
                 end;
           end;
     end;
  try
    frmLogo.Show;
    try
     if CaFactory.Audited and not ShopGlobal.ONLVersion then
        begin
          if not Global.RemoteFactory.Connected and not ShopGlobal.NetVersion then
             begin
               frmLogo.Label1.Caption := '正在连接远程服务...';
               frmLogo.Label1.Update;
               Global.MoveToRemate;
               try
                 try
                   Global.Connect;
                 except
                   ShowMsgBox('连接远程服务器失败，系统无法同步到最新资料..','友情提示...',MB_OK+MB_ICONWARNING);
                 end;
               finally
                 Global.MoveToLocal;
               end;
             end;
          if CaFactory.Audited and CaFactory.CheckInitSync then CaFactory.SyncAll(1);
          if Global.RemoteFactory.Connected and SyncFactory.CheckDBVersion then
             begin
               if SyncFactory.CheckInitSync then SyncFactory.SyncBasic(true);
               InitTenant;
             end;
        end
     else
        begin
          if CaFactory.Audited and CaFactory.CheckInitSync then CaFactory.SyncAll(1);
          if CaFactory.Audited and Global.RemoteFactory.Connected then //管理什么版本，有连接到服务器时，必须先同步数据
             begin
               if ShopGlobal.ONLVersion then //在线版只需同步注册数据
                  begin
                    if Global.RemoteFactory.ConnString<>Global.LocalFactory.ConnString then //调试模式时，不同步
                    begin
                      SyncFactory.SyncTimeStamp := CaFactory.TimeStamp;
                      SyncFactory.SyncComm := SyncFactory.CheckRemeteData;
                      SyncFactory.SyncSingleTable('SYS_DEFINE','TENANT_ID;DEFINE','TSyncSysDefine',0);
                      SyncFactory.SyncSingleTable('CA_SHOP_INFO','TENANT_ID;SHOP_ID','TSyncSingleTable',0);
                      SyncFactory.SyncSingleTable('ACC_ACCOUNT_INFO','TENANT_ID;ACCOUNT_ID','TSyncAccountInfo',0);
                    end;
                  end
               else
                  begin
                    if SyncFactory.CheckInitSync then SyncFactory.SyncBasic(true);
                  end;
             end;
          InitTenant;
        end;
    finally
      frmLogo.Close;
    end;
  except
    on E:Exception do
      begin
        ShowMsgBox(pchar(E.Message),'友情提示...',MB_OK+MB_ICONERROR);
        result := false;
      end;
  end;
end;

procedure TfrmN26Main.actfrmMeaUnitsExecute(Sender: TObject);
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
//  Application.Restore;
  frmN26Desk.SaveToFront;
  with TfrmMeaUnits.Create(self) do
    begin
      try
        ShowModal;
      finally
        free;
      end;
    end;

end;

procedure TfrmN26Main.actfrmDutyInfoListExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
//  if ShopGlobal.offline then Raise Exception.Create('暂不支持离线使用,开发中,请多关注...');
//  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmDutyInfoList);
  if not Assigned(Form) then
     begin
       Form := TfrmDutyInfoList.Create(self);
       AddFrom(Form);
     end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmRoleInfoListExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
//  if ShopGlobal.offline then Raise Exception.Create('暂不支持离线使用,开发中,请多关注...');
//  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmRoleInfoList);
  if not Assigned(Form) then
     begin
       Form := TfrmRoleInfoList.Create(self);
       AddFrom(Form);
     end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmDeptInfoListExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
//  if ShopGlobal.offline then Raise Exception.Create('暂不支持离线使用,开发中,请多关注...');
//  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmDeptInfoList);
  if not Assigned(Form) then
     begin
       Form := TfrmDeptInfoList.Create(self);
       AddFrom(Form);
     end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmUsersExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
//  if ShopGlobal.offline then Raise Exception.Create('暂不支持离线使用,开发中,请多关注...');
//  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmUsers);
  if not Assigned(Form) then
     begin
       Form := TfrmUsers.Create(self);
       AddFrom(Form);
     end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmBrandInfoExecute(Sender: TObject);
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
//  Application.Restore;
  frmN26Desk.SaveToFront;
  TfrmGoodsSort.ShowDialog(self,4);
end;

procedure TfrmN26Main.actfrmStockOrderListExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
//  if ShopGlobal.offline then Raise Exception.Create('暂不支持离线使用,开发中,请多关注...');
//  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmStockOrderList);
  if not Assigned(Form) then
     begin
       Form := TfrmStockOrderList.Create(self);
       AddFrom(Form);
//       if ShopGlobal.GetChkRight('400020') then TfrmStockOrderList(Form).actNew.OnExecute(nil);
     end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmSalesOrderListExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
//  if ShopGlobal.offline then Raise Exception.Create('暂不支持离线使用,开发中,请多关注...');
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmSalesOrderList);
  if not Assigned(Form) then
     begin
       Form := TfrmSalesOrderList.Create(self);
       AddFrom(Form);
//       if ShopGlobal.GetChkRight('400020') then TfrmSalesOrderList(Form).actNew.OnExecute(nil);
     end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmChangeOrderList1Execute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm('frmChangeOrderList1');
  if not Assigned(Form) then
     begin
       Form := TfrmChangeOrderList.Create(self);
       TfrmChangeOrderList(Form).CodeId := '1';
       TfrmChangeOrderList(Form).Name := 'frmChangeOrderList1';
       AddFrom(Form);
//       if ShopGlobal.GetChkRight('600029') then TfrmChangeOrderList(Form).actNew.OnExecute(nil);
     end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmChangeOrderList2Execute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm('frmChangeOrderList2');
  if not Assigned(Form) then
     begin
       Form := TfrmChangeOrderList.Create(self);
       TfrmChangeOrderList(Form).CodeId := '2';
       TfrmChangeOrderList(Form).Name := 'frmChangeOrderList2';
       AddFrom(Form);
       if ShopGlobal.GetChkRight('600029') then TfrmChangeOrderList(Form).actNew.OnExecute(nil);
     end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmGoodsInfoListExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
//  if ShopGlobal.offline then Raise Exception.Create('暂不支持离线使用,开发中,请多关注...');
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmGoodsInfoList);
  if not Assigned(Form) then
     begin
       Form := TfrmGoodsInfoList.Create(self);
       AddFrom(Form);
     end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmGoodsSortExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  if TfrmGoodsSortTree.ShowDialog(self,1) then
  begin
    Form:=FindChildForm(TfrmGoodsInfoList);
    if Form<>nil then
      TfrmGoodsInfoList(Form).LoadTree;
  end;
end;

procedure TfrmN26Main.actfrmCodeInfo3Execute(Sender: TObject);
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  TfrmCodeInfo.ShowDialog(self,3);
end;

procedure TfrmN26Main.actfrmSortInfoExecute(Sender: TObject);
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  TfrmGoodsSort.ShowDialog(self,2);
end;

procedure TfrmN26Main.actfrmImplInfoExecute(Sender: TObject);
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  TfrmGoodsSort.ShowDialog(self,5);
end;

procedure TfrmN26Main.actfrmAreaInfoExecute(Sender: TObject);
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  TfrmGoodsSort.ShowDialog(self,6);
end;

procedure TfrmN26Main.actfrmSaleStyleExecute(Sender: TObject);
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  TfrmCodeInfo.ShowDialog(self,2);
end;

procedure TfrmN26Main.actfrmSettleCodeExecute(Sender: TObject);
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  TfrmCodeInfo.ShowDialog(self,6);
end;

procedure TfrmN26Main.actfrmShopGroupExecute(Sender: TObject);
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  TfrmCodeInfo.ShowDialog(self,12);
end;

procedure TfrmN26Main.actfrmRecvOrderListExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
//  if ShopGlobal.offline then Raise Exception.Create('暂不支持离线使用,开发中,请多关注...');
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmRecvOrderList);
  if not Assigned(Form) then
     begin
       Form := TfrmRecvOrderList.Create(self);
       AddFrom(Form);
     end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmPayOrderListExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
//  if ShopGlobal.offline then Raise Exception.Create('暂不支持离线使用,开发中,请多关注...');
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmPayOrderList);
  if not Assigned(Form) then
     begin
       Form := TfrmPayOrderList.Create(self);
       AddFrom(Form);
     end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmClientExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
//  if ShopGlobal.offline then Raise Exception.Create('暂不支持离线使用,开发中,请多关注...');
// Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmClient);
  if not Assigned(Form) then
     begin
       Form := TfrmClient.Create(self);
       AddFrom(Form);
     end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmSupplierExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
//  if ShopGlobal.offline then Raise Exception.Create('暂不支持离线使用,开发中,请多关注...');
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmSupplier);
  if not Assigned(Form) then
     begin
       Form := TfrmSupplier.Create(self);
       AddFrom(Form);
     end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmSalRetuOrderListExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
//  if ShopGlobal.offline then Raise Exception.Create('暂不支持离线使用,开发中,请多关注...');
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmSalRetuOrderList);
  if not Assigned(Form) then
     begin
       Form := TfrmSalRetuOrderList.Create(self);
       AddFrom(Form);
     end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmStkRetuOrderListExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
//  if ShopGlobal.offline then Raise Exception.Create('暂不支持离线使用,开发中,请多关注...');
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmStkRetuOrderList);
  if not Assigned(Form) then
     begin
       Form := TfrmStkRetuOrderList.Create(self);
       AddFrom(Form);
     end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmPosMainExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmPosMain);
  if not Assigned(Form) then
     begin
       Form := TfrmPosMain.Create(self);
       AddFrom(Form);
     end;
  Form.WindowState := wsNormal;
  Form.Show;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmPriceGradeInfoExecute(Sender: TObject);
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  TfrmPriceGradeInfo.ShowDialog(self);

end;

procedure TfrmN26Main.actfrmSalIndentOrderListExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmSalIndentOrderList);
  if not Assigned(Form) then
     begin
       Form := TfrmSalIndentOrderList.Create(self);
       AddFrom(Form);
     end;
  Form.Show;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmStkIndentOrderListExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmStkIndentOrderList);
  if not Assigned(Form) then
     begin
       Form := TfrmStkIndentOrderList.Create(self);
       AddFrom(Form);
     end;
  Form.Show;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmSalInvoiceListExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if ShopGlobal.offline then Raise Exception.Create('此功能不能脱机操作。。。');
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmSalInvoiceList);
  if not Assigned(Form) then
     begin
       Form := TfrmSalInvoiceList.Create(self);
       AddFrom(Form);
     end;
  Form.Show;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmCustomerExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmCustomer);
  if not Assigned(Form) then
     begin
       Form := TfrmCustomer.Create(self);
       AddFrom(Form);
     end;
  if not Application.MainForm.Visible then
     begin
       Form.FormStyle :=  fsNormal;
       Form.Width := 800;
       Form.Height := 575;
       Form.WindowState := wsNormal;
     end
  else
  if Application.MainForm.Visible and (Form.FormStyle = fsNormal) then
     begin
       Form.FormStyle :=  fsMDIChild;
       Form.WindowState := wsMaximized;
     end;
  Form.Show;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmCostCalcExecute(Sender: TObject);
begin
  inherited;
{  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  TfrmCostCalc.StartCalc(self); }
end;

procedure TfrmN26Main.actfrmSysDefineExecute(Sender: TObject);
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  with TfrmSysDefine.Create(self) do
    begin
      try
        ShowModal;
      finally
        free;
      end;
    end;
end;

procedure TfrmN26Main.actfrmDaysCloseExecute(Sender: TObject);
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  TfrmCostCalc.StartDayReck(self);
end;

procedure TfrmN26Main.actfrmMonthCloseExecute(Sender: TObject);
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  TfrmCostCalc.StartMonthReck(self);

end;

procedure TfrmN26Main.actfrmCloseForDayExecute(Sender: TObject);
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  if TfrmCloseForDay.ShowClDy(self)=2 then ;// ShowMsgBox('当天没有营业数据，不需要结账','友情提示...',MB_OK+MB_ICONINFORMATION);
end;

procedure TfrmN26Main.actfrmPriceOrderListExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmPriceOrderList);
  if not Assigned(Form) then
     begin
       Form := TfrmPriceOrderList.Create(self);
       AddFrom(Form);
     end;
  Form.Show;
  Form.BringToFront;

end;

procedure TfrmN26Main.actfrmCheckOrderListExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmCheckOrderList);
  if not Assigned(Form) then
     begin
       Form := TfrmCheckOrderList.Create(self);
       AddFrom(Form);
     end;
  // Add 
  TfrmCheckOrderList(Form).DoCheckPrint:=actfrmChecktablePrintExecute;     
  Form.Show;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmDbOrderListExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmDbOrderList);
  if not Assigned(Form) then
     begin
       Form := TfrmDbOrderList.Create(self);
       AddFrom(Form);
     end;
  Form.Show;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmShopInfoListExecute(Sender: TObject);
var
  Form:TfrmBasic;
  AObj:TRecord_;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  if SFVersion='.LCL' then
     begin
       AObj := TRecord_.Create;
       try
         TfrmShopInfo.EditDialog(self,Global.SHOP_ID,Aobj);
       finally
         AObj.Free;
       end;
     end
  else
     begin
        Form := FindChildForm(TfrmShopInfoList);
        if not Assigned(Form) then
           begin
             Form := TfrmShopInfoList.Create(self);
             AddFrom(Form);
           end;
        Form.Show;
        Form.BringToFront;
     end;
end;

procedure TfrmN26Main.actfrmAccountExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmAccount);
  if not Assigned(Form) then
     begin
       Form := TfrmAccount.Create(self);
       AddFrom(Form);
     end;
  Form.Show;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmTransOrderListExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmTransOrderList);
  if not Assigned(Form) then
     begin
       Form := TfrmTransOrderList.Create(self);
       AddFrom(Form);
     end;
  Form.Show;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmDevFactoryExecute(Sender: TObject);
begin
  inherited;
  with TfrmDevFactory.Create(self) do
    begin
      try
        ShowModal;
      finally
        free;
      end;
    end;
end;

procedure TfrmN26Main.actfrmIoroOrderList1Execute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm('frmIoroOrderList1');
  if not Assigned(Form) then
     begin
       Form := TfrmIoroOrderList.Create(self);
       TfrmIoroOrderList(Form).IoroType := 1;
       TfrmIoroOrderList(Form).Name := 'frmIoroOrderList1';
       AddFrom(Form);
//       if ShopGlobal.GetChkRight('600029') then TfrmChangeOrderList(Form).actNew.OnExecute(nil);
     end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmIoroOrderList2Execute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm('frmIoroOrderList2');
  if not Assigned(Form) then
     begin
       Form := TfrmIoroOrderList.Create(self);
       TfrmIoroOrderList(Form).IoroType := 2;
       TfrmIoroOrderList(Form).Name := 'frmIoroOrderList2';
       AddFrom(Form);
//       if ShopGlobal.GetChkRight('600029') then TfrmChangeOrderList(Form).actNew.OnExecute(nil);
     end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmCheckTablePrintExecute(Sender: TObject);
var
  Form:TfrmBasic;
begin
  inherited;
  if not Logined then
  begin
    PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
    Exit;
  end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmCheckTablePrint);
  if not Assigned(Form) then
  begin
    Form := TfrmCheckTablePrint.Create(self);
    AddFrom(Form);
  end;
  if Sender is TRecord_ then
    TfrmCheckTablePrint(Form).DoOpenDefaultData(TRecord_(Sender));
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmRckMngExecute(Sender: TObject);
var
  Form:TfrmBasic;
begin
  inherited;
  if not Logined then
  begin
    PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
    Exit;
  end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmRckMng);
  if not Assigned(Form) then
  begin
    Form := TfrmRckMng.Create(self);
    AddFrom(Form);
  end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmJxcTotalReportExecute(Sender: TObject);
var
  Form:TfrmBasic;
begin
  inherited;
  if not Logined then
  begin
    PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
    Exit;
  end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmJxcTotalReport);
  if not Assigned(Form) then
  begin
    Form := TfrmJxcTotalReport.Create(self);
    AddFrom(Form);
  end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmStockDayReportExecute(Sender: TObject);
var
  Form:TfrmBasic;
begin
  inherited;
  if not Logined then
  begin
    PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
    Exit;
  end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmStockDayReport);
  if not Assigned(Form) then
  begin
    Form := TfrmStockDayReport.Create(self);
    AddFrom(Form);
  end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmSaleDayReportExecute(Sender: TObject);
var
  Form:TfrmBasic;
begin
  inherited;
  if not Logined then
  begin
    PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
    Exit;
  end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmSaleDayReport);
  if not Assigned(Form) then
  begin
    Form := TfrmSaleDayReport.Create(self);
    AddFrom(Form);
  end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmChange1DayReportExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm('frmChange1DayReport');
  if not Assigned(Form) then
     begin
       Form := TfrmChangeDayReport.Create(self);
       TfrmChangeDayReport(Form).CodeId := '1';
       TfrmChangeDayReport(Form).Name := 'frmChange1DayReport';
       AddFrom(Form);
//       if ShopGlobal.GetChkRight('600029') then TfrmChangeOrderList(Form).actNew.OnExecute(nil);
     end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmChange2DayReportExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm('frmChange2DayReport');
  if not Assigned(Form) then
     begin
       Form := TfrmChangeDayReport.Create(self);
       TfrmChangeDayReport(Form).CodeId := '2';
       TfrmChangeDayReport(Form).Name := 'frmChange2DayReport';
       AddFrom(Form);
//       if ShopGlobal.GetChkRight('600029') then TfrmChangeOrderList(Form).actNew.OnExecute(nil);
     end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmLockScreenExecute(Sender: TObject);
begin
  inherited;
  frmN26Desk.HookLocked := true;
  try
    Login(true);
  finally
    frmN26Desk.HookLocked := false;
  end;

end;

procedure TfrmN26Main.actfrmStorageDayReportExecute(Sender: TObject);
var
  Form:TfrmBasic;
begin
  inherited;
  if not Logined then
  begin
    PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
    Exit;
  end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmStorageDayReport);
  if not Assigned(Form) then
  begin
    Form := TfrmStorageDayReport.Create(self);
    AddFrom(Form);
  end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmRckDayReportExecute(Sender: TObject);
var
  Form:TfrmBasic;
begin
  inherited;
  if not Logined then
  begin
    PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
    Exit;
  end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmRckDayReport);
  if not Assigned(Form) then
  begin
    Form := TfrmRckDayReport.Create(self);
    AddFrom(Form);
  end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmRelationExecute(Sender: TObject);
var
  Form:TfrmBasic;
begin
  inherited;
  if not Logined then
  begin
    PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
    Exit;
  end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmRelation);
  if not Assigned(Form) then
  begin
    Form := TfrmRelation.Create(self);
    AddFrom(Form);
  end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.RzBmpButton3Click(Sender: TObject);
begin
  inherited;
  leftVisible := true;
  case deskFlag of
  1:begin
       rzLeft.Width := 29;
       Panel12.Width := 31;
       Panel24.Width := 23;
    end;
  0:begin
       if rzLeft.Width = 29 then rzLeft.Width := 172;
       if Panel12.Width = 31 then Panel12.Width := 174;
       if Panel24.Width = 23 then Panel24.Width := 166;
    end;
  end;
  frmMain.OnResize(nil);
  frmN26Desk.Locked := true;
  frmN26Desk.BringToFront;
end;

procedure TfrmN26Main.actfrmRecvDayReportExecute(Sender: TObject);
var
  Form:TfrmBasic;
begin
  inherited;
  if not Logined then
  begin
    PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
    Exit;
  end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmRecvDayReport);
  if not Assigned(Form) then
  begin
    Form := TfrmRecvDayReport.Create(self);
    AddFrom(Form);
  end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmPayDayReportExecute(Sender: TObject);
var
  Form:TfrmBasic;
begin
  inherited;
  if not Logined then
  begin
    PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
    Exit;
  end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmPayDayReport);
  if not Assigned(Form) then
  begin
    Form := TfrmPayDayReport.Create(self);
    AddFrom(Form);
  end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmRecvAbleReportExecute(Sender: TObject);
var
  Form:TfrmBasic;
begin
  inherited;
  if not Logined then
  begin
    PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
    Exit;
  end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmRecvAbleReport);
  if not Assigned(Form) then
  begin
    Form := TfrmRecvAbleReport.Create(self);
    AddFrom(Form);
  end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmPayAbleReportExecute(Sender: TObject);
var
  Form:TfrmBasic;
begin
  inherited;
  if not Logined then
  begin
    PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
    Exit;
  end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmPayAbleReport);
  if not Assigned(Form) then
  begin
    Form := TfrmPayAbleReport.Create(self);
    AddFrom(Form);
  end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmStorageTrackingExecute(Sender: TObject);
var
  Form:TfrmBasic;
begin
  inherited;
  if not Logined then
  begin
    PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
    Exit;
  end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmStorageTracking);
  if not Assigned(Form) then
  begin
    Form := TfrmStorageTracking.Create(self);
    AddFrom(Form);
  end;
  if not Application.MainForm.Visible then
     begin
       Form.FormStyle :=  fsNormal;
       Form.Width := 934;
       Form.Height := 575;
       Form.WindowState := wsNormal;
     end
  else
  if Application.MainForm.Visible and (Form.FormStyle = fsNormal) then
     begin
       Form.FormStyle :=  fsMDIChild;
       Form.WindowState := wsMaximized;
     end;
  Form.Show;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmDbDayReportExecute(Sender: TObject);
var
  Form:TfrmBasic;
begin
  inherited;
  if not Logined then
  begin
    PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
    Exit;
  end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmDbDayReport);
  if not Assigned(Form) then
  begin
    Form := TfrmDbDayReport.Create(self);
    AddFrom(Form);
  end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmGodsRunningReportExecute(Sender: TObject);
var
  Form:TfrmBasic;
begin
  inherited;
  if not Logined then
  begin
    PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
    Exit;
  end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmGodsRunningReport);
  if not Assigned(Form) then
  begin
    Form := TfrmGodsRunningReport.Create(self);
    AddFrom(Form);
  end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.RzBmpButton13Click(Sender: TObject);
begin
  inherited;
  if not ShopGlobal.GetChkRight('14100001',5) then Raise Exception.Create('你没有到货确认权限,请和管理员联系.');
  actfrmDownIndeOrder.Execute;
end;

procedure TfrmN26Main.RzBmpButton2Click(Sender: TObject);
begin
  inherited;
  if not ShopGlobal.GetChkRight('11200001',2) then Raise Exception.Create('你没有到货确认权限,请和管理员联系.');
  actfrmDownIndeOrder.OnExecute(actfrmDownIndeOrder);
end;

procedure TfrmN26Main.tlbCloseClick(Sender: TObject);
var
  i:integer;
begin
  for i:=0 to FList.Count -1 do
    begin
      if TrzBmpButton(FList[i]).Down and (TrzBmpButton(FList[i]).Tag>0) then
         begin
           TfrmBasic(TrzBmpButton(FList[i]).Tag).Close;
           break;
         end;
    end;
end;

procedure TfrmN26Main.N103Click(Sender: TObject);
begin
  inherited;
  self.Cascade;
end;

procedure TfrmN26Main.actfrmIoroDayReportExecute(Sender: TObject);
var
  Form:TfrmBasic;
begin
  inherited;
  if not Logined then
  begin
    PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
    Exit;
  end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmIoroDayReport);
  if not Assigned(Form) then
  begin
    Form := TfrmIoroDayReport.Create(self);
    AddFrom(Form);
  end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmMessageExecute(Sender: TObject);
var
  Form:TfrmBasic;
begin
  inherited;
  if not Logined then
  begin
    PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
    Exit;
  end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmMessage);
  if not Assigned(Form) then
  begin
    Form := TfrmMessage.Create(self);
    AddFrom(Form);
  end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmNewPaperReaderExecute(Sender: TObject);
var
  Form:TfrmBasic;
begin
  inherited;
  if not Logined then
  begin
    PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
    Exit;
  end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  TfrmNewPaperReader.ShowNewsPaper('');
end;

procedure TfrmN26Main.WriteAction(s: string;flag:integer);
var
  F:TIniFile;
begin
  F := TIniFile.Create(ExtractFilePath(ParamStr(0))+'sft.'+Global.UserID);
  try
    if flag=0 then
       F.WriteInteger('MenuMoudle',s,F.ReadInteger('Menu',s,0)+1)
    else
       F.WriteInteger('MenuReport',s,F.ReadInteger('Menu',s,0)+1);
  finally
    try
      F.Free;
    except
    end;
  end;
end;

procedure TfrmN26Main.actfrmQuestionnaireExecute(Sender: TObject);
var
  Form:TfrmBasic;
begin
  inherited;
  if not Logined then
  begin
    PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
    Exit;
  end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  TfrmQuestionnaire.ShowForm(self);
end;

procedure TfrmN26Main.LoadPic32;
begin
    sflag := 's1_';
    //logo
    //Image5.Picture.Graphic  := GetJpeg(sflag+'logo_lt');
    Image6.Picture.Graphic  := rcFactory.GetJpeg(sflag+'logo_bg');
    Image20.Picture.Graphic  := rcFactory.GetJpeg(sflag+'logo_r1');
    Image17.Picture.Graphic  := rcFactory.GetJpeg(sflag+'logo_r2');
    Image8.Picture.Graphic  := rcFactory.GetJpeg(sflag+'logo_r3');
    Image7.Picture.Graphic  := rcFactory.GetJpeg(sflag+'logo_r4');
    
    Image14.Picture.Graphic  := rcFactory.GetJpeg(sflag+'menu_title');

    Image11.Picture.Graphic  := rcFactory.GetJpeg(sflag+'tool_01');
    Image10.Picture.Graphic  := rcFactory.GetJpeg(sflag+'tool_02');
    Image16.Picture.Graphic  := rcFactory.GetJpeg(sflag+'tool_03');
    Image27.Picture.Graphic  := rcFactory.GetJpeg(sflag+'tool_04');
    Image21.Picture.Graphic  := rcFactory.GetJpeg(sflag+'tool_05');

    Image19.Picture.Graphic  := rcFactory.GetJpeg(sflag+'split');

    Image22.Picture.Graphic  := rcFactory.GetJpeg(sflag+'foot_1');
    Image15.Picture.Graphic  := rcFactory.GetJpeg(sflag+'foot_2');
    Image23.Picture.Graphic  := rcFactory.GetJpeg(sflag+'foot_3');
    Image24.Picture.Graphic  := rcFactory.GetJpeg(sflag+'foot_4');
    Image25.Picture.Graphic  := rcFactory.GetJpeg(sflag+'foot_bg');


    toolButton.Bitmaps.Up := rcFactory.GetBitmap(sflag+'toolbutton');
    toolButton.Bitmaps.Down := rcFactory.GetBitmap(sflag+'toolbutton_hot');
    RzBmpButton3.Bitmaps.Up := rcFactory.GetBitmap(sflag+'desktop');
    RzBmpButton3.Bitmaps.Hot := rcFactory.GetBitmap(sflag+'desktop_hot');

    RzBmpButton10.Bitmaps.Up := rcFactory.GetBitmap(sflag+'password');
    RzBmpButton10.Bitmaps.Hot := rcFactory.GetBitmap(sflag+'password_hot');
    RzBmpButton9.Bitmaps.Up := rcFactory.GetBitmap(sflag+'logout');
    RzBmpButton9.Bitmaps.Hot := rcFactory.GetBitmap(sflag+'logout_hot');
    RzBmpButton8.Bitmaps.Up := rcFactory.GetBitmap(sflag+'exit');
    RzBmpButton8.Bitmaps.Hot := rcFactory.GetBitmap(sflag+'exit_hot');

    RzBmpButton6.Bitmaps.Up := rcFactory.GetBitmap(sflag+'home');
    RzBmpButton6.Bitmaps.Hot := rcFactory.GetBitmap(sflag+'home_hot');
//    if N26Factory.Checked=0 then
//       begin
//         RzBmpButton1.Bitmaps.Up := rcFactory.GetBitmap(sflag+'xsm');
//         RzBmpButton1.Bitmaps.Hot := rcFactory.GetBitmap(sflag+'xsm_hot');
//       end
//    else
       begin
         RzBmpButton1.Bitmaps.Up := rcFactory.GetBitmap(sflag+'fit');
         RzBmpButton1.Bitmaps.Hot := rcFactory.GetBitmap(sflag+'fit_hot');
       end;
    RzBmpButton2.Bitmaps.Up := rcFactory.GetBitmap(sflag+'down');
    RzBmpButton2.Bitmaps.Hot := rcFactory.GetBitmap(sflag+'down_hot');
    RzBmpButton4.Bitmaps.Up := rcFactory.GetBitmap(sflag+'upload');
    RzBmpButton4.Bitmaps.Hot := rcFactory.GetBitmap(sflag+'upload_hot');
//    RzBmpButton5.Bitmaps.Up := rcFactory.GetBitmap(sflag+'help');
//    RzBmpButton5.Bitmaps.Hot := rcFactory.GetBitmap(sflag+'help_hot');

end;

procedure TfrmN26Main.RzBmpButton11Click(Sender: TObject);
var
  s:string;
  Form:TfrmBasic;
  sl:TStringList;
  Action:TAction;
begin
  inherited;
  ShellExecute(handle,'open',' http://58.222.222.46/ebp',nil,nil,0);
  Exit;
  if not CaFactory.Audited then Raise Exception.Create('不支持脱机使用..');
  if N26Factory.Checked=0 then
     begin
       if not CA_MODULE.Locate('MODU_NAME','信息互动',[]) then Raise Exception.Create('你没有开通信息互动功能');
     end
  else
     begin
       if not CA_MODULE.Locate('MODU_NAME','信息互动',[]) then Raise Exception.Create('你没有开通信息互动功能');
     end;
  if CA_MODULE.FieldByName('ACTION_NAME').AsString='actfrmN26Net' then
     begin
        if not ShopGlobal.GetChkRight(CA_MODULE.FieldByName('MODU_ID').AsString) then Raise Exception.Create('你没有操作此模块的权限。');
        s := CA_MODULE.FieldbyName('ACTION_URL').AsString;
        delete(s,1,4);
        delete(s,length(s),1);
        if not Logined then
           begin
             PostMessage(frmMain.Handle,WM_LOGIN_REQUEST,0,0);
             Exit;
           end;
        Application.Restore;
        frmN26Desk.SaveToFront;
        Form := FindChildForm(TfrmN26Browser);
        if not Assigned(Form) then
           begin
             Form := TfrmN26Browser.Create(self);
             Form.Caption := CA_MODULE.FieldbyName('MODU_NAME').asString;
             AddFrom(Form);
             if not TfrmN26Browser(Form).DoLogin then Exit;
           end;
        sl := TStringList.Create;
        try
          Form.Caption := CA_MODULE.FieldbyName('MODU_NAME').asString;
          sl.CommaText := s;
          TfrmN26Browser(Form).OpenUrl(TfrmN26Browser(Form).EncodeUrl(sl.values['url']));
          Form.SetFocus;
          DoActiveChange(Form);
        except
          sl.free;
          Raise;
        end;
    end
  else
    begin
       Action := FindAction(CA_MODULE.FieldByName('ACTION_NAME').AsString);
       if Action=nil then Exit;
       if not Action.Enabled then Raise Exception.Create('你没有操作此模块的权限');
       Action.OnExecute(Action); 
    end;
end;

procedure TfrmN26Main.RzBmpButton12Click(Sender: TObject);
begin
  inherited;
  Close;

end;

procedure TfrmN26Main.RzBmpButton7Click(Sender: TObject);
begin
  inherited;
  actfrmCustomer.OnExecute(actfrmCustomer);
end;

procedure TfrmN26Main.RzBmpButton14Click(Sender: TObject);
begin
  inherited;
  actfrmQuestionnaire.OnExecute(actfrmQuestionnaire);
end;

procedure TfrmN26Main.RzBmpButton15Click(Sender: TObject);
begin
  inherited;
  actfrmMessage.OnExecute(actfrmMessage);
end;

procedure TfrmN26Main.sDeskPageClick(Sender: TObject);
begin
  inherited;
  RzBmpButton3Click(nil);
end;

procedure TfrmN26Main.RzBmpButton6Click(Sender: TObject);
begin
  inherited;
  ShowMsgBox('谢谢你的关注，网站正在更新中...','友情提示..',MB_OK+MB_ICONINFORMATION);
end;

procedure TfrmN26Main.actfrmInLocusOrderListExecute(Sender: TObject);
var
  Form:TfrmBasic;
begin
  inherited;
  if not Logined then
  begin
    PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
    Exit;
  end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmInLocusOrderList);
  if not Assigned(Form) then
  begin
    Form := TfrmInLocusOrderList.Create(self);
    AddFrom(Form);
  end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmOutLocusOrderListExecute(Sender: TObject);
var
  Form:TfrmBasic;
begin
  inherited;
  if not Logined then
  begin
    PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
    Exit;
  end;
 // Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmOutLocusOrderList);
  if not Assigned(Form) then
  begin
    Form := TfrmOutLocusOrderList.Create(self);
    AddFrom(Form);
  end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.SortPageButton;
var
  i,n:integer;
begin
  n := 0;
  for i:=PageList.Count -1 downto 0 do
    begin
      if not TRzBmpButton(PageList[i]).Visible then
         PageList.Delete(i); 
    end;
  for i:=0 to PageList.Count -1 do
    begin
      if i=0 then
         TRzBmpButton(PageList[i]).Top := 1
      else
         TRzBmpButton(PageList[i]).Top := TRzBmpButton(PageList[i-1]).top + TRzBmpButton(PageList[i-1]).height + 1;
      inc(n);
    end;
end;

procedure TfrmN26Main.lblUserInfoClick(Sender: TObject);
begin
  inherited;
  actfrmNewPaperReader.OnExecute(nil);
end;

procedure TfrmN26Main.actfrmDownIndeOrderExecute(Sender: TObject);
var
  vData: OleVariant;
  Aobj: TRecord_;
  Form: TfrmBasic;
  SaveFactor:TdbFactory;
begin
  inherited;
  if not Logined then
  begin
    PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
    Exit;
  end;
  if not Global.RemoteFactory.Connected then 
     begin
       if ShowMsgBox('当前连接已经断开，是否尝试连接远程服务器？','友情提示..',MB_YESNO+MB_ICONQUESTION)<>6 then Exit;
       SaveFactor := uGlobal.Factor;
       try
         Global.MoveToRemate;
         try
           Global.Connect;
         except
           ShowMsgBox('无法连接到远程服务器，请检查网络是否正常','友情提示...',MB_OK+MB_ICONINFORMATION);
           Exit;
         end;
       finally
         uGlobal.Factor := SaveFactor;
       end;
     end;

  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmDownStockOrder);
  if (Form<>nil) and TfrmDownStockOrder(Form).Xsm and not Application.MainForm.Visible then
     begin
       Form.Show;
       Form.WindowState := wsNormal;
       Form.BringToFront;
       Exit;
     end;
  if (Form<>nil) then Form.Free;
  if not Application.MainForm.Visible then
     begin
       TfrmDownStockOrder.XsmShow;
       Exit;
     end;
  try
    Aobj:=TRecord_.Create;
    if TfrmDownStockOrder.DownStockOrder(AObj,vData) then
    begin
      if trim(AObj.fieldbyName('INDE_ID').AsString)<>'' then
      begin
        //Application.Restore;
        frmN26Desk.SaveToFront;
        Form := FindChildForm(TfrmStockOrderList);
        if not Assigned(Form) then
        begin
          Form := TfrmStockOrderList.Create(self);
          AddFrom(Form);
        end;
        TfrmStockOrderList(Form).DoIndeOrderWriteToStock(Aobj,vData);
        Form.WindowState := wsMaximized;
        Form.BringToFront;
      end;
    end;
  finally
    Aobj.Free;
  end;
  
end;

procedure TfrmN26Main.actfrmRecvForDayExecute(Sender: TObject);
var
  Form:TfrmBasic;
begin
  inherited;
  if not Logined then
  begin
    PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
    Exit;
  end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmRecvPosList);
  if not Assigned(Form) then
  begin
    Form := TfrmRecvPosList.Create(self);
    AddFrom(Form);
  end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.rzUserInfoClick(Sender: TObject);
begin
  inherited;
  actfrmNewPaperReader.OnExecute(nil);
end;

procedure TfrmN26Main.actfrmImpeachExecute(Sender: TObject);
begin
  inherited;
  TfrmImpeach.ShowImpeach(self); 
end;

procedure TfrmN26Main.actfrmClearDataExecute(Sender: TObject);
begin
  inherited;
  TfrmClearData.DeleteDB(self);

end;

function TfrmN26Main.ConnectToRsp: boolean;
var
  rs:TZQuery;
  rspComVersion:string;
begin
  frmLogo.Show;
  try
    result := false;
    Global.MoveToLocal;
    Global.Connect;
  finally
    frmLogo.Close;
  end;
  if not UpdateDbVersion then
     begin
       result := false;
       Exit;
     end;
  Global.MoveToRemate;
  if pos(';',ParamStr(2))>0 then //如果带分号，代表没加密码的
     Global.RemoteFactory.Initialize(ParamStr(2))
  else
     Global.RemoteFactory.Initialize(DecStr(ParamStr(2),ENC_KEY));
  Global.Connect;
   with TCreateDbFactory.Create do
   begin
     try
        RspComVersion := Factor.ExecProc('TGetComVersion');
        if CheckVersion(DBVersion,Global.RemoteFactory) or CompareVersion(ComVersion,RspComVersion) then
        begin
           ShowMsgBox('服务器的版本过旧，请联系管理员升级后台服务器..','友情提示...',MB_OK+MB_ICONINFORMATION);
           result := false;
           Exit;
        end;
     finally
        free;
     end;
   end;
  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text := 'select TENANT_ID,TENANT_NAME,SHORT_TENANT_NAME from CA_TENANT where TENANT_ID='+ParamStr(3);
    Factor.Open(rs);
    if rs.IsEmpty then
       begin
         ShowMsgBox('参数传入的企业号无效..','友情提示...',MB_OK+MB_ICONINFORMATION);
         result := false;
       end;
    Global.TENANT_ID := rs.Fields[0].AsInteger;
    Global.TENANT_NAME := rs.Fields[1].AsString;
    Global.SHOP_ID := rs.Fields[0].AsString+'0001';
    Global.SHOP_NAME := rs.Fields[2].AsString;
    Global.UserID := 'system';
    Global.UserName := '系统用户';
  finally
    rs.Free;
  end;
  LoadFrame;
  ProductId := ParamStr(4);
  SFVersion := '.ONL';
  CLVersion := ParamStr(5);
  result := true;
end;

procedure TfrmN26Main.actfrmSaleAnalyExecute(Sender: TObject);
var
  Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmSaleAnaly);
  if not Assigned(Form) then
     begin
       Form := TfrmSaleAnaly.Create(self);
       AddFrom(Form);
     end;
  if not Application.MainForm.Visible and (Form.FormStyle = fsMDIChild) then
     begin
       Form.FormStyle :=  fsNormal;
       Form.WindowState := wsNormal;
       Form.Width := 800;
       Form.Height := 575;
     end
  else
  if Application.MainForm.Visible and (Form.FormStyle = fsNormal) then
     begin
       Form.FormStyle :=  fsMDIChild;
       Form.WindowState := wsMaximized;
     end;
end;

procedure TfrmN26Main.wm_message(var Message: TMessage);
begin
  if Message.WParam = 99 then //执行自动到货确认
  begin
     if Global.UserID='system' then Exit;
     if not SyncFactory.SyncLockCheck then Exit;
     TfrmDownStockOrder.AutoDownStockOrder(inttostr(Message.LParam));
  end;
end;

procedure TfrmN26Main.actfrmNetForOrderExecute(Sender: TObject);
var
  Form:TfrmBasic;
  rimurl:string;
  rimuid:string;
  rimpwd:string;
  Msg:string;
  Params:TftParamList;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Params := TftParamList.Create(nil);
  try
    Params.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
    Params.ParamByName('SHOP_ID').AsString := Global.SHOP_ID;
    Msg := Global.RemoteFactory.ExecProc('TRimWsdlService',Params);
    Params.Decode(Params,Msg);
    rimurl := trim(Params.ParambyName('rimurl').AsString);
    rimuid := Params.ParambyName('rimuid').AsString;
    rimpwd := Params.ParambyName('rimpwd').AsString;
    if rimurl='' then Raise Exception.Create('无法连接到零售终端服务主机，请和实施人员联系.'); 
    if rimuid='' then Raise Exception.Create('当前登录门店的许可证号无效，请输入修改正确的许可证号.'); 
  finally
    Params.Free;
  end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm('frmNetForOrder');
  if not Assigned(Form) then
     begin
       Form := TfrmIEWebForm.Create(self);
       Form.Caption := actfrmNetForOrder.Caption;
       AddFrom(Form);
     end;
  try
    Form.Name := 'frmNetForOrder';
    if rimurl[length(rimurl)]<>'/' then rimurl := rimurl + '/';
    TfrmIEWebForm(Form).Open(rimurl+'rim_check/up?j_username='+rimuid+'&j_password='+rimpwd+'&MAIN_PAGE=rim');
    Form.Show;
    Form.BringToFront;
  except
    Form.Free;
    Raise;
  end;
end;

procedure TfrmN26Main.actfrmSaleManSaleReportExecute(Sender: TObject);
var
  Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmSaleManSaleReport);
  if not Assigned(Form) then
     begin
       Form := TfrmSaleManSaleReport.Create(self);
       AddFrom(Form);
     end;
  Form.Show;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmClientSaleReportExecute(Sender: TObject);
var
  Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmClientSaleReport);
  if not Assigned(Form) then
     begin
       Form := TfrmClientSaleReport.Create(self);
       AddFrom(Form);
     end;
  Form.Show;
  Form.BringToFront;
end;

procedure TfrmN26Main.DoLoadMsg(Sender: TObject);
begin
  if not Visible then Exit;
  if SyncFactory.Locked > 0 then Exit;
  PrainpowerJudge.SyncMsgc;
end;

procedure TfrmN26Main.actfrmSaleTotalReportExecute(Sender: TObject);
var
  Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmSaleTotalReport);
  if not Assigned(Form) then
     begin
       Form := TfrmSaleTotalReport.Create(self);
       AddFrom(Form);
     end;
  Form.Show;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmStgTotalReportExecute(Sender: TObject);
var
  Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmStgTotalReport);
  if not Assigned(Form) then
     begin
       Form := TfrmStgTotalReport.Create(self);
       AddFrom(Form);
     end;
  Form.Show;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmStockTotalReportExecute(Sender: TObject);
var
  Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmStockTotalReport);
  if not Assigned(Form) then
     begin
       Form := TfrmStockTotalReport.Create(self);
       AddFrom(Form);
     end;
  Form.Show;
  Form.BringToFront;
end;

function TfrmN26Main.ConnectToXsm: boolean;
const
  dec='{1#2$3%4(5)6@7!poeeww$3%4(5)djjkkldss}';
var
  mm,chk,tid,fn:string;
function  CheckParams:boolean;
begin
 try
  mm := ParamStr(2);
  if (copy(mm,1,3)<>'-mm') then Raise Exception.Create('传的参数无效，请认真阅读通讯协议文档');
  mm := copy(mm,5,255);

  chk := ParamStr(3);
  if (copy(chk,1,4)<>'-chk') then Raise Exception.Create('传的参数无效，请认真阅读通讯协议文档');
  chk := copy(chk,6,255);
  if chk<>md5Encode(mm+dec) then Raise Exception.Create('系统传入的校验码无效..');

  tid := ParamStr(5);
//  if copy(tid,1,3)<>'-id' then Raise Exception.Create('传的参数无效，请认真阅读通讯协议文档');
  tid := copy(tid,5,255);

  fn := ParamStr(4);
//  if copy(fn,1,3)<>'-fn' then Raise Exception.Create('传的参数无效，请认真阅读通讯协议文档');
  fn := copy(fn,5,255);
  result := true;

 except
   on E:Exception do
      begin
        ShowMsgBox(Pchar(E.Message),'友情提示...',MB_OK+MB_ICONINFORMATION);
        result := false;
      end;
 end;
end;
function CheckTenant:boolean;
var
  rs:TZQuery;
begin
  rs := TZQuery.Create(nil);
  try
    rs.SQL.Text := 'select Value from SYS_DEFINE Where Define = ''TENANT_ID'' and TENANT_ID=0 ';
    Factor.Open(rs);
    if (rs.Fields[0].asString<>tid) and (tid<>'') then //不相同要自动注册
       begin
         Global.TENANT_ID := 0;
         result := TfrmTenant.coAutoRegister(tid);
       end
    else
       result := TfrmTenant.coRegister(self);
  finally
    rs.Free;
  end;
end;
var
  rs:TZQuery;
  RspComVersion:string;
begin
  RzTrayIcon1.HideOnMinimize := true;
  result := false;
  frmLogo.Show;
  try
    result := false;
    Global.MoveToLocal;
    Global.Connect;
  finally
    frmLogo.Close;
  end;
  if not UpdateDbVersion then
     begin
       result := false;
       Exit;
     end;
  result := CheckParams;
  result := CheckTenant;
  if result then LoadFrame;
  if result and CaFactory.Audited then result := CheckVersion;
  if not result then Exit;
  if result then
     begin
      if ShopGlobal.NetVersion or ShopGlobal.ONLVersion then
         begin
           frmLogo.Show;
           try
             Global.MoveToRemate;
             try
               Global.Connect;
               with TCreateDbFactory.Create do
               begin
                 try
                    RspComVersion := Factor.ExecProc('TGetComVersion');
                    if CheckVersion(DBVersion,Global.RemoteFactory) or CompareVersion(ComVersion,RspComVersion) then
                    begin
                      if ShopGlobal.ONLVersion then
                         begin
                           ShowMsgBox('服务器的版本过旧，请联系管理员升级后台服务器..','友情提示...',MB_OK+MB_ICONINFORMATION);
                           result := false;
                           Exit;
                         end;
                      result := (ShowMsgBox('服务器的版本过旧，请联系管理员升级后台服务器，是否转脱机使用？','友情提示..',MB_YESNO+MB_ICONQUESTION)=6);
                      if result then
                        begin
                          Global.MoveToLocal;
                          Global.Connect;
                        end;
                    end;   
                 finally
                    free;
                 end;
               end;
             except
               if ShopGlobal.ONLVersion then
                  begin
                    if ShowMsgBox('连接数据库服务器失败,请检查网络是否正常,是否重新选择连接主机？','友情提示...',MB_YESNO+MB_ICONQUESTION)=6 then
                       TfrmHostDialog.HostDialog(self);
                    result := false;
                    Exit;
                  end;
               result := (ShowMsgBox('连接远程数据库失败,是否转脱机操作?','友情提示...',MB_YESNO+MB_ICONQUESTION)=6);
               if result then
                  begin
                    Global.MoveToLocal;
                    Global.Connect;
                  end;
             end;
           finally
             frmLogo.Close;
           end;
         end;
     end;
  try
    frmLogo.Show;
    try
     if CaFactory.Audited and not ShopGlobal.ONLVersion then
        begin
          if not Global.RemoteFactory.Connected and not ShopGlobal.NetVersion then
             begin
               frmLogo.Label1.Caption := '正在连接远程服务...';
               frmLogo.Label1.Update;
               Global.MoveToRemate;
               try
                 try
                   Global.Connect;
                 except
                   ShowMsgBox('连接远程服务器失败，系统无法同步到最新资料..','友情提示...',MB_OK+MB_ICONWARNING);
                 end;
               finally
                 Global.MoveToLocal;
               end;
             end;
          if Global.RemoteFactory.Connected and SyncFactory.CheckDBVersion then
             begin
               if CaFactory.CheckInitSync then CaFactory.SyncAll(1);
               if SyncFactory.CheckInitSync then SyncFactory.SyncBasic(true);
               InitTenant;
             end;
        end
     else
        begin
          if CaFactory.Audited and Global.RemoteFactory.Connected then //管理什么版本，有连接到服务器时，必须先同步数据
             begin
               if CaFactory.CheckInitSync then CaFactory.SyncAll(1);
               if ShopGlobal.ONLVersion then //在线版只需同步注册数据
                  begin
                    SyncFactory.SyncTimeStamp := CaFactory.TimeStamp;
                    SyncFactory.SyncComm := not SyncFactory.CheckRemeteData;
                    SyncFactory.SyncSingleTable('SYS_DEFINE','TENANT_ID;DEFINE','TSyncSingleTable',0);
                    SyncFactory.SyncSingleTable('CA_SHOP_INFO','TENANT_ID;SHOP_ID','TSyncSingleTable',0);
                    SyncFactory.SyncSingleTable('ACC_ACCOUNT_INFO','TENANT_ID;ACCOUNT_ID','TSyncAccountInfo',0);
                  end
               else
                  begin
                    if SyncFactory.CheckInitSync then SyncFactory.SyncBasic(true);
                  end;
             end;
          InitTenant;
        end;
    finally
      frmLogo.Close;
    end;
  except
    on E:Exception do
      begin
        ShowMsgBox(pchar(E.Message),'友情提示...',MB_OK+MB_ICONERROR);
        result := false;
        Exit;
      end;
  end;
  rs := Global.GetZQueryFromName('CA_USERS');
  if rs.Locate('MM',lowercase(mm),[]) or rs.Locate('MM',uppercase(mm),[]) then
    begin
      Global.SysDate := Date();
      Global.UserID := rs.FieldbyName('USER_ID').AsString;
      Global.SHOP_ID := rs.FieldbyName('SHOP_ID').AsString;
      Global.Roles  := rs.FieldbyName('ROLE_IDS').AsString;
      Global.SHOP_NAME := TdsFind.GetNameByID(Global.GetZQueryFromName('CA_SHOP_INFO'),'SHOP_ID','SHOP_NAME',rs.FieldbyName('SHOP_ID').AsString);
      Global.UserName := rs.FieldbyName('USER_NAME').AsString;
      result := true;
    end
  else
    begin
      Global.SysDate := Date();
      Global.UserID := 'admin';
      Global.SHOP_ID := inttostr(Global.TENANT_ID)+'0001';
      Global.Roles  := '';
      Global.SHOP_NAME := TdsFind.GetNameByID(Global.GetZQueryFromName('CA_SHOP_INFO'),'SHOP_ID','SHOP_NAME',Global.SHOP_ID);
      Global.UserName := '管理员';
      result := true;
    end;
//  IsXsm := true;
  if fn<>'' then
    PostMessage(Handle,WM_DESKTOP_REQUEST,StrtoIntDef(fn,0),1);
end;

procedure TfrmN26Main.RzTrayIcon1LButtonDblClick(Sender: TObject);
begin
  inherited;
  if Logined then
  begin
    frmN26Main.Show;
    frmN26Main.WindowState := wsMaximized;
  end;
end;

procedure TfrmN26Main.actfrmSaleMonthTotalReportExecute(Sender: TObject);
var
  Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmSaleMonthTotalReport);
  if not Assigned(Form) then
     begin
       Form := TfrmSaleMonthTotalReport.Create(self);
       AddFrom(Form);
     end;
  Form.Show;
  Form.BringToFront;
end;

procedure TfrmN26Main.DoPageClick(Sender: TObject);
begin
  LoadMenu(Sender);
end;

procedure TfrmN26Main.rzPageChange(Sender: TObject);
var i:integer;
begin
  inherited;
  if rzPage.TabIndex<0 then Exit;
  for i:=0 to rzPage.Tabs.Count -1 do rzPage.Tabs[i].ImageIndex := 0;
  LoadMenu(rzPage.Tabs[rzPage.TabIndex]);
  rzPage.Tabs[rzPage.TabIndex].ImageIndex := 1;
  if rzLeft.Width = 29 then rzLeft.Width := 172;
  if Panel12.Width = 31 then Panel12.Width := 174;
  if Panel24.Width = 23 then Panel24.Width := 166;
  frmMain.OnResize(nil);
end;

procedure TfrmN26Main.wm_check(var Message: TMessage);
begin
  try
  if (ShopGlobal.NetVersion or ShopGlobal.ONLVersion) then Exit;
  if SyncFactory.firsted and CaFactory.Audited then
     begin
       if not Global.RemoteFactory.Connected then Exit;
       if ShowMsgBox('系统第一次初始化，将从服务器恢复业务数据，是否立即执行？','友情提示...',MB_YESNO+MB_ICONQUESTION)<>6 then Exit;
       SyncFactory.SyncLockDb;
       if not SyncFactory.SyncLockCheck then Raise Exception.Create('你当前使用的电脑不是门店指定的专用电脑，不能执行数据同步操作。');
       SyncFactory.SyncAll;
     end;
  finally
    TfrmInitGuide.InitGuide(self);
  end;
  if actfrmMonthClose.Enabled then  TfrmCostCalc.CheckMonthReck(self);
  if actfrmDownIndeOrder.Enabled then actfrmDownIndeOrder.OnExecute(actfrmDownIndeOrder);
end;

procedure TfrmN26Main.actfrmN26NetExecute(Sender: TObject);
var
  s:string;
  Form:TfrmBasic;
  sl:TStringList;
begin
  inherited;
  if not CaFactory.Audited then Raise Exception.Create('不支持脱机使用..');
  if not CA_MODULE.Locate('MODU_ID',inttostr(TRzGroupItem(Sender).Tag),[]) then Raise Exception.Create('没找到对应的模块ID='+inttostr(TrzBmpButton(Sender).Tag));
  if not ShopGlobal.GetChkRight(inttostr(TRzGroupItem(Sender).Tag)) then Raise Exception.Create('你没有操作此模块的权限。');
  s := CA_MODULE.FieldbyName('ACTION_URL').AsString;
  delete(s,1,4);
  delete(s,length(s),1);
  if not Logined then
     begin
       PostMessage(frmMain.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmN26Browser);
  if not Assigned(Form) then
     begin
       Form := TfrmN26Browser.Create(self);
       Form.Caption := CA_MODULE.FieldbyName('MODU_NAME').asString;
       AddFrom(Form);
       if not TfrmN26Browser(Form).DoLogin then Exit;
     end;
  sl := TStringList.Create;
  try
    Form.Caption := CA_MODULE.FieldbyName('MODU_NAME').asString;
    sl.CommaText := s;
    TfrmN26Browser(Form).OpenUrl(TfrmN26Browser(Form).EncodeUrl(sl.values['url']) );
    Form.SetFocus;
    DoActiveChange(Form);
  except
    sl.free;
    Raise;
  end;
end;

procedure TfrmN26Main.RzBmpButton1Click(Sender: TObject);
var
  s:string;
  Form:TfrmBasic;
  sl:TStringList;
  Action:TAction;
begin
  inherited;
  if not CaFactory.Audited then Raise Exception.Create('不支持脱机使用..');
  if N26Factory.Checked=0 then
     begin
       if not CA_MODULE.Locate('MODU_NAME','网上订货',[]) then Raise Exception.Create('你没有开通网上订货业务');
     end
  else
     begin
       if not CA_MODULE.Locate('MODU_NAME','网上配货',[]) then Raise Exception.Create('你没有开通网上配货业务');
     end;
  if CA_MODULE.FieldByName('ACTION_NAME').AsString='actfrmN26Net' then
     begin
        if not ShopGlobal.GetChkRight(CA_MODULE.FieldByName('MODU_ID').AsString) then Raise Exception.Create('你没有操作此模块的权限。');
        s := CA_MODULE.FieldbyName('ACTION_URL').AsString;
        delete(s,1,4);
        delete(s,length(s),1);
        if not Logined then
           begin
             PostMessage(frmMain.Handle,WM_LOGIN_REQUEST,0,0);
             Exit;
           end;
        Application.Restore;
        frmN26Desk.SaveToFront;
        Form := FindChildForm(TfrmN26Browser);
        if not Assigned(Form) then
           begin
             Form := TfrmN26Browser.Create(self);
             Form.Caption := CA_MODULE.FieldbyName('MODU_NAME').asString;
             AddFrom(Form);
             if not TfrmN26Browser(Form).DoLogin then Exit;
           end;
        sl := TStringList.Create;
        try
          Form.Caption := CA_MODULE.FieldbyName('MODU_NAME').asString;
          sl.CommaText := s;
          TfrmN26Browser(Form).OpenUrl(TfrmN26Browser(Form).EncodeUrl(sl.values['url']));
          Form.SetFocus;
          DoActiveChange(Form);
        except
          sl.free;
          Raise;
        end;
    end
  else
    begin
       Action := FindAction(CA_MODULE.FieldByName('ACTION_NAME').AsString);
       if Action=nil then Exit;
       if not Action.Enabled then Raise Exception.Create('你没有操作此模块的权限');
       Action.OnExecute(Action); 
    end;
end;

destructor TfrmN26Main.Destroy;
var Form:TForm;
begin
  Form := FindChildForm(TfrmPosMain);
  if Form<>nil then Form.free;
  inherited;
end;

procedure TfrmN26Main.RzTrayIcon1MinimizeApp(Sender: TObject);
var Form:TForm;
begin
  inherited;
  Form := FindChildForm(TfrmPosMain);
  if Form<>nil then Form.WindowState := wsMinimized;
end;

procedure TfrmN26Main.RzTrayIcon1RestoreApp(Sender: TObject);
var Form:TForm;
begin
  inherited;
  Form := FindChildForm(TfrmPosMain);
  if Form<>nil then Form.WindowState := wsMaximized;
end;

procedure TfrmN26Main.RzButton1Click(Sender: TObject);
begin
  inherited;
  TfrmInitGuide.InitGuide(self); 
end;
procedure TfrmN26Main.actfrmGoodsMonthExecute(Sender: TObject);
var
  Form:TfrmBasic;
begin
  inherited;
  if not Logined then
  begin
    PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
    Exit;
  end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmGoodsMonth);
  if not Assigned(Form) then
  begin
    Form := TfrmGoodsMonth.Create(self);
    AddFrom(Form);
  end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmSimpleSaleDayReportExecute(Sender: TObject);
var
  Form:TfrmBasic;
begin
  inherited;
  if not Logined then
  begin
    PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
    Exit;
  end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm('TfrmSimpleSaleDayReport');
  if not Assigned(Form) then
  begin
    Form := TfrmSaleDayReport.Create(self);
    TfrmSaleDayReport(Form).SingleReportParams;
    AddFrom(Form);
  end;
  Form.Name := 'TfrmSimpleSaleDayReport';
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmIEOpenExecute(Sender: TObject);
begin
  inherited;
  if N26Factory.coAutoLogin then
     ShellExecute(0,'open',Pchar(N26Factory.EncodeUrl),nil,nil,0);
end;

procedure TfrmN26Main.actfrmDemandOrderList1Execute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm('frmDemandOrderList1');
  if not Assigned(Form) then
     begin
       Form := TfrmDemandOrderList.Create(self);
       TfrmDemandOrderList(Form).DemandType := '1';
       TfrmDemandOrderList(Form).Name := 'frmDemandOrderList1';
       AddFrom(Form);
//       if ShopGlobal.GetChkRight('600029') then TfrmChangeOrderList(Form).actNew.OnExecute(nil);
     end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmDemandOrderList2Execute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm('frmDemandOrderList2');
  if not Assigned(Form) then
     begin
       Form := TfrmDemandOrderList.Create(self);
       TfrmDemandOrderList(Form).DemandType := '2';
       TfrmDemandOrderList(Form).Name := 'frmDemandOrderList2';
       AddFrom(Form);
//       if ShopGlobal.GetChkRight('600029') then TfrmChangeOrderList(Form).actNew.OnExecute(nil);
     end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmInitGuideExecute(Sender: TObject);
begin
  inherited;
  TfrmInitGuide.StartGuide(self);

end;

procedure TfrmN26Main.SetdeskFlag(const Value: integer);
begin
  FdeskFlag := Value;
end;

procedure TfrmN26Main.SetleftVisible(const Value: boolean);
begin
  FleftVisible := Value;
  rzLeft.Visible := true;
  rzLeft.Width := 6;
  Panel12.Width := 8;
  Panel24.Width := 0;
end;

procedure TfrmN26Main.RzBmpButton5Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmN26Main.actfrmAllRckReportExecute(Sender: TObject);
var
  Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmAllRckReport);
  if not Assigned(Form) then
     begin
       Form := TfrmAllRckReport.Create(self);
       AddFrom(Form);
     end;
  Form.Show;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmSyncAllExecute(Sender: TObject);
begin
  inherited;
  if CaFactory.Audited then
     begin
       CaFactory.SyncAll(1);
       //if ShopGlobal.ONLVersion then Exit;
     end
  else
     begin
       //if ShopGlobal.ONLVersion then Raise Exception.Create('网络版不需要执行数据同步...');
     end;
  if PrainpowerJudge.Locked>0 then
     begin
       ShowMsgBox('正在执行消息同步，请稍等数据上报..','友情提示..',MB_OK+MB_ICONINFORMATION);
     end;
  frmLogo.Show;
  frmLogo.ShowTitle := '正在连接远程服务器，请稍候...';
  try
    if ShopGlobal.offline and not Global.RemoteFactory.Connected then
     begin
       Global.MoveToRemate;
       try
         try
           Global.Connect;
         except
           Raise Exception.Create('连接远程数据库失败,无法完成数据同步...');
         end;
       finally
         Global.MoveToLocal;
       end;
     end;
    if not SyncFactory.CheckDBVersion then Raise Exception.Create('当前数据库版本跟服务器不一致，请先升级程序后再同步...');
    SyncFactory.SyncLockDb;
    if not SyncFactory.SyncLockCheck then
       begin
         if Global.UserID='system' then
            begin
              if ShowMsgBox('当前门店已经锁定电脑了不能执行数据同步，是否对远程数据库进行解锁？','友情提示',MB_YESNO+MB_ICONQUESTION)<>6 then Exit;
              SyncFactory.SyncUnLockDb;
              Exit;
            end
         else
            Raise Exception.Create('你当前使用的电脑不是门店指定的专用电脑，不能执行数据同步操作。');
       end;
    if not ShopGlobal.ONLVersion and not ShopGlobal.NetVersion and TfrmCostCalc.CheckSyncReck(self) then TfrmCostCalc.TryCalcMthGods(self);
    if ShopGlobal.ONLVersion then SyncFactory.SyncRim else
       begin
         SyncFactory.SyncAll;
         frmLogo.Show;
         Global.LoadBasic;
         ShopGlobal.LoadRight;
       end;
  finally
    frmLogo.Close;
  end;

end;

procedure TfrmN26Main.RzBmpButton4Click(Sender: TObject);
begin
  inherited;
  actfrmSyncAll.OnExecute(actfrmSyncAll);
end;

procedure TfrmN26Main.actfrmBomOrderListExecute(Sender: TObject);
var
  Form:TfrmBasic;
begin
  inherited;
  if not Logined then
  begin
    PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
    Exit;
  end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm('TfrmBomOrderList');
  if not Assigned(Form) then
  begin
    Form := TfrmBomOrderList.Create(self);
    AddFrom(Form);
  end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmKpiIndexExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if ShopGlobal.offline then Raise Exception.Create('此功能不能脱机操作。。。');
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmKpiIndex);
  if not Assigned(Form) then
     begin
       Form := TfrmKpiIndex.Create(self);
       AddFrom(Form);
     end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmMktPlanOrderListExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if ShopGlobal.offline then Raise Exception.Create('此功能不能脱机操作。。。');
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmMktPlanOrderList);
  if not Assigned(Form) then
     begin
       Form := TfrmMktPlanOrderList.Create(self);
       AddFrom(Form);
     end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmMktRequOrderListExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if ShopGlobal.offline then Raise Exception.Create('此功能不能脱机操作。。。');
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmMktRequOrderList);
  if not Assigned(Form) then
     begin
       Form := TfrmMktRequOrderList.Create(self);
       AddFrom(Form);
     end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmMktKpiResultExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if ShopGlobal.offline then Raise Exception.Create('此功能不能脱机操作。。。');
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmMktKpiResult);
  if not Assigned(Form) then
     begin
       Form := TfrmMktKpiResult.Create(self);
       AddFrom(Form);
     end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmClientKpiReportExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmClientKpiReport);
  if not Assigned(Form) then
     begin
       Form := TfrmClientKpiReport.Create(self);
       AddFrom(Form);
     end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmManKpiReportExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmManKpiReport);
  if not Assigned(Form) then
     begin
       Form := TfrmManKpiReport.Create(self);
       AddFrom(Form);
     end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmBondRequReportExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmBondRequReport);
  if not Assigned(Form) then
     begin
       Form := TfrmBondRequReport.Create(self);
       AddFrom(Form);
     end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmMktRequReportExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmMktRequReport);
  if not Assigned(Form) then
     begin
       Form := TfrmMktRequReport.Create(self);
       AddFrom(Form);
     end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmMktCostTotalReportExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmMktCostTotalReport);
  if not Assigned(Form) then
     begin
       Form := TfrmMktCostTotalReport.Create(self);
       AddFrom(Form);
     end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmMktKpiTotalReportExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmMktKpiTotalReport);
  if not Assigned(Form) then
     begin
       Form := TfrmMktKpiTotalReport.Create(self);
       AddFrom(Form);
     end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmMktMarketCostOrderListExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmMktMarketCostOrderList);
  if not Assigned(Form) then
     begin
       Form := TfrmMktMarketCostOrderList.Create(self);
       AddFrom(Form);
     end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmMktActiveListExecute(Sender: TObject);
begin
  inherited;
  if ShopGlobal.offline then Raise Exception.Create('此功能不能脱机操作。。。');
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  with TfrmMktActiveList.Create(self) do
    begin
      try
        ShowModal;
      finally
        free;
      end;
    end;

end;

procedure TfrmN26Main.actfrmMktGodsReportExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmMktGodsReport);
  if not Assigned(Form) then
     begin
       Form := TfrmMktGodsReport.Create(self);
       AddFrom(Form);
     end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmMktBudgOrderListExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmMktBudgOrderList);
  if not Assigned(Form) then
     begin
       Form := TfrmMktBudgOrderList.Create(self);
       AddFrom(Form);
     end;
  Form.Show;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmMktBudgReportExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmMktBudgReport);
  if not Assigned(Form) then
     begin
       Form := TfrmMktBudgReport.Create(self);
       AddFrom(Form);
     end;
  Form.Show;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmPlanOrderList3Execute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmMktPlanOrderList3);
  if not Assigned(Form) then
     begin
       Form := TfrmMktPlanOrderList3.Create(self);
       AddFrom(Form);
     end;
  Form.Show;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmStkInvoiceListExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if ShopGlobal.offline then Raise Exception.Create('此功能不能脱机操作。。。');
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmStkInvoiceList);
  if not Assigned(Form) then
     begin
       Form := TfrmStkInvoiceList.Create(self);
       AddFrom(Form);
     end;
  Form.Show;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmInvoiceExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if ShopGlobal.offline then Raise Exception.Create('此功能不能脱机操作。。。');
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmInvoice);
  if not Assigned(Form) then
     begin
       Form := TfrmInvoice.Create(self);
       AddFrom(Form);
     end;
  Form.Show;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmMktAtthOrderListExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if ShopGlobal.offline then Raise Exception.Create('此功能不能脱机操作。。。');
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmMktAtthOrderList);
  if not Assigned(Form) then
     begin
       Form := TfrmMktAtthOrderList.Create(self);
       AddFrom(Form);
     end;
  Form.Show;
  Form.BringToFront;
end;

procedure TfrmN26Main.actfrmSalIndentDayReportExecute(Sender: TObject);
var Form:TfrmBasic;
begin
  inherited;
  if not Logined then
     begin
       PostMessage(frmN26Main.Handle,WM_LOGIN_REQUEST,0,0);
       Exit;
     end;
  Application.Restore;
  frmN26Desk.SaveToFront;
  Form := FindChildForm(TfrmSalIndentDayReport);
  if not Assigned(Form) then
     begin
       Form := TfrmSalIndentDayReport.Create(self);
       AddFrom(Form);
     end;
  Form.WindowState := wsMaximized;
  Form.BringToFront;
end;

end.







