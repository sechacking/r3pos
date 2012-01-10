unit ufrmMktTaskOrderList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uframeContractToolForm, DB, ZAbstractRODataset, ZBase,
  ZAbstractDataset, ZDataset, Menus, ActnList, ComCtrls, ToolWin, StdCtrls,
  RzLabel, jpeg, ExtCtrls, Grids, DBGridEh, RzTabs, RzPanel, RzButton,
  cxTextEdit, cxButtonEdit, zrComboBoxList, cxControls, cxContainer,
  cxEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, FR_Class, cxSpinEdit;

type
  TfrmMktTaskOrderList = class(TframeContractToolForm)
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel5: TRzLabel;
    Label3: TLabel;
    fndGLIDE_NO: TcxTextEdit;
    fndDEPT_ID: TzrComboBoxList;
    btnOk: TRzBitBtn;
    fndPLAN_USER: TzrComboBoxList;
    Label2: TLabel;
    frfMktPlanOrderList: TfrReport;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    K1: TcxSpinEdit;
    K2: TcxSpinEdit;
    Label40: TLabel;
    fndSHOP_ID: TzrComboBoxList;
    Label1: TLabel;
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actPreviewExecute(Sender: TObject);
    procedure actFindExecute(Sender: TObject);
    procedure actInfoExecute(Sender: TObject);
    procedure actAuditExecute(Sender: TObject);
    procedure actPriorExecute(Sender: TObject);
    procedure actNextExecute(Sender: TObject);
    procedure frfMktPlanOrderListGetValue(const ParName: String;
      var ParValue: Variant);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure cdsListAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    { Private declarations }
    function  CheckCanExport: boolean; override;
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
uses uDsUtil, uFnUtil,uGlobal,uShopUtil,uXDictFactory,ufrmFastReport, ufrmMktTaskOrder,
  uShopGlobal;
{$R *.dfm}

procedure TfrmMktTaskOrderList.actNewExecute(Sender: TObject);
begin
  if not ShopGlobal.GetChkRight('100002150',2) then Raise Exception.Create('��û���������ۼƻ���Ȩ��,��͹���Ա��ϵ.');
  inherited;

end;

procedure TfrmMktTaskOrderList.actDeleteExecute(Sender: TObject);
begin
  if not ShopGlobal.GetChkRight('100002150',4) then Raise Exception.Create('��û��ɾ�����ۼƻ�����Ȩ��,��͹���Ա��ϵ.');
  if (CurContract=nil) then
     begin
       if cdsList.IsEmpty then Exit;
       OpenForm(cdsList.FieldbyName('PLAN_ID').AsString,cdsList.FieldbyName('CLIENT_ID').AsString);
     end;
  if CurContract=nil then Raise Exception.Create('"���ۼƻ�"���쳣!');

  if TfrmMktTaskOrder(CurContract).cdsHeader.FieldByName('CREA_USER').AsString <> Global.UserID then
    begin
      if not ShopGlobal.GetChkRight('100002150',5) then
         Raise Exception.Create('��û��ɾ��"'+TdsFind.GetNameByID(Global.GetZQueryFromName('CA_USERS'),'USER_ID','USER_NAME',TfrmMktTaskOrder(CurContract).cdsHeader.FieldByName('CREA_USER').AsString)+'"¼�뵥�ݵ�Ȩ��!');
    end;
  inherited;
  if (CurContract<>nil) then
     begin
       if not CurContract.saved then Exit;
       if ShopGlobal.GetChkRight('100002150',2) and (MessageBox(Handle,'ɾ����ǰ���ݳɹ�,�Ƿ�����������ۼƻ�����',pchar(Application.Title),MB_YESNO+MB_ICONINFORMATION)=6) then
          CurContract.NewOrder
       else
          if rzPage.PageCount>2 then CurContract.Close;
     end;
end;

