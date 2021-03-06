unit udllShopUtil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, RzPanel, 
  Dialogs, ExtCtrls, StdCtrls, cxMaskEdit, cxDropDownEdit, cxControls, cxContainer,
  cxEdit, cxTextEdit, ZDataSet, ZBase, Grids, DBGrids, DB, DBGridEh, cxButtonEdit,
  cxCalendar, cxMemo, zrComboBoxList, cxRadioGroup, cxSpinEdit, cxCheckBox, RzTreeVw,
  Registry, Nb30, WinSock;

const
  ColumnTitleColor=$00F0E598;

  MAX_HOSTNAME_LEN = 128;
  MAX_DOMAIN_NAME_LEN = 128;
  MAX_SCOPE_ID_LEN = 256;
  MAX_ADAPTER_NAME_LENGTH = 256;
  MAX_ADAPTER_DESCRIPTION_LENGTH = 128;
  MAX_ADAPTER_ADDRESS_LENGTH = 8;

type
  TIPAddressString = array[0..4 * 4 - 1] of Char;
  PIPAddrString = ^TIPAddrString;
  TIPAddrString = record
    Next: PIPAddrString;
    IPAddress: TIPAddressString;
    IPMask: TIPAddressString;
    Context: Integer;
  end;

  PIPAdapterInfo = ^TIPAdapterInfo;
  TIPAdapterInfo = record
    Next: PIPAdapterInfo;
    ComboIndex: Integer;
    AdapterName: array[0..MAX_ADAPTER_NAME_LENGTH + 3] of Char;
    Description: array[0..MAX_ADAPTER_DESCRIPTION_LENGTH + 3] of Char;
    AddressLength: Integer;
    Address: array[1..MAX_ADAPTER_ADDRESS_LENGTH] of Byte;
    Index: Integer;
    _Type: Integer;
    DHCPEnabled: Integer;
    CurrentIPAddress: PIPAddrString;
    IPAddressList: TIPAddrString;
    GatewayList: TIPAddrString;
    DHCPServer: TIPAddrString;
    HaveWINS: Bool;
    PrimaryWINSServer: TIPAddrString;
    SecondaryWINSServer: TIPAddrString;
    LeaseObtained: Integer;
    LeaseExpires: Integer;
  end;

//添加下拉选择框
procedure AddCbxPickList(Cbx:TcxComboBox;cname:string='';temp:TZQuery=nil);
//清除下拉选择框
procedure ClearCbxPickList(Cbx:TcxComboBox);
//初始freme窗体
procedure Initframe(frame:Tframe);
//悉放freme窗体
procedure Freeframe(frame:Tframe);
//初始form窗体
procedure Initform(form:Tform);
//悉放form窗体
procedure Freeform(form:Tform);
//设置输入框状态
procedure SetEditStyle(dbState:TDataSetState;AStyle:TcxCustomEditStyle);
//设置frame状态
procedure SetFrameEditStatus(frame:Tframe;dbState:TDataSetState);
//设置foram状态
procedure SetFormEditStatus(form:TForm;dbState:TDataSetState);
//设置DBGridEh参数
procedure InitGridPickList(Grid:TDBGridEh);
//绑定数据源
procedure ReadFromObject(AObj:TRecord_;form:Tform;_tag:string='');
//写入数据源
procedure WriteToObject(AObj:TRecord_;form:Tform;_tag:string='');
//数值条件解悉
function EncodeNumber(field:string;value:string):string;
//字符条件解悉
function EncodeString(field:string;value:string):string;
//打开界面资源
procedure LoadFormRes(Form:TForm);
//自编条码
function GetBarCode(ID:string;Size,Color:string;Len:Integer=13;flag:string='9'):string;
function GetBarCodeID(BarCode:string):string;
function GetBarCodeColor(BarCode:string):string;
function GetBarCodeSize(BarCode:string):string;
//截地区后缀
function GetRegionId(id:string):string;
//截取定长字符:
function GetTrimStr(const srcStr: string; vLen: integer): string;
//获取Mac地址
function GetAdaptersInfo(AI: PIPAdapterInfo; var BufLen: Integer): Integer; stdcall; external 'iphlpapi.dll' Name 'GetAdaptersInfo';
//获取Mac地址
function GetMacAddrInfo:string;
//获取计算机名
function GetComputerName:string;
//获取系统信息
function GetSystemInfo:string;
//获取Mac地址
function GetMacAddr(idx:integer=0):string;
//获取IP地址
function GetIpAddr:string;

implementation

uses uFnUtil,udllDsUtil,udllGlobal,udllXDictFactory,uTreeUtil;

function GetRegionId(id:string):string;
begin
  result := id;
  if copy(result,length(result)-1,2)='00' then
     delete(result,length(result)-1,2);
  if copy(result,length(result)-1,2)='00' then
     delete(result,length(result)-1,2);
end;

//截取定长字符:
function GetTrimStr(const srcStr: string; vLen: integer): string;
var
  wStr: widestring;
begin
  if Length(srcStr)> vLen then
  begin
    wStr:=srcStr;
    result:= Copy(wStr,1,(vLen div 2)); //拷贝取(vLen div 2)
  end else
    result:= srcStr;
