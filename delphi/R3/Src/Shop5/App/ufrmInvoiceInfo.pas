unit ufrmInvoiceInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uframeDialogForm, ActnList, Menus, RzTabs, ExtCtrls, RzPanel,
  StdCtrls, RzLabel, RzButton, cxMemo, cxControls, cxContainer, cxEdit,
  cxTextEdit, ZBase, cxRadioGroup, DB, DBClient, cxDropDownEdit, ADODB,
  cxCalendar, cxMaskEdit, cxButtonEdit, zrComboBoxList, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, cxCurrencyEdit;

type
  TfrmInvoiceInfo = class(TframeDialogForm)
    Btn_Save: TRzBitBtn;
    Btn_Close: TRzBitBtn;
    lab_REMARK: TRzLabel;
    labINVH_NO: TRzLabel;
    edtINVH_NO: TcxTextEdit;
    labCREA_DATE: TRzLabel;
    edtSHOP_ID: TzrComboBoxList;
    LabID_NUMBER: TRzLabel;
    edtTOTAL_AMT: TcxTextEdit;
    edtREMARK: TcxMemo;
    RzLabel2: TRzLabel;
    cdsTable: TZQuery;
    lab_SHOP_ID: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel6: TRzLabel;
    edtCREA_USER: TzrComboBoxList;
    RzLabel9: TRzLabel;
    RzLabel1: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    edtENDED_NO: TcxTextEdit;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    edtBEGIN_NO: TcxTextEdit;
    RzLabel10: TRzLabel;
    edtCANCEL_AMT: TcxTextEdit;
    RzLabel11: TRzLabel;
    edtBALANCE: TcxTextEdit;
    edtUSING_AMT: TcxTextEdit;
    RzLabel12: TRzLabel;
    edtCREA_DATE: TcxDateEdit;
    procedure Btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Btn_SaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edtBEGIN_NOFocusChanged(Sender: TObject);
    procedure edtENDED_NOFocusChanged(Sender: TObject);
    procedure edtUSING_AMTFocusChanged(Sender: TObject);
    procedure edtCANCEL_AMTFocusChanged(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Aobj:TRecord_;
    Saved:Boolean;
    procedure SetText(Type_i:Integer);
    procedure SetdbState(const Value: TDataSetState); override;
    procedure Open(code:string);
    procedure Append;
    procedure Edit(code:string);
    procedure Save;
    procedure Writeto(Aobj:TRecord_);
    function  IsEdit(Aobj:TRecord_;cdsTable:TZQuery):Boolean;//判断会员档案是否有修改
    class function AddDialog(Owner:TForm;var _AObj:TRecord_):boolean;
    class function EditDialog(Owner:TForm;id:string;var _AObj:TRecord_):boolean;
    class function ShowDialog(Owner:TForm;id:string):boolean;
  end;

implementation
uses uShopUtil,uDsUtil, ufrmBasic, Math, uGlobal, uFnUtil, uShopGlobal;
{$R *.dfm}

procedure TfrmInvoiceInfo.Append;
begin
  Open('');
  dbState := dsInsert;
  edtCREA_DATE.Date := Global.SysDate;
  //edtCREA_USER.Text := FormatDateTime('YYYY-MM-DD',Global.SysDate);
  edtSHOP_ID.KeyValue := Global.SHOP_ID;
  edtSHOP_ID.Text := Global.SHOP_NAME;
  edtCREA_USER.KeyValue := Global.UserID;
  edtCREA_USER.Text := Global.UserName;
end;

procedure TfrmInvoiceInfo.Btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmInvoiceInfo.Edit(code: string);
begin
  Open(code);
  dbState := dsEdit;
end;

procedure TfrmInvoiceInfo.FormCreate(Sender: TObject);
begin
  inherited;
  edtSHOP_ID.DataSet := Global.GetZQueryFromName('CA_SHOP_INFO');
  edtCREA_USER.DataSet := Global.GetZQueryFromName('CA_USERS');
  Aobj := TRecord_.Create;
end;

procedure TfrmInvoiceInfo.FormDestroy(Sender: TObject);
begin
  inherited;
  Aobj.Free;
end;

procedure TfrmInvoiceInfo.Open(code: string);
var
  Params:TftParamList;
begin
  Params := TftParamList.Create(nil);
  try
    Params.ParamByName('INVH_ID').asString := code;
    Params.ParamByName('TENANT_ID').AsInteger := Global.TENANT_ID;
    cdsTable.Close;
    Factor.Open(cdsTable,'TInvoice',Params);
    Aobj.ReadFromDataSet(cdsTable);
    ReadFromObject(Aobj,Self);
    edtSHOP_ID.KeyValue := Aobj.FieldbyName('SHOP_ID').AsString;
    edtSHOP_ID.Text := TdsFind.GetNameByID(Global.GetZQueryFromName('CA_SHOP_INFO'),'SHOP_ID','SHOP_NAME',Aobj.FieldbyName('SHOP_ID').AsString);
    edtCREA_USER.KeyValue := Aobj.FieldbyName('CREA_USER').AsString;
    edtCREA_USER.Text := TdsFind.GetNameByID(Global.GetZQueryFromName('CA_USERS'),'USER_ID','USER_NAME',Aobj.FieldbyName('CREA_USER').AsString);
    dbState := dsBrowse;
  finally
  Params.Free;
  end;
end;

procedure TfrmInvoiceInfo.Save;
 procedure UpdateToGlobal(AObj:TRecord_);
   var Temp:TZQuery;
   begin
      {Temp := Global.GetZQueryFromName('CA_USERS');
      Temp.Filtered := false;
      if Temp.Locate('USER_ID',AObj.FieldByName('USER_ID').AsString,[]) then
         Temp.Edit
      else
         Temp.Append;
      AObj.WriteToDataSet(Temp,false);
      Temp.Post;}
   end;
var temp,tmp,tmp1:TZQuery;
    j:integer;
begin
  if dbState=dsBrowse then exit;
  if trim(edtSHOP_ID.Text)='' then
  begin
    if edtSHOP_ID.CanFocus then edtSHOP_ID.SetFocus;
    raise Exception.Create('请选择领用门店！');
  end;
  if trim(edtCREA_USER.Text)='' then
  begin
    if edtCREA_USER.CanFocus then edtCREA_USER.SetFocus;
    raise Exception.Create('请选择领用人！');
  end;
  if trim(edtCREA_DATE.Text)='' then
  begin
    if edtCREA_DATE.CanFocus then edtCREA_DATE.SetFocus;
    raise Exception.Create('请选择领用日期！');
  end;
  if trim(edtINVH_NO.Text)='' then
  begin
    if edtINVH_NO.CanFocus then edtINVH_NO.SetFocus;
    raise Exception.Create('请输入发票本号！');
  end;
  if trim(edtBEGIN_NO.Text)='' then
  begin
    if edtBEGIN_NO.CanFocus then edtBEGIN_NO.SetFocus;
    raise Exception.Create('请输入发票起始号！');
  end;
  if trim(edtENDED_NO.Text)='' then
  begin
    if edtENDED_NO.CanFocus then edtENDED_NO.SetFocus;
    raise Exception.Create('请输入发票终止号！');
  end;

  //此检测，现已经不能只对前台检测，要OBJ中对整个数据库检测

  //检测结束
  Writeto(Aobj);

  if not IsEdit(Aobj,cdsTable) then exit;
  if dbState = dsInsert then
  begin
    AObj.FieldbyName('INVH_ID').AsString := TSequence.NewId;
    AObj.FieldbyName('TENANT_ID').AsInteger := Global.TENANT_ID;
  end;
  if dbState=dsInsert then
    cdsTable.Append
  else if dbState=dsEdit then
    cdsTable.Edit;
  Aobj.WriteToDataSet(cdsTable);
  cdsTable.Post;
  if Factor.UpdateBatch(cdsTable,'TInvoice',nil) then
     UpdateToGlobal(AObj);
  dbState:=dsBrowse;
  Saved:=True;
end;

procedure TfrmInvoiceInfo.Btn_SaveClick(Sender: TObject);
var bl:boolean;
begin
  inherited;
  bl:=(dbState<>dsEdit);
  Save;
  If Saved and Assigned(OnSave) then OnSave(Aobj);
  If Saved and Assigned(OnSave) and bl then
  begin
    if MessageBox(Handle,'是否继续新增用户?',pchar(Application.Title),MB_YESNO+MB_ICONQUESTION)=6 then
      Append
    else
      ModalResult := MROK;
  end
  else
    ModalResult := MROK;
end;

procedure TfrmInvoiceInfo.FormShow(Sender: TObject);
begin
  inherited;
  if edtINVH_NO.CanFocus then edtINVH_NO.SetFocus;
end;

procedure TfrmInvoiceInfo.SetdbState(const Value: TDataSetState);
begin
  inherited;
  //RzLabel1.Visible:=True;
  //RzLabel2.Visible:=True;
  //RzLabel4.Visible:=True;
  //RzLabel7.Visible:=True;
  Btn_Save.Visible := (value<>dsBrowse);
  case dbState of
    dsInsert:Caption:='发票信息--(新增)';
    dsEdit:Caption:='发票信息--(修改)';
  else
    begin
      Caption:='发票信息';
      //RzLabel1.Visible:=False;
      //RzLabel2.Visible:=False;
      //RzLabel4.Visible:=False;
      //RzLabel7.Visible:=False;
    end;
  end;
end;

function TfrmInvoiceInfo.IsEdit(Aobj: TRecord_;
  cdsTable: TZQuery): Boolean;
var i:integer;
begin
  Result:=False;
  for i:=0 to cdsTable.FieldCount-1 do
  begin
    if AObj.Fields[i].AsString<>cdsTable.Fields[i].AsString then
    begin
      Result:=True;
      break;
    end;
  end;
end;

procedure TfrmInvoiceInfo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var i:integer;
begin
  inherited;
  if dbState=dsBrowse then exit;
  try
   if not((dbState = dsInsert) and (trim(edtINVH_NO.Text)='')) then
   begin
    WriteTo(AObj);
    if not IsEdit(Aobj,cdsTable) then Exit;
    i:=MessageBox(Handle,'发票信息有修改，是否保存修改信息？',pchar(Application.Title),MB_YESNOCANCEL+MB_DEFBUTTON1+MB_ICONINFORMATION);
    if i=6 then
       begin
         Save;
         if Saved and Assigned(OnSave) then OnSave(AObj);
       end;
    if i=2 then abort;
   end;
  except
    CanClose := false;
    Raise;
  end;
end;

procedure TfrmInvoiceInfo.Writeto(Aobj: TRecord_);
begin
  WriteToObject(Aobj,self);
  Aobj.FieldByName('SHOP_ID').AsString := edtSHOP_ID.AsString;
  Aobj.FieldByName('CREA_USER').AsString := edtCREA_USER.AsString;
end;

class function TfrmInvoiceInfo.AddDialog(Owner: TForm;
  var _AObj: TRecord_): boolean;
begin
{   if not ShopGlobal.GetChkRight('100017') then Raise Exception.Create('你没有新增用户的权限,请和管理员联系.'); }
   with TfrmInvoiceInfo.Create(Owner) do
    begin
      try
        Append;
        if ShowModal=MROK then
        begin
          AObj.CopyTo(_AObj);
          result :=True;
        end
        else
          result :=False;
      finally
        free;
      end;
    end;
end;

class function TfrmInvoiceInfo.EditDialog(Owner: TForm; id: string;
  var _AObj: TRecord_): boolean;
begin
{   if not ShopGlobal.GetChkRight('100018') then Raise Exception.Create('你没有修改用户的权限,请和管理员联系.'); }
   with TfrmInvoiceInfo.Create(Owner) do
    begin
      try
        Edit(id);
        if ShowModal=MROK then
        begin
          AObj.CopyTo(_AObj);
          result :=True;
        end
        else
          result :=False;
      finally
        free;
      end;
    end;
end;

class function TfrmInvoiceInfo.ShowDialog(Owner: TForm; id: string): boolean;
begin
   with TfrmInvoiceInfo.Create(Owner) do
    begin
      try
        Open(id);
        ShowModal;
      finally
        free;
      end;
    end;
end;


procedure TfrmInvoiceInfo.edtBEGIN_NOFocusChanged(Sender: TObject);
begin
  inherited;
  try
    if Trim(edtBEGIN_NO.Text) = '' then Exit;
    StrToInt64(Trim(edtBEGIN_NO.Text));
  except
    edtBEGIN_NO.Text := '0';
    edtBEGIN_NO.SetFocus;
  end;
end;

procedure TfrmInvoiceInfo.edtENDED_NOFocusChanged(Sender: TObject);
begin
  inherited;
  try
    if Trim(edtENDED_NO.Text) = '' then Exit;
    StrToInt64(Trim(edtENDED_NO.Text));
    SetText(1);
  except
    edtENDED_NO.Text := '0';
    edtENDED_NO.SetFocus;
  end;
end;

procedure TfrmInvoiceInfo.edtUSING_AMTFocusChanged(Sender: TObject);
begin
  inherited;
  Try
    if Trim(edtUSING_AMT.Text) = '' then Exit;
    StrToInt64(Trim(edtUSING_AMT.Text));
  except
    edtUSING_AMT.Text := '0';
    edtUSING_AMT.SetFocus;
  end;
end;

procedure TfrmInvoiceInfo.edtCANCEL_AMTFocusChanged(Sender: TObject);
begin
  inherited;
  try
    if Trim(edtCANCEL_AMT.Text) = '' then Exit;
    StrToInt64(Trim(edtCANCEL_AMT.Text));
    SetText(2);
  except
    edtCANCEL_AMT.Text := '0';
    edtCANCEL_AMT.SetFocus;
  end;
end;

procedure TfrmInvoiceInfo.SetText(Type_i: Integer);
begin
  case Type_i of
    1:edtTOTAL_AMT.Text := IntToStr(StrToInt64(Trim(edtENDED_NO.Text))-StrToInt64(Trim(edtBEGIN_NO.Text))+1);
    2:edtBALANCE.Text := IntToStr(StrToInt64(Trim(edtTOTAL_AMT.Text))-StrToInt64(Trim(edtUSING_AMT.Text))-StrToInt64(Trim(edtCANCEL_AMT.Text)));
  end;
end;

end.