procedure TfrmMktTaskOrderList.actEditExecute(Sender: TObject);
begin
  if not ShopGlobal.GetChkRight('100002150',3) then Raise Exception.Create('��û���޸Ķ�������Ȩ��,��͹���Ա��ϵ.');
  if (CurContract=nil) then
     begin
       if cdsList.IsEmpty then Exit;
       OpenForm(cdsList.FieldbyName('PLAN_ID').AsString,cdsList.FieldbyName('CLIENT_ID').AsString);
     end;
  if CurContract=nil then Raise Exception.Create('"���ۼƻ�"���쳣!');

  if TfrmMktTaskOrder(CurContract).cdsHeader.FieldByName('CREA_USER').AsString <> Global.UserID then
    begin
      if not ShopGlobal.GetChkRight('100002150',5) then
         Raise Exception.Create('��û���޸�"'+TdsFind.GetNameByID(Global.GetZQueryFromName('CA_USERS'),'USER_ID','USER_NAME',TfrmMktTaskOrder(CurContract).cdsHeader.FieldByName('CREA_USER').AsString)+'"¼�뵥�ݵ�Ȩ��!');
    end;
  inherited;

end;

procedure TfrmMktTaskOrderList.actSaveExecute(Sender: TObject);
begin
  inherited;
  if (CurContract<>nil) then
     begin
       if not CurContract.saved then Exit;

       if ShopGlobal.GetChkRight('100002150',2) and (MessageBox(Handle,'�Ƿ����������������',pchar(Application.Title),MB_YESNO+MB_ICONINFORMATION)=6) then
          CurContract.NewOrder
       else
          if rzPage.PageCount>2 then CurContract.Close;
     end;
end;

procedure TfrmMktTaskOrderList.actPrintExecute(Sender: TObject);
begin
  inherited;
  if not ShopGlobal.GetChkRight('100002150',6) then Raise Exception.Create('��û�д�ӡ��������Ȩ��,��͹���Ա��ϵ.');
  with TfrmFastReport.Create(Self) do
    begin
      try
        if CurContract<>nil then
           begin
             if CurContract.oid = '' then Exit;
             if CurContract.dbState <> dsBrowse then Raise Exception.Create('�뱣����ٴ�ӡ...');
             //BeforePrint := PrintBefore;
             //AfterPrint := PrintAfter;
             PrintReport(PrintSQL(inttostr(Global.TENANT_ID),CurContract.oid),frfMktPlanOrderList);
           end
        else
           begin
             if cdsList.IsEmpty then Exit;
             //BeforePrint := PrintBefore;
             //AfterPrint := PrintAfter;
             PrintReport(PrintSQL(cdsList.FieldbyName('TENANT_ID').AsString,cdsList.FieldbyName('PLAN_ID').AsString),frfMktPlanOrderList);
           end;
      finally
         free;
      end;
    end;
end;

procedure TfrmMktTaskOrderList.actPreviewExecute(Sender: TObject);
begin
  inherited;
  if not ShopGlobal.GetChkRight('100002150',6) then Raise Exception.Create('��û�д�ӡ��������Ȩ��,��͹���Ա��ϵ.');
  with TfrmFastReport.Create(Self) do
    begin
      try
        if CurContract<>nil then
           begin
             if CurContract.oid = '' then Exit;
             if CurContract.dbState <> dsBrowse then Raise Exception.Create('�뱣����ٴ�ӡ...');
             //BeforePrint := PrintBefore;
             //AfterPrint := PrintAfter;
             ShowReport(PrintSQL(inttostr(Global.TENANT_ID),CurContract.oid),frfMktPlanOrderList,nil,true);
           end
        else
           begin
             if cdsList.IsEmpty then Exit;
             //BeforePrint := PrintBefore;
             //AfterPrint := PrintAfter;
             ShowReport(PrintSQL(cdsList.FieldbyName('TENANT_ID').AsString,cdsList.FieldbyName('PLAN_ID').AsString),frfMktPlanOrderList,nil,true);
           end;
      finally
         free;
      end;
    end;
end;

procedure TfrmMktTaskOrderList.Open(Id: string);
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
    rs.Params.ParamByName('K1').AsInteger := K1.Value;
    rs.Params.ParamByName('K2').AsInteger := K2.Value;
    if rs.Params.FindParam('PLAN_USER')<>nil then rs.Params.FindParam('PLAN_USER').AsString := fndPLAN_USER.AsString;
    if rs.Params.FindParam('DEPT_ID')<>nil then rs.Params.FindParam('DEPT_ID').AsString := fndDEPT_ID.AsString;
    if rs.Params.FindParam('SHOP_ID')<>nil then rs.Params.FindParam('SHOP_ID').AsString := fndSHOP_ID.AsString;
    Factor.Open(rs);
    rs.Last;
    MaxId := rs.FieldbyName('PLAN_ID').AsString;
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

