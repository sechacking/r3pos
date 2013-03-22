unit ufrmInitGoods;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmWebDialogForm, ExtCtrls, RzPanel, RzTabs, cxControls,
  cxContainer, cxEdit, cxTextEdit, StdCtrls, RzButton, DB, ZBase,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, udataFactory, cxMaskEdit,
  cxButtonEdit, zrComboBoxList, cxCheckBox, cxMemo, cxDropDownEdit,
  cxRadioGroup, cxSpinEdit, cxCalendar, RzLabel, Buttons, pngimage,
  RzBckgnd, RzBorder, RzBmpBtn, Math, msxml;

type
  TfrmInitGoods = class(TfrmWebDialogForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    rzPage: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    cdsGoodsInfo: TZQuery;
    cdsGoodsRelation: TZQuery;
    edtBARCODE1: TcxTextEdit;
    edtGODS_CODE: TcxTextEdit;
    edtGODS_NAME: TcxTextEdit;
    edtCALC_UNITS: TzrComboBoxList;
    edtNEW_INPRICE: TcxTextEdit;
    edtNEW_OUTPRICE: TcxTextEdit;
    cdsBarCode: TZQuery;
    TabSheet3: TRzTabSheet;
    edtMoreUnits: TcxCheckBox;
    edtGOODS_OPTION1: TcxRadioButton;
    edtGOODS_OPTION2: TcxRadioButton;
    edtInput: TcxTextEdit;
    RzPanel7: TRzPanel;
    btnNext: TRzBitBtn;
    btnPrev: TRzBitBtn;
    edtTable: TZQuery;
    edtSORT_ID: TcxButtonEdit;
    edtSORT_ID1: TcxTextEdit;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    edtSMALLTO_CALC: TcxTextEdit;
    edtSMALL_UNITS: TzrComboBoxList;
    edtDefault1: TcxCheckBox;
    edtBARCODE2: TcxTextEdit;
    edtDefault2: TcxCheckBox;
    edtBIGTO_CALC: TcxTextEdit;
    edtBIG_UNITS: TzrComboBoxList;
    edtBARCODE3: TcxTextEdit;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    RzPanel4: TRzPanel;
    lblCaption: TRzLabel;
    adv03: TImage;
    RzBackground2: TRzBackground;
    RzBackground3: TRzBackground;
    RzBackground1: TRzBackground;
    RzLabel3: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzBorder1: TRzBorder;
    RzPanel9: TRzPanel;
    RzPanel10: TRzPanel;
    RzPanel12: TRzPanel;
    RzPanel14: TRzPanel;
    RzPanel16: TRzPanel;
    RzPanel17: TRzPanel;
    RzPanel18: TRzPanel;
    edtSHOP_NEW_OUTPRICE: TcxTextEdit;
    RzPanel5: TRzPanel;
    RzPanel6: TRzPanel;
    RzLabel6: TRzLabel;
    RzLabel10: TRzLabel;
    btnClose: TRzBmpButton;
    RzBorder2: TRzBorder;
    RzBorder3: TRzBorder;
    RzPanel8: TRzPanel;
    RzPanel11: TRzPanel;
    RzPanel13: TRzPanel;
    RzPanel15: TRzPanel;
    RzPanel19: TRzPanel;
    RzPanel20: TRzPanel;
    RzPanel21: TRzPanel;
    cdsGoodsPrice: TZQuery;
    RzPanel_SMALL: TRzPanel;
    RzPanel_BIG: TRzPanel;
    procedure FormCreate(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPrevClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtMoreUnitsPropertiesChange(Sender: TObject);
    procedure edtGOODS_OPTION1Click(Sender: TObject);
    procedure edtGOODS_OPTION2Click(Sender: TObject);
    procedure edtDefault1Click(Sender: TObject);
    procedure edtDefault2Click(Sender: TObject);
    procedure edtInputKeyPress(Sender: TObject; var Key: Char);
    procedure edtSORT_IDPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edtSMALL_UNITSPropertiesChange(Sender: TObject);
    procedure edtSMALL_UNITSSaveValue(Sender: TObject);
    procedure edtBIG_UNITSSaveValue(Sender: TObject);
    procedure edtBIG_UNITSPropertiesChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnCloseClick(Sender: TObject);
    procedure edtCALC_UNITSSaveValue(Sender: TObject);
    procedure RzPanel5Click(Sender: TObject);
    procedure RzPanel6Click(Sender: TObject);
    procedure edtCALC_UNITSPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function  GetFinded:boolean;
    procedure GetGoodsInfo;
    procedure UploadGoodsInfo;
    procedure DownloadUnits;overload;
    procedure DownloadUnits(pubGoodsinfoResp:IXMLDOMNode);overload;
    procedure RefreshUnits;
    function  IsChinese(str:string):Boolean;
    function  CanFocus(Control:TControl):Boolean;
  public
    AObj:TRecord_;
    LocalFinded:boolean;
    RemoteFinded:boolean;
    RspFinded:boolean;
    Simple:boolean;
    Dialog:boolean;
    FY_RELATION_ID:string;
    FY_TENANT_ID:string;
    procedure ReadFromObject;
    procedure WriteToObject;
    procedure CheckInput1;
    procedure CheckInput2;
    procedure OpenDataSet(tenantId,godsId:string);
    procedure PostDataSet;
    procedure SetReadOnly;
    procedure CancelReadOnly;
    procedure Save;
    function  BarCodeSimpleInit(barcode:string):boolean;
    procedure SetDialogForm;
    procedure ajustPostion;override;
    class function ShowDialog(Owner:TForm;barcode:string;var GodsId:string):boolean;
    property Finded:boolean read GetFinded;
  end;

implementation

uses uRspFactory,udllDsUtil,udllFnUtil,udllShopUtil,uTokenFactory,udllGlobal,ufrmSortDropFrom,
     uAdvFactory,uSyncFactory,uRspSyncFactory;

const
  FY_CREATOR_ID = '110000002'; //���̹�Ӧ��������,�����޸���Ʒ����

{$R *.dfm}

procedure TfrmInitGoods.FormCreate(Sender: TObject);
var
  i: integer;
  rs: TZQuery;
begin
  inherited;
  Simple := false;
  Dialog := false;
  AObj := TRecord_.Create;

  FY_RELATION_ID := '';
  FY_TENANT_ID := '';

  rs := dllGlobal.GetZQueryFromName('CA_RELATIONS');
  rs.First;
  while not rs.Eof do
    begin
      if (rs.FieldByName('RELATION_ID').AsInteger <> 1000006) and (rs.FieldByName('RELATION_TYPE').AsString = '1') then
        begin
          FY_RELATION_ID := rs.FieldByName('RELATION_ID').AsString;
          FY_TENANT_ID := rs.FieldByName('TENANT_ID').AsString;
          break;
        end;
      rs.Next;
    end;

  edtCALC_UNITS.DataSet := dllGlobal.GetZQueryFromName('PUB_MEAUNITS');
  edtSMALL_UNITS.DataSet := dllGlobal.GetZQueryFromName('PUB_MEAUNITS');
  edtBIG_UNITS.DataSet := dllGlobal.GetZQueryFromName('PUB_MEAUNITS');

  for i := 0 to rzPage.PageCount - 1 do
    begin
      rzPage.Pages[i].TabVisible := False;
    end;
  rzPage.ActivePageIndex := 0;
  btnPrev.Visible := false;
  btnNext.Visible := true;
  edtDefault1.Checked := false;
  edtDefault2.Checked := false;

  if (FY_TENANT_ID = '') or (FY_RELATION_ID = '') then
    begin
      btnNext.Enabled := false;
      Raise Exception.Create('��ǰ��ҵ��δ���˷��̹�Ӧ��...');
    end;
end;

procedure TfrmInitGoods.btnNextClick(Sender: TObject);
begin
  inherited;
  if rzPage.ActivePageIndex = 0 then
    begin
      LocalFinded := false;
      RemoteFinded := false;
      RspFinded := false;
      edtSORT_ID.Text := '';
      edtSHOP_NEW_OUTPRICE.Text := '';
      edtDefault1.Checked := false;
      edtDefault2.Checked := false;
      if edtGOODS_OPTION1.Checked then
        begin
          GetGoodsInfo;
          edtBARCODE1.Text := '';
          edtBARCODE2.Text := '';
          edtBARCODE3.Text := '';
          edtBARCODE1.Properties.ReadOnly := false;
          edtBARCODE2.Properties.ReadOnly := false;
          edtBARCODE3.Properties.ReadOnly := false;
          SetEditStyle(dsInsert, edtBARCODE1.Style);
          SetEditStyle(dsInsert, edtBARCODE2.Style);
          SetEditStyle(dsInsert, edtBARCODE3.Style);
        end
      else
        begin
          OpenDataSet(token.tenantId, '');
          edtBARCODE1.Text := '�Ա�����...';
          edtBARCODE2.Text := '�Ա�����...';
          edtBARCODE3.Text := '�Ա�����...';
          edtBARCODE1.Properties.ReadOnly := true;
          edtBARCODE2.Properties.ReadOnly := true;
          edtBARCODE3.Properties.ReadOnly := true;
          SetEditStyle(dsBrowse, edtBARCODE1.Style);
          SetEditStyle(dsBrowse, edtBARCODE2.Style);
          SetEditStyle(dsBrowse, edtBARCODE3.Style);
        end;
      ReadFromObject;
      rzPage.ActivePageIndex := 1;
      btnPrev.Visible := True;
      btnNext.Visible := True;
      if CanFocus(edtGODS_CODE) then edtGODS_CODE.SetFocus;
    end
  else if rzPage.ActivePageIndex = 1 then
    begin
      CheckInput1;
      if edtMoreUnits.Checked then
        begin
          rzPage.ActivePageIndex := 2;
          btnPrev.Visible := True;
          btnNext.Visible := True;
          btnNext.Caption := '���';
        end
      else
        begin
          WriteToObject;
          if (not Finded) and (edtGOODS_OPTION1.Checked) then UploadGoodsInfo;
          Save;
          if (not Simple) and (not Dialog) then MessageBox(Handle,'��Ʒ���ӳɹ�...','������ʾ..',MB_OK);
          rzPage.ActivePageIndex := 0;
          btnPrev.Visible := False;
          btnNext.Visible := True;
          btnNext.Caption := '��һ��';
        end;
    end
  else if rzPage.ActivePageIndex = 2 then
    begin
      CheckInput2;
      WriteToObject;
      if (not Finded) and (edtGOODS_OPTION1.Checked) then UploadGoodsInfo;
      Save;
      if (not Simple) and (not Dialog) then MessageBox(Handle,'��Ʒ���ӳɹ�...','������ʾ..',MB_OK);
      rzPage.ActivePageIndex := 0;
      btnPrev.Visible := False;
      btnNext.Visible := True;
      btnNext.Caption := '��һ��';
    end;
end;

procedure TfrmInitGoods.btnPrevClick(Sender: TObject);
begin
  inherited;
  if rzPage.ActivePageIndex = 1 then
    begin
      rzPage.ActivePageIndex := 0;
      btnPrev.Visible := False;
      btnNext.Visible := True;
      btnNext.Caption := '��һ��';
    end
  else if rzPage.ActivePageIndex = 2 then
    begin
      rzPage.ActivePageIndex := 1;
      btnPrev.Visible := True;
      btnNext.Visible := True;
      btnNext.Caption := '��һ��';
    end;
end;

procedure TfrmInitGoods.GetGoodsInfo;
var
  barcode,godsId:string;
  outxml:widestring;
  doc:IXMLDomDocument;
  pubGoodsinfoResp:IXMLDOMNode;
  hasGoods:TZQuery;
  tmpGoodsInfo,tmpBarCode:TZQuery;
  Params:TftParamList;
  tmpObj:TRecord_;
begin
  barcode := trim(edtInput.Text);
  if barcode = '' then
    begin
      if CanFocus(edtInput) then edtInput.SetFocus;
      Raise Exception.Create('������������...');
    end;
  if IsChinese(barcode) or (Length(barcode) <> 13) then
    begin
      if CanFocus(edtInput) then edtInput.SetFocus;
      Raise Exception.Create('�������ʽ���Ϸ�...');
    end;

  // ��ѯ�Ծ�Ӫ��Ʒ
  hasGoods := TZQuery.Create(nil);
  try
    hasGoods.SQL.Text := 'select GODS_ID from PUB_BARCODE where TENANT_ID = ' + FY_TENANT_ID + ' and BARCODE = '''+barcode+''' ';
    dataFactory.Open(hasGoods);
    if not hasGoods.IsEmpty then
      begin
        godsId := hasGoods.FieldByName('GODS_ID').AsString;
        hasGoods.Close;
        hasGoods.SQL.Text := 'select GODS_ID from PUB_GOODSINFO where TENANT_ID = ' + FY_TENANT_ID + ' and GODS_ID = ''' + godsId + '''';
        dataFactory.Open(hasGoods);
        if not hasGoods.IsEmpty then
          begin
            LocalFinded := true;
            godsId := hasGoods.FieldByName('GODS_ID').AsString;
          end
        else
          begin
            LocalFinded := false;
            godsId := '';
          end;
      end;
  finally
    hasGoods.Free;
  end;

  // ��ѯ�������Ʒ
  if (not Finded) and (dataFactory.iDbType = 5) then
    begin
      dataFactory.MoveToRemote;
      hasGoods := TZQuery.Create(nil);
      try
        hasGoods.SQL.Text := 'select GODS_ID from PUB_BARCODE where  TENANT_ID = ' + FY_TENANT_ID + ' and BARCODE = '''+barcode+''' ';
        dataFactory.Open(hasGoods);
        if not hasGoods.IsEmpty then
          begin
            godsId := hasGoods.FieldByName('GODS_ID').AsString;
            hasGoods.Close;
            hasGoods.SQL.Text := 'select GODS_ID from PUB_GOODSINFO where TENANT_ID = ' + FY_TENANT_ID + ' and GODS_ID = ''' + godsId + '''';
            dataFactory.Open(hasGoods);
            if not hasGoods.IsEmpty then
              begin
                RemoteFinded := true;
                godsId := hasGoods.FieldByName('GODS_ID').AsString;
              end
            else
              begin
                RemoteFinded := false;
                godsId := '';
              end;
          end;
      finally
        hasGoods.Free;
        dataFactory.MoveToDefault;
      end;
    end;

  // ��ѯRSP��Ʒ
  if not Finded then
    begin
      try
        outxml := rspFactory.getGoodsInfo(barcode);
        doc := rspFactory.CreateXML(outxml);
        pubGoodsinfoResp := rspFactory.FindNode(doc,'body');
        pubGoodsinfoResp := pubGoodsinfoResp.firstChild;
        if pubGoodsinfoResp <> nil then
          begin
            RspFinded := true;
            godsId := rspFactory.GetNodeValue(pubGoodsinfoResp,'godsId');
          end
        else
          begin
            RspFinded := false;
            godsId := '';
          end;
      except
        on E:Exception do
           begin
             RspFinded := false;
             godsId := '';
             Raise Exception.Create('��ѯ��Ʒ��Ϣʧ�ܣ�ԭ��'+E.Message);
           end;
      end;
    end;

  if not Finded then
    begin
      try
        RspSyncFactory.downloadGoodsSort;
      except
        on E:Exception do
           Raise Exception.Create('������Ʒ����ʧ�ܣ�ԭ��'+E.Message);
      end;
    end;

  OpenDataSet(FY_TENANT_ID, godsId);

  if LocalFinded then
    begin
      if Copy(cdsGoodsInfo.FieldByName('COMM').AsString,2,2) = '2' then
        begin
          cdsGoodsInfo.Edit;
          cdsGoodsInfo.Post;
        end;
      cdsBarCode.First;
      while not cdsBarCode.Eof do
        begin
          if Copy(cdsBarCode.FieldByName('COMM').AsString,2,2) = '2' then
            begin
              cdsBarCode.Edit;
              cdsBarCode.Post;
            end;
          cdsBarCode.Next;
        end;
      if cdsGoodsRelation.IsEmpty then
        begin
          cdsGoodsRelation.Append;
          cdsGoodsRelation.FieldByName('ROWS_ID').AsString := TSequence.NewId;
          cdsGoodsRelation.FieldByName('TENANT_ID').AsInteger := strtoint(token.tenantId);
          cdsGoodsRelation.FieldByName('GODS_ID').AsString := cdsGoodsInfo.FieldByName('GODS_ID').AsString;
          cdsGoodsRelation.FieldByName('RELATION_ID').AsInteger := strtoint(FY_RELATION_ID);
          cdsGoodsRelation.FieldByName('NEW_INPRICE').AsFloat := cdsGoodsInfo.FieldByName('NEW_INPRICE').AsFloat;
          cdsGoodsRelation.FieldByName('NEW_OUTPRICE').AsFloat := cdsGoodsInfo.FieldByName('NEW_OUTPRICE').AsFloat;
          cdsGoodsRelation.FieldByName('ZOOM_RATE').AsFloat := 1.000;
          cdsGoodsRelation.Post;
        end
      else
        begin
          if Copy(cdsGoodsRelation.FieldByName('COMM').AsString,2,2) = '2' then
            begin
              cdsGoodsRelation.Edit;
              cdsGoodsRelation.Post;
            end;
        end;
    end;

  if RemoteFinded then
    begin
      tmpGoodsInfo := TZQuery.Create(nil);
      tmpBarCode := TZQuery.Create(nil);
      Params := TftParamList.Create(nil);
      dataFactory.MoveToRemote;
      try
        Params.ParamByName('TENANT_ID').AsInteger := strtoint(FY_TENANT_ID);
        Params.ParamByName('GODS_ID').AsString := godsId;
        dataFactory.Open(tmpGoodsInfo,'TGoodsInfoV60',Params);
        dataFactory.Open(tmpBarCode,'TBarCodeV60',Params);

        cdsGoodsInfo.Edit;
        tmpObj := TRecord_.Create;
        try
          tmpObj.ReadFromDataSet(tmpGoodsInfo);
          tmpObj.WriteToDataSet(cdsGoodsInfo);
        finally
          tmpObj.Free;
        end;

        tmpObj := TRecord_.Create;
        try
          if tmpBarCode.Locate('BARCODE_TYPE','0',[]) then
            begin
              if cdsBarCode.Locate('BARCODE_TYPE','0',[]) then
                cdsBarCode.Edit
              else
                cdsBarCode.Append;
              tmpObj.ReadFromDataSet(tmpBarCode);
              tmpObj.WriteToDataSet(cdsBarCode);
            end
          else
            begin
              if cdsBarCode.Locate('BARCODE_TYPE','0',[]) then
                cdsBarCode.Delete;
            end;

          if tmpBarCode.Locate('BARCODE_TYPE','1',[]) then
            begin
              if cdsBarCode.Locate('BARCODE_TYPE','1',[]) then
                cdsBarCode.Edit
              else
                cdsBarCode.Append;
              tmpObj.ReadFromDataSet(tmpBarCode);
              tmpObj.WriteToDataSet(cdsBarCode);
            end
          else
            begin
              if cdsBarCode.Locate('BARCODE_TYPE','1',[]) then
                cdsBarCode.Delete;
            end;

          if tmpBarCode.Locate('BARCODE_TYPE','2',[]) then
            begin
              if cdsBarCode.Locate('BARCODE_TYPE','2',[]) then
                cdsBarCode.Edit
              else
                cdsBarCode.Append;
              tmpObj.ReadFromDataSet(tmpBarCode);
              tmpObj.WriteToDataSet(cdsBarCode);
            end
          else
            begin
              if cdsBarCode.Locate('BARCODE_TYPE','2',[]) then
                cdsBarCode.Delete;
            end;
        finally
          tmpObj.Free;
        end;
      finally
        dataFactory.MoveToDefault;
        tmpGoodsInfo.Free;
        tmpBarCode.Free;
        Params.Free;
      end;

      if cdsGoodsRelation.IsEmpty then
        begin
          cdsGoodsRelation.Append;
          cdsGoodsRelation.FieldByName('ROWS_ID').AsString := TSequence.NewId;
        end
      else
        cdsGoodsRelation.Edit;
      cdsGoodsRelation.FieldByName('TENANT_ID').AsInteger := strtoint(token.tenantId);
      cdsGoodsRelation.FieldByName('GODS_ID').AsString := cdsGoodsInfo.FieldByName('GODS_ID').AsString;
      cdsGoodsRelation.FieldByName('RELATION_ID').AsInteger := strtoint(FY_RELATION_ID);
      cdsGoodsRelation.FieldByName('NEW_INPRICE').AsFloat := cdsGoodsInfo.FieldByName('NEW_INPRICE').AsFloat;
      cdsGoodsRelation.FieldByName('NEW_OUTPRICE').AsFloat := cdsGoodsInfo.FieldByName('NEW_OUTPRICE').AsFloat;
      cdsGoodsRelation.FieldByName('ZOOM_RATE').AsFloat := 1.000;

      PostDataSet;

      DownloadUnits;
    end;

  if RspFinded then
    begin
      if cdsGoodsInfo.IsEmpty then
        cdsGoodsInfo.Append
      else
        cdsGoodsInfo.Edit;
      cdsGoodsInfo.FieldByName('TENANT_ID').AsInteger := strtoint(rspFactory.GetNodeValue(pubGoodsinfoResp,'tenantId'));
      cdsGoodsInfo.FieldByName('GODS_ID').AsString := rspFactory.GetNodeValue(pubGoodsinfoResp,'godsId');
      cdsGoodsInfo.FieldByName('GODS_CODE').AsString := rspFactory.GetNodeValue(pubGoodsinfoResp,'godsCode');
      cdsGoodsInfo.FieldByName('GODS_NAME').AsString := rspFactory.GetNodeValue(pubGoodsinfoResp,'godsName');
      cdsGoodsInfo.FieldByName('GODS_SPELL').AsString := rspFactory.GetNodeValue(pubGoodsinfoResp,'godsSpell');
      cdsGoodsInfo.FieldByName('GODS_TYPE').AsInteger := strtoint(rspFactory.GetNodeValue(pubGoodsinfoResp,'godsType'));
      cdsGoodsInfo.FieldByName('SORT_ID1').AsString := rspFactory.GetNodeValue(pubGoodsinfoResp,'sortId1');
      cdsGoodsInfo.FieldByName('UNIT_ID').AsString := rspFactory.GetNodeValue(pubGoodsinfoResp,'unitId');
      cdsGoodsInfo.FieldByName('CALC_UNITS').AsString := rspFactory.GetNodeValue(pubGoodsinfoResp,'calcUnits');
      cdsGoodsInfo.FieldByName('BARCODE').AsString := rspFactory.GetNodeValue(pubGoodsinfoResp,'barcode');
      cdsGoodsInfo.FieldByName('SMALL_UNITS').AsString := rspFactory.GetNodeValue(pubGoodsinfoResp,'smallUnits');
      cdsGoodsInfo.FieldByName('SMALLTO_CALC').AsFloat := strtofloat(rspFactory.GetNodeValue(pubGoodsinfoResp,'smalltoCalc'));
      cdsGoodsInfo.FieldByName('BIG_UNITS').AsString := rspFactory.GetNodeValue(pubGoodsinfoResp,'bigUnits');
      cdsGoodsInfo.FieldByName('BIGTO_CALC').AsFloat := strtofloat(rspFactory.GetNodeValue(pubGoodsinfoResp,'bigtoCalc'));
      cdsGoodsInfo.FieldByName('NEW_INPRICE').AsFloat := strtofloat(rspFactory.GetNodeValue(pubGoodsinfoResp,'newInprice'));
      cdsGoodsInfo.FieldByName('NEW_OUTPRICE').AsFloat := strtofloat(rspFactory.GetNodeValue(pubGoodsinfoResp,'newOutprice'));
      cdsGoodsInfo.FieldByName('NEW_LOWPRICE').AsFloat := strtofloat(rspFactory.GetNodeValue(pubGoodsinfoResp,'newLowprice'));
      cdsGoodsInfo.FieldByName('USING_PRICE').AsInteger := strtoint(rspFactory.GetNodeValue(pubGoodsinfoResp,'usingPrice'));
      cdsGoodsInfo.FieldByName('HAS_INTEGRAL').AsInteger := strtoint(rspFactory.GetNodeValue(pubGoodsinfoResp,'hasIntegral'));
      cdsGoodsInfo.FieldByName('USING_BATCH_NO').AsInteger := strtoint(rspFactory.GetNodeValue(pubGoodsinfoResp,'usingBatchNo'));
      cdsGoodsInfo.FieldByName('USING_BARTER').AsInteger := strtoint(rspFactory.GetNodeValue(pubGoodsinfoResp,'usingBarter'));
      cdsGoodsInfo.FieldByName('USING_LOCUS_NO').AsInteger := strtoint(rspFactory.GetNodeValue(pubGoodsinfoResp,'usingLocusNo'));
      cdsGoodsInfo.FieldByName('BARTER_INTEGRAL').AsInteger := strtoint(rspFactory.GetNodeValue(pubGoodsinfoResp,'barterIntegral'));

      if cdsBarCode.Locate('BARCODE_TYPE', '0', []) then
        cdsBarCode.Edit
      else
      begin
        cdsBarCode.Append;
        cdsBarCode.FieldByName('ROWS_ID').AsString := rspFactory.GetNodeValue(pubGoodsinfoResp,'calcRowsId');
      end;
      cdsBarCode.FieldByName('TENANT_ID').AsInteger := strtoint(rspFactory.GetNodeValue(pubGoodsinfoResp,'tenantId'));
      cdsBarCode.FieldByName('GODS_ID').AsString := rspFactory.GetNodeValue(pubGoodsinfoResp,'godsId');
      cdsBarCode.FieldByName('PROPERTY_01').AsString := '#';
      cdsBarCode.FieldByName('PROPERTY_02').AsString := '#';
      cdsBarCode.FieldByName('UNIT_ID').AsString := rspFactory.GetNodeValue(pubGoodsinfoResp,'calcUnits');
      cdsBarCode.FieldByName('BARCODE_TYPE').AsString := '0';
      cdsBarCode.FieldByName('BATCH_NO').AsString := '#';
      cdsBarCode.FieldByName('BARCODE').AsString := rspFactory.GetNodeValue(pubGoodsinfoResp,'barcode');

      if cdsGoodsInfo.FieldByName('SMALL_UNITS').AsString <> '' then
        begin
          if cdsBarCode.Locate('BARCODE_TYPE', '1', []) then
            cdsBarCode.Edit
          else
          begin
            cdsBarCode.Append;
            cdsBarCode.FieldByName('ROWS_ID').AsString := rspFactory.GetNodeValue(pubGoodsinfoResp,'smallRowsId');
          end;
          cdsBarCode.FieldByName('TENANT_ID').AsInteger := strtoint(rspFactory.GetNodeValue(pubGoodsinfoResp,'tenantId'));
          cdsBarCode.FieldByName('GODS_ID').AsString := rspFactory.GetNodeValue(pubGoodsinfoResp,'godsId');
          cdsBarCode.FieldByName('PROPERTY_01').AsString := '#';
          cdsBarCode.FieldByName('PROPERTY_02').AsString := '#';
          cdsBarCode.FieldByName('UNIT_ID').AsString := rspFactory.GetNodeValue(pubGoodsinfoResp,'smallUnits');
          cdsBarCode.FieldByName('BARCODE_TYPE').AsString := '1';
          cdsBarCode.FieldByName('BATCH_NO').AsString := '#';
          cdsBarCode.FieldByName('BARCODE').AsString := rspFactory.GetNodeValue(pubGoodsinfoResp,'smallBarcode');
        end;
      if cdsGoodsInfo.FieldByName('BIG_UNITS').AsString <> '' then
        begin
          if cdsBarCode.Locate('BARCODE_TYPE', '2', []) then
            cdsBarCode.Edit
          else
          begin
            cdsBarCode.Append;
            cdsBarCode.FieldByName('ROWS_ID').AsString := rspFactory.GetNodeValue(pubGoodsinfoResp,'bigRowsId');
          end;
          cdsBarCode.FieldByName('TENANT_ID').AsInteger := strtoint(rspFactory.GetNodeValue(pubGoodsinfoResp,'tenantId'));
          cdsBarCode.FieldByName('GODS_ID').AsString := rspFactory.GetNodeValue(pubGoodsinfoResp,'godsId');
          cdsBarCode.FieldByName('PROPERTY_01').AsString := '#';
          cdsBarCode.FieldByName('PROPERTY_02').AsString := '#';
          cdsBarCode.FieldByName('UNIT_ID').AsString := rspFactory.GetNodeValue(pubGoodsinfoResp,'bigUnits');
          cdsBarCode.FieldByName('BARCODE_TYPE').AsString := '2';
          cdsBarCode.FieldByName('BATCH_NO').AsString := '#';
          cdsBarCode.FieldByName('BARCODE').AsString := rspFactory.GetNodeValue(pubGoodsinfoResp,'bigBarcode');
        end;

      if cdsGoodsRelation.IsEmpty then
      begin
        cdsGoodsRelation.Append;
        cdsGoodsRelation.FieldByName('ROWS_ID').AsString := TSequence.NewId;
      end
      else
        cdsGoodsRelation.Edit;
      cdsGoodsRelation.FieldByName('TENANT_ID').AsInteger := strtoint(token.tenantId);
      cdsGoodsRelation.FieldByName('GODS_ID').AsString := cdsGoodsInfo.FieldByName('GODS_ID').AsString;
      cdsGoodsRelation.FieldByName('RELATION_ID').AsInteger := strtoint(FY_RELATION_ID);
      cdsGoodsRelation.FieldByName('NEW_INPRICE').AsFloat := cdsGoodsInfo.FieldByName('NEW_INPRICE').AsFloat;
      cdsGoodsRelation.FieldByName('NEW_OUTPRICE').AsFloat := cdsGoodsInfo.FieldByName('NEW_OUTPRICE').AsFloat;
      cdsGoodsRelation.FieldByName('ZOOM_RATE').AsFloat := 1.000;

      PostDataSet;

      DownloadUnits(pubGoodsinfoResp);
    end;

  edtTable.Data := cdsGoodsInfo.Data;
end;

procedure TfrmInitGoods.UploadGoodsInfo;
var
  doc:IXMLDomDocument;
  node:IXMLDOMNode;
  success:boolean;
begin
  doc := rspFactory.CreateRspXML;
  Node := doc.CreateElement('flag');
  Node.text := '1';
  rspFactory.FindNode(doc,'header\pub').appendChild(Node);

  Node := doc.CreateElement('pubGoodsinfo');
  rspFactory.FindNode(doc,'body').appendChild(Node);

  Node := doc.CreateElement('tenantId');
  Node.text := cdsGoodsInfo.FieldByName('TENANT_ID').AsString;
  rspFactory.FindNode(doc,'body\pubGoodsinfo').appendChild(Node);

  Node := doc.CreateElement('relationId');
  Node.text := FY_RELATION_ID;
  rspFactory.FindNode(doc,'body\pubGoodsinfo').appendChild(Node);

  Node := doc.CreateElement('godsId');
  Node.text := cdsGoodsInfo.FieldByName('GODS_ID').AsString;
  rspFactory.FindNode(doc,'body\pubGoodsinfo').appendChild(Node);

  Node := doc.CreateElement('godsCode');
  Node.text := cdsGoodsInfo.FieldByName('GODS_CODE').AsString;
  rspFactory.FindNode(doc,'body\pubGoodsinfo').appendChild(Node);

  Node := doc.CreateElement('godsName');
  Node.text := cdsGoodsInfo.FieldByName('GODS_NAME').AsString;
  rspFactory.FindNode(doc,'body\pubGoodsinfo').appendChild(Node);

  Node := doc.CreateElement('godsSpell');
  Node.text := cdsGoodsInfo.FieldByName('GODS_SPELL').AsString;
  rspFactory.FindNode(doc,'body\pubGoodsinfo').appendChild(Node);

  Node := doc.CreateElement('godsType');
  Node.text := '1';
  rspFactory.FindNode(doc,'body\pubGoodsinfo').appendChild(Node);

  Node := doc.CreateElement('sortId1');
  Node.text := cdsGoodsInfo.FieldByName('SORT_ID1').AsString;
  rspFactory.FindNode(doc,'body\pubGoodsinfo').appendChild(Node);

  Node := doc.CreateElement('unitId');
  Node.text := cdsGoodsInfo.FieldByName('UNIT_ID').AsString;
  rspFactory.FindNode(doc,'body\pubGoodsinfo').appendChild(Node);

  Node := doc.CreateElement('calcUnits');
  Node.text := cdsGoodsInfo.FieldByName('CALC_UNITS').AsString;
  rspFactory.FindNode(doc,'body\pubGoodsinfo').appendChild(Node);

  Node := doc.CreateElement('barcode');
  Node.text := cdsGoodsInfo.FieldByName('BARCODE').AsString;
  rspFactory.FindNode(doc,'body\pubGoodsinfo').appendChild(Node);

  Node := doc.CreateElement('newInprice');
  Node.text := cdsGoodsInfo.FieldByName('NEW_INPRICE').AsString;
  rspFactory.FindNode(doc,'body\pubGoodsinfo').appendChild(Node);

  Node := doc.CreateElement('newOutprice');
  Node.text := cdsGoodsInfo.FieldByName('NEW_OUTPRICE').AsString;
  rspFactory.FindNode(doc,'body\pubGoodsinfo').appendChild(Node);

  if cdsBarCode.Locate('BARCODE_TYPE', '0', []) then
    begin
      Node := doc.CreateElement('calcRowsId');
      Node.text := cdsBarCode.FieldByName('ROWS_ID').AsString;
      rspFactory.FindNode(doc,'body\pubGoodsinfo').appendChild(Node);
    end;

  if cdsGoodsInfo.FieldByName('SMALL_UNITS').AsString <> '' then
    begin
      Node := doc.CreateElement('smallUnits');
      Node.text := cdsGoodsInfo.FieldByName('SMALL_UNITS').AsString;
      rspFactory.FindNode(doc,'body\pubGoodsinfo').appendChild(Node);

      Node := doc.CreateElement('smalltoCalc');
      Node.text := cdsGoodsInfo.FieldByName('SMALLTO_CALC').AsString;
      rspFactory.FindNode(doc,'body\pubGoodsinfo').appendChild(Node);

      if cdsBarCode.Locate('BARCODE_TYPE', '1', []) then
        begin
          Node := doc.CreateElement('smallRowsId');
          Node.text := cdsBarCode.FieldByName('ROWS_ID').AsString;
          rspFactory.FindNode(doc,'body\pubGoodsinfo').appendChild(Node);

          Node := doc.CreateElement('smallBarcode');
          Node.text := cdsBarCode.FieldByName('BARCODE').AsString;
          rspFactory.FindNode(doc,'body\pubGoodsinfo').appendChild(Node);
        end;
    end;

  if cdsGoodsInfo.FieldByName('BIG_UNITS').AsString <> '' then
    begin
      Node := doc.CreateElement('bigUnits');
      Node.text := cdsGoodsInfo.FieldByName('BIG_UNITS').AsString;
      rspFactory.FindNode(doc,'body\pubGoodsinfo').appendChild(Node);

      Node := doc.CreateElement('bigtoCalc');
      Node.text := cdsGoodsInfo.FieldByName('BIGTO_CALC').AsString;
      rspFactory.FindNode(doc,'body\pubGoodsinfo').appendChild(Node);

      if cdsBarCode.Locate('BARCODE_TYPE', '2', []) then
        begin
          Node := doc.CreateElement('bigRowsId');
          Node.text := cdsBarCode.FieldByName('ROWS_ID').AsString;
          rspFactory.FindNode(doc,'body\pubGoodsinfo').appendChild(Node);

          Node := doc.CreateElement('bigBarcode');
          Node.text := cdsBarCode.FieldByName('BARCODE').AsString;
          rspFactory.FindNode(doc,'body\pubGoodsinfo').appendChild(Node);
        end;
    end;
  
  Node := doc.CreateElement('usingPrice');
  Node.text := '1';
  rspFactory.FindNode(doc,'body\pubGoodsinfo').appendChild(Node);
  
  Node := doc.CreateElement('hasIntegral');
  Node.text := '1';
  rspFactory.FindNode(doc,'body\pubGoodsinfo').appendChild(Node);
  
  Node := doc.CreateElement('usingBatchNo');
  Node.text := '1';
  rspFactory.FindNode(doc,'body\pubGoodsinfo').appendChild(Node);
  
  Node := doc.CreateElement('usingBarter');
  Node.text := '1';
  rspFactory.FindNode(doc,'body\pubGoodsinfo').appendChild(Node);

  Node := doc.CreateElement('usingLocusNo');
  Node.text := '2';
  rspFactory.FindNode(doc,'body\pubGoodsinfo').appendChild(Node);
  
  Node := doc.CreateElement('barterIntegral');
  Node.text := '0';
  rspFactory.FindNode(doc,'body\pubGoodsinfo').appendChild(Node);

  try
    success := rspFactory.uploadGoods('<?xml version="1.0" encoding="gb2312"?>'+doc.xml)
  except
    on E:Exception do
       Raise Exception.Create('������Ʒʧ�ܣ�ԭ��'+E.Message);
  end;
  if not success then Raise Exception.Create('������Ʒʧ��...');
end;

procedure TfrmInitGoods.CheckInput1;
  procedure CheckGodsMaxPrice(edtPrice: TcxTextEdit;MsgInfo: string);
    begin
      if StrToFloatDef(edtPrice.Text,0) > 999999999 then
        begin
          if CanFocus(edtPrice) then edtPrice.SetFocus;
          Raise Exception.Create('����ġ�'+MsgInfo+'����ֵ������Ч...');
        end;
    end;
begin
  if edtGOODS_OPTION1.Checked then //��������Ʒ�����������
    begin
      if trim(edtBARCODE1.Text)='' then
        begin
          if CanFocus(edtBARCODE1) then edtBARCODE1.SetFocus;
          Raise Exception.Create('���벻��Ϊ�գ������룡');
        end;
    end;

  if trim(edtGODS_CODE.Text)='' then
    begin
      if CanFocus(edtGODS_CODE) then edtGODS_CODE.SetFocus;
      Raise Exception.Create('���Ų���Ϊ�գ������룡');
    end;

  if Length(edtGODS_CODE.Text)>20 then edtGODS_CODE.Text:=Copy(edtGODS_CODE.Text,1,20);

  if trim(edtGODS_NAME.Text)='' then
    begin
      if CanFocus(edtGODS_NAME) then edtGODS_NAME.SetFocus;
      Raise Exception.Create('��Ʒ���Ʋ���Ϊ�գ�');
    end;

  if trim(edtCALC_UNITS.Text)='' then edtCALC_UNITS.KeyValue := null;

  if (trim(edtCALC_UNITS.AsString)='') or (trim(edtCALC_UNITS.Text)='') then
    begin
      if CanFocus(edtCALC_UNITS) then edtCALC_UNITS.SetFocus;
      Raise Exception.Create('������λ����Ϊ�գ�');
    end;

  if (not Simple) and (trim(edtSORT_ID1.Text)='') then
    begin
      if CanFocus(edtSORT_ID) then edtSORT_ID.SetFocus;
      Raise Exception.Create('��Ʒ���಻��Ϊ�գ�');
    end;

  if trim(edtNEW_INPRICE.Text)='' then
    begin
      if CanFocus(edtNEW_INPRICE) then edtNEW_INPRICE.SetFocus;
      Raise Exception.Create('��׼���۲���Ϊ�գ�');
    end;
  if trim(edtNEW_OUTPRICE.Text)='' then
    begin
      if CanFocus(edtNEW_OUTPRICE) then edtNEW_OUTPRICE.SetFocus;
      Raise Exception.Create('��׼�ۼ۲���Ϊ�գ�');
    end;
  if trim(edtSHOP_NEW_OUTPRICE.Text)='' then
    begin
      if CanFocus(edtSHOP_NEW_OUTPRICE) then edtSHOP_NEW_OUTPRICE.SetFocus;
      Raise Exception.Create('�����ۼ۲���Ϊ�գ�');
    end;

  CheckGodsMaxPrice(edtNEW_INPRICE,'��׼����');
  CheckGodsMaxPrice(edtNEW_OUTPRICE,'��׼�ۼ�');
  CheckGodsMaxPrice(edtSHOP_NEW_OUTPRICE,'�����ۼ�');

  if StrToFloatDef(trim(edtNEW_OUTPRICE.Text),0) < StrToFloatDef(trim(edtNEW_INPRICE.Text),0) then
    begin
      if CanFocus(edtNEW_OUTPRICE) then edtNEW_OUTPRICE.SetFocus;
      Raise Exception.Create('��׼�ۼ۲���С�ڱ�׼���ۣ�');
    end;
  if StrToFloatDef(trim(edtSHOP_NEW_OUTPRICE.Text),0) < StrToFloatDef(trim(edtNEW_INPRICE.Text),0) then
    begin
      if CanFocus(edtSHOP_NEW_OUTPRICE) then edtSHOP_NEW_OUTPRICE.SetFocus;
      Raise Exception.Create('�����ۼ۲���С�ڱ�׼���ۣ�');
    end;
end;

procedure TfrmInitGoods.CheckInput2;
begin
  if edtGOODS_OPTION1.Checked then //��������Ʒ�����������
    begin
      if (trim(edtSMALL_UNITS.AsString)<>'') and (trim(edtBARCODE2.Text)='') then
        begin
          if CanFocus(edtSMALL_UNITS) then edtSMALL_UNITS.SetFocus;
          Raise Exception.Create('С��װ���벻��Ϊ�գ�');
        end;
      if (trim(edtBIG_UNITS.AsString)<>'') and (trim(edtBARCODE3.Text)='') then
        begin
          if CanFocus(edtBIG_UNITS) then edtBIG_UNITS.SetFocus;
          Raise Exception.Create('���װ���벻��Ϊ�գ�');
        end;
      if (trim(edtSMALL_UNITS.AsString)<>'') and (trim(edtBARCODE2.Text)=trim(edtBARCODE1.Text)) then
        begin
          if CanFocus(edtBARCODE2) then edtBARCODE2.SetFocus;
          Raise Exception.Create('С��װ���벻���������λ������ͬ��');
        end;
      if (trim(edtBIG_UNITS.AsString)<>'') and (trim(edtBARCODE3.Text)=trim(edtBARCODE1.Text)) then
        begin
          if CanFocus(edtBARCODE3) then edtBARCODE3.SetFocus;
          Raise Exception.Create('���װ���벻���������λ������ͬ��');
        end;
      if (trim(edtSMALL_UNITS.AsString)<>'') and (trim(edtBIG_UNITS.AsString)<>'') and (trim(edtBARCODE3.Text)=trim(edtBARCODE1.Text)) then
        begin
          if CanFocus(edtBARCODE3) then edtBARCODE3.SetFocus;
          Raise Exception.Create('���װ���벻����С��װ������ͬ��');
        end;
    end;
  
  if (trim(edtSMALL_UNITS.AsString)<>'') and (StrToFloatDef(edtSMALLTO_CALC.Text,0)<=0) then
    begin
      if CanFocus(edtSMALLTO_CALC) then edtSMALLTO_CALC.SetFocus;
      Raise Exception.Create('С��װ��λ�Ļ���ϵ������С�ڵ���0!');
    end;
  if (trim(edtBIG_UNITS.AsString)<>'') and (StrToFloatDef(edtBIGTO_CALC.Text,0)<=0) then
    begin
      if CanFocus(edtBIGTO_CALC) then   edtBIGTO_CALC.SetFocus;
      Raise Exception.Create('���װ��λ�Ļ���ϵ������С�ڵ���0!');
    end;

  if trim(edtCALC_UNITS.AsString)=trim(edtSMALL_UNITS.AsString) then
    begin
      if CanFocus(edtSMALL_UNITS) then edtSMALL_UNITS.SetFocus;
      Raise Exception.Create('С��װ��λ���ܺͼ�����λ��ͬ��');
    end;
  if trim(edtCALC_UNITS.AsString)=trim(edtBIG_UNITS.AsString) then
    begin
      if CanFocus(edtBIG_UNITS) then edtBIG_UNITS.SetFocus;
      Raise Exception.Create('���װ��λ���ܺͼ�����λ��ͬ��');
    end;
  if (trim(edtSMALL_UNITS.AsString)=trim(edtBIG_UNITS.AsString)) and (trim(edtSMALL_UNITS.AsString)<>'') then
    begin
      if CanFocus(edtBIG_UNITS) then edtBIG_UNITS.SetFocus;
      Raise Exception.Create('���װ��λ���ܺ�С��װ��λ��ͬ��');
    end;

  if (edtDefault1.Checked) and (trim(edtSMALL_UNITS.AsString)='') then
    begin
      if CanFocus(edtSMALL_UNITS) then edtSMALL_UNITS.SetFocus;
      Raise Exception.Create('С��װ��λ��ΪĬ�ϵ�λ����Ϊ��');
    end;
  if (edtDefault1.Checked) and (StrToFloatDef(edtSMALLTO_CALC.Text,0)<=0) then
    begin
      if CanFocus(edtSMALLTO_CALC) then edtSMALLTO_CALC.SetFocus;
      Raise Exception.Create('С��װ��λ�Ļ���ϵ������С�ڵ���0!');
    end;
  if (edtDefault2.Checked) and (trim(edtBIG_UNITS.AsString)='') then
    begin
      if CanFocus(edtBIG_UNITS) then edtBIG_UNITS.SetFocus;
      Raise Exception.Create('���װ��λ��ΪĬ�ϵ�λ����Ϊ��');
    end;
  if (edtDefault2.Checked) and (StrToFloatDef(edtBIGTO_CALC.Text,0)<=0) then
    begin
      if CanFocus(edtBIGTO_CALC) then edtBIGTO_CALC.SetFocus;
      Raise Exception.Create('���װ��λ�Ļ���ϵ������С�ڵ���0!');
    end;
end;

procedure TfrmInitGoods.ReadFromObject;
var rs: TZQuery;
begin
  AObj.ReadFromDataSet(cdsGoodsInfo);
  udllShopUtil.ReadFromObject(AObj,self);

  if cdsBarCode.Locate('BARCODE_TYPE', '0', []) then
    edtBARCODE1.Text := cdsBarCode.FieldByName('BARCODE').AsString;

  if edtGOODS_OPTION1.Checked and (edtBARCODE1.Text = '') then
    edtBARCODE1.Text := edtInput.Text;

  if cdsGoodsInfo.FieldByName('SMALL_UNITS').AsString <> '' then
    begin
      if cdsBarCode.Locate('BARCODE_TYPE', '1', []) then
        edtBARCODE2.Text := cdsBarCode.FieldByName('BARCODE').AsString;
    end
  else edtSMALLTO_CALC.Text := '';
  if cdsGoodsInfo.FieldByName('BIG_UNITS').AsString <> '' then
    begin
      if cdsBarCode.Locate('BARCODE_TYPE', '2', []) then
        edtBARCODE3.Text := cdsBarCode.FieldByName('BARCODE').AsString;
    end
  else edtBIGTO_CALC.Text := '';

  if (cdsGoodsInfo.FieldByName('SMALL_UNITS').AsString <> '') and
     (cdsGoodsInfo.FieldByName('UNIT_ID').AsString = cdsGoodsInfo.FieldByName('SMALL_UNITS').AsString) then
    edtDefault1.Checked := true
  else
  if (cdsGoodsInfo.FieldByName('BIG_UNITS').AsString <> '') and
     (cdsGoodsInfo.FieldByName('UNIT_ID').AsString = cdsGoodsInfo.FieldByName('BIG_UNITS').AsString) then
    edtDefault2.Checked := true;

  if Finded then
    begin
      SetReadOnly;

      if RspFinded then //RSP�ҵ���Ʒ�������̹�Ӧ��֮�ⲻ�����޸ķ���
      begin
        if cdsGoodsInfo.FieldByName('TENANT_ID').AsString <> FY_CREATOR_ID then
          begin
            rs := dllGlobal.GetZQueryFromName('PUB_GOODSSORT');
            if rs.Locate('SORT_ID',cdsGoodsInfo.FieldByName('SORT_ID1').AsString,[]) then
              edtSORT_ID.Text := rs.FieldByName('SORT_NAME').AsString;
            edtSORT_ID1.Properties.ReadOnly := true;
            SetEditStyle(dsBrowse, edtSORT_ID.Style);
          end
        else
          begin
            edtSORT_ID1.Text := '';
            edtSORT_ID1.Properties.ReadOnly := false;
            SetEditStyle(dsInsert, edtSORT_ID.Style);
          end;
      end else //�����ҵ���Ʒ�������޸ķ���
      begin
        edtSORT_ID1.Properties.ReadOnly := false;
        SetEditStyle(dsInsert, edtSORT_ID.Style);
        rs := dllGlobal.GetZQueryFromName('PUB_GOODSSORT');
        if Copy(cdsGoodsRelation.FieldByName('COMM').AsString,2,2) <> '2' then
          begin
            if cdsGoodsRelation.FieldByName('GODS_CODE').AsString <> '' then
              edtGODS_CODE.Text :=  cdsGoodsRelation.FieldByName('GODS_CODE').AsString;
            if cdsGoodsRelation.FieldByName('GODS_NAME').AsString <> '' then
              edtGODS_NAME.Text :=  cdsGoodsRelation.FieldByName('GODS_NAME').AsString;
            if cdsGoodsRelation.FieldByName('SORT_ID1').AsString <> '' then
              edtSORT_ID1.Text := cdsGoodsRelation.FieldByName('SORT_ID1').AsString;
            if cdsGoodsRelation.FieldByName('NEW_INPRICE').AsString <> '' then
              edtNEW_INPRICE.Text := cdsGoodsRelation.FieldByName('NEW_INPRICE').AsString;
            if cdsGoodsRelation.FieldByName('NEW_OUTPRICE').AsString <> '' then
              edtNEW_OUTPRICE.Text := cdsGoodsRelation.FieldByName('NEW_OUTPRICE').AsString;

            if rs.Locate('SORT_ID',cdsGoodsRelation.FieldByName('SORT_ID1').AsString,[]) then
              edtSORT_ID.Text := rs.FieldByName('SORT_NAME').AsString
            else
              edtSORT_ID.Text := '��������Ʒ';
          end
        else
          begin
            if rs.Locate('SORT_ID',cdsGoodsInfo.FieldByName('SORT_ID1').AsString,[]) then
              edtSORT_ID.Text := rs.FieldByName('SORT_NAME').AsString
            else
              edtSORT_ID.Text := '��������Ʒ';
          end;
      end;

      if cdsGoodsPrice.Locate('SHOP_ID', token.shopId, []) then
        begin
          if Copy(cdsGoodsPrice.FieldByName('COMM').AsString,2,2) <> '2' then
            edtSHOP_NEW_OUTPRICE.Text := cdsGoodsPrice.FieldByName('NEW_OUTPRICE').AsString
        end;

      if trim(edtSHOP_NEW_OUTPRICE.Text) = '' then
        edtSHOP_NEW_OUTPRICE.Text := edtNEW_OUTPRICE.Text;

      if (cdsGoodsInfo.FieldByName('SMALL_UNITS').AsString <> '') or (cdsGoodsInfo.FieldByName('BIG_UNITS').AsString <> '') then
        begin
          edtMoreUnits.Checked := true;
          btnNext.Caption := '��һ��';
        end
      else
        begin
          edtMoreUnits.Checked := false;
          btnNext.Caption := '���';
        end;
    end
  else
    begin
      CancelReadOnly;
      edtMoreUnits.Checked := false;
      btnNext.Caption := '���';
      edtSORT_ID1.Text := '';
      edtSORT_ID1.Properties.ReadOnly := false;
      SetEditStyle(dsInsert, edtSORT_ID.Style);
    end;

  if edtGOODS_OPTION1.Checked then
    begin
      if not Finded then
        begin
          edtBARCODE1.Properties.ReadOnly := false;
          edtBARCODE2.Properties.ReadOnly := false;
          edtBARCODE3.Properties.ReadOnly := false;
          SetEditStyle(dsInsert, edtBARCODE1.Style);
          SetEditStyle(dsInsert, edtBARCODE2.Style);
          SetEditStyle(dsInsert, edtBARCODE3.Style);
        end
      else
        begin
          edtBARCODE1.Properties.ReadOnly := true;
          edtBARCODE2.Properties.ReadOnly := true;
          edtBARCODE3.Properties.ReadOnly := true;
          SetEditStyle(dsBrowse, edtBARCODE1.Style);
          SetEditStyle(dsBrowse, edtBARCODE2.Style);
          SetEditStyle(dsBrowse, edtBARCODE3.Style);
        end
    end
  else
    begin
      edtBARCODE1.Properties.ReadOnly := true;
      edtBARCODE2.Properties.ReadOnly := true;
      edtBARCODE3.Properties.ReadOnly := true;
      SetEditStyle(dsBrowse, edtBARCODE1.Style);
      SetEditStyle(dsBrowse, edtBARCODE2.Style);
      SetEditStyle(dsBrowse, edtBARCODE3.Style);
    end;
end;

procedure TfrmInitGoods.WriteToObject;
begin
  if not edtMoreUnits.Checked then
    begin
      edtSMALL_UNITS.KeyValue := null;
      edtBIG_UNITS.KeyValue := null;
    end;

  if edtSMALL_UNITS.AsString = '' then edtSMALL_UNITS.KeyValue := null;
  if edtBIG_UNITS.AsString  = '' then edtBIG_UNITS.KeyValue := null;

  udllShopUtil.WriteToObject(AObj,self);
  AObj.FieldByName('BARCODE').AsString := edtBARCODE1.Text;
  AObj.WriteToDataSet(cdsGoodsInfo);

  if cdsGoodsRelation.IsEmpty then
    cdsGoodsRelation.Append
  else
    cdsGoodsRelation.Edit;

  if not Finded then
    begin
      if cdsGoodsInfo.IsEmpty then
        cdsGoodsInfo.Append
      else
        cdsGoodsInfo.Edit;
      if edtGOODS_OPTION1.Checked then //��Ӧ����Ʒ
        begin
          cdsGoodsInfo.FieldByName('TENANT_ID').AsInteger := strtoint(FY_TENANT_ID);
          cdsGoodsInfo.FieldByName('BARCODE').AsString := edtBARCODE1.Text;
        end
      else //��������Ʒ,�Ա�����
        begin
          cdsGoodsInfo.FieldByName('TENANT_ID').AsInteger := strtoint(token.tenantId);
          cdsGoodsInfo.FieldByName('BARCODE').AsString := GetBarCode(TSequence.GetSequence('BARCODE_ID',token.tenantId,'',6),'#','#');
        end;
      cdsGoodsInfo.FieldByName('GODS_ID').AsString := TSequence.NewId;
      cdsGoodsInfo.FieldByName('GODS_SPELL').AsString := fnString.GetWordSpell(edtGODS_NAME.Text,3);
      cdsGoodsInfo.FieldByName('GODS_TYPE').AsInteger := 1;
      cdsGoodsInfo.FieldByName('USING_PRICE').AsInteger := 1;
      cdsGoodsInfo.FieldByName('HAS_INTEGRAL').AsInteger := 1;
      cdsGoodsInfo.FieldByName('USING_BATCH_NO').AsInteger := 2;
      cdsGoodsInfo.FieldByName('USING_BARTER').AsInteger := 1;
      cdsGoodsInfo.FieldByName('USING_LOCUS_NO').AsInteger := 2;
      cdsGoodsInfo.FieldByName('BARTER_INTEGRAL').AsInteger := 0;

      if cdsBarCode.Locate('BARCODE_TYPE', '0', []) then
        cdsBarCode.Edit
      else
      begin
        cdsBarCode.Append;
        cdsBarCode.FieldByName('ROWS_ID').AsString := TSequence.NewId;
      end;
      cdsBarCode.FieldByName('TENANT_ID').AsInteger := cdsGoodsInfo.FieldByName('TENANT_ID').AsInteger;
      cdsBarCode.FieldByName('GODS_ID').AsString := cdsGoodsInfo.FieldByName('GODS_ID').AsString;
      cdsBarCode.FieldByName('PROPERTY_01').AsString := '#';
      cdsBarCode.FieldByName('PROPERTY_02').AsString := '#';
      cdsBarCode.FieldByName('UNIT_ID').AsString := cdsGoodsInfo.FieldByName('CALC_UNITS').AsString;
      cdsBarCode.FieldByName('BARCODE_TYPE').AsString := '0';
      cdsBarCode.FieldByName('BATCH_NO').AsString := '#';
      cdsBarCode.FieldByName('BARCODE').AsString := cdsGoodsInfo.FieldByName('BARCODE').AsString;

      if cdsGoodsInfo.FieldByName('SMALL_UNITS').AsString <> '' then
        begin
          if cdsBarCode.Locate('BARCODE_TYPE', '1', []) then
            cdsBarCode.Edit
          else
          begin
            cdsBarCode.Append;
            cdsBarCode.FieldByName('ROWS_ID').AsString := TSequence.NewId;
          end;
          cdsBarCode.FieldByName('TENANT_ID').AsInteger := cdsGoodsInfo.FieldByName('TENANT_ID').AsInteger;
          cdsBarCode.FieldByName('GODS_ID').AsString := cdsGoodsInfo.FieldByName('GODS_ID').AsString;
          cdsBarCode.FieldByName('PROPERTY_01').AsString := '#';
          cdsBarCode.FieldByName('PROPERTY_02').AsString := '#';
          cdsBarCode.FieldByName('UNIT_ID').AsString := cdsGoodsInfo.FieldByName('SMALL_UNITS').AsString;
          cdsBarCode.FieldByName('BARCODE_TYPE').AsString := '1';
          cdsBarCode.FieldByName('BATCH_NO').AsString := '#';
          if edtGOODS_OPTION1.Checked then //��Ӧ����Ʒ
            cdsBarCode.FieldByName('BARCODE').AsString := edtBARCODE2.Text
          else //��������Ʒ,�Ա�����
            cdsBarCode.FieldByName('BARCODE').AsString := GetBarCode(TSequence.GetSequence('BARCODE_ID',token.tenantId,'',6),'#','#');
        end;
      if cdsGoodsInfo.FieldByName('BIG_UNITS').AsString <> '' then
        begin
          if cdsBarCode.Locate('BARCODE_TYPE', '2', []) then
            cdsBarCode.Edit
          else
          begin
            cdsBarCode.Append;
            cdsBarCode.FieldByName('ROWS_ID').AsString := TSequence.NewId;
          end;
          cdsBarCode.FieldByName('TENANT_ID').AsInteger := cdsGoodsInfo.FieldByName('TENANT_ID').AsInteger;
          cdsBarCode.FieldByName('GODS_ID').AsString := cdsGoodsInfo.FieldByName('GODS_ID').AsString;
          cdsBarCode.FieldByName('PROPERTY_01').AsString := '#';
          cdsBarCode.FieldByName('PROPERTY_02').AsString := '#';
          cdsBarCode.FieldByName('UNIT_ID').AsString := cdsGoodsInfo.FieldByName('BIG_UNITS').AsString;
          cdsBarCode.FieldByName('BARCODE_TYPE').AsString := '2';
          cdsBarCode.FieldByName('BATCH_NO').AsString := '#';
          if edtGOODS_OPTION1.Checked then //��Ӧ����Ʒ
            cdsBarCode.FieldByName('BARCODE').AsString := edtBARCODE3.Text
          else //��������Ʒ,�Ա�����
            cdsBarCode.FieldByName('BARCODE').AsString := GetBarCode(TSequence.GetSequence('BARCODE_ID',token.tenantId,'',6),'#','#');
        end;

      if edtGOODS_OPTION1.Checked then //��Ӧ����Ʒ
        begin
          cdsGoodsRelation.FieldByName('ROWS_ID').AsString := TSequence.NewId;
          cdsGoodsRelation.FieldByName('TENANT_ID').AsInteger := strtoint(token.tenantId);
          cdsGoodsRelation.FieldByName('GODS_ID').AsString := cdsGoodsInfo.FieldByName('GODS_ID').AsString;
          cdsGoodsRelation.FieldByName('RELATION_ID').AsInteger := strtoint(FY_RELATION_ID);
          cdsGoodsRelation.FieldByName('ZOOM_RATE').AsFloat := 1.000;
        end;

      // ������λ
      if edtMoreUnits.Checked and edtDefault1.Checked then
        cdsGoodsInfo.FieldByName('UNIT_ID').AsString := edtSMALL_UNITS.AsString
      else if edtMoreUnits.Checked and edtDefault2.Checked then
        cdsGoodsInfo.FieldByName('UNIT_ID').AsString := edtBIG_UNITS.AsString
      else
        cdsGoodsInfo.FieldByName('UNIT_ID').AsString := edtCALC_UNITS.AsString;
    end;

  if edtGOODS_OPTION1.Checked then //��Ӧ����Ʒ
    begin
      cdsGoodsRelation.FieldByName('GODS_CODE').AsString := cdsGoodsInfo.FieldByName('GODS_CODE').AsString;
      cdsGoodsRelation.FieldByName('GODS_NAME').AsString := cdsGoodsInfo.FieldByName('GODS_NAME').AsString;
      cdsGoodsRelation.FieldByName('GODS_SPELL').AsString := fnString.GetWordSpell(cdsGoodsRelation.FieldByName('GODS_NAME').AsString,3);
      if Finded then
        begin
          if Simple and RspFinded then
            cdsGoodsRelation.FieldByName('SORT_ID1').AsString := '#'
          else
            cdsGoodsRelation.FieldByName('SORT_ID1').AsString := cdsGoodsInfo.FieldByName('SORT_ID1').AsString;
        end
      else
        cdsGoodsRelation.FieldByName('SORT_ID1').AsString := '#';
      cdsGoodsRelation.FieldByName('NEW_INPRICE').AsFloat := cdsGoodsInfo.FieldByName('NEW_INPRICE').AsFloat;
      cdsGoodsRelation.FieldByName('NEW_OUTPRICE').AsFloat := cdsGoodsInfo.FieldByName('NEW_OUTPRICE').AsFloat;
    end;

  // ���װ����
  if cdsGoodsInfo.FieldByName('SMALL_UNITS').AsString = '' then
    begin
      if cdsBarCode.Locate('BARCODE_TYPE', '1', []) then
         cdsBarCode.Delete;
    end;
  if cdsGoodsInfo.FieldByName('BIG_UNITS').AsString = '' then
    begin
      if cdsBarCode.Locate('BARCODE_TYPE', '2', []) then
         cdsBarCode.Delete;
    end;

  PostDataSet;

  if Finded then cdsGoodsInfo.Data := edtTable.Data;
end;

procedure TfrmInitGoods.OpenDataSet(tenantId,godsId:string);
var
  Params: TftParamList;
begin
  Params := TftParamList.Create(nil);
  cdsGoodsInfo.Close;
  try
    Params.ParamByName('TENANT_ID').AsInteger := strtoint(tenantId);
    Params.ParamByName('GODS_ID').AsString := godsId;
    dataFactory.Open(cdsGoodsInfo,'TGoodsInfoV60',Params);
  finally
    Params.Free;
  end;

  Params := TftParamList.Create(nil);
  cdsBarCode.Close;
  try
    Params.ParamByName('TENANT_ID').AsInteger := strtoint(tenantId);
    Params.ParamByName('GODS_ID').AsString := godsId;
    dataFactory.Open(cdsBarCode,'TBarCodeV60',Params);
  finally
    Params.Free;
  end;

  Params := TftParamList.Create(nil);
  cdsGoodsRelation.Close;
  try
    Params.ParamByName('TENANT_ID').AsInteger := strtoint(token.tenantId);
    Params.ParamByName('GODS_ID').AsString := godsId;
    Params.ParamByName('RELATION_ID').AsInteger := strtoint(FY_RELATION_ID);
    dataFactory.Open(cdsGoodsRelation,'TGoodsRelationV60',Params);
  finally
    Params.Free;
  end;

  Params := TftParamList.Create(nil);
  cdsGoodsPrice.Close;
  try
    Params.ParamByName('TENANT_ID').AsInteger := strtoint(token.tenantId);
    Params.ParamByName('SHOP_ID').AsString := token.shopId;
    Params.ParamByName('GODS_ID').AsString := godsId;
    Params.ParamByName('PRICE_ID').AsString := '#';
    dataFactory.Open(cdsGoodsPrice,'TGoodsPriceV60',Params);
  finally
    Params.Free;
  end;
end;

procedure TfrmInitGoods.Save;
var
  tmpGoodsInfo,tmpBarCode,tmpGoodsRelation,tmpGoodsPrice: TZQuery;
  Params: TftParamList;
  tmpObj: TRecord_;
  isDel: boolean;
begin
  isDel := false;
  if FnNumber.CompareFloat(StrtoFloatDef(edtSHOP_NEW_OUTPRICE.Text,0),StrtoFloatDef(edtNEW_OUTPRICE.Text,0))=0 then
    begin
      isDel := false;
      if cdsGoodsPrice.Locate('SHOP_ID',token.tenantId+'0001',[]) and
         (FnNumber.CompareFloat(StrtoFloatDef(edtSHOP_NEW_OUTPRICE.Text,0),cdsGoodsPrice.FieldByName('NEW_OUTPRICE').AsFloat)=0)
      then isDel := true;

      if cdsGoodsPrice.Locate('SHOP_ID',token.shopId,[]) and (cdsGoodsPrice.RecordCount=1) then
        isDel := true;

      if IsDel and cdsGoodsPrice.Locate('SHOP_ID',token.shopId,[]) then cdsGoodsPrice.Delete;
    end;
  if not isDel then
    begin
      if cdsGoodsPrice.Locate('SHOP_ID',token.shopId,[]) then
        cdsGoodsPrice.Edit
      else
        cdsGoodsPrice.Append;
      cdsGoodsPrice.FieldByName('TENANT_ID').AsInteger := strtoint(token.tenantId);
      cdsGoodsPrice.FieldByName('PRICE_ID').AsString := '#';
      cdsGoodsPrice.FieldByName('SHOP_ID').AsString := token.shopId;
      cdsGoodsPrice.FieldByName('GODS_ID').AsString := cdsGoodsInfo.FieldbyName('GODS_ID').AsString;
      cdsGoodsPrice.FieldByName('PRICE_METHOD').AsString := '1';
      cdsGoodsPrice.FieldByName('NEW_OUTPRICE').AsFloat := StrtoFloatDef(edtSHOP_NEW_OUTPRICE.Text,0);
      cdsGoodsPrice.FieldByName('NEW_OUTPRICE1').AsFloat := StrtoFloatDef(edtSHOP_NEW_OUTPRICE.Text,0)*cdsGoodsInfo.FieldByName('SMALLTO_CALC').AsFloat;
      cdsGoodsPrice.FieldByName('NEW_OUTPRICE2').AsFloat := StrtoFloatDef(edtSHOP_NEW_OUTPRICE.Text,0)*cdsGoodsInfo.FieldByName('BIGTO_CALC').AsFloat;
      cdsGoodsPrice.Post;
    end;

  dataFactory.BeginBatch;
  try
    dataFactory.AddBatch(cdsGoodsInfo,'TGoodsInfoV60',nil);
    dataFactory.AddBatch(cdsBarCode,'TBarCodeV60',nil);
    dataFactory.AddBatch(cdsGoodsPrice,'TGoodsPriceV60',nil);
    if edtGOODS_OPTION1.Checked then
      dataFactory.AddBatch(cdsGoodsRelation,'TGoodsRelationV60',nil);
    dataFactory.CommitBatch;
  except
    dataFactory.CancelBatch;
    Raise;
  end;

  LocalFinded := false;
  RemoteFinded := false;
  RspFinded := false;
  edtInput.Text := '';

  // ���ر���
  if dataFactory.iDbType <> 5 then
    begin
      tmpGoodsInfo := TZQuery.Create(nil);
      tmpBarCode := TZQuery.Create(nil);
      tmpGoodsRelation := TZQuery.Create(nil);
      tmpGoodsPrice := TZQuery.Create(nil);
      dataFactory.MoveToSqlite;
      try
        Params := TftParamList.Create(nil);
        tmpGoodsInfo.Close;
        try
          Params.ParamByName('TENANT_ID').AsInteger := cdsGoodsInfo.FieldByName('TENANT_ID').AsInteger;
          Params.ParamByName('GODS_ID').AsString := cdsGoodsInfo.FieldByName('GODS_ID').AsString;
          dataFactory.Open(tmpGoodsInfo,'TGoodsInfoV60',Params);
        finally
          Params.Free;
        end;

        Params := TftParamList.Create(nil);
        tmpBarCode.Close;
        try
          Params.ParamByName('TENANT_ID').AsInteger := cdsBarCode.FieldByName('TENANT_ID').AsInteger;
          Params.ParamByName('GODS_ID').AsString := cdsBarCode.FieldByName('GODS_ID').AsString;
          dataFactory.Open(tmpBarCode,'TBarCodeV60',Params);
        finally
          Params.Free;
        end;

        Params := TftParamList.Create(nil);
        tmpGoodsRelation.Close;
        try
          Params.ParamByName('TENANT_ID').AsInteger := cdsGoodsRelation.FieldByName('TENANT_ID').AsInteger;
          Params.ParamByName('GODS_ID').AsString := cdsGoodsRelation.FieldByName('GODS_ID').AsString;
          Params.ParamByName('RELATION_ID').AsInteger := cdsGoodsRelation.FieldByName('RELATION_ID').AsInteger;
          dataFactory.Open(tmpGoodsRelation,'TGoodsRelationV60',Params);
        finally
          Params.Free;
        end;

        Params := TftParamList.Create(nil);
        tmpGoodsPrice.Close;
        try
          Params.ParamByName('TENANT_ID').AsInteger := cdsGoodsPrice.FieldByName('TENANT_ID').AsInteger;
          Params.ParamByName('SHOP_ID').AsString := cdsGoodsPrice.FieldByName('SHOP_ID').AsString;
          Params.ParamByName('GODS_ID').AsString := cdsGoodsPrice.FieldByName('GODS_ID').AsString;
          Params.ParamByName('PRICE_ID').AsString := cdsGoodsPrice.FieldByName('PRICE_ID').AsString;
          dataFactory.Open(tmpGoodsPrice,'TGoodsPriceV60',Params);
        finally
          Params.Free;
        end;

        tmpObj := TRecord_.Create;
        try
          if tmpGoodsInfo.IsEmpty then tmpGoodsInfo.Append
          else tmpGoodsInfo.Edit;
          tmpObj.ReadFromDataSet(cdsGoodsInfo);
          tmpObj.WriteToDataSet(tmpGoodsInfo, false);
        finally
          tmpObj.Free;
        end;

        tmpObj := TRecord_.Create;
        try
          if cdsBarCode.Locate('BARCODE_TYPE', '0', []) then
            begin
              if tmpBarCode.Locate('BARCODE_TYPE', '0', []) then
                tmpBarCode.Edit
              else
                tmpBarCode.Append;
              tmpObj.ReadFromDataSet(cdsBarCode);
              tmpObj.WriteToDataSet(tmpBarCode, false);
            end
          else
            begin
              if tmpBarCode.Locate('BARCODE_TYPE', '0', []) then
                tmpBarCode.Delete;
            end;

          if cdsBarCode.Locate('BARCODE_TYPE', '1', []) then
            begin
              if tmpBarCode.Locate('BARCODE_TYPE', '1', []) then
                tmpBarCode.Edit
              else
                tmpBarCode.Append;
              tmpObj.ReadFromDataSet(cdsBarCode);
              tmpObj.WriteToDataSet(tmpBarCode, false);
            end
          else
            begin
              if tmpBarCode.Locate('BARCODE_TYPE', '1', []) then
                tmpBarCode.Delete;
            end;

          if cdsBarCode.Locate('BARCODE_TYPE', '2', []) then
            begin
              if tmpBarCode.Locate('BARCODE_TYPE', '2', []) then
                tmpBarCode.Edit
              else
                tmpBarCode.Append;
              tmpObj.ReadFromDataSet(cdsBarCode);
              tmpObj.WriteToDataSet(tmpBarCode, false);
            end
          else
            begin
              if tmpBarCode.Locate('BARCODE_TYPE', '2', []) then
                tmpBarCode.Delete;
            end;
        finally
          tmpObj.Free;
        end;

        tmpObj := TRecord_.Create;
        try
          if tmpGoodsRelation.IsEmpty then tmpGoodsRelation.Append
          else tmpGoodsRelation.Edit;
          tmpObj.ReadFromDataSet(cdsGoodsRelation);
          tmpObj.WriteToDataSet(tmpGoodsRelation, false);
        finally
          tmpObj.Free;
        end;

        tmpObj := TRecord_.Create;
        try
          if cdsGoodsPrice.Locate('SHOP_ID', token.shopId, []) then
            begin
              if tmpGoodsPrice.Locate('SHOP_ID', token.shopId, []) then
                tmpGoodsPrice.Edit
              else
                tmpGoodsPrice.Append;
              tmpObj.ReadFromDataSet(cdsGoodsPrice);
              tmpObj.WriteToDataSet(tmpGoodsPrice, false);
            end
          else
            begin
              if tmpGoodsPrice.Locate('SHOP_ID', token.shopId, []) then
                tmpGoodsPrice.Delete;
            end;
        finally
          tmpObj.Free;
        end;

        if tmpGoodsInfo.State in [dsEdit,dsInsert] then
          tmpGoodsInfo.Post;
        if tmpBarCode.State in [dsEdit,dsInsert] then
          tmpBarCode.Post;
        if tmpGoodsRelation.State in [dsEdit,dsInsert] then
          tmpGoodsRelation.Post;
        if tmpGoodsPrice.State in [dsEdit,dsInsert] then
          tmpGoodsPrice.Post;

        dataFactory.BeginBatch;
        try
          dataFactory.AddBatch(tmpGoodsInfo,'TGoodsInfoV60',nil);
          dataFactory.AddBatch(tmpBarCode,'TBarCodeV60',nil);
          dataFactory.AddBatch(tmpGoodsPrice,'TGoodsPriceV60',nil);
          if edtGOODS_OPTION1.Checked then
            dataFactory.AddBatch(tmpGoodsRelation,'TGoodsRelationV60',nil);
          dataFactory.CommitBatch;
        except
          dataFactory.CancelBatch;
          Raise;
        end;
      finally
        dataFactory.MoveToDefault;
        tmpGoodsInfo.Free;
        tmpBarCode.Free;
        tmpGoodsRelation.Free;
        tmpGoodsPrice.Free;
      end;
    end;
  dllGlobal.GetZQueryFromName('PUB_GOODSINFO').Close;
  ModalResult := MROK;
end;

procedure TfrmInitGoods.PostDataSet;
begin
  if cdsGoodsInfo.State in [dsEdit,dsInsert] then
     cdsGoodsInfo.Post;
  if cdsBarCode.State in [dsEdit,dsInsert] then
     cdsBarCode.Post;
  if cdsGoodsRelation.State in [dsEdit,dsInsert] then
     cdsGoodsRelation.Post;
end;

procedure TfrmInitGoods.FormDestroy(Sender: TObject);
begin
  inherited;
  AObj.Free;
end;

procedure TfrmInitGoods.edtMoreUnitsPropertiesChange(Sender: TObject);
begin
  inherited;
  if edtMoreUnits.Checked then
    btnNext.Caption := '��һ��'
  else
    btnNext.Caption := '���';
end;

procedure TfrmInitGoods.edtGOODS_OPTION1Click(Sender: TObject);
begin
  inherited;
  edtGOODS_OPTION2.Checked := false;
  if CanFocus(edtInput) then edtInput.SetFocus;
end;

procedure TfrmInitGoods.edtGOODS_OPTION2Click(Sender: TObject);
begin
  inherited;
  edtGOODS_OPTION1.Checked := false;
end;

procedure TfrmInitGoods.edtDefault1Click(Sender: TObject);
begin
  inherited;
  if (edtDefault1.Checked) and (edtDefault2.Checked) then
    edtDefault2.Checked := false;
end;

procedure TfrmInitGoods.edtDefault2Click(Sender: TObject);
begin
  inherited;
  if (edtDefault2.Checked) and (edtDefault1.Checked) then
    edtDefault1.Checked := false;
end;

procedure TfrmInitGoods.edtInputKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not edtGOODS_OPTION1.Checked then edtGOODS_OPTION1.Checked := true;
  if Key = #13 then
    if btnNext.Visible then btnNext.Click;
end;

procedure TfrmInitGoods.SetReadOnly;
begin
  edtCALC_UNITS.Properties.ReadOnly := true;
  edtSMALL_UNITS.Properties.ReadOnly := true;
  edtSMALLTO_CALC.Properties.ReadOnly := true;
  edtBIG_UNITS.Properties.ReadOnly := true;
  edtBIGTO_CALC.Properties.ReadOnly := true;
  edtDEFAULT1.Properties.ReadOnly := true;
  edtDEFAULT2.Properties.ReadOnly := true;
  edtMoreUnits.Properties.ReadOnly := true;

  SetEditStyle(dsBrowse, edtCALC_UNITS.Style);
  SetEditStyle(dsBrowse, edtSMALL_UNITS.Style);
  SetEditStyle(dsBrowse, edtSMALLTO_CALC.Style);
  SetEditStyle(dsBrowse, edtBIG_UNITS.Style);
  SetEditStyle(dsBrowse, edtBIGTO_CALC.Style);
end;

procedure TfrmInitGoods.CancelReadOnly;
begin
  edtCALC_UNITS.Properties.ReadOnly := false;
  edtSMALL_UNITS.Properties.ReadOnly := false;
  edtSMALLTO_CALC.Properties.ReadOnly := false;
  edtBIG_UNITS.Properties.ReadOnly := false;
  edtBIGTO_CALC.Properties.ReadOnly := false;
  edtDEFAULT1.Properties.ReadOnly := false;
  edtDEFAULT2.Properties.ReadOnly := false;
  edtMoreUnits.Properties.ReadOnly := false;
 
  SetEditStyle(dsInsert, edtCALC_UNITS.Style);
  SetEditStyle(dsInsert, edtSMALL_UNITS.Style);
  SetEditStyle(dsInsert, edtSMALLTO_CALC.Style);
  SetEditStyle(dsInsert, edtBIG_UNITS.Style);
  SetEditStyle(dsInsert, edtBIGTO_CALC.Style);
end;

function TfrmInitGoods.BarCodeSimpleInit(barcode:string):boolean;
begin
  result := false;
  if not btnNext.Enabled then Exit;
  try
    Simple := true;
    edtGOODS_OPTION1.Checked := true;
    edtInput.Text := barcode;
    btnNext.Click;
    if Finded then
      begin
        btnNext.Click;
        if edtMoreUnits.Checked then
          btnNext.Click;
        result := true;
      end;
  except
    on E:Exception do
       begin
         result := false;
         MessageBox(Handle,pchar(E.Message),'������ʾ..',MB_OK);
       end;
  end;
  Simple := false;
end;

procedure TfrmInitGoods.edtSORT_IDPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Obj:TRecord_;
begin
  inherited;
  if edtSORT_ID1.Properties.ReadOnly then Exit;
  Obj := TRecord_.Create;
  try
    if edtGOODS_OPTION1.Checked and (not Finded) then
      begin
        frmSortDropFrom.RelationId := FY_RELATION_ID;
        if frmSortDropFrom.DropForm(edtSORT_ID, Obj) then
          begin
            edtSORT_ID1.Text := Obj.FieldbyName('SORT_ID').AsString;
            edtSORT_ID.Text := Obj.FieldbyName('SORT_NAME').AsString;
          end;
      end
    else
      begin
        if frmSortDropFrom.DropForm(edtSORT_ID, Obj) then
          begin
            edtSORT_ID1.Text := Obj.FieldbyName('SORT_ID').AsString;
            edtSORT_ID.Text := Obj.FieldbyName('SORT_NAME').AsString;
          end;
      end;
  finally
    Obj.Free;
  end;
end;

procedure TfrmInitGoods.edtCALC_UNITSPropertiesChange(Sender: TObject);
begin
  inherited;
  if edtSMALL_UNITS.AsString <> '' then
    RzPanel_SMALL.Caption := edtCALC_UNITS.Text + '=1' + edtSMALL_UNITS.Text;
  if edtBIG_UNITS.AsString <> '' then
    RzPanel_BIG.Caption := edtCALC_UNITS.Text + '=1' + edtBIG_UNITS.Text;
end;

procedure TfrmInitGoods.edtCALC_UNITSSaveValue(Sender: TObject);
begin
  inherited;
  if edtSMALL_UNITS.AsString <> '' then
    RzPanel_SMALL.Caption := edtCALC_UNITS.Text + '=1' + edtSMALL_UNITS.Text;
  if edtBIG_UNITS.AsString <> '' then
    RzPanel_BIG.Caption := edtCALC_UNITS.Text + '=1' + edtBIG_UNITS.Text;
end;

procedure TfrmInitGoods.edtSMALL_UNITSPropertiesChange(Sender: TObject);
begin
  inherited;
  if edtSMALL_UNITS.AsString = '' then
    RzPanel_SMALL.Caption := ''
  else
    RzPanel_SMALL.Caption := edtCALC_UNITS.Text + '=1' + edtSMALL_UNITS.Text;
end;

procedure TfrmInitGoods.edtSMALL_UNITSSaveValue(Sender: TObject);
begin
  inherited;
  if edtSMALL_UNITS.AsString = '' then
    RzPanel_SMALL.Caption := ''
  else
    RzPanel_SMALL.Caption := edtCALC_UNITS.Text + '=1' + edtSMALL_UNITS.Text;
end;

procedure TfrmInitGoods.edtBIG_UNITSPropertiesChange(Sender: TObject);
begin
  inherited;
  if edtBIG_UNITS.AsString = '' then
    RzPanel_BIG.Caption := ''
  else
    RzPanel_BIG.Caption := edtCALC_UNITS.Text + '=1' + edtBIG_UNITS.Text;
end;

procedure TfrmInitGoods.edtBIG_UNITSSaveValue(Sender: TObject);
begin
  inherited;
  if edtBIG_UNITS.AsString = '' then
    RzPanel_BIG.Caption := ''
  else
    RzPanel_BIG.Caption := edtCALC_UNITS.Text + '=1' + edtBIG_UNITS.Text;
end;

procedure TfrmInitGoods.SetDialogForm;
begin
  Dialog := true;
  btnClose.Visible := true;
  self.Height := RzPanel1.Height;
  self.Width := RzPanel1.Width;
  RzPanel1.Left := 0;
  RzPanel1.Top := 0;
end;

class function TfrmInitGoods.ShowDialog(Owner:TForm;barcode:string;var GodsId:string):boolean;
begin
  with TfrmInitGoods.Create(Owner) do
    begin
      try
        SetDialogForm;
        if barcode <> '' then
          begin
            if BarCodeSimpleInit(barcode) then
              begin
                result := true;
                GodsId := cdsGoodsInfo.FieldByName('GODS_ID').AsString;
                Exit;
              end
            else
              begin
                result := (ShowModal = MROK);
                if result then GodsId := cdsGoodsInfo.FieldByName('GODS_ID').AsString;
              end;
          end
        else
          begin
            result := (ShowModal = MROK);
            if result then GodsId := cdsGoodsInfo.FieldByName('GODS_ID').AsString;
          end;
      finally
        Free;
      end;
    end;
end;

procedure TfrmInitGoods.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Dialog and (Key=#27) then Close;
end;

procedure TfrmInitGoods.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmInitGoods.RzPanel5Click(Sender: TObject);
begin
  inherited;
  edtGOODS_OPTION1.Checked := true;
  if CanFocus(edtInput) then edtInput.SetFocus; 
end;

procedure TfrmInitGoods.RzPanel6Click(Sender: TObject);
begin
  inherited;
  edtGOODS_OPTION2.Checked := true;
end;

procedure TfrmInitGoods.FormShow(Sender: TObject);
begin
  inherited;
  advFactory.getAdvPngImage(adv03.Name,adv03.Picture);
  if CanFocus(edtInput) then edtInput.SetFocus;
end;

procedure TfrmInitGoods.ajustPostion;
begin
  inherited;
  RzPanel1.Top := (self.ClientHeight - RzPanel1.Height) div 2 - 1;
  RzPanel1.Left := (self.ClientWidth - RzPanel1.Width) div 2 - 1;
end;

function TfrmInitGoods.IsChinese(str: string): Boolean;
var i:integer;
begin
  Result:=False;
  for i:=0 to length(str)-1 do
  begin
    if str[i] in LeadBytes then
    begin
      result := true;
      break;
    end;
  end;
end;

function TfrmInitGoods.CanFocus(Control: TControl): Boolean;
begin
  result := false;
  if Control is TcxTextEdit then
    result := (self.Visible) and TcxTextEdit(Control).CanFocus;
  if Control is TzrComboBoxList then
    result := (self.Visible) and TzrComboBoxList(Control).CanFocus;
end;

function TfrmInitGoods.GetFinded: boolean;
begin
  result := RspFinded or RemoteFinded or LocalFinded;
end;

procedure TfrmInitGoods.RefreshUnits;
begin
  dllGlobal.GetZQueryFromName('PUB_MEAUNITS').Close;
  edtCALC_UNITS.DataSet := dllGlobal.GetZQueryFromName('PUB_MEAUNITS');
  edtSMALL_UNITS.DataSet := dllGlobal.GetZQueryFromName('PUB_MEAUNITS');
  edtBIG_UNITS.DataSet := dllGlobal.GetZQueryFromName('PUB_MEAUNITS');
end;

procedure TfrmInitGoods.DownloadUnits;
var
  tmpUnits,cdsUnits:TZQuery;
  tmpObj:TRecord_;
  unitIds:string;
begin
  tmpUnits := TZQuery.Create(nil);
  cdsUnits := TZQuery.Create(nil);
  tmpObj := TRecord_.Create;
  try
    unitIds := ''''+cdsGoodsInfo.FieldByName('CALC_UNITS').AsString+'''';
    if cdsGoodsInfo.FieldByName('SMALL_UNITS').AsString <> '' then
       unitIds := unitIds + ',' + '''' + cdsGoodsInfo.FieldByName('SMALL_UNITS').AsString + '''';
    if cdsGoodsInfo.FieldByName('BIG_UNITS').AsString <> '' then
       unitIds := unitIds + ',' + '''' + cdsGoodsInfo.FieldByName('BIG_UNITS').AsString + '''';

    dataFactory.MoveToRemote;
    try
      tmpUnits.SQL.Text := 'select * from PUB_MEAUNITS where UNIT_ID in ('+unitIds+')';
      dataFactory.Open(tmpUnits);
    finally
      dataFactory.MoveToDefault;
    end;

    dataFactory.MoveToSqlite;
    try
      cdsUnits.SQL.Text := 'select * from PUB_MEAUNITS where UNIT_ID in ('+unitIds+')';
      dataFactory.Open(cdsUnits);
    finally
      dataFactory.MoveToDefault;
    end;

    tmpUnits.First;
    while not tmpUnits.Eof do
      begin
        if not cdsUnits.Locate('UNIT_ID',tmpUnits.FieldByName('UNIT_ID').AsString,[]) then
           begin
             cdsUnits.Append;
             tmpObj.ReadFromDataSet(tmpUnits);
             tmpObj.WriteToDataSet(cdsUnits);
           end;
        tmpUnits.Next;
      end;

    dataFactory.MoveToSqlite;
    try
      dataFactory.UpdateBatch(cdsUnits,'TMeaUnitsV60');
    finally
      dataFactory.MoveToDefault;
    end;
  finally
    tmpUnits.Free;
    cdsUnits.Free;
    tmpObj.Free;
  end;
  RefreshUnits;
end;

procedure TfrmInitGoods.DownloadUnits(pubGoodsinfoResp: IXMLDOMNode);
var
  cdsUnits:TZQuery;
  unitIds:string;
begin
  unitIds := ''''+cdsGoodsInfo.FieldByName('CALC_UNITS').AsString+'''';
  if cdsGoodsInfo.FieldByName('SMALL_UNITS').AsString <> '' then
     unitIds := unitIds + ',' + '''' + cdsGoodsInfo.FieldByName('SMALL_UNITS').AsString + '''';
  if cdsGoodsInfo.FieldByName('BIG_UNITS').AsString <> '' then
     unitIds := unitIds + ',' + '''' + cdsGoodsInfo.FieldByName('BIG_UNITS').AsString + '''';

  cdsUnits := TZQuery.Create(nil);
  dataFactory.MoveToSqlite;
  try
    cdsUnits.SQL.Text := 'select * from PUB_MEAUNITS where UNIT_ID in ('+unitIds+')';
    dataFactory.Open(cdsUnits);

    if not cdsUnits.Locate('UNIT_ID',cdsGoodsInfo.FieldByName('CALC_UNITS').AsString,[]) then
       begin
         cdsUnits.Append;
         cdsUnits.FieldByName('TENANT_ID').AsInteger := strtoint(FY_TENANT_ID);
         cdsUnits.FieldByName('UNIT_ID').AsString := cdsGoodsInfo.FieldByName('CALC_UNITS').AsString;
         cdsUnits.FieldByName('UNIT_NAME').AsString := rspFactory.GetNodeValue(pubGoodsinfoResp,'calcUnitsName');
         cdsUnits.FieldByName('UNIT_SPELL').AsString := fnString.GetWordSpell(rspFactory.GetNodeValue(pubGoodsinfoResp,'calcUnitsName'),3);
         cdsUnits.FieldByName('SEQ_NO').AsInteger := strtointdef(rspFactory.GetNodeValue(pubGoodsinfoResp,'calcUnitsSeqNo'),0);
         cdsUnits.Post;
       end;
    if cdsGoodsInfo.FieldByName('SMALL_UNITS').AsString <> '' then
    begin
       if not cdsUnits.Locate('UNIT_ID',cdsGoodsInfo.FieldByName('SMALL_UNITS').AsString,[]) then
       begin
         cdsUnits.Append;
         cdsUnits.FieldByName('TENANT_ID').AsInteger := strtoint(FY_TENANT_ID);
         cdsUnits.FieldByName('UNIT_ID').AsString := cdsGoodsInfo.FieldByName('SMALL_UNITS').AsString;
         cdsUnits.FieldByName('UNIT_NAME').AsString := rspFactory.GetNodeValue(pubGoodsinfoResp,'smallUnitsName');
         cdsUnits.FieldByName('UNIT_SPELL').AsString := fnString.GetWordSpell(rspFactory.GetNodeValue(pubGoodsinfoResp,'smallUnitsName'),3);
         cdsUnits.FieldByName('SEQ_NO').AsInteger := strtointdef(rspFactory.GetNodeValue(pubGoodsinfoResp,'smallUnitsSeqNo'),0);
         cdsUnits.Post;
       end;
    end;
    if cdsGoodsInfo.FieldByName('BIG_UNITS').AsString <> '' then
    begin
       if not cdsUnits.Locate('UNIT_ID',cdsGoodsInfo.FieldByName('BIG_UNITS').AsString,[]) then
       begin
         cdsUnits.Append;
         cdsUnits.FieldByName('TENANT_ID').AsInteger := strtoint(FY_TENANT_ID);
         cdsUnits.FieldByName('UNIT_ID').AsString := cdsGoodsInfo.FieldByName('BIG_UNITS').AsString;
         cdsUnits.FieldByName('UNIT_NAME').AsString := rspFactory.GetNodeValue(pubGoodsinfoResp,'bigUnitsName');
         cdsUnits.FieldByName('UNIT_SPELL').AsString := fnString.GetWordSpell(rspFactory.GetNodeValue(pubGoodsinfoResp,'bigUnitsName'),3);
         cdsUnits.FieldByName('SEQ_NO').AsInteger := strtointdef(rspFactory.GetNodeValue(pubGoodsinfoResp,'bigUnitsSeqNo'),0);
         cdsUnits.Post;
       end;
    end;
    
    dataFactory.UpdateBatch(cdsUnits,'TMeaUnitsV60');
  finally
    cdsUnits.Free;
    dataFactory.MoveToDefault;
  end;

  if dataFactory.iDbType <> 5 then
  begin
    cdsUnits := TZQuery.Create(nil);
    try
      cdsUnits.SQL.Text := 'select * from PUB_MEAUNITS where UNIT_ID in ('+unitIds+')';
      dataFactory.Open(cdsUnits);

      if not cdsUnits.Locate('UNIT_ID',cdsGoodsInfo.FieldByName('CALC_UNITS').AsString,[]) then
         begin
           cdsUnits.Append;
           cdsUnits.FieldByName('TENANT_ID').AsInteger := strtoint(FY_TENANT_ID);
           cdsUnits.FieldByName('UNIT_ID').AsString := cdsGoodsInfo.FieldByName('CALC_UNITS').AsString;
           cdsUnits.FieldByName('UNIT_NAME').AsString := rspFactory.GetNodeValue(pubGoodsinfoResp,'calcUnitsName');
           cdsUnits.FieldByName('UNIT_SPELL').AsString := fnString.GetWordSpell(rspFactory.GetNodeValue(pubGoodsinfoResp,'calcUnitsName'),3);
           cdsUnits.FieldByName('SEQ_NO').AsInteger := strtointdef(rspFactory.GetNodeValue(pubGoodsinfoResp,'calcUnitsSeqNo'),0);
           cdsUnits.Post;
         end;
      if cdsGoodsInfo.FieldByName('SMALL_UNITS').AsString <> '' then
      begin
         if not cdsUnits.Locate('UNIT_ID',cdsGoodsInfo.FieldByName('SMALL_UNITS').AsString,[]) then
         begin
           cdsUnits.Append;
           cdsUnits.FieldByName('TENANT_ID').AsInteger := strtoint(FY_TENANT_ID);
           cdsUnits.FieldByName('UNIT_ID').AsString := cdsGoodsInfo.FieldByName('SMALL_UNITS').AsString;
           cdsUnits.FieldByName('UNIT_NAME').AsString := rspFactory.GetNodeValue(pubGoodsinfoResp,'smallUnitsName');
           cdsUnits.FieldByName('UNIT_SPELL').AsString := fnString.GetWordSpell(rspFactory.GetNodeValue(pubGoodsinfoResp,'smallUnitsName'),3);
           cdsUnits.FieldByName('SEQ_NO').AsInteger := strtointdef(rspFactory.GetNodeValue(pubGoodsinfoResp,'smallUnitsSeqNo'),0);
           cdsUnits.Post;
         end;
      end;
      if cdsGoodsInfo.FieldByName('BIG_UNITS').AsString <> '' then
      begin
         if not cdsUnits.Locate('UNIT_ID',cdsGoodsInfo.FieldByName('BIG_UNITS').AsString,[]) then
         begin
           cdsUnits.Append;
           cdsUnits.FieldByName('TENANT_ID').AsInteger := strtoint(FY_TENANT_ID);
           cdsUnits.FieldByName('UNIT_ID').AsString := cdsGoodsInfo.FieldByName('BIG_UNITS').AsString;
           cdsUnits.FieldByName('UNIT_NAME').AsString := rspFactory.GetNodeValue(pubGoodsinfoResp,'bigUnitsName');
           cdsUnits.FieldByName('UNIT_SPELL').AsString := fnString.GetWordSpell(rspFactory.GetNodeValue(pubGoodsinfoResp,'bigUnitsName'),3);
           cdsUnits.FieldByName('SEQ_NO').AsInteger := strtointdef(rspFactory.GetNodeValue(pubGoodsinfoResp,'bigUnitsSeqNo'),0);
           cdsUnits.Post;
         end;
      end;

      dataFactory.UpdateBatch(cdsUnits,'TMeaUnitsV60');
    finally
      cdsUnits.Free;
    end;
  end;

  RefreshUnits;
end;

initialization
  RegisterClass(TfrmInitGoods);
finalization
  UnRegisterClass(TfrmInitGoods);
end.