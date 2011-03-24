program Shop;
uses
  Forms,
  Windows,
  SysUtils,
  uGlobal in '..\..\BASIC\uGlobal.pas' {Global: TDataModule},
  ufrmMain in '..\..\BASIC\ufrmMain.pas' {frmMain},
  ufrmDesk in '..\..\BASIC\ufrmDesk.pas' {frmDesk},
  udmIcon in '..\..\BASIC\udmIcon.pas' {dmIcon: TDataModule},
  uResOpr in '..\..\PUB\uResOpr.pas',
  GIFImage in '..\..\PUB\GIFIMAGE.PAS',
  ufrmBasic in '..\..\Basic\ufrmBasic.pas' {frmBasic},
  uShopGlobal in 'uShopGlobal.pas' {ShopGlobal: TDataModule},
  uframeMDForm in 'Frame\uframeMDForm.pas' {frameMDForm},
  uframeDialogForm in 'Frame\uframeDialogForm.pas' {frameDialogForm},
  uShopUtil in 'Frame\uShopUtil.pas',
  ufrmShopMain in 'ufrmShopMain.pas' {frmShopMain},
  ufrmShopDesk in 'ufrmShopDesk.pas' {frmShopDesk},
  uXDictFactory in 'Frame\uXDictFactory.pas',
  uframeToolForm in 'Frame\uframeToolForm.pas' {frameToolForm},
  ObjCommon in 'Obj\ObjCommon.pas',
  uDownByHttp in 'Update\uDownByHttp.pas',
  ufrmInstall in 'Update\ufrmInstall.pas' {frmInstall},
  uDevFactory in 'App\uDevFactory.pas',
  ufrmPswModify in 'ufrmPswModify.pas' {frmPswModify},
  ufrmLogin in 'ufrmLogin.pas' {frmLogin},
  ObjMeaUnits in 'Obj\ObjMeaUnits.pas',
  ufrmMeaUnits in 'App\ufrmMeaUnits.pas' {frmMeaUnits},
  ufrmTenant in 'App\ufrmTenant.pas' {frmTenant},
  ufrmDutyInfo in 'App\ufrmDutyInfo.pas' {frmDutyInfo},
  ufrmDutyInfoList in 'App\ufrmDutyInfoList.pas' {frmDutyInfoList},
  ufrmRoleInfo in 'App\ufrmRoleInfo.pas' {frmRoleInfo},
  ufrmRoleInfoList in 'App\ufrmRoleInfoList.pas' {frmRoleInfoList},
  ufrmUsers in 'App\ufrmUsers.pas' {frmUsers},
  ufrmUsersInfo in 'App\ufrmUsersInfo.pas' {frmUsersInfo},
  ObjDutyInfo in 'Obj\ObjDutyInfo.pas',
  ObjRoleInfo in 'Obj\ObjRoleInfo.pas',
  ObjUsers in 'Obj\ObjUsers.pas',
  ObjTenant in 'Obj\ObjTenant.pas',
  uCaFactory in 'App\uCaFactory.pas',
  ufrmDeptInfo in 'App\ufrmDeptInfo.pas' {frmDeptInfo},
  ufrmDeptInfoList in 'App\ufrmDeptInfoList.pas' {frmDeptInfoList},
  ufrmGoodssort in 'App\ufrmGoodssort.pas' {frmGoodssort},
  uframeSelectGoods in 'Frame\uframeSelectGoods.pas' {frameSelectGoods},
  uframeDialogProperty in 'Frame\uframeDialogProperty.pas' {frameDialogProperty},
  uframeOrderForm in 'Frame\uframeOrderForm.pas' {frameOrderForm},
  uframeOrderToolForm in 'Frame\uframeOrderToolForm.pas' {frameOrderToolForm},
  ufrmStkRetuOrder in 'App\ufrmStkRetuOrder.pas' {frmStkRetuOrder},
  ufrmStkRetuOrderList in 'App\ufrmStkRetuOrderList.pas' {frmStkRetuOrderList},
  ObjStkRetuOrder in 'Obj\ObjStkRetuOrder.pas',
  ObjSalRetuOrder in 'Obj\ObjSalRetuOrder.pas',
  ufrmSalRetuOrder in 'App\ufrmSalRetuOrder.pas' {frmSalRetuOrder},
  ufrmSalRetuOrderList in 'App\ufrmSalRetuOrderList.pas' {frmSalRetuOrderList},
  ObjChangeOrder in 'Obj\ObjChangeOrder.pas',
  ufrmChangeOrder in 'App\ufrmChangeOrder.pas' {frmChangeOrder},
  ufrmChangeOrderList in 'App\ufrmChangeOrderList.pas' {frmChangeOrderList},
  ufrmClient in 'App\ufrmClient.pas' {frmClient},
  ufrmClientInfo in 'App\ufrmClientInfo.pas' {frmClientInfo},
  ufrmGoodsSortTree in 'App\ufrmGoodsSortTree.pas' {frmGoodsSortTree},
  ufrmSupplier in 'App\ufrmSupplier.pas' {frmSupplier},
  ufrmSupplierInfo in 'App\ufrmSupplierInfo.pas' {frmSupplierInfo},
  ObjClient in 'Obj\ObjClient.pas',
  ObjDeptInfo in 'Obj\ObjDeptInfo.pas',
  ObjGoodsSort in 'Obj\ObjGoodsSort.pas',
  ObjShop in 'Obj\ObjShop.pas',
  ufrmGoodsInfo in 'App\ufrmGoodsInfo.pas' {frmGoodsInfo},
  ufrmGoodsInfoList in 'App\ufrmGoodsInfoList.pas' {frmGoodsInfoList},
  ObjGoodsInfo in 'Obj\ObjGoodsInfo.pas',
  ObjGetPrice in 'Obj\ObjGetPrice.pas',
  ObjPayOrder in 'Obj\ObjPayOrder.pas',
  ObjRecvOrder in 'Obj\ObjRecvOrder.pas',
  ufrmCodeInfo in 'App\ufrmCodeInfo.pas' {frmCodeInfo},
  ObjCodeInfo in 'Obj\ObjCodeInfo.pas',
  uframeTreeFindDialog in 'Frame\uframeTreeFindDialog.pas' {frameTreeFindDialog},
  uframeListDialog in 'Frame\uframeListDialog.pas' {frameListDialog},
  ufrmPayOrder in 'App\ufrmPayOrder.pas' {frmPayOrder},
  ufrmPayOrderList in 'App\ufrmPayOrderList.pas' {frmPayOrderList},
  ufrmRecvOrder in 'App\ufrmRecvOrder.pas' {frmRecvOrder},
  ufrmRecvOrderList in 'App\ufrmRecvOrderList.pas' {frmRecvOrderList},
  ufrmSelectGoodSort in 'App\ufrmSelectGoodSort.pas' {frmSelectGoodSort},
  Des in '..\..\Pub\des.pas',
  ufrmSalIndentOrder in 'App\ufrmSalIndentOrder.pas' {frmSalIndentOrder},
  ufrmSalIndentOrderList in 'App\ufrmSalIndentOrderList.pas' {frmSalIndentOrderList},
  ObjDbOrder in 'Obj\ObjDbOrder.pas',
  ObjStockOrder in 'Obj\ObjStockOrder.pas',
  ufrmStkIndentOrder in 'App\ufrmStkIndentOrder.pas' {frmStkIndentOrder},
  ufrmStkIndentOrderList in 'App\ufrmStkIndentOrderList.pas' {frmStkIndentOrderList},
  ufrmPosPrice in 'App\ufrmPosPrice.pas' {frmPosPrice},
  ufrmPosMain in 'App\ufrmPosMain.pas' {frmPosMain},
  uframeSelectCustomer in 'Frame\uframeSelectCustomer.pas' {frameSelectCustomer},
  ufrmShowDibs in 'App\ufrmShowDibs.pas' {frmShowDibs},
  ufrmCardNoInput in 'App\ufrmCardNoInput.pas' {frmCardNoInput},
  ufrmDibsOption in 'App\ufrmDibsOption.pas' {frmDibsOption},
  ufrmHangUpFile in 'App\ufrmHangUpFile.pas' {frmHangUpFile},
  ufrmPriceGradeInfo in 'App\ufrmPriceGradeInfo.pas' {frmPriceGradeInfo},
  ufrmRoleRights in 'App\ufrmRoleRights.pas' {frmRoleRights},
  ufrmUserRights in 'App\ufrmUserRights.pas' {frmUserRights},
  ObjPRICEGRADEInfo in 'Obj\ObjPriceGradeInfo.pas',
  ObjRoleRights in 'Obj\ObjRoleRights.pas',
  ObjUserRights in 'Obj\ObjUserRights.pas',
  ufrmDbOrder in 'App\ufrmDbOrder.pas' {frmDbOrder},
  ufrmDbOrderList in 'App\ufrmDbOrderList.pas' {frmDbOrderList},
  ObjSalIndentOrder in 'Obj\ObjSalIndentOrder.pas',
  ufrmStockOrder in 'App\ufrmStockOrder.pas' {frmStockOrder},
  ufrmStockOrderList in 'App\ufrmStockOrderList.pas' {frmStockOrderList},
  ObjStkIndentOrder in 'Obj\ObjStkIndentOrder.pas',
  ufrmInvoice in 'App\ufrmInvoice.pas' {frmInvoice},
  ufrmInvoiceInfo in 'App\ufrmInvoiceInfo.pas' {frmInvoiceInfo},
  ObjInvoice in 'Obj\ObjInvoice.pas',
  ObjSupplier in 'Obj\ObjSupplier.pas',
  ObjCustomer in 'Obj\ObjCustomer.pas',
  ufrmCustomer in 'App\ufrmCustomer.pas' {frmCustomer},
  ufrmCustomerInfo in 'App\ufrmCustomerInfo.pas' {frmCustomerInfo},
  ufrmCostCalc in 'App\ufrmCostCalc.pas' {frmCostCalc},
  ObjSysDefine in 'Obj\ObjSysDefine.pas',
  ufrmSysDefine in 'App\ufrmSysDefine.pas' {frmSysDefine},
  ufrmPrcCompList in 'App\ufrmPrcCompList.pas' {frmPrcCompList},
  ufrmPriceOrder in 'App\ufrmPriceOrder.pas' {frmPriceOrder},
  ufrmPriceOrderList in 'App\ufrmPriceOrderList.pas' {frmPriceOrderList},
  ObjPriceOrder in 'Obj\ObjPriceOrder.pas',
  ObjPrintOrder in 'Obj\ObjPrintOrder.pas',
  uframeSelectCompany in 'Frame\uframeSelectCompany.pas' {frameSelectCompany},
  ufrmBatchPmdPrice in 'App\ufrmBatchPmdPrice.pas' {frmBatchPmdPrice},
  ufrmPosMenu in 'App\ufrmPosMenu.pas' {frmPosMenu},
  ufrmCloseForDay in 'App\ufrmCloseForDay.pas' {frmCloseForDay},
  ObjCloseForDay in 'Obj\ObjCloseForDay.pas',
  ufrmCheckOrderList in 'App\ufrmCheckOrderList.pas' {frmCheckOrderList},
  ufrmCheckOrder in 'App\ufrmCheckOrder.pas' {frmCheckOrder},
  ufrmCheckAudit in 'App\ufrmCheckAudit.pas' {frmCheckAudit},
  ufrmCheckTask in 'App\ufrmCheckTask.pas' {frmCheckTask},
  ufrmCheckTaskDelete in 'App\ufrmCheckTaskDelete.pas' {frmCheckTaskDelete},
  ufrmSelectCheckGoods in 'App\ufrmSelectCheckGoods.pas',
  ObjIoroOrder in 'Obj\ObjIoroOrder.pas',
  ufrmSalesOrder in 'App\ufrmSalesOrder.pas' {frmSalesOrder},
  ObjSalesOrder in 'Obj\ObjSalesOrder.pas',
  ufrmSalesOrderList in 'App\ufrmSalesOrderList.pas' {frmSalesOrderList},
  ufrmDbOkDialog in 'App\ufrmDbOkDialog.pas' {frmDbOkDialog},
  ufrmShopInfo in 'App\ufrmShopInfo.pas' {frmShopInfo},
  ufrmShopInfoList in 'App\ufrmShopInfoList.pas' {frmShopInfoList},
  ufrmIEWebForm in 'App\ufrmIEWebForm.pas' {frmIEWebForm},
  ufrmAccount in 'App\ufrmAccount.pas' {frmAccount},
  ufrmAccountInfo in 'App\ufrmAccountInfo.pas' {frmAccountInfo},
  ObjAccount in 'Obj\ObjAccount.pas',
  ufrmTransOrder in 'App\ufrmTransOrder.pas' {frmTransOrder},
  ufrmTransOrderList in 'App\ufrmTransOrderList.pas' {frmTransOrderList},
  ObjTransOrder in 'Obj\ObjTransOrder.pas',
  ufrmDevFactory in 'App\ufrmDevFactory.pas' {frmDevFactory},
  ufrmIoroOrder in 'App\ufrmIoroOrder.pas' {frmIoroOrder},
  ufrmRckMng in 'App\ufrmRckMng.pas' {frmRckMng},
  ufrmCheckTablePrint in 'App\ufrmCheckTablePrint.pas',
  ufrmClientSort in 'App\ufrmClientSort.pas' {frmClientSort},
  ufrmTicketPrint in 'App\ufrmTicketPrint.pas' {frmTicketPrint},
  uframeBaseReport in 'Frame\uframeBaseReport.pas' {frameBaseReport},
  uframeFindDialog in 'Frame\uframeFindDialog.pas' {frameFindDialog},
  ufrmIoroOrderList in 'App\ufrmIoroOrderList.pas' {frmIoroOrderList},
  ufrmJxcTotalReport in 'App\ufrmJxcTotalReport.pas' {frmJxcTotalReport},
  ufrmStockDayReport in 'App\ufrmStockDayReport.pas' {frmStockDayReport},
  CaTenantService in 'App\CaTenantService.pas',
  ufrmBatchCloseForDay in 'App\ufrmBatchCloseForDay.pas' {frmBatchCloseForDay},
  ufrmChangeDayReport in 'App\ufrmChangeDayReport.pas' {frmChangeDayReport},
  ufrmSaleDayReport in 'App\ufrmSaleDayReport.pas' {frmSaleDayReport},
  uSyncFactory in 'App\uSyncFactory.pas',
  ufrmStorageDayReport in 'App\ufrmStorageDayReport.pas' {frmStorageDayReport},
  ufrmRckDayReport in 'App\ufrmRckDayReport.pas' {frmRckDayReport},
  ufrmJoinRelation in 'App\ufrmJoinRelation.pas' {frmJoinRelation},
  ufrmRelation in 'App\ufrmRelation.pas' {frmRelation},
  ufrmRelationInfo in 'App\ufrmRelationInfo.pas' {frmRelationInfo},
  objRelation in 'Obj\objRelation.pas',
  ObjSyncFactory in 'Obj\ObjSyncFactory.pas',
  ufrmPayDayReport in 'App\ufrmPayDayReport.pas' {frmPayDayReport},
  ufrmRecvDayReport in 'App\ufrmRecvDayReport.pas' {frmRecvDayReport},
  ufrmRecvAbleReport in 'App\ufrmRecvAbleReport.pas' {frmRecvAbleReport},
  ufrmPayAbleReport in 'App\ufrmPayAbleReport.pas' {frmPayAbleReport},
  ufrmStorageTracking in 'App\ufrmStorageTracking.pas' {frmStorageTracking},
  ufrmFindOrder in 'App\ufrmFindOrder.pas' {frmFindOrder};

{$R *.res}
var
  f:TextFile;
  handle:THandle;
  Msg:Integer;
begin
  Application.Initialize;
  DBVersion := 'DB1.0.0.1';
  Application.CreateForm(TdmIcon, dmIcon);
  Application.CreateForm(TShopGlobal, ShopGlobal);
  Application.CreateForm(TfrmShopMain, frmShopMain);
  Application.CreateForm(TfrmShopDesk, frmShopDesk);
  Application.ShowMainForm := false;
  PostMessage(frmShopMain.Handle,WM_LOGIN_REQUEST,1,1);
  Application.Run;

end.