procedure TfrmMktTaskOrderList.actFindExecute(Sender: TObject);
begin
  inherited;
  Open('');
end;

procedure TfrmMktTaskOrderList.actInfoExecute(Sender: TObject);
begin
  inherited;
  if (CurContract=nil) then
     begin
       if cdsList.IsEmpty then Exit;
       OpenForm(cdsList.FieldbyName('PLAN_ID').AsString,cdsList.FieldbyName('CLIENT_ID').AsString);
     end;
end;

procedure TfrmMktTaskOrderList.actAuditExecute(Sender: TObject);
begin
  if not ShopGlobal.GetChkRight('100002150',5) then Raise Exception.Create('��û��������ۼƻ�����Ȩ��,��͹���Ա��ϵ.');
  if (CurContract=nil) then
     begin
       if cdsList.IsEmpty then Exit;
       OpenForm(cdsList.FieldbyName('PLAN_ID').AsString,cdsList.FieldbyName('CLIENT_ID').AsString);
     end;
  inherited;

end;

procedure TfrmMktTaskOrderList.actPriorExecute(Sender: TObject);
var
  Temp:TZQuery;
  Params:TftParamList;
begin
  inherited;
  if CurContract <> nil then
     begin
        Params := TftParamList.Create(nil);
        try
          Params.ParamByName('TENANT_ID').asInteger := Global.TENANT_ID;
          Params.ParamByName('CLIENT_ID').asString := CurContract.cid;
          Params.ParamByName('CREA_USER').asString := Global.UserID;
          if (CurContract.gid = '') or (CurContract.gid='..����..') then
             Params.ParamByName('GLIDE_NO').asString := '9999999999999999'
          else
             Params.ParamByName('GLIDE_NO').asString := CurContract.gid;
          Temp := TZQuery.Create(nil);
          try
             Factor.Open(Temp,'TMktTaskOrderGetPrior',Params);
             if Temp.Fields[0].asString<>'' then
                CurContract.Open(Temp.Fields[0].asString);
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

procedure TfrmMktTaskOrderList.actNextExecute(Sender: TObject);
var
  Temp:TZQuery;
  Params:TftParamList;
begin
  inherited;
  if CurContract <> nil then
     begin
        Params := TftParamList.Create(nil);
        try
          Params.ParamByName('TENANT_ID').asInteger := Global.TENANT_ID;
          Params.ParamByName('CLIENT_ID').asString := CurContract.cid;
          Params.ParamByName('CREA_USER').asString := Global.UserID;
          if (CurContract.gid = '') then
             Params.ParamByName('GLIDE_NO').asString := '00000000000000'
          else
             Params.ParamByName('GLIDE_NO').asString := CurContract.gid;
          Temp := TZQuery.Create(nil);
          try
             Factor.Open(Temp,'TMktTaskOrderGetNext',Params);
             if Temp.Fields[0].asString<>'' then
                CurContract.Open(Temp.Fields[0].asString);
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

procedure TfrmMktTaskOrderList.frfMktPlanOrderListGetValue(
  const ParName: String; var ParValue: Variant);
begin
  inherited;
  if ParName='��ҵ����' then ParValue := ShopGlobal.TENANT_NAME;
  if ParName='��ҵ���' then ParValue := ShopGlobal.SHORT_TENANT_NAME;
  if ParName='��ӡ��' then ParValue := ShopGlobal.UserName;
end;

