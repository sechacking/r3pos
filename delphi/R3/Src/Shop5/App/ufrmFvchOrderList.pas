{  21300001	0	ƾ֤��	1	��ѯ	2	����	3	�޸�	4	ɾ��	5	���	6	��ӡ	7	����   }

unit ufrmFvchOrderList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uframeToolForm, ActnList, Menus, ComCtrls, ToolWin, StdCtrls,
  RzLabel, RzTabs, ExtCtrls, RzPanel, Grids, DBGridEh, cxControls,
  cxContainer, cxEdit, cxTextEdit, RzButton,zBase, DB, RzTreeVw,
  cxButtonEdit, zrComboBoxList, cxDropDownEdit, cxCalendar, cxMaskEdit,
  cxRadioGroup, FR_Class, PrnDbgeh, jpeg, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TfrmFvchOrderList = class(TframeToolForm)
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton10: TToolButton;
    ToolButton3: TToolButton;
    ToolButton6: TToolButton;
    frfRecvOrder: TfrReport;
    actfrmBatchReck: TAction;
    fndP1_SHOP_ID: TzrComboBoxList;
    RzPanel6: TRzPanel;
    Label3: TLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    Label2: TLabel;
    P1_D1: TcxDateEdit;
    P1_D2: TcxDateEdit;
    btnOk: TRzBitBtn;
    fndSTATUS: TcxRadioGroup;
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    CdsList: TZQuery;
    ListDs: TDataSource;
    Label8: TLabel;
    fndP1_DEPT_ID: TzrComboBoxList;
    fndP1_BILL_NAME: TcxComboBox;
    actFvch: TAction;
    procedure FormCreate(Sender: TObject);
    procedure actFindExecute(Sender: TObject);
    procedure actInfoExecute(Sender: TObject);
    procedure actAuditExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RzPageChange(Sender: TObject);
    procedure frfRecvOrderUserFunction(const Name: String; p1, p2, p3: Variant; var Val: Variant);
    procedure actDeleteExecute(Sender: TObject);
    procedure frfRecvOrderGetValue(const ParName: String; var ParValue: Variant);
    procedure CdsListAfterScroll(DataSet: TDataSet);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure actFvchExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actPreviewExecute(Sender: TObject);
  private
    procedure ChangeButton;
    function  CheckCanExport: boolean; override;
  public
    IsEnd: boolean;
    MaxId:string;
    pid:string;
    locked:boolean;
    procedure AddRecord(AObj:TRecord_);    
    function EncodeSQL(id:string;var w:string):string;
    procedure Open(Id:string);
  end;

implementation

uses
  uGlobal, uFnUtil, ufrmEhLibReport, ufrmFastReport, uDsUtil, uShopUtil, 
  uShopGlobal, uCtrlUtil, ufrmFvchOrder, ufrmBasic, ObjCommon,
  ufrmFvchCalc;
  
{$R *.dfm}

procedure TfrmFvchOrderList.FormCreate(Sender: TObject);
begin
  inherited;
  TDbGridEhSort.InitForm(self);
  fndP1_DEPT_ID.DataSet := Global.GetZQueryFromName('CA_DEPT_INFO');
  //��һ��ҳӦ���˿�:
  P1_D1.Date := fnTime.fnStrtoDate(FormatDateTime('YYYY-MM-01', date));
  P1_D2.Date := fnTime.fnStrtoDate(FormatDateTime('YYYY-MM-DD', date));
  fndP1_SHOP_ID.DataSet := Global.GetZQueryFromName('CA_SHOP_INFO');
  fndP1_SHOP_ID.KeyValue := Global.SHOP_ID;
  fndP1_SHOP_ID.Text := Global.SHOP_NAME;
  if Copy(Global.SHOP_ID,Length(Global.SHOP_ID)-3,Length(Global.SHOP_ID)) <> '0001' then
  begin
    SetEditStyle(dsBrowse,fndP1_SHOP_ID.Style);
    fndP1_SHOP_ID.Properties.ReadOnly := True;
  end;
  //2011.11.10 �����ŵ�Ȩ�޼�����Ȩ�ޣ���ԭ�еĿ���ע��
  RzPage.ActivePageIndex := 0;

  if ShopGlobal.GetProdFlag = 'E' then
    Label3.Caption := '�ֿ�����';
  ChangeButton;
  AddCbxPickList(fndP1_BILL_NAME,'BILL_NAME');
  fndP1_BILL_NAME.Properties.Items.Insert(0,'ȫ��');
end;

procedure TfrmFvchOrderList.actFindExecute(Sender: TObject);
begin
  inherited;
  Open('');
end;

