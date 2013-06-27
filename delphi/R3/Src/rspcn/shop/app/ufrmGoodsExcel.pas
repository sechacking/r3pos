unit ufrmGoodsExcel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmWebDialogForm, ExtCtrls, RzPanel, RzTabs, cxControls,
  cxContainer, cxEdit, cxTextEdit, StdCtrls, RzButton, DB, ZBase,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, udataFactory, cxMaskEdit,
  cxButtonEdit, zrComboBoxList, cxCheckBox, cxMemo, cxDropDownEdit,
  cxRadioGroup, cxSpinEdit, cxCalendar, RzLabel, Buttons, pngimage,
  RzBckgnd, RzBorder, RzBmpBtn, Math, msxml, ufrmWebDialog, jpeg, RzForms,
  Grids, DBGridEh, RzEdit, RzStatus,ComObj,IniFiles, ufrmExcelFactory,
  Menus;

type
  TfrmGoodsExcel = class(TfrmExcelFactory)
    RzLabel14: TRzLabel;
    procedure Image4Click(Sender: TObject);
  private
    //FBarcode:widestring;
    //FGoodsCode:widestring;
    //FUnits:widestring;
    //FSorts:widestring;
    FieldCheckSet:array[0..20] of string;
    FSortType:integer; //0 ����û���ļ��еķ��ࣻ1  �������ļ��е����з��ࣻ2 �����в����ļ��з���
    FUnitType:array[0..2] of integer; //ͬFSortType
    //barCodeList,godsCodeList,unitList,sortList:TStringList;
    procedure CreateUseDataSet;override;
    procedure CreateParams;override;
    function FindColumn(vStr:string):Boolean;override;
    function SelfCheckExcute:Boolean;override;   //�����ļ��ڲ��ж������ظ�
    function SelfCheckExcute2:Boolean;
    function OutCheckExcute:Boolean;             //�����ļ���������ݶԱ�
    function Check(columnIndex:integer):Boolean;override;
    function SaveExcel(dsExcel:TZQuery):Boolean;override;
    procedure CreateStringList(var vList:TStringList);
    procedure TransformtoString(vList:TStringList;var vStr:widestring);overload;
    procedure TransformtoString(var vList:string;vStr:string);overload;
    function DeleteDuplicateString(vStr:string;var vStrList:TStringList):string;
    procedure ClearParams;
  public
    class function ExcelFactory(Owner: TForm;vDataSet:TZQuery;Fields,Formats:string;isSelfCheck:Boolean=false):Boolean;override;
  end;

  const
    FieldsString =
    'BARCODE1=������,GODS_CODE=����,GODS_NAME=��Ʒ����,GODS_SPELL=ƴ����,CALC_UNITS=������λ,SORT_ID1=��Ʒ����,NEW_OUTPRICE=��׼�ۼ�,'+
    'NEW_INPRICE=���½���,NEW_LOWPRICE=����ۼ�,MY_OUTPRICE=�����ۼ�,SORT_ID7=��ɫ��,SORT_ID8=������,SMALL_UNITS=С��װ��λ,SMALLTO_CALC=С��װ����ϵ��,'+
    'BARCODE2=С��װ����,MY_OUTPRICE1=С��װ�����ۼ�,BIG_UNITS=���װ��λ,BIGTO_CALC=���װ����ϵ��,BARCODE3=���װ����,MY_OUTPRICE2=���װ�����ۼ�,SORT_ID3=��Ӧ��';

    FormatString =
    '0=BARCODE1,1=GODS_CODE,2=GODS_NAME,3=GODS_SPELL,4=CALC_UNITS,5=SORT_ID1,6=NEW_OUTPRICE,7=NEW_INPRICE,8=NEW_LOWPRICE,9=MY_OUTPRICE,'+
    '10=SORT_ID7,11=SORT_ID8,12=SMALL_UNITS,13=SMALLTO_CALC,14=BARCODE2,15=MY_OUTPRICE1,16=BIG_UNITS,17=BIGTO_CALC,18=BARCODE3,19=MY_OUTPRICE2,20=SORT_ID3';

implementation

uses uRspFactory,udllDsUtil,uFnUtil,udllShopUtil,uTokenFactory,udllGlobal,ufrmSortDropFrom,
     uCacheFactory,uSyncFactory,uRspSyncFactory,dllApi,ufrmMeaUnits;

{$R *.dfm}