function TfrmMktTaskOrderList.EncodeSQL(id: string): string;
var w,w1:string;
begin
  w := ' where A.TENANT_ID=:TENANT_ID and PLAN_TYPE=''2'' and A.KPI_YEAR>=:K1 and A.KPI_YEAR<=:K2 ';
  if fndDEPT_ID.AsString <> '' then
     w := w +' and A.DEPT_ID=:DEPT_ID';
  if fndSHOP_ID.AsString <> '' then
     w := w +' and A.SHOP_ID=:SHOP_ID';
  if fndPLAN_USER.AsString <> '' then
     w := w + ' and A.PLAN_USER=:PLAN_USER';
  if Trim(fndGLIDE_NO.Text) <> '' then
     w := w +' and A.GLIDE_NO like ''%'+trim(fndGLIDE_NO.Text)+'''';

  if id<>'' then
     w := w +' and A.PLAN_ID>'''+id+'''';
  result :=
     'select A.PLAN_ID,A.GLIDE_NO,A.KPI_YEAR,A.PLAN_DATE,A.BEGIN_DATE,A.END_DATE,'+
     'A.DEPT_ID,F.DEPT_NAME as DEPT_ID_TEXT,A.PLAN_USER,D.USER_NAME as PLAN_USER_TEXT,'+
     'A.CHK_DATE,A.CHK_USER,C.USER_NAME as CHK_USER_TEXT,A.PLAN_AMT,A.PLAN_MNY,A.BOND_MNY,'+
     'A.BUDG_MNY,A.REMARK,A.CREA_DATE,A.CREA_USER,E.USER_NAME as CREA_USER_TEXT '+
     ' from MKT_PLANORDER A '+
     ' left join VIW_USERS C on A.TENANT_ID=C.TENANT_ID and A.CHK_USER=C.USER_ID '+
     ' left join VIW_USERS D on A.TENANT_ID=D.TENANT_ID and A.PLAN_USER=D.USER_ID '+
     ' left join VIW_USERS E on A.TENANT_ID=E.TENANT_ID and A.CREA_USER=E.USER_ID '+
     ' left join CA_DEPT_INFO F on A.TENANT_ID=F.TENANT_ID and A.DEPT_ID=F.DEPT_ID '+w+ShopGlobal.GetDataRight('A.SHOP_ID',1)+ShopGlobal.GetDataRight('A.DEPT_ID',2)+' ';
  case Factor.iDbType of
  0:result := 'select top 600 * from ('+result+') jp order by PLAN_ID';
  1:result :=
       'select * from ('+
       'select * from ('+result+') j order by PLAN_ID) where ROWNUM<=600';
  4:result :=
       'select * from ('+
       'select * from ('+result+') j order by PLAN_ID) tp fetch first 600  rows only';
  5:result := 'select * from ('+result+') j order by PLAN_ID limit 600';
  else
    result := 'select * from ('+result+') j order by PLAN_ID';
  end;
end;

function TfrmMktTaskOrderList.GetFormClass: TFormClass;
begin
  Result := TfrmMktTaskOrder;
end;

function TfrmMktTaskOrderList.PrintSQL(tenantid, id: string): string;
begin
  Result := '';
end;

function TfrmMktTaskOrderList.CheckCanExport: boolean;
begin
  result:=ShopGlobal.GetChkRight('100002150',7);
end;

procedure TfrmMktTaskOrderList.DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
  actInfo.OnExecute(nil)
end;

procedure TfrmMktTaskOrderList.cdsListAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if IsEnd or not DataSet.Eof then Exit;
  if cdsList.ControlsDisabled then Exit;
  Open(MaxId);
end;

procedure TfrmMktTaskOrderList.FormShow(Sender: TObject);
begin
  inherited;
  Open('');
  //���봰��Ĭ���������ж��Ƿ�����Ȩ��:
  if (ShopGlobal.GetChkRight('100002150',2)) and (rzPage.ActivePageIndex = 0) and (rzPage.PageCount=1) then actNew.OnExecute(nil);
end;

procedure TfrmMktTaskOrderList.FormCreate(Sender: TObject);
begin
  inherited;
  InitGridPickList(DBGridEh1);
  fndDEPT_ID.DataSet := Global.GetZQueryFromName('CA_DEPT_INFO');
  fndDEPT_ID.RangeField := 'DEPT_TYPE';
  fndDEPT_ID.RangeValue := '1';
  fndPLAN_USER.DataSet := Global.GetZQueryFromName('CA_USERS');
  fndSHOP_ID.DataSet := Global.GetZQueryFromName('CA_SHOP_INFO');
  K1.Value := StrtoInt(formatDatetime('YYYY',date()));
  K2.Value := StrtoInt(formatDatetime('YYYY',date()));
  if ShopGlobal.GetProdFlag = 'E' then
    begin
      Label40.Caption := '�ֿ�����';
    end;

end;

procedure TfrmMktTaskOrderList.DBGridEh1DrawColumnCell(Sender: TObject;
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

end.