procedure TfrmFvchOrderList.actInfoExecute(Sender: TObject);
begin
  inherited;
  if cdsList.IsEmpty then Exit;
  with TfrmFvchOrder.Create(self) do
  begin
    try
      cid := cdsList.FieldbyName('SHOP_ID').AsString;
      Open(cdsList.FieldByName('FVCH_ID').AsString);
      ShowModal;
    finally
      free;
    end;
  end;
end;

procedure TfrmFvchOrderList.ChangeButton;
begin
  if cdsList.Active and (cdsList.FieldByName('CHK_DATE').AsString = '') then actAudit.Caption := '���' else actAudit.Caption := '����';
   begin
     actDelete.Enabled := rzPage.ActivePageIndex > 0;
     actEdit.Enabled := rzPage.ActivePageIndex > 0;
     actSave.Enabled := rzPage.ActivePageIndex > 0;
     actCancel.Enabled := false;
     actInfo.Enabled := rzPage.ActivePageIndex > 0;
     actAudit.Enabled := rzPage.ActivePageIndex > 0;
   end;
end;
procedure TfrmFvchOrderList.actAuditExecute(Sender: TObject);
var
  Msg :string;
  Params:TftParamList;
begin
  inherited;
    if cdsList.IsEmpty then Raise Exception.Create('��ѡ�����˵��տ');
   if not ShopGlobal.GetChkRight('21300001',5) then Raise Exception.Create('��û������տ��Ȩ��,��͹���Ա��ϵ.');
    if cdsList.FieldByName('CHK_DATE').AsString<>'' then
       begin
         //if copy(cdsList.FieldByName('COMM').AsString,1,1)= '1' then Raise Exception.Create('�Ѿ�ͬ�������ݲ�������');
         if cdsList.FieldByName('CHK_USER').AsString<>Global.UserID then Raise Exception.Create('ֻ������˲��ܶԵ�ǰ���۵�ִ������');
         if MessageBox(Handle,'ȷ������ǰ�տ��',pchar(Application.Title),MB_YESNO+MB_ICONQUESTION)<>6 then Exit;
       end
    else
       begin
         //if copy(cdsList.FieldByName('COMM').AsString,1,1)= '1' then Raise Exception.Create('�Ѿ�ͬ�������ݲ��������');
         if MessageBox(Handle,'ȷ����˵�ǰ�տ��',pchar(Application.Title),MB_YESNO+MB_ICONQUESTION)<>6 then Exit;
       end;
    try
      Params := TftParamList.Create(nil);
      try
        Params.ParamByName('TENANT_ID').AsInteger := cdsList.FieldbyName('TENANT_ID').AsInteger;
        Params.ParamByName('SHOP_ID').asString := cdsList.FieldbyName('SHOP_ID').AsString;
        Params.ParamByName('RECV_ID').asString := cdsList.FieldbyName('RECV_ID').AsString;
        Params.ParamByName('CHK_DATE').asString := FormatDatetime('YYYY-MM-DD',date());
        Params.ParamByName('CHK_USER').asString := Global.UserID;
        if cdsList.FieldByName('CHK_DATE').AsString='' then
           Msg := Factor.ExecProc('TRecvOrderAudit',Params)
        else
           Msg := Factor.ExecProc('TRecvOrderUnAudit',Params) ;
      finally
         Params.free;
      end;
      MessageBox(Handle,Pchar(Msg),Pchar(Application.Title),MB_OK+MB_ICONINFORMATION);
      if cdsList.FieldByName('CHK_DATE').AsString='' then
         begin
            cdsList.Edit;
            cdsList.FieldByName('CHK_DATE').AsString := FormatDatetime('YYYY-MM-DD',date());
            cdsList.FieldByName('CHK_USER').AsString := Global.UserID;
            cdsList.FieldByName('CHK_USER_TEXT').AsString := Global.UserName;
            cdsList.Post;
         end
      else
         begin
            cdsList.Edit;
            cdsList.FieldByName('CHK_DATE').AsString := '';
            cdsList.FieldByName('CHK_USER').AsString := '';
            cdsList.FieldByName('CHK_USER_TEXT').AsString := '';
            cdsList.Post;
         end;
    except
      on E:Exception do
         begin
           Raise Exception.Create(E.Message);
         end;
    end;
end;

procedure TfrmFvchOrderList.FormShow(Sender: TObject);
begin
  inherited;
  Open('');
end;

function TfrmFvchOrderList.EncodeSQL(id:string;var w:string): string;
var
  strSql,strWhere: string;