end;

function GetBarCodeID(BarCode:string):string;
begin
  Result := copy(BarCode,2,6);
end;

function GetBarCodeColor(BarCode:string):string;
begin
  if Length(BarCode)<13 then
     begin
       result := '#';
       Exit;
     end;
  Result := copy(BarCode,10,3);
  result := result;
  if Result = '000' then Result := '#';
end;

function GetBarCodeSize(BarCode:string):string;
begin
  if Length(BarCode)<13 then
     begin
       result := '#';
       Exit;
     end;
  Result := copy(BarCode,8,2);
  if Result = '00' then Result := '#';
end;

//自编条码
function GetBarCode(ID:string;Size,Color:string;Len:Integer=13;flag:string='9'):string;
  function GetCodeFlag(data:String): String;
        var i,fak,sum : Integer;  begin
          sum := 0;
          fak := Length(data);
          for i:=1 to Length(data) do
          begin
                  if (fak mod 2) = 0 then
                          sum := sum + (StrToInt(data[i])*1)
                  else
                          sum := sum + (StrToInt(data[i])*3);
                  dec(fak);
          end;
          if (sum mod 10) = 0 then
                  result := data+'0'
          else
                  result := data+IntToStr(10-(sum mod 10));
  end;
var s,p1,p2:string;
begin
  if not( Length(ID) in [6]) then  Raise Exception.Create('条码种子位必须是6位');
  if (Length(Size)>3) and (Size[1]<>'0') then
     Raise Exception.Create('尺码属于不能大于2位');
  p1 := copy(Size,length(Size)-1,2);
  if p1='#' then p1 := '00';
  if Length(Color)>3 then
     Raise Exception.Create('颜色属于不能大于3位');
  p2 := Color;
  if p2='#' then p2 := '000';
  s := flag+FnString.FormatStringEx(ID,6)+FnString.FormatStringEx(p1,2)+FnString.FormatStringEx(p2,3);
  Result := GetCodeFlag(s);
end;

procedure ClearCbxPickList(Cbx:TcxComboBox);
var i:integer;
begin
  Cbx.ItemIndex := -1;
  for i:=0 to Cbx.Properties.Items.Count -1 do
     begin
       if assigned(Cbx.Properties.Items.Objects[i]) and (integer(Cbx.Properties.Items.Objects[i])>10000) then
          Cbx.Properties.Items.Objects[i].Free;
     end;
  Cbx.Properties.Items.Clear;
end;

procedure AddCbxPickList(Cbx:TcxComboBox;cname:string='';temp:TZQuery=nil);
var
  rs:TZQuery;
  AObj:TRecord_;
  i:integer;