procedure TfrmGoodsExcel.CreateUseDataSet;
begin
  inherited; 
  with DataSet.FieldDefs do
    begin
      Add('BARCODE1',ftString,30,False);
      Add('GODS_CODE',ftString,20,False);
      Add('GODS_NAME',ftString,50,False);
      Add('GODS_SPELL',ftString,50,False);
      Add('CALC_UNITS',ftString,36,False);
      Add('SORT_ID1',ftString,36,False);
      Add('NEW_OUTPRICE',ftFloat,0,False);
      Add('NEW_INPRICE',ftFloat,0,False);
      Add('NEW_LOWPRICE',ftFloat,0,False);
      Add('MY_OUTPRICE',ftFloat,0,False);
      Add('SORT_ID7',ftString,36,False);
      Add('SORT_ID8',ftString,36,False);
      Add('SMALL_UNITS',ftString,36,False);
      Add('SMALLTO_CALC',ftFloat,0,False);
      Add('BARCODE2',ftString,30,False);
      Add('MY_OUTPRICE1',ftFloat,0,False);
      Add('BIG_UNITS',ftString,36,False);
      Add('BIGTO_CALC',ftFloat,0,False);
      Add('BARCODE3',ftString,30,False);
      Add('MY_OUTPRICE2',ftFloat,0,False);
      Add('SORT_ID3',ftString,36,False);
    end;
  DataSet.CreateDataSet;
end;

function TfrmGoodsExcel.SaveExcel(dsExcel:TZQuery):Boolean;
procedure WriteToBarcode(Data_Bar:TZQuery;Gods_Id,Unit_Id,BarCode,BarcodeType:String);
  begin
    Data_Bar.Append;
    //Data_Bar.FieldByName('RELATION_FLAG').AsString := '2';
    Data_Bar.FieldByName('TENANT_ID').AsInteger :=strtoint(token.tenantId);
    Data_Bar.FieldByName('GODS_ID').AsString := Gods_Id;
    Data_Bar.FieldByName('ROWS_ID').AsString := TSequence.NewId;  //�к�[GUID���]
    Data_Bar.FieldByName('PROPERTY_01').AsString := '#';
    Data_Bar.FieldByName('PROPERTY_02').AsString := '#';
    Data_Bar.FieldByName('BARCODE_TYPE').AsString := BarcodeType;
    Data_Bar.FieldByName('UNIT_ID').AsString := Unit_Id;
    Data_Bar.FieldByName('BATCH_NO').AsString := '#';
    Data_Bar.FieldByName('BARCODE').AsString := BarCode;
    Data_Bar.Post;
  end;
  procedure WriteToGoodsPrice(Data_Price:TZQuery;Gods_Id:string;OutPrice,OutPrice1,OutPrice2:double);
  begin
    Data_Price.Append;
    Data_Price.FieldByName('TENANT_ID').AsInteger :=strtoint(token.tenantId);
    Data_Price.FieldByName('PRICE_ID').AsString :='#';
    Data_Price.FieldByName('SHOP_ID').AsString:=token.shopId;
    Data_Price.FieldByName('GODS_ID').AsString:=Gods_Id;
    Data_Price.FieldByName('PRICE_METHOD').AsString:='1';
    Data_Price.FieldByName('NEW_OUTPRICE').AsFloat:=OutPrice;
    Data_Price.FieldByName('NEW_OUTPRICE1').AsString:=floattostr(OutPrice1);
    Data_Price.FieldByName('NEW_OUTPRICE2').AsString:=floattostr(OutPrice2);
    Data_Price.Post;
  end;
var DsGoods,DsBarcode,DsGoodsPrice,rs,us,ss:TZQuery;
    GodsId,Bar,Code,Name,Error_Info:String;
    SumBarcode,SumCode,SumName:Integer;
    Params:TftParamList;
