{  11100001	0	进货订单	1	查询  2	新增	3	修改	4	删除	5	审核	6	打印	7	导出
}

unit ufrmStkIndentOrderList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uframeOrderToolForm, DB, ActnList, Menus, ComCtrls,
  ToolWin, StdCtrls, RzLabel, Grids, DBGridEh, ExtCtrls, RzTabs, RzPanel,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxButtonEdit, zrComboBoxList, RzButton,
  cxRadioGroup, ZBase, FR_Class, jpeg, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TfrmStkIndentOrderList = class(TframeOrderToolForm)
    ToolButton11: TToolButton;
    D1: TcxDateEdit;
    D2: TcxDateEdit;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    fndCLIENT_ID: TzrComboBoxList;
    RzLabel5: TRzLabel;
    fndINDE_ID: TcxTextEdit;
    Label1: TLabel;
    btnOk: TRzBitBtn;
    fndSTATUS: TcxRadioGroup;
    frfStkIndentOrder: TfrReport;
    actfrmPayOrder: TAction;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    Label40: TLabel;
    fndSHOP_ID: TzrComboBoxList;
    Label3: TLabel;
    fndDEPT_ID: TzrComboBoxList;
    procedure cdsListAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actFindExecute(Sender: TObject);
    procedure actPriorExecute(Sender: TObject);
    procedure actNextExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actAuditExecute(Sender: TObject);
    procedure actInfoExecute(Sender: TObject);
    procedure frfStkIndentOrderUserFunction(const Name: String; p1, p2, p3: Variant; var Val: Variant);
    procedure actPrintExecute(Sender: TObject);
    procedure actPreviewExecute(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure actfrmPayOrderExecute(Sender: TObject);
    procedure frfStkIndentOrderGetValue(const ParName: String;
      var ParValue: Variant);
  private
    oid:string;
    PrintTimes:Integer;
    HandClosedItem :TMenuItem; //2012.01.30添加手工结案的菜单
    function  CheckCanExport: boolean; override;
    procedure PrintBefore(Sender:TObject);
    procedure PrintAfter(Sender:TObject);
    //2012.01.30添加手工结案的菜单
    procedure AddHandClosedPopup;
    //2012.01.30设置是否可以手工结案
    procedure DoOnPmPopup(Sender: TObject);
    //2012.01.30手工结案的点击事件
    procedure DoHandClosedClick(Sender: Tobject);    
  public
    { Public declarations }
    IsEnd: boolean;
    MaxId:string;
    function PrintSQL(tenantid,id:string):string;
    function GetFormClass:TFormClass;override;
    function EncodeSQL(id:string):string;
    procedure Open(Id:string);
  end;

implementation
uses ufrmStkIndentOrder, uDsUtil, uFnUtil,uGlobal,uShopUtil,uXDictFactory,ufrmFastReport, ufrmPayOrder,
  uShopGlobal, uMsgBox, ufrmOrderHandSet;
{$R *.dfm}

{ TfrmStkIndentOrderList }

function TfrmStkIndentOrderList.EncodeSQL(id: string): string;
var w,w1:string;
begin
  w := ' where A.TENANT_ID=:TENANT_ID and A.INDE_DATE>=:D1 and A.INDE_DATE<=:D2 ';
  if fndSHOP_ID.AsString <> '' then
     w := w +' and A.SHOP_ID=:SHOP_ID';
  if fndCLIENT_ID.AsString <> '' then
     w := w +' and A.CLIENT_ID=:CLIENT_ID';
  //[2012.02.03 xhh修改:可以按树上下级查询]
  if fndDEPT_ID.AsString <> '' then
     w := w + ShopGlobal.GetDeptID('A.DEPT_ID',fndDEPT_ID.AsString);
  if trim(fndINDE_ID.Text) <> '' then
     w := w + ' and A.GLIDE_NO like ''%'+trim(fndINDE_ID.Text)+'''';
  if fndSTATUS.ItemIndex > 0 then
     begin
       case fndSTATUS.ItemIndex of
       1:w := w +' and A.CHK_DATE is null';
       2:w := w +' and A.CHK_DATE is not null';
       3:w := w +' and A.STKBILL_STATUS=0';
       4:w := w +' and A.STKBILL_STATUS=1';
       5:w := w +' and A.STKBILL_STATUS=2';
       6:w1 := ' where RECK_MNY<>0';
       7:w1 := ' where RECK_MNY=0';
       end;
     end;
  if id<>'' then
     w := w +' and A.INDE_ID>'''+id+'''';
  result :=
     'select A.TENANT_ID,A.INDE_ID,A.GLIDE_NO,A.STKBILL_STATUS,A.INDE_DATE,A.CREA_DATE,A.REMARK,A.INVOICE_FLAG,A.CLIENT_ID,A.GUIDE_USER,A.CREA_USER,A.SHOP_ID,A.ADVA_MNY,A.INDE_AMT as AMOUNT,A.INDE_MNY as AMONEY,''6'' as ABLE_TYPE '+
     'from STK_INDENTORDER A '+w+ShopGlobal.GetDataRight('A.SHOP_ID',1)+ShopGlobal.GetDataRight('A.DEPT_ID',2)+' ';
  result := 'select ja.*,a.CLIENT_NAME from ('+result+') ja left join VIW_CLIENTINFO a on ja.TENANT_ID=a.TENANT_ID and ja.CLIENT_ID=a.CLIENT_ID';
  result := 'select jc.*,c.PAYM_MNY,c.RECK_MNY from ('+result+') jc left join ACC_PAYABLE_INFO c on jc.TENANT_ID=c.TENANT_ID and jc.INDE_ID=c.STOCK_ID and jc.ABLE_TYPE=c.ABLE_TYPE';
  result := 'select jd.*,d.USER_NAME as GUIDE_USER_TEXT from ('+result+') jd left outer join VIW_USERS d on jd.TENANT_ID=d.TENANT_ID and jd.GUIDE_USER=d.USER_ID';
  result := 'select je.*,e.USER_NAME as CREA_USER_TEXT from ('+result+') je left outer join VIW_USERS e on je.TENANT_ID=e.TENANT_ID and je.CREA_USER=e.USER_ID '+w1;
  case Factor.iDbType of
  0:result := 'select top 600 * from ('+result+') jp order by INDE_ID';
  1:result :=
       'select * from ('+
       'select * from ('+result+') j order by INDE_ID) where ROWNUM<=600';
  4:result :=
       'select * from ('+
       'select * from ('+result+') j order by INDE_ID) tp fetch first 600  rows only';
  5:result := 'select * from ('+result+') j order by INDE_ID limit 600';
  else
    result := 'select * from ('+result+') j order by INDE_ID';
  end;
end;

function TfrmStkIndentOrderList.GetFormClass: TFormClass;
begin
  result := TfrmStkIndentOrder;
end;

procedure TfrmStkIndentOrderList.Open(Id: string);
var
  rs:TZQuery;
  sm:TMemoryStream;
begin
  if not Visible then Exit;
  if Id='' then cdsList.close;
  rs := TZQuery.Create(nil);
  sm := TMemoryStream.Create;
  cdsList.DisableControls;
  try
    rs.SQL.Text := EncodeSQL(Id);
    rs.Params.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
    rs.Params.ParamByName('D1').AsInteger := strtoint(formatdatetime('YYYYMMDD',D1.Date));
    rs.Params.ParamByName('D2').AsInteger := strtoint(formatdatetime('YYYYMMDD',D2.Date));
    if rs.Params.FindParam('CLIENT_ID')<>nil then rs.Params.FindParam('CLIENT_ID').AsString := fndCLIENT_ID.AsString; 
    if rs.Params.FindParam('SHOP_ID')<>nil then rs.Params.FindParam('SHOP_ID').AsString := fndSHOP_ID.AsString;
    //if rs.Params.FindParam('DEPT_ID')<>nil then rs.Params.FindParam('DEPT_ID').AsString := fndDEPT_ID.AsString;
    Factor.Open(rs);
    rs.Last;
    MaxId := rs.FieldbyName('INDE_ID').AsString;
    if Id='' then
    begin
       rs.SaveToStream(sm);
       cdsList.LoadFromStream(sm);  
       cdsList.IndexFieldNames := 'GLIDE_NO';
    end
    else
    begin
       rs.SaveToStream(sm);
       cdsList.AddFromStream(sm);
    end;
    if rs.RecordCount <600 then IsEnd := True else IsEnd := false;
  finally
    cdsList.EnableControls;
    sm.Free;
    rs.Free;
  end;
end;

procedure TfrmStkIndentOrderList.cdsListAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if IsEnd or not DataSet.Eof then Exit;
  if cdsList.ControlsDisabled then Exit;
  Open(MaxId);

end;

procedure TfrmStkIndentOrderList.FormCreate(Sender: TObject);
begin
  inherited;
  fndSHOP_ID.KeyValue := Global.SHOP_ID;
  fndSHOP_ID.Text := Global.SHOP_NAME;
  fndSHOP_ID.DataSet := Global.GetZQueryFromName('CA_SHOP_INFO');
  InitGridPickList(DBGridEh1);
  fndCLIENT_ID.DataSet := Global.GetZQueryFromName('PUB_CLIENTINFO');
  fndDEPT_ID.DataSet := Global.GetZQueryFromName('CA_DEPT_INFO');
  fndDEPT_ID.RangeField := 'DEPT_TYPE';
  fndDEPT_ID.RangeValue := '1';
  D1.Date := date();
  D2.Date := date();
  {if Copy(Global.SHOP_ID,Length(Global.SHOP_ID)-3,Length(Global.SHOP_ID)) <> '0001' then
  begin
    SetEditStyle(dsBrowse,fndSHOP_ID.Style);
    fndSHOP_ID.Properties.ReadOnly := True;
  end;}
  //2011.11.10 引入门店权限及部门权限，把原有的控制注释
  if ShopGlobal.GetProdFlag = 'E' then
    begin
      Label40.Caption := '订货仓库';
    end;

  if not ShopGlobal.GetChkRight('14500001',2) then
  begin
    DBGridEh1.Columns[10].Free;
    DBGridEh1.Columns[9].Free;
    DBGridEh1.Columns[8].Free;
    DBGridEh1.Columns[7].Free;
  end;
  //2012.02.18修改:对于没收款权限，菜单不显示
  actfrmPayOrder.Visible:=ShopGlobal.GetChkRight('21400001',2);
end;

procedure TfrmStkIndentOrderList.FormShow(Sender: TObject);
begin
  inherited;
  Open('');
  //进入窗体默认新增加判断是否新增权限:
  if (ShopGlobal.GetChkRight('11100001',2)) and (rzPage.ActivePageIndex = 0) and (rzPage.PageCount=1) then actNew.OnExecute(nil);
  //2012.02.01创建菜单
  AddHandClosedPopup;
end;

procedure TfrmStkIndentOrderList.actFindExecute(Sender: TObject);
begin
  inherited;
  Open('');

end;

procedure TfrmStkIndentOrderList.actPriorExecute(Sender: TObject);
var
  Temp:TZQuery;
  Params:TftParamList;
begin
  inherited;
  if CurOrder <> nil then
     begin
        Params := TftParamList.Create(nil);
        try
          Params.ParamByName('TENANT_ID').asInteger := Global.TENANT_ID;
          Params.ParamByName('SHOP_ID').asString := CurOrder.cid;
          Params.ParamByName('CREA_USER').asString := Global.UserID;
          Params.ParamByName('STOCK_TYPE').asString := '1';
          if (CurOrder.gid = '') or (CurOrder.gid='..新增..') then
             Params.ParamByName('GLIDE_NO').asString := '9999999999999999'
          else
             Params.ParamByName('GLIDE_NO').asString := CurOrder.gid;
          Temp := TZQuery.Create(nil);
          try
             Factor.Open(Temp,'TStkIndentOrderGetPrior',Params);
             if Temp.Fields[0].asString<>'' then
                CurOrder.Open(Temp.Fields[0].asString);
          finally
             Temp.Free;
          end;
        finally
          Params.Free;
        end;
     end
  else
     begin
        cdsList.Prior;
     end;
end;

procedure TfrmStkIndentOrderList.actNextExecute(Sender: TObject);
var
  Temp:TZQuery;
  Params:TftParamList;
begin
  inherited;
  if CurOrder <> nil then
     begin
        Params := TftParamList.Create(nil);
        try
          Params.ParamByName('TENANT_ID').asInteger := Global.TENANT_ID;
          Params.ParamByName('SHOP_ID').asString := CurOrder.cid;
          Params.ParamByName('CREA_USER').asString := Global.UserID;
          Params.ParamByName('STOCK_TYPE').asString := '1';
          if CurOrder.gid = '' then
             Params.ParamByName('GLIDE_NO').asString := '00000000000000'
          else
             Params.ParamByName('GLIDE_NO').asString := CurOrder.gid;
          Temp := TZQuery.Create(nil);
          try
             Factor.Open(Temp,'TStkIndentOrderGetNext',Params);
             if Temp.Fields[0].asString<>'' then
                CurOrder.Open(Temp.Fields[0].asString);
          finally
             Temp.Free;
          end;
        finally
          Params.Free;
        end;
     end
  else
     begin
        cdsList.Next;
     end;
end;

procedure TfrmStkIndentOrderList.actEditExecute(Sender: TObject);
begin
//  if not ShopGlobal.GetChkRight('11100001',3) then Raise Exception.Create('你没有修改订货单的权限,请和管理员联系.');
  if (CurOrder=nil) then
     begin
       if cdsList.IsEmpty then Exit;
       OpenForm(cdsList.FieldbyName('INDE_ID').AsString,cdsList.FieldbyName('SHOP_ID').AsString);
     end;
  if CurOrder=nil then Raise Exception.Create('"进货订单"打开异常!');

  if TfrmStkIndentOrder(CurOrder).cdsHeader.FieldByName('CREA_USER').AsString <> Global.UserID then
    begin
      if not ShopGlobal.GetChkRight('11100001',5) then
        Raise Exception.Create('你没有修改"'+TdsFind.GetNameByID(Global.GetZQueryFromName('CA_USERS'),'USER_ID','USER_NAME',TfrmStkIndentOrder(CurOrder).cdsHeader.FieldByName('CREA_USER').AsString)+'"录入单据的权限!');
    end;
  inherited;

end;

procedure TfrmStkIndentOrderList.actDeleteExecute(Sender: TObject);
begin
  //if not ShopGlobal.GetChkRight('11100001',4) then Raise Exception.Create('你没有删除订货单的权限,请和管理员联系.');
  if (CurOrder=nil) then
     begin
       if cdsList.IsEmpty then Exit;
       OpenForm(cdsList.FieldbyName('INDE_ID').AsString,cdsList.FieldbyName('SHOP_ID').AsString);
     end;
  if CurOrder=nil then Raise Exception.Create('"进货订单"打开异常!');

  if TfrmStkIndentOrder(CurOrder).cdsHeader.FieldByName('CREA_USER').AsString <> Global.UserID then
    begin
      if not ShopGlobal.GetChkRight('11100001',5) then
        Raise Exception.Create('你没有删除"'+TdsFind.GetNameByID(Global.GetZQueryFromName('CA_USERS'),'USER_ID','USER_NAME',TfrmStkIndentOrder(CurOrder).cdsHeader.FieldByName('CREA_USER').AsString)+'"录入单据的权限!');
    end;
  inherited;
  if (CurOrder<>nil) then
     begin
       if not CurOrder.saved then Exit;
       if ShopGlobal.GetChkRight('11100001',2) and (MessageBox(Handle,'删除当前单据成功,是否继续新增订货单？',pchar(Application.Title),MB_YESNO+MB_ICONINFORMATION)=6) then
          CurOrder.NewOrder
       else
          if rzPage.PageCount>2 then CurOrder.Close;
     end;
end;

procedure TfrmStkIndentOrderList.actSaveExecute(Sender: TObject);
begin
  inherited;
  if (CurOrder<>nil) then
     begin
       if not CurOrder.saved then Exit;
       if (ShopGlobal.GetParameter('SAVE_STOCK_PRINT')='1')
          and
          ShopGlobal.GetChkRight('11100001',6)
       then
          begin
            actPrint.OnExecute(nil);
          end;
       if ShopGlobal.GetChkRight('11100001',2) and (MessageBox(Handle,'是否继续新增订货单？',pchar(Application.Title),MB_YESNO+MB_ICONINFORMATION)=6) then
          CurOrder.NewOrder
       else
          if rzPage.PageCount>2 then CurOrder.Close;
     end;
end;

procedure TfrmStkIndentOrderList.actAuditExecute(Sender: TObject);
begin
//  if not ShopGlobal.GetChkRight('11100001',5) then Raise Exception.Create('你没有审核订货单的权限,请和管理员联系.');
  if (CurOrder=nil) then
     begin
       if cdsList.IsEmpty then Exit;
       OpenForm(cdsList.FieldbyName('INDE_ID').AsString,cdsList.FieldbyName('SHOP_ID').AsString);
     end;
  inherited;

end;

procedure TfrmStkIndentOrderList.actInfoExecute(Sender: TObject);
begin
  inherited;
  if (CurOrder=nil) then
     begin
       if cdsList.IsEmpty then Exit;
       OpenForm(cdsList.FieldbyName('INDE_ID').AsString,cdsList.FieldbyName('SHOP_ID').AsString);
     end;

end;

procedure TfrmStkIndentOrderList.frfStkIndentOrderUserFunction(const Name: String;
  p1, p2, p3: Variant; var Val: Variant);
var small:real;
begin
  inherited;
  if UPPERCASE(Name)='SMALLTOBIG' then
     begin
       small := frParser.Calc(p1);
       Val := FnNumber.SmallTOBig(small);
     end;
end;

function TfrmStkIndentOrderList.PrintSQL(tenantid, id: string): string;
var
  TopCnd: string;
begin
  //数据库类型 0:SQL Server; 1:Oracle; 2:Sybase; 3:ACCESS; 4:DB2; 5:Sqlite
  case Factor.iDbType of
   0: TopCnd:=' top 20000 ';
   else
      TopCnd:='';
  end;
  
  result :=
   'select j.*,case when j.IS_PRESENT=2 then ''(兑换)'' when j.IS_PRESENT=1 then ''(赠送)'' else '''' end as IS_PRESENT_TEXT,'+
//   'j.INDE_MNY/(1+j.TAX_RATE)*j.TAX_RATE as TOTAL_TAX_MNY,'+
//   'j.INDE_MNY-j.INDE_MNY/(1+j.TAX_RATE)*j.TAX_RATE as TOTAL_NOTAX_MNY,'+
   '(select sum(RECK_MNY) from ACC_PAYABLE_INFO where TENANT_ID='+tenantid+' and CLIENT_ID=j.CLIENT_ID and INDE_ID='''+id+''') as ORDER_OWE_MNY,'+
   '(select sum(RECK_MNY) from ACC_PAYABLE_INFO where TENANT_ID='+tenantid+' and CLIENT_ID=j.CLIENT_ID) as TOTAL_OWE_MNY '+
   'from ('+
   'select jm.*,m.DEPT_NAME as DEPT_ID_TEXT from ('+
   'select jl.*,l.CODE_NAME as SETTLE_CODE_TEXT from ('+
   'select jk.*,k.UNIT_NAME from ('+
   'select jj.*,j.COLOR_NAME as PROPERTY_02_TEXT from ('+
   'select ji.*,i.SIZE_NAME as PROPERTY_01_TEXT from ('+
   'select jh.*,h.GODS_NAME,h.GODS_CODE,h.BARCODE from ('+
   'select jg.*,g.SHOP_NAME,g.ADDRESS as SHOP_ADDR,g.TELEPHONE as SHOP_TELE,g.FAXES from ('+
   'select jf.*,f.USER_NAME as CREA_USER_TEXT from ('+
   'select je.*,e.CODE_NAME as INVOICE_FLAG_TEXT from ('+
   'select jd.*,d.USER_NAME as CHK_USER_TEXT from ('+
   'select jc.*,c.USER_NAME as GUIDE_USER_TEXT from ('+
   'select jb.*,b.CLIENT_NAME,b.LINKMAN,b.TELEPHONE2 as MOVE_TELE,b.SETTLE_CODE,b.POSTALCODE,b.ADDRESS,b.FAXES CLIENT_FAXES from ('+
   'select '+TopCnd+' A.TENANT_ID,A.SHOP_ID,A.DEPT_ID,A.INDE_ID,A.GLIDE_NO,A.INDE_DATE,A.CLIENT_ID,A.CREA_USER,A.GUIDE_USER,'+
   'A.CHK_DATE,A.CHK_USER,A.FIG_ID,A.INDE_AMT,A.INDE_MNY,A.REMARK,A.INVOICE_FLAG,A.TAX_RATE,A.CREA_DATE,A.PRINT_TIMES,A.BOND_MNY as ALL_BOND_MNY,A.BOND_RET as ALL_BOND_RET,'+
   'A.OTH1_MNY,A.OTH2_MNY,A.OTH3_MNY,A.OTH4_MNY,A.OTH5_MNY,A.OTH6_MNY,'+
   'B.AMOUNT,B.APRICE,B.SEQNO,B.ORG_PRICE,B.PROPERTY_01,B.PROPERTY_02,B.UNIT_ID,B.BATCH_NO,B.GODS_ID,B.LOCUS_NO,B.CALC_MONEY,B.AGIO_RATE,B.AGIO_MONEY,B.IS_PRESENT,B.REMARK as REMARK_DETAIL,'+
   'B.BOND_MNY,B.BOND_RET from STK_INDENTORDER A,STK_INDENTDATA B '+
   'where A.TENANT_ID=B.TENANT_ID and A.INDE_ID=B.INDE_ID and A.TENANT_ID='+tenantid+' and A.INDE_ID='''+id+''' order by SEQNO) jb '+
   'left outer join VIW_CLIENTINFO b on jb.TENANT_ID=b.TENANT_ID and jb.CLIENT_ID=b.CLIENT_ID ) jc '+
   'left outer join VIW_USERS c on jc.TENANT_ID=c.TENANT_ID and jc.GUIDE_USER=c.USER_ID ) jd '+
   'left outer join VIW_USERS d on jd.TENANT_ID=d.TENANT_ID and jd.CHK_USER=d.USER_ID ) je '+
   'left outer join (select CODE_ID,CODE_NAME from PUB_PARAMS where TYPE_CODE=''INVOICE_FLAG'') e on je.INVOICE_FLAG=e.CODE_ID ) jf '+
   'left outer join VIW_USERS f on jf.TENANT_ID=f.TENANT_ID and jf.CREA_USER=f.USER_ID ) jg '+
   'left outer join CA_SHOP_INFO g on jg.TENANT_ID=g.TENANT_ID and jg.SHOP_ID=g.SHOP_ID) jh '+
   'left outer join VIW_GOODSINFO h on jh.TENANT_ID=h.TENANT_ID and jh.GODS_ID=h.GODS_ID ) ji '+
   'left outer join VIW_SIZE_INFO i on ji.TENANT_ID=i.TENANT_ID and ji.PROPERTY_01=i.SIZE_ID ) jj '+
   'left outer join VIW_COLOR_INFO j on jj.TENANT_ID=j.TENANT_ID and jj.PROPERTY_02=j.COLOR_ID ) jk '+
   'left outer join VIW_MEAUNITS k on jk.TENANT_ID=k.TENANT_ID and jk.UNIT_ID=k.UNIT_ID ) jl '+
   'left outer join (select CODE_ID,CODE_NAME from PUB_CODE_INFO where CODE_TYPE=''6'' and TENANT_ID='+tenantid+') l on jl.SETTLE_CODE=l.CODE_ID) jm '+
   'left outer join CA_DEPT_INFO m on jm.TENANT_ID=m.TENANT_ID and jm.DEPT_ID=m.DEPT_ID ) j order by SEQNO';
end;

procedure TfrmStkIndentOrderList.actPrintExecute(Sender: TObject);
begin
  inherited;
  if not ShopGlobal.GetChkRight('11100001',6) then Raise Exception.Create('你没有打印订货单的权限,请和管理员联系.');
  with TfrmFastReport.Create(Self) do
    begin
      try
        if CurOrder<>nil then
           begin
             if CurOrder.oid = '' then Exit;
             if CurOrder.dbState <> dsBrowse then Raise Exception.Create('请保存后再打印...');
             BeforePrint := PrintBefore;
             AfterPrint := PrintAfter;
             PrintReport(PrintSQL(inttostr(Global.TENANT_ID),CurOrder.oid),frfStkIndentOrder);
           end
        else
           begin
             if cdsList.IsEmpty then Exit;
             BeforePrint := PrintBefore;
             AfterPrint := PrintAfter;
             PrintReport(PrintSQL(cdsList.FieldbyName('TENANT_ID').AsString,cdsList.FieldbyName('INDE_ID').AsString),frfStkIndentOrder);
           end;
      finally
         free;
      end;
    end;
end;

procedure TfrmStkIndentOrderList.actPreviewExecute(Sender: TObject);
begin
  inherited;
  if not ShopGlobal.GetChkRight('11100001',6) then Raise Exception.Create('你没有打印订货单的权限,请和管理员联系.');
  with TfrmFastReport.Create(Self) do
    begin
      try
        if CurOrder<>nil then
           begin
             if CurOrder.oid = '' then Exit;
             if CurOrder.dbState <> dsBrowse then Raise Exception.Create('请保存后再打印...');
             BeforePrint := PrintBefore;
             AfterPrint := PrintAfter;
             ShowReport(PrintSQL(inttostr(Global.TENANT_ID),CurOrder.oid),frfStkIndentOrder,nil,true);
           end
        else
           begin
             if cdsList.IsEmpty then Exit;
             BeforePrint := PrintBefore;
             AfterPrint := PrintAfter;             
             ShowReport(PrintSQL(cdsList.FieldbyName('TENANT_ID').AsString,cdsList.FieldbyName('INDE_ID').AsString),frfStkIndentOrder,nil,true);
           end;
      finally
         free;
      end;
    end;
end;

procedure TfrmStkIndentOrderList.actNewExecute(Sender: TObject);
begin
//  if not ShopGlobal.GetChkRight('11100001',2) then Raise Exception.Create('你没有新增订货单的权限,请和管理员联系.');
  inherited;

end;

procedure TfrmStkIndentOrderList.DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
//  if not ShopGlobal.GetChkRight('400021') then
     actInfo.OnExecute(nil)
//  else
//     actEdit.OnExecute(nil);

end;

procedure TfrmStkIndentOrderList.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var ARect:TRect;
begin
  inherited;
  if Column.FieldName = 'SEQNO' then
    begin
      ARect := Rect;
      DBGridEh1.canvas.Brush.Color := $0000F2F2;
      DBGridEh1.canvas.FillRect(ARect);
      DrawText(DBGridEh1.Canvas.Handle,pchar(Inttostr(cdsList.RecNo)),length(Inttostr(cdsList.RecNo)),ARect,DT_NOCLIP or DT_SINGLELINE or DT_CENTER or DT_VCENTER);
    end;

end;

procedure TfrmStkIndentOrderList.actfrmPayOrderExecute(Sender: TObject);
var
  rs:TZQuery;
  clid,cpid,oid:string;
begin
  inherited;
  if not ShopGlobal.GetChkRight('21400001',2) then Raise Exception.Create('你没有付款单的新增权限,请和管理员联系.');
  rs := TZQuery.Create(nil);
  try
  if CurOrder<>nil then
     begin
       clid := TfrmStkIndentOrder(CurOrder).edtCLIENT_ID.AsString;
       cpid := CurOrder.cid;
       oid := CurOrder.oid;
     end
  else
     begin
       if cdsList.IsEmpty then Exit;
       clid := cdsList.FieldbyName('CLIENT_ID').AsString;
       cpid := cdsList.FieldbyName('SHOP_ID').AsString;
       oid := cdsList.FieldbyName('INDE_ID').AsString;
     end;
  rs.SQL.Text
     :='select A.ABLE_ID,A.SHOP_ID,A.CLIENT_ID,B.CLIENT_NAME as CLIENT_ID_TEXT,A.STOCK_ID,A.ACCT_INFO,A.ABLE_TYPE,A.ACCT_MNY,A.PAYM_MNY,A.REVE_MNY,A.RECK_MNY,A.ABLE_DATE,A.NEAR_DATE,C.SHOP_NAME as SHOP_ID_TEXT '+
     'from ACC_PAYABLE_INFO A,VIW_CLIENTINFO B,CA_SHOP_INFO C where A.TENANT_ID=C.TENANT_ID and A.SHOP_ID=C.SHOP_ID and A.TENANT_ID=B.TENANT_ID and A.CLIENT_ID=B.CLIENT_ID and A.TENANT_ID='+inttostr(Global.TENANT_ID)+' and A.CLIENT_ID='''+clid+''' and A.RECK_MNY<>0 order by ABLE_ID';
  Factor.Open(rs);
  if rs.IsEmpty then Raise Exception.Create('当前选中的供应商没有欠款...'); 
  with TfrmPayOrder.Create(self) do
    begin
      try
        Append;
        edtCLIENT_ID.KeyValue := clid;
        edtCLIENT_ID.Text := TdsFind.GetNameByID(edtCLIENT_ID.DataSet,'CLIENT_ID','CLIENT_NAME',clid);
        rs.First;
        while not rs.eof do
          begin
            if rs.FieldbyName('RECK_MNY').AsFloat <> 0 then
               begin
                 cdsDetail.Append;
                 cdsDetail.FieldByName('ABLE_ID').AsString := rs.FieldbyName('ABLE_ID').AsString;
                 cdsDetail.FieldByName('ACCT_INFO').AsString := rs.FieldbyName('ACCT_INFO').AsString;
                 cdsDetail.FieldByName('ABLE_TYPE').AsString := rs.FieldbyName('ABLE_TYPE').AsString;
                 cdsDetail.FieldByName('RECK_MNY').AsString := rs.FieldbyName('RECK_MNY').AsString;
                 cdsDetail.FieldByName('ACCT_MNY').AsString := rs.FieldbyName('ACCT_MNY').AsString;

                 if rs.FieldbyName('STOCK_ID').AsString = oid then
                    begin
                      cdsDetail.FieldByName('A').AsString := '1';
                      cdsDetail.FieldByName('PAY_MNY').AsString := rs.FieldbyName('RECK_MNY').AsString;
                      cdsDetail.FieldByName('BALA_MNY').AsString := '0';
                    end
                 else
                    begin
                      cdsDetail.FieldByName('A').AsString := '0';
                      cdsDetail.FieldByName('PAY_MNY').AsString := '0';
                      cdsDetail.FieldByName('BALA_MNY').AsString := rs.FieldbyName('RECK_MNY').AsString;
                    end;

                 cdsDetail.FieldByName('ABLE_DATE').AsString := rs.FieldbyName('ABLE_DATE').AsString;
                 cdsDetail.FieldByName('CLIENT_ID').AsString := rs.FieldbyName('CLIENT_ID').AsString;
                 cdsDetail.FieldByName('CLIENT_ID_TEXT').AsString := rs.FieldbyName('CLIENT_ID_TEXT').AsString;
                 cdsDetail.FieldByName('SHOP_ID').AsString := rs.FieldbyName('SHOP_ID').AsString;
                 cdsDetail.FieldByName('SHOP_ID_TEXT').AsString := rs.FieldbyName('SHOP_ID_TEXT').AsString;
                 cdsDetail.Post;
               end;
            rs.Next;
          end;
        if ShowModal=MROK then
           begin
             if CurOrder<>nil then TfrmStkIndentOrder(CurOrder).ShowOweInfo;
           end;
      finally
        free;
      end;
    end;
  finally
    rs.Free;
  end;
  
end;

procedure TfrmStkIndentOrderList.frfStkIndentOrderGetValue(const ParName: String;
  var ParValue: Variant);
begin
  inherited;
  if ParName='企业名称' then ParValue := ShopGlobal.TENANT_NAME;
  if ParName='企业简称' then ParValue := ShopGlobal.SHORT_TENANT_NAME;
  if ParName='打印人' then ParValue := ShopGlobal.UserName;
end;

function TfrmStkIndentOrderList.CheckCanExport: boolean;
begin
  result:=ShopGlobal.GetChkRight('11100001',7);
end;

procedure TfrmStkIndentOrderList.PrintAfter(Sender: TObject);
var Sql_Str:String;
begin
  if CurOrder<>nil then
     Sql_Str := 'update STK_INDENTORDER set PRINT_TIMES = '+IntToStr(PrintTimes+1)+',PRINT_USER = '''+ShopGlobal.UserID+''' where TENANT_ID='+inttostr(Global.TENANT_ID)+' and INDE_ID='+QuotedStr(CurOrder.oid)
  else
     Sql_Str := 'update STK_INDENTORDER set PRINT_TIMES = '+IntToStr(PrintTimes+1)+',PRINT_USER = '''+ShopGlobal.UserID+''' where TENANT_ID='+cdsList.FieldbyName('TENANT_ID').AsString+' and INDE_ID='+QuotedStr(cdsList.FieldbyName('INDE_ID').AsString);
  Factor.ExecSQL(Sql_Str);
end;

procedure TfrmStkIndentOrderList.PrintBefore(Sender: TObject);
var rs:TZQuery;
    Sql_Str,Info:String;
    i:Integer;
begin
  rs := TZQuery.Create(nil);
  try
    if CurOrder<>nil then
       Sql_Str := 'select PRINT_TIMES,PRINT_USER from STK_INDENTORDER where TENANT_ID='+inttostr(Global.TENANT_ID)+' and INDE_ID='+QuotedStr(CurOrder.oid)
    else
       Sql_Str := 'select PRINT_TIMES,PRINT_USER from STK_INDENTORDER where TENANT_ID='+cdsList.FieldbyName('TENANT_ID').AsString+' and INDE_ID='+QuotedStr(cdsList.FieldbyName('INDE_ID').AsString);
    rs.Close;
    rs.SQL.Text := Sql_Str;
    Factor.Open(rs);
    PrintTimes := rs.FieldByName('PRINT_TIMES').AsInteger;
    if PrintTimes > 0  then
       begin
         Info := '本单据已经打印"'+IntToStr(PrintTimes)+'"次,是否再次打印!';
         i := ShowMsgBox(Pchar(Info),'友情提示...',MB_YESNO+MB_ICONQUESTION);
         if i = 7 then
          Raise Exception.Create('');

       end;
  finally
    rs.Free;
  end;
end;

procedure TfrmStkIndentOrderList.AddHandClosedPopup;
var
  p:TPopupMenu;
  Item: TMenuItem;
begin
  p := DBGridEh1.PopupMenu;
  if p=nil then Exit;
  p.OnPopup:=DoOnPmPopup; 
  Item :=TMenuItem.Create(nil);
  Item.Caption := '-';
  p.Items.Add(Item);
  //创建菜单
  HandClosedItem :=TMenuItem.Create(nil);
  HandClosedItem.Caption := '手工结案';
  HandClosedItem.OnClick := DoHandClosedClick;
  p.Items.Add(HandClosedItem);
end;

procedure TfrmStkIndentOrderList.DoOnPmPopup(Sender: TObject);
begin
  if HandClosedItem<>nil then
  begin
    HandClosedItem.Enabled:=False;
    if (not cdsList.Active) or (cdsList.IsEmpty) then Exit;
    if cdsList.FieldByName('STKBILL_STATUS').AsInteger=1 then
      HandClosedItem.Enabled:=true;  //只有发货状态才能手工结案
  end;
end;

procedure TfrmStkIndentOrderList.DoHandClosedClick(Sender: Tobject);
var
  INDE_ID,Msg: string; //订单ID
begin
  INDE_ID:=cdsList.fieldbyName('INDE_ID').AsString;
  Msg:='供应商〖'+cdsList.fieldbyName('CLIENT_NAME').AsString+'〗的采购订单〖'+cdsList.fieldbyName('GLIDE_NO').AsString+'〗手工结案成功 ！';
  if TfrmOrderHandSet.FindDialog(self,1,INDE_ID) then
  begin
    cdsList.Edit;
    cdsList.FieldByName('STKBILL_STATUS').AsString:='2'; 
    cdsList.Post;
    MessageBox(Handle,Pchar(Msg),'友情提示...',MB_OK+MB_ICONINFORMATION);
  end;
end;


end.