begin
  if P1_D1.EditValue = null then Raise Exception.Create('ƾ֤������������Ϊ��');
  if P1_D2.EditValue = null then Raise Exception.Create('ƾ֤������������Ϊ��');
  if P1_D1.Date > P1_D2.Date then Raise Exception.Create('ƾ֤��ѯ��ʼ���ڲ��ܴ��ڽ�������');
  strWhere := strWhere + ' and A.TENANT_ID='+inttoStr(Global.TENANT_ID)+' ';
  //����ȡ���ݵ�����:
  if trim(id)<>'' then
    strWhere:=strWhere+' A.FVCH_ID > '+QuotedStr(id);
  //�ʿ�����:
  if P1_D1.Date=P1_D2.Date then
    strWhere := strWhere + ' and A.FVCH_DATE='+formatDatetime('YYYYMMDD',P1_D1.Date)+' '
  else
    strWhere := strWhere + ' and A.FVCH_DATE>='+formatDatetime('YYYYMMDD',P1_D1.Date)+' and A.FVCH_DATE<='+formatDatetime('YYYYMMDD',P1_D2.Date)+'';
  //�ŵ�����:
  if fndP1_SHOP_ID.AsString <> '' then
    strWhere := strWhere + ' and A.SHOP_ID='''+fndP1_SHOP_ID.AsString+'''';
  //��������:
  if fndP1_DEPT_ID.AsString <> '' then
    strWhere := strWhere + ' and A.DEPT_ID='''+fndP1_DEPT_ID.AsString+'''';

  //����״̬
  if fndSTATUS.ItemIndex>0 then
    strWhere := strWhere + ' and isnull(A.FVCH_FLAG,'''')='''+InttoStr(fndSTATUS.ItemIndex)+''' ';
  //��������
  if fndP1_BILL_NAME.ItemIndex>0 then
    strWhere := strWhere + ' and B.FVCH_GTYPE='''+TRecord_(fndP1_BILL_NAME.Properties.Items.Objects[fndP1_BILL_NAME.ItemIndex]).FieldByName('CODE_ID').AsString+''' ';

  strSql:=
    'select distinct '+
    ' A.TENANT_ID '+
    ',A.SHOP_ID'+
    ',A.FVCH_ID'+
    ',A.FVCH_CODE'+   //ƾ֤����
    ',A.DEPT_ID'+
    ',A.FVCH_DATE'+
    ',A.FVCH_ATTACH '+
    ',A.CREA_USER'+
    ',A.FVCH_FLAG'+
    ',A.FVCH_IMPORT_ID '+
    ',B.FVCH_GTYPE '+
    ' from ACC_FVCHORDER A,ACC_FVCHGLIDE B '+
    ' where A.TENANT_ID=B.TENANT_ID and A.FVCH_ID=B.FVCH_ID '+
    ' '+strWhere+ShopGlobal.GetDataRight('A.SHOP_ID',1)+ShopGlobal.GetDataRight('A.DEPT_ID',2)+' ';

  //�����ŵ��
  strSql:=
    'select jc.*'+
    ' ,c.DEPT_NAME'+
    ' ,d.SHOP_NAME as SHOP_ID_TEXT'+
    ' ,e.USER_NAME as CREA_USER_TEXT '+
    '  from ('+strSql+') jc '+
    ' left outer join CA_DEPT_INFO c on jc.TENANT_ID=c.TENANT_ID and jc.DEPT_ID=c.DEPT_ID '+
    ' left outer join CA_SHOP_INFO d on jc.TENANT_ID=d.TENANT_ID and jc.SHOP_ID=d.SHOP_ID '+
    ' left outer join VIW_USERS e on jc.TENANT_ID=e.TENANT_ID and jc.CREA_USER=e.USER_ID ';

  case Factor.iDbType of
   0: result := 'select top 600 * from ('+strSql+') jp order by FVCH_ID';
   1: result := 'select * from ('+strSql+' order by FVCH_ID) where ROWNUM<=600';
   4: result :=
       'select * from ('+
       'select * from ('+strSql+') j order by FVCH_ID) tp fetch first 600  rows only';
   5: result := 'select * from ('+strSql+') j order by FVCH_ID limit 600';
   else
     result := 'select * from ('+strSql+') j order by FVCH_ID';
  end;
end;

procedure TfrmFvchOrderList.Open(Id: string);
var
  rs:TZQuery;
  Str:string;
  sm:TMemoryStream;
begin
  if not Visible then Exit;
  if Id='' then CdsList.close;
  rs := TZQuery.Create(nil);
  sm := TMemoryStream.Create;
  CdsList.DisableControls;
  try
    rs.SQL.Text :=ParseSQL(Factor.iDbType, EncodeSQL(Id,Str));
    Factor.Open(rs);
    rs.SortedFields :='FVCH_ID';
    rs.IndexFieldNames :='FVCH_ID';
    if Id='' then
    begin
      rs.SaveToStream(sm);
      CdsList.LoadFromStream(sm);
      CdsList.SortedFields := 'FVCH_ID';
      CdsList.IndexFieldNames := 'FVCH_ID';
    end else
    begin
      rs.SaveToStream(sm);
      CdsList.AddFromStream(sm);
    end;
    if rs.RecordCount <600 then IsEnd := True else IsEnd := false;
  finally
    CdsList.EnableControls;
    sm.Free;
    rs.Free;
  end;
end;

procedure TfrmFvchOrderList.RzPageChange(Sender: TObject);
begin
  inherited;
  actFind.OnExecute(nil);
  ChangeButton;
end;

procedure TfrmFvchOrderList.frfRecvOrderUserFunction(const Name: String; p1,
  p2, p3: Variant; var Val: Variant);
var small:real;
begin
  inherited;
  if UPPERCASE(Name)='SMALLTOBIG' then
     begin
       small := frParser.Calc(p1);
       Val := FnNumber.SmallTOBig(small);
     end;
end;

procedure TfrmFvchOrderList.actDeleteExecute(Sender: TObject);
begin
  inherited;
   if cdsList.IsEmpty then Exit;
   if not ShopGlobal.GetChkRight('21300001',4) then Raise Exception.Create('��û��ɾ��ƾ֤��Ȩ��,��͹���Ա��ϵ.');
   if cdsList.FieldByName('CREA_USER').AsString <> Global.UserID then
    begin
      if not ShopGlobal.GetChkRight('21300001',5) then
        Raise Exception.Create('��û��ɾ��"'+cdsList.FieldByName('RECV_USER_TEXT').AsString+'"¼��ƾ֤��Ȩ��!');
    end;
   if cdsList.FieldByName('FVCH_IMPORT_ID').AsString <> '' then Raise Exception.Create('��ƾ֤�������ϵͳ,����ִ��ɾ������.');   
   if MessageBox(Handle,'ȷ��ɾ����ǰѡ�е�ƾ֤��','������ʾ',MB_YESNO+MB_ICONQUESTION)<>6 then Exit;
   with TfrmFvchOrder.Create(self) do
   begin
     try
       Open(cdsList.FieldByName('FVCH_ID').AsString);
       DeleteOrder;
       cdsList.Delete;
       if cdsList.IsEmpty then CdsFvchData.Close;
       MessageBox(Handle,'ɾ���տ�ɹ�...','������ʾ...',MB_OK+MB_ICONINFORMATION);
     finally
       free;
     end;
   end;
end;

procedure TfrmFvchOrderList.AddRecord(AObj: TRecord_);
begin
 
end;

procedure TfrmFvchOrderList.frfRecvOrderGetValue(const ParName: String;
  var ParValue: Variant);
begin
  inherited;
  if ParName='��ҵ����' then ParValue := ShopGlobal.TENANT_NAME;
  if ParName='��ҵ���' then ParValue := ShopGlobal.SHORT_TENANT_NAME;
end;

function TfrmFvchOrderList.CheckCanExport: boolean;
begin
  result:=ShopGlobal.GetChkRight('21300001',7);
end;


procedure TfrmFvchOrderList.CdsListAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if IsEnd or not DataSet.Eof then Exit;
  if CdsList.ControlsDisabled then Exit;  
  Open(MaxId);
end;

procedure TfrmFvchOrderList.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
var ARect:TRect;
begin
  inherited;
  if (Rect.Top = DBGridEh1.CellRect(DBGridEh1.Col, DBGridEh1.Row).Top) and (not
    (gdFocused in State) or not DBGridEh1.Focused) then
  begin
    DBGridEh1.Canvas.Brush.Color := clAqua;
  end;
  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  if Column.FieldName = 'SEQNO' then
  begin
    ARect := Rect;
    DbGridEh1.canvas.FillRect(ARect);
    DrawText(DbGridEh1.Canvas.Handle,pchar(Inttostr(CdsList.RecNo)),length(Inttostr(CdsList.RecNo)),ARect,DT_NOCLIP or DT_SINGLELINE or DT_CENTER or DT_VCENTER);
  end;
end;

procedure TfrmFvchOrderList.actFvchExecute(Sender: TObject);
begin
  with TfrmFvchCalc.Create(nil) do
  begin
    try
      ShowModal;
    finally
      Free;
    end;
  end;
end;

procedure TfrmFvchOrderList.actPrintExecute(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmFvchOrderList.actPreviewExecute(Sender: TObject);
begin
  inherited;
  //
end;

end.