begin
  //��ʾ������������
  if dsExcel.RecordCount=0 then exit;
  Result := False;
  
  DsGoods := TZQuery.Create(nil);
  DsBarcode := TZQuery.Create(nil);
  DsGoodsPrice:=TZQuery.Create(nil);

  rs := dllGlobal.GetZQueryFromName('PUB_GOODSINFO');
  us:=dllGlobal.GetZQueryFromName('PUB_MEAUNITS');
  ss:=dllGlobal.GetZQueryFromName('PUB_GOODSSORT');

  try
    Params := TftParamList.Create(nil);
    Params.ParamByName('TENANT_ID').asInteger := strtoint(token.tenantId);
    Params.ParamByName('SHOP_ID').AsString :=token.shopId;
    Params.ParamByName('GODS_ID').asString :='';
    dataFactory.BeginBatch;
    try
      dataFactory.AddBatch(DsGoods,'TGoodsInfoV60',Params);
      dataFactory.AddBatch(DsBarcode,'TBarCodeV60',Params);
      dataFactory.AddBatch(DsGoodsPrice,'TGoodsPriceV60',Params);
      dataFactory.OpenBatch;
    except
      dataFactory.CancelBatch;
      Raise;
    end;

    dsExcel.First;
    while not dsExcel.Eof do
      begin
        Bar := dsExcel.FieldByName('BARCODE1').AsString;
        Code := dsExcel.FieldByName('GODS_CODE').AsString;
        Name := dsExcel.FieldByName('GODS_NAME').AsString;

        DsGoods.Append;
        GodsId := TSequence.NewId;
        DsGoods.FieldByName('GODS_ID').AsString := GodsId;
        DsGoods.FieldByName('TENANT_ID').AsInteger :=strtoint(token.tenantId);
        //DsGoods.FieldByName('SHOP_ID').AsString :=token.shopId;  
        DsGoods.FieldByName('GODS_CODE').AsString := Code;
        DsGoods.FieldByName('GODS_NAME').AsString := Name;
        if dsExcel.FieldByName('GODS_SPELL').AsString <> '' then
          DsGoods.FieldByName('GODS_SPELL').AsString := dsExcel.FieldByName('GODS_SPELL').AsString
        else
          DsGoods.FieldByName('GODS_SPELL').AsString := fnString.GetWordSpell(Trim(Name),3);
        DsGoods.FieldByName('GODS_TYPE').AsString :='';
        if ss.Locate('SORT_NAME',dsExcel.FieldByName('SORT_ID1').AsString,[]) then
          DsGoods.FieldByName('SORT_ID1').AsString := ss.FieldByName('SORT_ID').AsString;
        DsGoods.FieldByName('SORT_ID3').AsString := dsExcel.FieldByName('SORT_ID3').AsString;
        DsGoods.FieldByName('SORT_ID7').AsString := dsExcel.FieldByName('SORT_ID7').AsString;
        DsGoods.FieldByName('SORT_ID8').AsString := dsExcel.FieldByName('SORT_ID8').AsString;
        if us.Locate('UNIT_NAME',dsExcel.FieldByName('CALC_UNITS').AsString,[]) then
        begin
          DsGoods.FieldByName('UNIT_ID').AsString := us.fieldByName('UNIT_ID').AsString;
          DsGoods.FieldByName('CALC_UNITS').AsString := us.fieldByName('UNIT_ID').AsString;
        end;

        //2011.08.25���ж������Ƿ�Ϊ��:
        if Bar <> '' then
        begin
          DsGoods.FieldByName('BARCODE').AsString := Bar;
          WriteToBarcode(DsBarcode,GodsId,dsExcel.FieldByName('CALC_UNITS').AsString,dsExcel.FieldByName('BARCODE1').AsString,'0');
        end;

        if dsExcel.FieldByName('BARCODE2').AsString <> '' then
          begin
            if us.Locate('UNIT_NAME',dsExcel.FieldByName('SMALL_UNITS').AsString,[]) then
            DsGoods.FieldByName('SMALL_UNITS').AsString := us.FieldByName('UNIT_ID').AsString;
            DsGoods.FieldByName('SMALLTO_CALC').AsString := dsExcel.FieldByName('SMALLTO_CALC').AsString;
            WriteToBarcode(DsBarcode,GodsId,dsExcel.FieldByName('SMALL_UNITS').AsString,dsExcel.FieldByName('BARCODE2').AsString,'1');
          end;

        if dsExcel.FieldByName('BARCODE3').AsString <> '' then
          begin
            if us.Locate('UNIT_NAME',dsExcel.FieldByName('BIG_UNITS').AsString,[]) then
            DsGoods.FieldByName('BIG_UNITS').AsString := us.FieldByName('UNIT_ID').AsString;
            DsGoods.FieldByName('BIGTO_CALC').AsString := dsExcel.FieldByName('BIGTO_CALC').AsString;
            WriteToBarcode(DsBarcode,GodsId,dsExcel.FieldByName('BIG_UNITS').AsString,dsExcel.FieldByName('BARCODE3').AsString,'2');
          end;

        DsGoods.FieldByName('NEW_INPRICE').AsFloat := dsExcel.FieldByName('NEW_INPRICE').AsFloat;
        DsGoods.FieldByName('NEW_OUTPRICE').AsFloat := dsExcel.FieldByName('NEW_OUTPRICE').AsFloat;
        DsGoods.FieldByName('NEW_LOWPRICE').AsFloat := dsExcel.FieldByName('NEW_LOWPRICE').AsFloat;
        if dsExcel.FieldByName('MY_OUTPRICE').AsString<>'' then
        begin
          WriteToGoodsPrice(DsGoodsPrice,GodsId,dsExcel.FieldByName('MY_OUTPRICE').AsFloat,dsExcel.FieldByName('MY_OUTPRICE1').AsFloat,dsExcel.FieldByName('MY_OUTPRICE2').AsFloat);
        end;

        DsGoods.FieldByName('USING_PRICE').AsInteger := 1;
        DsGoods.FieldByName('HAS_INTEGRAL').AsInteger := 1;
        //DsGoods.FieldByName('INTEGRAL_RATE').AsFloat := 1;
        DsGoods.FieldByName('USING_BATCH_NO').AsInteger := 2;
        DsGoods.FieldByName('USING_BARTER').AsInteger := 1;
        DsGoods.FieldByName('USING_LOCUS_NO').AsInteger := 2;
        DsGoods.FieldByName('BARTER_INTEGRAL').AsInteger := 0;
        //DsGoods.FieldByName('USING_IN_TAX_RATE').AsString := '0';
        //DsGoods.FieldByName('USING_OUT_TAX_RATE').AsString := '0';

        DsGoods.Post;
        dsExcel.Next;
      end;

      dataFactory.BeginBatch;
      try
        dataFactory.AddBatch(DsGoods,'TGoodsInfoV60',Params);
        dataFactory.AddBatch(DsBarcode,'TBarCodeV60',Params);
        dataFactory.AddBatch(DsGoodsPrice,'TGoodsPriceV60',Params);
        dataFactory.CommitBatch;
      except
        dataFactory.CancelBatch;
        Raise;
      end;
  finally
    DsGoods.Free;
    DsBarcode.Free;
    DsGoodsPrice.Free;
    Params.Free;
  end;
  Result := True;