begin
  if temp=nil then
  begin
    rs := dllGlobal.GetZQueryFromName('PUB_PARAMS');
    rs.Filtered := false;
    if cname='' then
       rs.Filter := 'TYPE_CODE='''+copy(Cbx.Name,4,50)+''''
    else
       rs.Filter := 'TYPE_CODE='''+cname+'''';
    rs.Filtered := true;
  end
  else
    rs := temp;
  try
  if not rs.IsEmpty then ClearCbxPickList(cbx);
  rs.First;
  while not rs.Eof do
    begin
      AObj := TRecord_.Create;
      AObj.ReadFromDataSet(rs);
      Cbx.Properties.Items.AddObject(rs.FieldbyName('CODE_NAME').AsString,AObj);
      rs.Next;
    end;
  finally
    rs.Filtered := false;
    rs.Filter := '';
  end;
end;

procedure Initframe(frame:Tframe);
var i:integer;
begin
  for i:=0 to frame.ComponentCount -1 do
    begin
      if frame.Components[i] is TcxComboBox then
         AddCbxPickList(TcxComboBox(frame.Components[i]));
    end;
end;

procedure Freeframe(frame:Tframe);
var i:integer;
begin
  for i:=0 to frame.ComponentCount -1 do
    begin
      if frame.Components[i] is TcxComboBox then
         ClearCbxPickList(TcxComboBox(frame.Components[i]));
    end;
end;

//初始form窗体
procedure Initform(form:Tform);
var i,j:integer;
begin
  for i:=0 to form.ComponentCount -1 do
    begin
      if form.Components[i] is TcxComboBox then
         AddCbxPickList(TcxComboBox(form.Components[i]));
      if form.Components[i] is TDBGridEh then
         begin
           TDBGridEh(form.Components[i]).isDrawRows := true;
           TDBGridEh(form.Components[i]).Color := $00F6F6F6;
           TDBGridEh(form.Components[i]).FixedColor := $00FAFAEF;
           TDBGridEh(form.Components[i]).Row1Color := TDBGridEh(form.Components[i]).Color;
           TDBGridEh(form.Components[i]).Row2Color := TDBGridEh(form.Components[i]).FixedColor;
           TDBGridEh(form.Components[i]).footerColor := $00F0E598;//$0083E4FF;
           for j:=0 to TDBGridEh(form.Components[i]).Columns.Count-1 do
              TDBGridEh(form.Components[i]).Columns[j].Title.Color := $00F0E598;
           TDBGridEh(form.Components[i]).Options := TDBGridEh(form.Components[i]).Options - [dgRowSelect];
           InitGridPickList(TDBGridEh(form.Components[i]));
         end;                                                            
    end;
end;

//释放form窗体
procedure Freeform(form:Tform);
var i:integer;
begin
  for i:=0 to form.ComponentCount -1 do
    begin
      if form.Components[i] is TcxComboBox then
         begin
           TcxComboBox(form.Components[i]).properties.onChange := nil;
           ClearCbxPickList(TcxComboBox(form.Components[i]));
         end;
      if form.Components[i] is TRzTreeView then
         begin
           TRzTreeView(form.Components[i]).onChange := nil;
           ClearTree(TRzTreeView(form.Components[i]));
         end;
    end;
end;

procedure SetEditStyle(dbState:TDataSetState;AStyle:TcxCustomEditStyle);
begin
  if dbState = dsBrowse then
     begin
       AStyle.BorderStyle := ebsUltraFlat;
       AStyle.Color := clBtnFace;//$00EBEBEB;
       AStyle.Edges := [];
       AStyle.hotTrack := false;
       AStyle.ButtonTransParency := ebtHideInactive;
     end
  else
     begin
       AStyle.BorderStyle := ebsUltraFlat;
       AStyle.Color := clWhite;
       AStyle.Edges := [];
       AStyle.hotTrack := false;
       AStyle.ButtonTransParency := ebtInactive;
     end;
end;

procedure SetFrameEditStatus(frame:Tframe;dbState:TDataSetState);
var i:integer;
begin
  for i:=0 to frame.ComponentCount -1 do
    begin
      if frame.Components[i] is TcxComboBox then
         begin
           if frame.Components[i].Tag = 1 then
           begin
             SetEditStyle(dsBrowse,TcxComboBox(frame.Components[i]).Style);
             TcxComboBox(frame.Components[i]).Properties.ReadOnly := True;
           end
           else
           begin
             SetEditStyle(dbState,TcxComboBox(frame.Components[i]).Style);
             TcxComboBox(frame.Components[i]).Properties.ReadOnly := (dbState=dsBrowse);
           end;
         end;
      if frame.Components[i] is TcxButtonEdit then
         begin
           if frame.Components[i].Tag = 1 then
           begin
             SetEditStyle(dsBrowse,TcxButtonEdit(frame.Components[i]).Style);
             TcxButtonEdit(frame.Components[i]).Properties.ReadOnly := True;
           end
           else
           begin
             SetEditStyle(dbState,TcxButtonEdit(frame.Components[i]).Style);
             TcxButtonEdit(frame.Components[i]).Properties.ReadOnly := (dbState=dsBrowse);
           end;
         end;
      if frame.Components[i] is TcxRadioGroup then
         begin
           if frame.Components[i].Tag = 1 then
           begin
             SetEditStyle(dsBrowse,TcxRadioGroup(frame.Components[i]).Style);
             TcxRadioGroup(frame.Components[i]).Properties.ReadOnly := True;
           end
           else
           begin
             SetEditStyle(dbState,TcxRadioGroup(frame.Components[i]).Style);
             TcxRadioGroup(frame.Components[i]).Properties.ReadOnly := (dbState=dsBrowse);
           end;
         end;
      if frame.Components[i] is TcxSpinEdit then
         begin
           if frame.Components[i].Tag = 1 then
           begin
             SetEditStyle(dsBrowse,TcxSpinEdit(frame.Components[i]).Style);
             TcxSpinEdit(frame.Components[i]).Properties.ReadOnly := true;
           end
           else
           begin
             SetEditStyle(dbState,TcxSpinEdit(frame.Components[i]).Style);
             TcxSpinEdit(frame.Components[i]).Properties.ReadOnly := (dbState=dsBrowse);
           end;
         end;
      if frame.Components[i] is TcxMaskEdit then
         begin
           if frame.Components[i].Tag = 1 then
           begin
             SetEditStyle(dsBrowse,TcxTextEdit(frame.Components[i]).Style);
             TcxMaskEdit(frame.Components[i]).Properties.ReadOnly := true;
           end
           else
           begin
             SetEditStyle(dbState,TcxTextEdit(frame.Components[i]).Style);
             TcxMaskEdit(frame.Components[i]).Properties.ReadOnly := (dbState=dsBrowse);
           end;
         end;
      if frame.Components[i] is TcxMemo then
         begin
           if frame.Components[i].Tag = 1 then
           begin
             SetEditStyle(dsBrowse,TcxMemo(frame.Components[i]).Style);
             TcxMemo(frame.Components[i]).Properties.ReadOnly := True;
           end
           else
           begin
             SetEditStyle(dbState,TcxMemo(frame.Components[i]).Style);
             TcxMemo(frame.Components[i]).Properties.ReadOnly := (dbState=dsBrowse);
           end;
         end;

      if frame.Components[i] is TcxRadioGroup then
         begin
           if frame.Components[i].Tag = 1 then
           begin
             SetEditStyle(dsBrowse,TcxRadioGroup(frame.Components[i]).Style);
             TcxRadioGroup(frame.Components[i]).Properties.ReadOnly := true;
           end
           else
           begin
             SetEditStyle(dbState,TcxRadioGroup(frame.Components[i]).Style);
             TcxRadioGroup(frame.Components[i]).Properties.ReadOnly := (dbState=dsBrowse);
           end;
         end;
      if frame.Components[i] is TcxTextEdit then
         begin
           if frame.Components[i].Tag = 1 then
           begin
             SetEditStyle(dsBrowse,TcxTextEdit(frame.Components[i]).Style);
             TcxTextEdit(frame.Components[i]).Properties.ReadOnly := true;
           end
           else
           begin
             SetEditStyle(dbState,TcxTextEdit(frame.Components[i]).Style);
             TcxTextEdit(frame.Components[i]).Properties.ReadOnly := (dbState=dsBrowse);
           end;
         end;
      if frame.Components[i] is TzrComboBoxList then
         begin
           if frame.Components[i].Tag = 1 then
           begin
             SetEditStyle(dsBrowse,TzrComboBoxList(frame.Components[i]).Style);
             TzrComboBoxList(frame.Components[i]).Properties.ReadOnly := true;
           end
           else
           begin
             SetEditStyle(dbState,TzrComboBoxList(frame.Components[i]).Style);
             TzrComboBoxList(frame.Components[i]).Properties.ReadOnly := (dbState=dsBrowse);
           end;
         end;
      if frame.Components[i] is TcxDateEdit then
         begin
           if frame.Components[i].Tag = 1 then
           begin
             SetEditStyle(dsBrowse,TcxDateEdit(frame.Components[i]).Style);
             TcxDateEdit(frame.Components[i]).Properties.ReadOnly := true;
           end
           else
           begin
             SetEditStyle(dbState,TcxDateEdit(frame.Components[i]).Style);
             TcxDateEdit(frame.Components[i]).Properties.ReadOnly := (dbState=dsBrowse);
           end;
         end;
    end;
end;

//设置form状态
procedure SetFormEditStatus(form:TForm;dbState:TDataSetState);
var i:integer;
begin
  for i:=0 to form.ComponentCount -1 do
    begin
      if form.Components[i].tag <0 then continue;
      if form.Components[i] is TrzPanel then
         begin
           if copy(form.Components[i].Name,1,5)<>'edtBK' then continue; 
           if dbState = dsBrowse then
              TrzPanel(form.Components[i]).Color := $00EBEBEB
           else
              TrzPanel(form.Components[i]).Color := clWhite;
         end;
      if form.Components[i] is TcxComboBox then
         begin
           if form.Components[i].Tag = 1 then
           begin
             SetEditStyle(dsBrowse,TcxComboBox(form.Components[i]).Style);
             TcxComboBox(form.Components[i]).Properties.ReadOnly := True;
             TcxComboBox(form.Components[i]).Enabled := false;
           end
           else
           begin
             SetEditStyle(dbState,TcxComboBox(form.Components[i]).Style);
             TcxComboBox(form.Components[i]).Properties.ReadOnly := (dbState=dsBrowse);
             TcxComboBox(form.Components[i]).Enabled := true;
           end;
         end;
      if form.Components[i] is TcxRadioGroup then
         begin
           if form.Components[i].Tag = 1 then
           begin
             SetEditStyle(dsBrowse,TcxRadioGroup(form.Components[i]).Style);
             TcxRadioGroup(form.Components[i]).Properties.ReadOnly := True;
           end
           else
           begin
             SetEditStyle(dbState,TcxRadioGroup(form.Components[i]).Style);
             TcxRadioGroup(form.Components[i]).Properties.ReadOnly := (dbState=dsBrowse);
           end;
         end;
      if form.Components[i] is TcxButtonEdit then
         begin
           if form.Components[i].Tag = 1 then
           begin
             SetEditStyle(dsBrowse,TcxButtonEdit(form.Components[i]).Style);
             TcxButtonEdit(form.Components[i]).Properties.ReadOnly := True;
             TcxButtonEdit(form.Components[i]).Enabled := false;
           end
           else
           begin
             SetEditStyle(dbState,TcxButtonEdit(form.Components[i]).Style);
             TcxButtonEdit(form.Components[i]).Properties.ReadOnly := (dbState=dsBrowse);
             TcxButtonEdit(form.Components[i]).Enabled := true;
           end;
         end;
      if form.Components[i] is TcxSpinEdit then
         begin
           if form.Components[i].Tag = 1 then
           begin
             SetEditStyle(dsBrowse,TcxSpinEdit(form.Components[i]).Style);
             TcxSpinEdit(form.Components[i]).Properties.ReadOnly := true;
           end
           else
           begin
             SetEditStyle(dbState,TcxSpinEdit(form.Components[i]).Style);
             TcxSpinEdit(form.Components[i]).Properties.ReadOnly := (dbState=dsBrowse);
           end;
         end;
      if form.Components[i] is TcxMaskEdit then
         begin
           if form.Components[i].Tag = 1 then
           begin
             SetEditStyle(dsBrowse,TcxTextEdit(form.Components[i]).Style);
             TcxMaskEdit(form.Components[i]).Properties.ReadOnly := true;
           end
           else
           begin
             SetEditStyle(dbState,TcxTextEdit(form.Components[i]).Style);
             TcxMaskEdit(form.Components[i]).Properties.ReadOnly := (dbState=dsBrowse);
           end;
         end;
      if form.Components[i] is TcxTextEdit then
         begin
           if form.Components[i].Tag = 1 then
           begin
             SetEditStyle(dsBrowse,TcxTextEdit(form.Components[i]).Style);
             TcxTextEdit(form.Components[i]).Properties.ReadOnly := true;
           end
           else
           begin
             SetEditStyle(dbState,TcxTextEdit(form.Components[i]).Style);
             TcxTextEdit(form.Components[i]).Properties.ReadOnly := (dbState=dsBrowse);
           end;
         end;
      if form.Components[i] is TzrComboBoxList then
         begin
           if form.Components[i].Tag = 1 then
           begin
             SetEditStyle(dsBrowse,TzrComboBoxList(form.Components[i]).Style);
             TzrComboBoxList(form.Components[i]).Properties.ReadOnly := true;
             TzrComboBoxList(form.Components[i]).Enabled := false;
           end
           else
           begin
             SetEditStyle(dbState,TzrComboBoxList(form.Components[i]).Style);
             TzrComboBoxList(form.Components[i]).Properties.ReadOnly := (dbState=dsBrowse);
             TzrComboBoxList(form.Components[i]).Enabled := true;
           end;
         end;
      if form.Components[i] is TcxDateEdit then
         begin
           if form.Components[i].Tag = 1 then
           begin
             SetEditStyle(dsBrowse,TcxDateEdit(form.Components[i]).Style);
             TcxDateEdit(form.Components[i]).Properties.ReadOnly := true;
             TcxDateEdit(form.Components[i]).Enabled := false;
           end
           else
           begin
             SetEditStyle(dbState,TcxDateEdit(form.Components[i]).Style);
             TcxDateEdit(form.Components[i]).Properties.ReadOnly := (dbState=dsBrowse);
             TcxDateEdit(form.Components[i]).Enabled := true;
           end;
         end;
      if form.Components[i] is TcxMemo then
         begin
           if form.Components[i].Tag = 1 then
           begin
             SetEditStyle(dsBrowse,TcxMemo(form.Components[i]).Style);
             TcxMemo(form.Components[i]).Properties.ReadOnly := true;
           end
           else
           begin
             SetEditStyle(dbState,TcxMemo(form.Components[i]).Style);
             TcxMemo(form.Components[i]).Properties.ReadOnly := (dbState=dsBrowse);
           end;
         end;
    end;
end;

//设置DBGridEh参数
procedure InitGridPickList(Grid:TDBGridEh);
var
  i:integer;
  rs:TZQuery;
begin
  for i:=0 to Grid.Columns.Count -1 do
    begin
      rs := dllGlobal.GetZQueryFromName('PUB_PARAMS');
      rs.Filtered := false;
      rs.Filter := 'TYPE_CODE='''+Grid.Columns[i].FieldName+'''';
      rs.Filtered := true;
      if rs.IsEmpty then Continue;
      try
      Grid.Columns[i].KeyList.Clear;
      Grid.Columns[i].PickList.Clear;
      rs.First;
      while not rs.Eof do
        begin
          Grid.Columns[i].KeyList.Add(rs.FieldbyName('CODE_ID').AsString);
          Grid.Columns[i].PickList.Add(rs.FieldbyName('CODE_NAME').AsString);
          rs.Next;
        end;
      finally
        rs.Filtered := false;
        rs.Filter := '';
      end;
    end;
end;

//绑定数据源
procedure ReadFromObject(AObj:TRecord_;form:Tform;_tag:string='');
var
  i:integer;
  fldname:string;
  saveed:boolean;
begin
  with form do
  begin
  for i := 0 to ComponentCount-1 do
    begin
      if (_tag<>'') and (copy(Components[i].Name,1,3) <> _tag) then Continue;
      fldname := copy(Components[i].Name,4,50);
      if AObj.FindField(fldname)=nil then continue; 
      if Components[i] is TcxComboBox then
         begin
           saveed := TcxComboBox(Components[i]).Properties.ReadOnly;
           TcxComboBox(Components[i]).Properties.ReadOnly := false;
           TcxComboBox(Components[i]).ItemIndex := TdsItems.FindItems(TcxComboBox(Components[i]).Properties.Items,'CODE_ID',AObj.FieldbyName(fldname).AsString);
           TcxComboBox(Components[i]).Properties.ReadOnly := saveed;
         end;
      if Components[i] is TcxSpinEdit then
         begin
           TcxSpinEdit(Components[i]).Value := AObj.FieldbyName(fldname).AsFloat;
         end;
      if Components[i] is TcxCheckBox then
         begin
           TcxCheckBox(Components[i]).Checked := AObj.FieldbyName(fldname).AsBoolean;
         end;
      if Components[i] is TcxTextEdit then
         begin
           if (AObj.FieldbyName(fldname).DataType in [ftString,ftFixedChar,ftWideString]) and (TcxTextEdit(Components[i]).Properties.MaxLength=0) then
              TcxTextEdit(Components[i]).Properties.MaxLength := AObj.FieldbyName(fldname).Width;
           TcxTextEdit(Components[i]).Text := AObj.FieldbyName(fldname).AsString;
         end;
      if Components[i] is TcxMaskEdit then
         begin
           if (AObj.FieldbyName(fldname).DataType in [ftString,ftFixedChar,ftWideString]) and (TcxTextEdit(Components[i]).Properties.MaxLength=0) then
              TcxMaskEdit(Components[i]).Properties.MaxLength := AObj.FieldbyName(fldname).Width;
           TcxMaskEdit(Components[i]).Text := AObj.FieldbyName(fldname).AsString;
         end;
      if Components[i].ClassNameIs('TcxButtonEdit') then
         begin
           TcxButtonEdit(Components[i]).Text := AObj.FieldbyName(fldname).AsString;
         end;
      if Components[i] is TzrComboBoxList then
         begin
           TzrComboBoxList(Components[i]).KeyValue := AObj.FieldbyName(fldname).AsString;
           if AObj.FindField(fldname+'_TEXT') <> nil then
              TzrComboBoxList(Components[i]).Text := AObj.FieldbyName(fldname+'_TEXT').AsString
           else
              begin
                if (TzrComboBoxList(Components[i]).DataSet <> nil)
                   and
                   TzrComboBoxList(Components[i]).DataSet.Active
                then
                   TzrComboBoxList(Components[i]).Text := TdsFind.GetNameByID(TzrComboBoxList(Components[i]).DataSet,TzrComboBoxList(Components[i]).KeyField,TzrComboBoxList(Components[i]).ListField,AObj.FieldbyName(fldname).AsString);
              end;
         end;
      if Components[i] is TcxMemo then
         begin
           if (AObj.FieldbyName(fldname).DataType in [ftString,ftFixedChar,ftWideString]) and (TcxMemo(Components[i]).Properties.MaxLength=0) then
              TcxMemo(Components[i]).Properties.MaxLength := AObj.FieldbyName(fldname).Width;
           TcxMemo(Components[i]).Text := AObj.FieldbyName(fldname).AsString;
         end;
      if Components[i] is TcxDateEdit then
         begin
           if AObj.FieldbyName(fldname).AsString = '' then
              TcxDateEdit(Components[i]).EditValue := null
           else
              TcxDateEdit(Components[i]).Date := fnTime.fnStrtoDate(AObj.FieldbyName(fldname).AsString);
         end;
    end;
  end;
end;

//写入数据源
procedure WriteToObject(AObj:TRecord_;form:Tform;_tag:string='');
var
  i:integer;
  fldname:string;
begin
  with form do
  begin
  for i := 0 to ComponentCount-1 do
    begin
      if (_tag<>'') and (copy(Components[i].Name,1,3) <> _tag) then Continue;
      fldname := copy(Components[i].Name,4,50);
      if AObj.FindField(fldname)=nil then continue;
      if Components[i] is TcxCheckBox then
         begin
           //if TcxCheckBox(Components[i]).Properties.ReadOnly then continue;
           AObj.FieldbyName(fldname).AsBoolean := TcxCheckBox(Components[i]).Checked;
         end;
      if Components[i] is TcxComboBox then
         begin
           //if TcxComboBox(Components[i]).Properties.ReadOnly then continue;
           if TcxComboBox(Components[i]).ItemIndex=-1 then
              AObj.FieldbyName(fldname).AsString := ''
           else
              AObj.FieldbyName(fldname).AsString := TRecord_(TcxComboBox(Components[i]).Properties.Items.Objects[TcxComboBox(Components[i]).ItemIndex]).FieldbyName('CODE_ID').AsString;
         end;
      if Components[i] is TcxDateEdit then
         begin
           //if TcxDateEdit(Components[i]).Properties.ReadOnly then continue;
           if TcxDateEdit(Components[i]).EditValue = null then
              AObj.FieldbyName(fldname).AsString := ''
           else
              begin
                if AObj.FieldbyName(fldname).DataType in [ftString,ftWideString] then
                   AObj.FieldbyName(fldname).AsString := formatDatetime('YYYY-MM-DD',TcxDateEdit(Components[i]).Date)
                else
                   AObj.FieldbyName(fldname).asInteger := StrtoInt(formatDatetime('YYYYMMDD',TcxDateEdit(Components[i]).Date));
              end;
         end;
      if Components[i] is TcxMemo then
         begin
           //if TcxMemo(Components[i]).Properties.ReadOnly then continue;
           AObj.FieldbyName(fldname).AsString := TcxMemo(Components[i]).Text;
         end;
      if Components[i] is TzrComboBoxList then
         begin
           //if TzrComboBoxList(Components[i]).Properties.ReadOnly then continue;
           if TzrComboBoxList(Components[i]).Text='' then
              AObj.FieldbyName(fldname).AsString := ''
           else
              AObj.FieldbyName(fldname).AsString := TzrComboBoxList(Components[i]).AsString;
           if AObj.FindField(fldname+'_TEXT')<>nil then AObj.FieldbyName(fldname+'_TEXT').asString := TzrComboBoxList(Components[i]).Text;

         end;
      if Components[i] is TcxSpinEdit then
         begin
           AObj.FieldbyName(fldname).NewValue := TcxSpinEdit(Components[i]).Value;
         end;
      if Components[i] is TcxMaskEdit then
         begin
           //if TcxMaskEdit(Components[i]).Properties.ReadOnly then continue;
           if (AObj.FieldbyName(fldname).DataType in [ftSmallint, ftInteger, ftWord,ftFloat, ftCurrency, ftBCD]) and (trim(TcxMaskEdit(Components[i]).Text)='') then
              AObj.FieldbyName(fldname).NewValue := null
           else
              begin
                if (AObj.FieldbyName(fldname).DataType in [ftSmallint, ftInteger, ftWord, ftLargeint]) then
                   begin
                     try
                       if StrtoInt(TcxMaskEdit(Components[i]).Text)>999999999 then Raise Exception.Create('数值过大');
                     except
                       Raise Exception.Create(TcxMaskEdit(Components[i]).Text+'无效整型数据');
                     end;
                   end;
                if (AObj.FieldbyName(fldname).DataType in [ftFloat, ftCurrency, ftBCD]) then
                   begin
                     try
                       if StrtoFloat(TcxMaskEdit(Components[i]).Text)>999999999 then Raise Exception.Create('数值过大');
                     except
                       Raise Exception.Create(TcxMaskEdit(Components[i]).Text+'无效数值型数据');
                     end;
                   end;
                AObj.FieldbyName(fldname).AsString := trim(TcxMaskEdit(Components[i]).Text);
              end;
         end;
      if Components[i].ClassNameIs('TcxButtonEdit') then
         begin
           AObj.FieldbyName(fldname).AsString := TcxButtonEdit(Components[i]).Text;
         end;
      if Components[i] is TcxTextEdit then
         begin
           //if TcxTextEdit(Components[i]).Properties.ReadOnly then continue;
           if (AObj.FieldbyName(fldname).DataType in [ftSmallint, ftInteger, ftWord,ftFloat, ftCurrency, ftBCD]) and (trim(TcxTextEdit(Components[i]).Text)='') then
              AObj.FieldbyName(fldname).NewValue := null
           else
              begin
                if (AObj.FieldbyName(fldname).DataType in [ftSmallint, ftInteger, ftWord, ftLargeint]) then
                   begin
                     try
                       if StrtoInt(TcxTextEdit(Components[i]).Text)>999999999 then Raise Exception.Create('数值过大');
                     except
                       Raise Exception.Create(TcxTextEdit(Components[i]).Text+'无效整型数据');
                     end;
                   end;
                if (AObj.FieldbyName(fldname).DataType in [ftFloat, ftCurrency, ftBCD]) then
                   begin
                     try
                       if StrtoFloat(TcxTextEdit(Components[i]).Text)>999999999 then Raise Exception.Create('数值过大');
                     except
                       Raise Exception.Create(TcxTextEdit(Components[i]).Text+'无效数值型数据');
                     end;
                   end;
                AObj.FieldbyName(fldname).AsString := trim(TcxTextEdit(Components[i]).Text);
              end;
         end;
    end;
  end;
end;

//数值条件解悉
function EncodeNumber(field:string;value:string):string;
var
  n,i:integer;
  s,s1,s2,s3,dot1,dot2,dot3:string;
  vList:TStringList;
begin
  s := trim(value);
  if s='' then Exit;
  vList := TStringList.Create;
  try
    StrToStrings(s,',',vList);
    if vList.Count > 1 then
    begin
      result := '';
      for i:=0 to vList.Count-1 do
        begin
          if result<>'' then result := result +' or ';
          result := result + EncodeNumber(field,vList[i]);
        end;
      if result <> '' then result := '('+result+')';
      Exit;
    end;
  finally
    vList.Free;
  end;
  n := pos('~',s);
  if n>0 then
     begin
       s1 := trim(copy(s,1,n-1));
       s2 := trim(copy(s,n+1,length(s)-n));
       if (s1='') and (s2='') then Exit;
       if trim(s1)='' then
          result := field+'<='+FloatToStr(StrToFloatDef(s2,0))
       else
       if trim(s2)='' then
          result := field+'>='+FloatToStr(StrToFloatDef(s1,0))
       else
          result := field+'>='+FloatToStr(StrToFloatDef(s1,0))+' and '+field+'<='+FloatToStr(StrToFloatDef(s2,0));
     end
  else
     begin
       result := field+'='+FloatToStr(StrToFloatDef(s,0))
     end;
end;

//字符条件解悉
function EncodeString(field:string;value:string):string;
var
  n,i:integer;
  s,s1,s2,s3,dot1,dot2,dot3:string;
  vList:TStringList;
begin
  s := trim(value);
  if s='' then Exit;
  vList := TStringList.Create;
  try
    StrToStrings(s,',',vList);
    if vList.Count > 1 then
    begin
      result := '';
      for i:=0 to vList.Count-1 do
        begin
          if result<>'' then result := result +' or ';
          result := result + EncodeString(field,vList[i]);
        end;
      if result <> '' then result := '('+result+')';
      Exit;
    end;
  finally
    vList.Free;
  end;
  n := pos('~',s);
  if n>0 then
     begin
       s1 := trim(copy(s,1,n-1));
       s2 := trim(copy(s,n+1,length(s)-n));
       if (s1='') and (s2='') then Exit;
       if trim(s1)='' then
          result := field+'<='''+FloatToStr(StrToFloatDef(s2,0))+''''
       else
       if trim(s2)='' then
          result := field+'>='''+FloatToStr(StrToFloatDef(s1,0))+''''
       else
          result := field+'>='''+FloatToStr(StrToFloatDef(s1,0))+''''+' and '+field+'<='''+FloatToStr(StrToFloatDef(s2,0))+'''';
     end
  else
     begin
       result := field+'='''+FloatToStr(StrToFloatDef(s,0))+'''';
     end;
end;

procedure LoadFormRes(Form:TForm);
function FindColumn(FieldName:string;DBGrid:TDBGridEh):TColumnEh;
var i:integer;
begin
  result := nil;
  for i:=0 to DBGrid.Columns.Count - 1 do
    begin
      if DBGrid.Columns[i].FieldName = FieldName then
         begin
           result := DBGrid.Columns[i];
           Exit;
         end;
    end;
end;
var
  Column:TColumnEh;
  i:integer;
begin
  for i:=0 to Form.ComponentCount -1 do
  begin
    if Form.Components[i] is TDBGridEH then
    begin
      Column := FindColumn('PROPERTY_01',TDBGridEh(Form.Components[i]));
      if Column<>nil then
      begin
        Column.Title.Caption := XDictFactory.GetResString('PROPERTY_01',dllGlobal.GetVersionFlag,'尺码');
      end;
    end;
  end;
end;

function GetMacAddrInfo:string;
var
  AI, Work: PIPAdapterInfo;
  Size: Integer;
  Res: Integer;
  I: Integer;
  function MACToStr(ByteArr: PByte; Len: Integer): string;
  begin
    result := '';
    while (Len > 0) do
    begin
      result := result + IntToHex(ByteArr^, 2);
      ByteArr := Pointer(Integer(ByteArr) + SizeOf(Byte));
      Dec(Len);
    end;
  end;
begin
  Size := 5120;
  GetMem(AI, Size);
  Res := GetAdaptersInfo(AI, Size);
  if (Res <> ERROR_SUCCESS) then Exit;

  Work := AI;
  I := 1;
  repeat
    if result <> '' then result := result + ',';
    result := result + MACToStr(@Work^.Address, Work^.AddressLength);
    Inc(I);
    Work := Work^.Next;
  until (Work = nil);

  FreeMem(AI);
end;

function GetSystemInfo: string;
var Reg:TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey:=HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion',false) then
    begin
      result:=Reg.ReadString('ProductName');
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

function GetComputerName: string;
var
  s: array [0..MAX_COMPUTERNAME_LENGTH] of Char;
  w:dword;
begin
  w := MAX_COMPUTERNAME_LENGTH+1;
  Windows.GetComputerName(s,w);
  result := string(s);
end;

function GetMacAddr(idx:integer=0): string;
var
  NCB: TNCB;
  ADAPTER: TADAPTERSTATUS;
  LANAENUM: TLANAENUM;
  intIdx: Integer;
  cRC: Char;
  strTemp: string;
begin
  result := '';
  ZeroMemory(@NCB, SizeOf(NCB));
  NCB.ncb_command := Chr(NCBENUM);
  cRC := NetBios(@NCB);
  NCB.ncb_buffer := @LANAENUM;
  NCB.ncb_length := SizeOf(LANAENUM);
  cRC := NetBios(@NCB);
  if Ord(cRC) <> 0 then Exit;
  ZeroMemory(@NCB, SizeOf(NCB));
  NCB.ncb_command := Chr(NCBRESET);
  NCB.ncb_lana_num := LANAENUM.lana[idx];
  cRC := NetBios(@NCB);
  if Ord(cRC) <> 0 then Exit;
  ZeroMemory(@NCB, SizeOf(NCB));
  NCB.ncb_command := Chr(NCBASTAT);
  NCB.ncb_lana_num := LANAENUM.lana[idx];
  StrPCopy(NCB.ncb_callname, '*');
  NCB.ncb_buffer := @ADAPTER;
  NCB.ncb_length := SizeOf(ADAPTER);
  cRC := NetBios(@NCB);
  strTemp := '';
  for intIdx := 0 to 5 do
      strTemp := strTemp + InttoHex(Integer(ADAPTER.adapter_address[intIdx]), 2);
  result := strTemp;
end;

function GetIpAddr:string;
var
  WSAData: TWSAData;
  HostEnt: PHostEnt;
  s: string;
  size: Cardinal;
begin
  result := '';
  s := GetComputerName;
  WSAStartup(2, WSAData);
  HostEnt := GetHostByName(PChar(s));
  if HostEnt <> nil then
  begin
    with HostEnt^ do result := Format('%d.%d.%d.%d', [Byte(h_addr^[0]), Byte(h_addr^[1]), Byte(h_addr^[2]), Byte(h_addr^[3])]);
  end;
  WSACleanup;
end;

end.