end;

function TfrmGoodsExcel.FindColumn(vStr:string):Boolean;
begin
   Result := True;
  if not cdsColumn.Locate('FieldName','GODS_NAME',[]) then
    begin
      Result := False;
    end;
  if not cdsColumn.Locate('FieldName','CALC_UNITS',[]) then
    begin
      Result := False;
    end;
  if not cdsColumn.Locate('FieldName','SORT_ID1',[]) then
    begin
      Result := False;
    end;
  if not cdsColumn.Locate('FieldName','NEW_OUTPRICE',[]) then
    begin
      Result := False;
    end;
end;

procedure TfrmGoodsExcel.CreateParams;
var rs:TZQuery;
    str:string;
    i:integer;
begin
  inherited;
end;

function TfrmGoodsExcel.Check(columnIndex:integer): Boolean;
var str,strError:string;
    num:double;
begin
  str:=cdsExcel.Fields[columnIndex].AsString;
  case columnIndex-1 of
    0:begin
         if str='' then
         strError:='������Ϊ��;';
       end;
    1:begin
         if str='' then
         strError:='����Ϊ��;';
       end;
    2:begin
       if str='' then
         strError:='��Ʒ����Ϊ��;';
      end;
    3:begin
       if str='' then
         strError:='ƴ����Ϊ��;';
      end;
    4:begin
        if str='' then
          strError:='������λΪ��;'
        else begin
          if FUnitType[0]=0 then
            strError:='������λ������;';
        end;
      end;
    5:begin
        if str='' then
          strError:='��Ʒ����Ϊ��;'
        else begin
          if FSortType=0 then
            strError:='��Ʒ���಻����;';
        end;
      end;
    6:begin
        try
          if str<>'' then
            num:=strtofloat(str)
          else
            strError:='��׼�ۼ�Ϊ��;';
         except
          strError:='��Ч�ı�׼�ۼ�;'
        end;
      end;
    7:begin
        try
          if str<>'' then
            num:=strtofloat(str)
          else
            strError:='���½���Ϊ��;';
        except
          strError:='��Ч�����½���;'
        end;
      end;
    8:begin
        try
          if str<>'' then
            num:=strtofloat(str)
          else
            strError:='����ۼ�Ϊ��;';
        except
          strError:='��Ч������ۼ�;'
        end;
      end;
    9:begin
        try
          if str<>'' then
            num:=strtofloat(str)
          else
            strError:='�����ۼ�Ϊ��;';
        except
          strError:='��Ч�ı����ۼ�;'
        end;
      end;
    10:begin     //Color
      end;
    11:begin    //size
      end;
    12:begin
         if str='' then
          strError:='С��װ��λΪ��;'
        else begin
          if FUnitType[1]=0 then
            strError:='С��װ��λ������;';
        end;
      end;
    13:begin
        try
          if str<>''then
            num:=strtofloat(str)
          else
            strError:='С��װ����ϵ��Ϊ��;'
        except
          strError:='��Ч��С��װ����ϵ��;'
        end;
      end;
    14:begin
         if str='' then
         strError:='С��װ������Ϊ��;';
      end;
    15:begin
        try
          if str<> '' then
            num:=strtofloat(str)
          else
            strError:='С��װ�����ۼ�Ϊ��;';
        except
          strError:='��Ч��С��װ�����ۼ�;'
        end;
      end;
    16:begin
         if str='' then
          strError:='���װ��λΪ��;'
        else begin
          if FUnitType[2]=0 then
            strError:='���װ��λ������;';
        end;
      end;
    17:begin
        try
          if str<> '' then
            num:=strtofloat(str)
          else
            strError:='���װ����ϵ��Ϊ��;';
        except
          strError:='��Ч�Ĵ��װ����ϵ��;'
        end;
      end;
    18:begin
        if str='' then
         strError:='���װ������Ϊ��;';
      end;
    19:begin
        try
          if str<> '' then
           num:=strtofloat(str)
          else
           strError:='���װ�����ۼ�Ϊ��;'; 
        except
          strError:='��Ч�Ĵ��װ�����ۼ�;'
        end;
      end;
    20:begin
        if str='' then
         strError:='��Ӧ��Ϊ��;';
      end;
  end;
  cdsExcel.FieldByName('Msg').AsString:=cdsExcel.FieldByName('Msg').AsString+strError;
end;

procedure TfrmGoodsExcel.ClearParams;
var i:integer;
begin
  for i:=0 to 20 do
    FieldCheckSet[i]:='';
end;

function TfrmGoodsExcel.SelfCheckExcute2: Boolean;
var rs:TZQuery;
    strPre,strNext:string;
    fieldBarcode,fieldGodscode,fieldUnit,fieldSort:string;
    preID:integer;
begin
  {
  CreateStringList(barCodeList);
  CreateStringList(godsCodeList);
  CreateStringList(unitList);
  CreateStringList(sortList);
  //����
  if cdsColumn.Locate('FieldName','BARCODE1',[]) then
      fieldBarcode:=cdsColumn.fieldByName('FileName').AsString;
  if fieldBarcode='' then
    raise exception.Create('��ѯ���ֶβ����ڣ�');
  //����
  if cdsColumn.Locate('FieldName','GODS_CODE',[]) then
      fieldGodscode:=cdsColumn.fieldByName('FileName').AsString;
  //������λ
  if cdsColumn.Locate('FieldName','CALC_UNITS',[]) then
      fieldUnit:=cdsColumn.fieldByName('FileName').AsString;
  //����
  if cdsColumn.Locate('FieldName','SORT_ID1',[]) then
      fieldSort:=cdsColumn.fieldByName('FileName').AsString;
  rs:=TZQuery.Create(nil);
  rs.Data:=cdsExcel.Data;
  rs.SortedFields:=fieldBarcode;
  rs.First;
  strPre:=rs.fieldByName(fieldBarcode).AsString;
  preId:=rs.fieldByName('ID').AsInteger;
  if strPre<> '' then
    barCodeList.Add(strPre);
  if rs.fieldbyName(fieldGodscode).AsString<>''then
    godsCodeList.Add(rs.fieldbyName(fieldGodscode).AsString);
  if rs.fieldbyName(fieldUnit).AsString<>'' then
    unitList.Add(rs.fieldbyName(fieldUnit).AsString);
  if rs.fieldbyName(fieldSort).AsString<>'' then
    sortList.Add(rs.fieldbyName(fieldSort).AsString);
  rs.Next;
  while not rs.Eof do
  begin
    strNext:=rs.fieldByName(fieldBarcode).AsString;
    if strPre=strNext then
    begin
      cdsExcel.Locate('ID',rs.fieldByName('ID').AsInteger,[]);
      cdsExcel.Edit;
      cdsExcel.FieldByName('Msg').AsString:=cdsExcel.FieldByName('Msg').AsString+'���'+inttostr(preId)+'�������������ظ�;';
      cdsExcel.Post;
    end;
    strPre:=strNext;
    preID:=rs.fieldByName('ID').AsInteger;

    if strNext<> '' then
    barCodeList.Add(strNext);
    if rs.fieldbyName(fieldGodscode).AsString<>'' then
    godsCodeList.Add(rs.fieldbyName(fieldGodscode).AsString);
    if rs.fieldbyName(fieldUnit).AsString<>'' then
    unitList.Add(rs.fieldbyName(fieldUnit).AsString);
    if rs.fieldbyName(fieldSort).AsString<>'' then
    sortList.Add(rs.fieldbyName(fieldSort).AsString);
    rs.Next;
  end;

  TransformtoString(barCodeList,FBarcode);
  TransformtoString(godsCodeList,FGoodsCode);
  TransformtoString(unitList,FUnits);
  TransformtoString(sortList,FSorts);

  OutCheckExcute;
  }
end;

function TfrmGoodsExcel.SelfCheckExcute: Boolean;
var isSort:Boolean;
    rs:TZQuery;
    fieldName,FileName:string;
    preId:integer;
    strPre,strNext:string;
begin
  try
    rs:=TZQuery.Create(nil);
    rs.Data:=cdsExcel.Data;

    ClearParams;
    cdsColumn.First;
    while not cdsColumn.Eof do
    begin
      isSort:=false;
      fieldName:=cdsColumn.FieldbyName('FieldName').AsString;
      if fieldName <> '' then
      begin
        if (fieldName='BARCODE1') or (fieldName='BARCODE2') or
           (fieldName='BARCODE3') or (fieldName='GODS_CODE') or
           (fieldName='CALC_UNITS') or (fieldName='SMALL_UNITS') or
           (fieldName='BIG_UNITS') or (fieldName='SORT_ID1') then
        begin
          if (fieldName='BARCODE1') or (fieldName='BARCODE2') or
             (fieldName='BARCODE3') or (fieldName='GODS_CODE') then
          begin
            isSort:=true;
            rs.SortedFields:=cdsColumn.fieldByName('FileName').AsString;
          end;

          FileName:=cdsColumn.fieldByName('FileName').AsString;
          if isSort then
          begin
            rs.First;
            strPre:=rs.fieldByName(FileName).AsString;
            preId:=rs.fieldByName('ID').AsInteger;
            if strPre<>'' then
              TransformtoString(FieldCheckSet[cdsColumn.FieldByName('ID').AsInteger],strPre);
            rs.Next;
            while not rs.Eof do
            begin
              strNext:=rs.fieldByName(FileName).AsString;
              if strPre=strNext then
              begin
                cdsExcel.Locate('ID',rs.fieldByName('ID').AsInteger,[]);
                cdsExcel.Edit;
                cdsExcel.FieldByName('Msg').AsString:=cdsExcel.FieldByName('Msg').AsString+'���'+inttostr(preId)+'������'+cdsColumn.fieldByName('DestTitle').asstring+'�ظ�;';
                cdsExcel.Post;
              end;
              strPre:=strNext;
              preID:=rs.fieldByName('ID').AsInteger;
              if strNext<>'' then
              TransformtoString(FieldCheckSet[cdsColumn.FieldByName('ID').AsInteger],strNext);
              rs.Next;
            end;
          end else
          begin
            rs.First;
            while not rs.Eof do
            begin
              strNext:=rs.fieldByName(FileName).AsString;
              if strNext<> '' then
              TransformtoString(FieldCheckSet[cdsColumn.FieldByName('ID').AsInteger],strNext);
              rs.Next;
            end;
          end;
        end;
      end;
      cdsColumn.Next;
    end;
    OutCheckExcute;
  finally
    rs.Free;
  end;
end;

function TfrmGoodsExcel.OutCheckExcute: Boolean;
var rs,ss:TZQuery;
    FieldName,tempField,strError:string;
    i,c:integer;
    strWhere:string;
    strList:TStringList;
begin
  try
    rs:=TZQuery.Create(nil);
    ss:=TZQuery.Create(nil);
    ss.Data:=cdsExcel.Data;

    //*********************����*****************************
    for c:=0 to 2 do
    begin
      if c=0 then
        tempField:='BARCODE1'
      else if c=1 then
        tempField:='BARCODE2'
      else if c=2 then
        tempField:='BARCODE3';

      FieldName:='';
      if cdsColumn.Locate('FieldName',tempField,[]) then
      begin
        FieldName:=cdsColumn.fieldByName('FileName').AsString;
        strWhere:=DeleteDuplicateString(FieldCheckSet[cdsColumn.FieldByName('ID').AsInteger],strList);
        rs.SQL.Text:='select distinct barcode from VIW_BARCODE where tenant_id='+token.tenantId+' and barcode_type='''+inttostr(c)+''' and comm not in(''02'',''12'') and barcode in ('+strWhere+')';
        dataFactory.Open(rs);
        if not rs.IsEmpty then
        begin
          rs.First;
          while not rs.Eof do
          begin
            ss.Filtered:=false;
            ss.Filter:=FieldName+'='''+rs.Fields[0].AsString+'''';
            ss.Filtered:=true;
            ss.First;
            while not ss.Eof do
            begin
              cdsExcel.Locate('ID',ss.fieldByName('ID').AsInteger,[]);
              cdsExcel.Edit;
              cdsExcel.FieldByName('Msg').AsString:=cdsExcel.FieldByName('Msg').AsString+cdsColumn.fieldByName('DestTitle').AsString+'�Ѵ���;';
              cdsExcel.Post;
              ss.Next;
            end;
            ss.Filtered:=false;
            rs.Next;
          end;
        end;
      end;
    end;

    //*********************����*****************************
    FieldName:='';
    if cdsColumn.Locate('FieldName','GODS_CODE',[]) then
    begin
      FieldName:=cdsColumn.fieldByName('FileName').AsString;
      strWhere:=DeleteDuplicateString(FieldCheckSet[cdsColumn.FieldByName('ID').AsInteger],strList);
      rs.Close;
      rs.SQL.Text:='select distinct GODS_CODE from VIW_GOODSPRICEEXT where tenant_id='+token.tenantId+' and comm not in(''02'',''12'') and GODS_CODE in ('+strWhere+')';
      dataFactory.Open(rs);
      if not rs.IsEmpty then
      begin
        rs.First;
        while not rs.Eof do
        begin
          ss.Filtered:=false;
          ss.Filter:=FieldName+'='''+rs.Fields[0].AsString+'''';
          ss.Filtered:=true;
          ss.First;
          while not ss.Eof do
          begin
            cdsExcel.Locate('ID',ss.fieldByName('ID').AsInteger,[]);
            cdsExcel.Edit;
            cdsExcel.FieldByName('Msg').AsString:=cdsExcel.FieldByName('Msg').AsString+'�����Ѵ���;';
            cdsExcel.Post;
            ss.Next;
          end;
          ss.Filtered:=false;
          rs.Next;
        end;
      end;
    end;

    //*********************��λ*****************************
    for c:=0 to 2 do
    begin
      if c=0 then
        tempField:='CALC_UNITS'
      else if c=1 then
        tempField:='SMALL_UNITS'
      else if c=2 then
        tempField:='BIG_UNITS';

      FieldName:='';
      if cdsColumn.Locate('FieldName',tempField,[]) then
      begin
        FieldName:=cdsColumn.fieldByName('FileName').AsString;
        strWhere:=DeleteDuplicateString(FieldCheckSet[cdsColumn.FieldByName('ID').AsInteger],strList);
        rs.Close;
        rs.SQL.Text:='select distinct UNIT_NAME from VIW_MEAUNITS where tenant_id='+token.tenantId+' and comm not in(''02'',''12'') and UNIT_NAME in ('+strWhere+')';
        dataFactory.Open(rs);
        if not rs.IsEmpty then
        begin
          if rs.RecordCount=strList.Count then
          begin
            FUnitType[c]:=1;
          end
          else if rs.RecordCount<strList.Count then
          begin
            FUnitType[c]:=2;
            for i:=0 to strList.Count-1 do
            begin
              if not rs.Locate('UNIT_NAME',strList[i],[]) then
              begin
                ss.Filtered:=false;
                ss.Filter:=FieldName+'='''+strList[i]+'''';
                ss.Filtered:=true;
                ss.First;
                while not ss.Eof do
                begin
                  cdsExcel.Locate('ID',ss.fieldByName('ID').AsInteger,[]);
                  cdsExcel.Edit;
                  cdsExcel.FieldByName('Msg').AsString:=cdsExcel.FieldByName('Msg').AsString+cdsColumn.fieldByName('DestTitle').AsString+'������;';
                  cdsExcel.Post;
                  ss.Next;
                end;
                ss.Filtered:=false;
              end;
            end;
          end;
        end
        else
          FUnitType[c]:=0;
      end;
    end; 

    //*********************��Ʒ����*****************************
    FieldName:='';
    if cdsColumn.Locate('FieldName','SORT_ID1',[]) then
    begin
      FieldName:=cdsColumn.fieldByName('FileName').AsString;
      strWhere:=DeleteDuplicateString(FieldCheckSet[cdsColumn.FieldByName('ID').AsInteger],strList);
      rs.Close;
      rs.SQL.Text:='select distinct SORT_NAME from VIW_GOODSSORT where tenant_id='+token.tenantId+' and comm not in(''02'',''12'') and SORT_NAME in ('+strWhere+')';
      dataFactory.Open(rs);
      if not rs.IsEmpty then
      begin
        if rs.RecordCount=strList.Count then  //���еķ��඼�ڿ���
        begin
          FSortType:=1;
        end
        else if rs.RecordCount<strList.Count then  //���ַ����ڿ���
        begin
          FSortType:=2;
          for i:=0 to strList.Count-1 do
          begin
            if not rs.Locate('SORT_NAME',strList[i],[]) then
            begin
              ss.Filtered:=false;
              ss.Filter:=FieldName+'='''+strList[i]+'''';
              ss.Filtered:=true;
              ss.First;
              while not ss.Eof do
              begin
                cdsExcel.Locate('ID',ss.fieldByName('ID').AsInteger,[]);
                cdsExcel.Edit;
                cdsExcel.FieldByName('Msg').AsString:=cdsExcel.FieldByName('Msg').AsString+'��Ʒ���಻����;';
                cdsExcel.Post;
                ss.Next;
              end;
              ss.Filtered:=false;
            end;
          end;
        end
      end
      else                                  //����û���ļ��з���
        FSortType:=0;
    end;

    //*********************��ɫ�����롢��Ӧ��*****************************
  finally
    rs.Free;
    ss.Free;
  end;
end;

class function TfrmGoodsExcel.ExcelFactory(Owner: TForm; vDataSet: TZQuery;Fields,Formats:string;
  isSelfCheck: Boolean): Boolean;
begin
  with TfrmGoodsExcel.Create(Owner) do
    begin
      try
        DataSet:=vDataSet;
        CreateUseDataSet;
        DecodeFields(FieldsString);
        DecodeFormats(FormatString);
        SelfCheck:=isSelfCheck;
        result := (ShowModal=MROK);
      finally
        free;
      end;
    end;
end;

//Duplicates ��3����ѡֵ:
//dupIgnore: ����; 
//dupAccept: ����;
//dupError: ��ʾ����
procedure TfrmGoodsExcel.CreateStringList(var vList: TStringList);
begin
  if vList=nil then
  begin
    vList:=TStringList.Create;
    vList.Sorted:=true;
    vList.Duplicates:=dupIgnore;
  end
  else
    vList.Clear;
end;

procedure TfrmGoodsExcel.TransformtoString(vList: TStringList;var vStr:wideString);
var i:integer;
begin
  vStr:='';
  for i:=0 to vList.Count-1 do
  begin
    if vStr='' then
      vStr:=''''+vList[i]+''''
    else
      vStr:=vStr+','+''''+vList[i]+'''';;
  end;
end;

procedure TfrmGoodsExcel.Image4Click(Sender: TObject);
begin
  inherited;
  if MessageBox(Handle,pchar('�Ƿ�Ҫ������Ʒ����ģ�壿'),'������ʾ',MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2)<>6 then exit;
  saveDialog1.DefaultExt:='*.xls';
  saveDialog1.Filter:='Excel�ĵ�(*.xls)|*.xls';
  if saveDialog1.Execute then
  begin
    if FileExists(SaveDialog1.FileName) then
    begin
      if MessageBox(Handle, Pchar(SaveDialog1.FileName + '�Ѿ����ڣ��Ƿ񸲸�����'), Pchar(Application.Title), MB_YESNO + MB_ICONQUESTION) <> 6 then
        exit;
      DeleteFile(SaveDialog1.FileName);
    end;
    try
      if FileExists(ExtractFilePath(Application.ExeName)+'ExcelTemplate\��Ʒ��Ϣ�����.xls') then
        CopyFile(pchar(ExtractFilePath(Application.ExeName)+'ExcelTemplate\��Ʒ��Ϣ�����.xls'),pchar(SaveDialog1.FileName),false)
      else
        MessageBox(Handle, Pchar('û���ҵ�����ģ�壡'), Pchar(Application.Title), MB_OK + MB_ICONQUESTION);
    except
      MessageBox(Handle, Pchar('���ص���ģ��ʧ�ܣ�'), Pchar(Application.Title), MB_OK + MB_ICONQUESTION);
    end;
  end;
end;

function TfrmGoodsExcel.DeleteDuplicateString(vStr: string;var vStrList:TStringList): string;
var i:integer;
    strResult:string;
begin
  strResult:='';
  if vStrList=nil then
  begin
    vStrList:=TStringList.Create;
    vStrList.Sorted:=true;
    vStrList.Duplicates:= dupIgnore;
  end
  else
    vStrList.Clear;

  vStrList.DelimitedText:=vStr;
  for i:=0 to vStrList.Count-1 do
  begin
    if strResult='' then
      strResult:=''''+vStrList[i]+''''
    else
    strResult:=strResult+','+''''+vStrList[i]+'''';
  end; 
  result:=strResult;
end;

procedure TfrmGoodsExcel.TransformtoString(var vList: string;
  vStr: string);
begin
  if vList='' then
    vList:=vStr
  else
    vList:=vList+','+vStr;
end;

end.