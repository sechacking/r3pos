inherited frmClientInfo: TfrmClientInfo
  Left = 558
  Top = 249
  Caption = #23458#25143#26723#26696
  ClientHeight = 364
  ClientWidth = 528
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited bgPanel: TRzPanel
    Width = 528
    Height = 364
    BorderColor = clWhite
    Color = clWhite
    inherited RzPage: TRzPageControl
      Top = 113
      Width = 518
      Height = 206
      Color = clWhite
      ParentColor = False
      FixedDimension = 20
      inherited TabSheet1: TRzTabSheet
        Color = clWhite
        Caption = #35814#32454#20449#24687
        inherited RzPanel2: TRzPanel
          Width = 514
          Height = 179
          BorderColor = clWhite
          Color = clWhite
          object labHOMEPAGE: TRzLabel
            Left = -10
            Top = 108
            Width = 100
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = #22791#27880
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object RzLabel3: TRzLabel
            Left = -9
            Top = 84
            Width = 100
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = #21457#31080#31867#22411
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object RzLabel9: TRzLabel
            Left = -9
            Top = 35
            Width = 100
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = #24320#25143#38134#34892
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object RzLabel10: TRzLabel
            Left = -10
            Top = 59
            Width = 100
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = #36134#21495
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object RzLabel18: TRzLabel
            Left = 267
            Top = 84
            Width = 100
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = #21487#29992#20313#39069
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object RzLabel19: TRzLabel
            Left = 267
            Top = 12
            Width = 100
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = #32047#35745#31215#20998
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object RzLabel20: TRzLabel
            Left = 267
            Top = 36
            Width = 100
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = #20351#29992#31215#20998
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object RzLabel21: TRzLabel
            Left = 267
            Top = 60
            Width = 100
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = #21487#29992#31215#20998
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object labSHOP_ID: TRzLabel
            Left = -11
            Top = 11
            Width = 100
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = #25152#23646#38376#24215
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object edtINVOICE_FLAG: TcxComboBox
            Left = 96
            Top = 80
            Width = 121
            Height = 20
            Properties.DropDownListStyle = lsFixedList
            TabOrder = 3
          end
          object edtACCOUNT: TcxTextEdit
            Left = 96
            Top = 56
            Width = 170
            Height = 20
            TabOrder = 1
          end
          object edtREMARK: TcxMemo
            Left = 96
            Top = 105
            Width = 398
            Height = 67
            TabOrder = 7
          end
          object edtBALANCE: TcxTextEdit
            Left = 372
            Top = 80
            Width = 121
            Height = 20
            Enabled = False
            TabOrder = 2
          end
          object edtACCU_INTEGRAL: TcxTextEdit
            Left = 372
            Top = 8
            Width = 121
            Height = 20
            Enabled = False
            TabOrder = 4
          end
          object edtRULE_INTEGRAL: TcxTextEdit
            Left = 372
            Top = 32
            Width = 121
            Height = 20
            Enabled = False
            TabOrder = 5
          end
          object edtINTEGRAL: TcxTextEdit
            Left = 372
            Top = 56
            Width = 121
            Height = 20
            Enabled = False
            TabOrder = 6
          end
          object edtBANK_ID: TcxComboBox
            Left = 96
            Top = 32
            Width = 121
            Height = 20
            Properties.DropDownListStyle = lsFixedList
            TabOrder = 0
          end
          object edtSHOP_ID: TzrComboBoxList
            Left = 96
            Top = 8
            Width = 121
            Height = 20
            Enabled = False
            Properties.AutoSelect = False
            Properties.Buttons = <
              item
                Default = True
              end>
            Properties.ReadOnly = True
            TabOrder = 8
            InGrid = False
            KeyValue = Null
            FilterFields = 'SHOP_ID;SHOP_NAME;SHOP_SPELL'
            KeyField = 'SHOP_ID'
            ListField = 'SHOP_NAME'
            Columns = <
              item
                EditButtons = <>
                FieldName = 'CODE_NAME'
                Footers = <>
                Title.Caption = #23610#30721#32452
                Width = 121
              end
              item
                EditButtons = <>
                FieldName = 'CODE_SPELL'
                Footers = <>
                Visible = False
              end>
            DropWidth = 176
            DropHeight = 130
            ShowTitle = False
            AutoFitColWidth = True
            OnAddClick = edtSORT_IDAddClick
            ShowButton = True
            LocateStyle = lsDark
            Buttons = [zbNew]
            DropListStyle = lsFixed
            OnSaveValue = edtSORT_IDSaveValue
            MultiSelect = False
          end
        end
      end
      object TabSheet2: TRzTabSheet
        Color = clWhite
        Caption = #32852#31995#20449#24687
        object RzPanel3: TRzPanel
          Left = 0
          Top = 0
          Width = 514
          Height = 179
          Align = alClient
          BorderColor = clWhite
          Color = clWhite
          TabOrder = 0
          object labLINKMAN: TRzLabel
            Left = -10
            Top = 18
            Width = 100
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = #32852#31995#20154
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object labTELEPHONE1: TRzLabel
            Left = -10
            Top = 70
            Width = 100
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = #30005#35805
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object labPOSTALCODE: TRzLabel
            Left = -10
            Top = 120
            Width = 100
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = #37038#32534
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object labFAXES: TRzLabel
            Left = -10
            Top = 45
            Width = 100
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = #20256#30495
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object labEMAIL: TRzLabel
            Left = 264
            Top = 95
            Width = 100
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = #30005#23376#37038#20214
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object labTELEPHONE2: TRzLabel
            Left = 264
            Top = 45
            Width = 100
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'QQ'
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object RzLabel5: TRzLabel
            Left = -10
            Top = 95
            Width = 100
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = #25163#26426
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object labADDRESS: TRzLabel
            Left = -10
            Top = 144
            Width = 100
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = #22320#22336
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object labMSN: TRzLabel
            Left = 264
            Top = 70
            Width = 100
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'MSN'
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object RzLabel12: TRzLabel
            Left = 264
            Top = 119
            Width = 99
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = #32593#22336
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object RzLabel23: TRzLabel
            Left = 264
            Top = 21
            Width = 100
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = #32463#33829#35768#21487#35777
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object edtLINKMAN: TcxTextEdit
            Left = 97
            Top = 15
            Width = 121
            Height = 20
            TabOrder = 0
          end
          object edtTELEPHONE1: TcxTextEdit
            Left = 97
            Top = 66
            Width = 121
            Height = 20
            TabOrder = 2
          end
          object edtPOSTALCODE: TcxTextEdit
            Left = 97
            Top = 116
            Width = 121
            Height = 20
            TabOrder = 4
          end
          object edtFAXES: TcxTextEdit
            Left = 97
            Top = 41
            Width = 121
            Height = 20
            TabOrder = 1
          end
          object edtEMAIL: TcxTextEdit
            Left = 371
            Top = 91
            Width = 121
            Height = 20
            TabOrder = 8
          end
          object edtQQ: TcxTextEdit
            Left = 371
            Top = 41
            Width = 121
            Height = 20
            TabOrder = 6
          end
          object edtTELEPHONE2: TcxTextEdit
            Left = 97
            Top = 91
            Width = 121
            Height = 20
            TabOrder = 3
          end
          object edtADDRESS: TcxTextEdit
            Left = 97
            Top = 141
            Width = 395
            Height = 20
            TabOrder = 10
          end
          object edtMSN: TcxTextEdit
            Left = 371
            Top = 66
            Width = 121
            Height = 20
            TabOrder = 7
          end
          object edtHOMEPAGE: TcxTextEdit
            Left = 371
            Top = 116
            Width = 121
            Height = 20
            TabOrder = 9
          end
          object edtLICENSE_CODE: TcxTextEdit
            Left = 371
            Top = 17
            Width = 121
            Height = 20
            TabOrder = 5
          end
        end
      end
    end
    inherited btPanel: TRzPanel
      Top = 319
      Width = 518
      BorderColor = clWhite
      Color = clWhite
      object Btn_Save: TRzBitBtn
        Left = 363
        Top = 9
        Width = 67
        Height = 26
        Anchors = [akTop, akRight]
        Caption = #20445#23384'(&S)'
        Color = clSilver
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        HighlightColor = 16026986
        HotTrack = True
        HotTrackColor = 3983359
        HotTrackColorType = htctActual
        ParentFont = False
        TextShadowColor = clWhite
        TextShadowDepth = 4
        TabOrder = 0
        TextStyle = tsRaised
        ThemeAware = False
        OnClick = Btn_SaveClick
        NumGlyphs = 2
        Spacing = 5
      end
      object Btn_Close: TRzBitBtn
        Left = 450
        Top = 9
        Width = 67
        Height = 26
        Anchors = [akTop, akRight]
        Caption = #20851#38381'(&C)'
        Color = clSilver
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        HighlightColor = 16026986
        HotTrack = True
        HotTrackColor = 3983359
        HotTrackColorType = htctActual
        ParentFont = False
        TextShadowColor = clWhite
        TextShadowDepth = 4
        TabOrder = 1
        TextStyle = tsRaised
        ThemeAware = False
        OnClick = Btn_CloseClick
        NumGlyphs = 2
        Spacing = 5
      end
    end
    object RzPanel1: TRzPanel
      Left = 5
      Top = 5
      Width = 518
      Height = 108
      Align = alTop
      BorderOuter = fsNone
      BorderColor = clWhite
      Color = clWhite
      TabOrder = 2
      object labCLIENT_NAME: TRzLabel
        Left = -10
        Top = 29
        Width = 100
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = #23458#25143#21517#31216
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object labCLIENT_SPELL: TRzLabel
        Left = 265
        Top = 29
        Width = 100
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = #25340#38899#30721
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object RzLabel4: TRzLabel
        Left = 494
        Top = 54
        Width = 6
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = '*'
        Font.Charset = GB2312_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object RzLabel6: TRzLabel
        Left = -9
        Top = 78
        Width = 100
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = #23458#25143#31867#21035
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object RzLabel13: TRzLabel
        Left = 259
        Top = 30
        Width = 6
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = '*'
        Font.Charset = GB2312_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object RzLabel7: TRzLabel
        Left = 265
        Top = 78
        Width = 100
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22320#21306
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object RzLabel2: TRzLabel
        Left = 494
        Top = 78
        Width = 6
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = '*'
        Font.Charset = GB2312_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object RzLabel14: TRzLabel
        Left = 221
        Top = 79
        Width = 6
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = '*'
        Font.Charset = GB2312_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object RzLabel1: TRzLabel
        Left = -10
        Top = 5
        Width = 100
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = #23458#25143#32534#21495
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object RzLabel11: TRzLabel
        Left = 220
        Top = 5
        Width = 6
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = '*'
        Font.Charset = GB2312_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object RzLabel8: TRzLabel
        Left = 265
        Top = 54
        Width = 100
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = #32467#31639#26041#24335
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object RzLabel16: TRzLabel
        Left = -9
        Top = 54
        Width = 100
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = #23458#25143#31561#32423
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object RzLabel22: TRzLabel
        Left = 220
        Top = 54
        Width = 6
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = '*'
        Font.Charset = GB2312_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object edtCLIENT_NAME: TcxTextEdit
        Left = 97
        Top = 26
        Width = 160
        Height = 20
        Properties.OnChange = edtCLIENT_NAMEPropertiesChange
        TabOrder = 1
      end
      object edtCLIENT_SPELL: TcxTextEdit
        Left = 371
        Top = 26
        Width = 121
        Height = 20
        Enabled = False
        TabOrder = 2
      end
      object edtSORT_ID: TzrComboBoxList
        Left = 98
        Top = 75
        Width = 121
        Height = 20
        Properties.AutoSelect = False
        Properties.Buttons = <
          item
            Default = True
          end>
        Properties.ReadOnly = True
        TabOrder = 3
        InGrid = False
        KeyValue = Null
        FilterFields = 'CODE_ID;CODE_NAME;CODE_SPELL'
        KeyField = 'CODE_ID'
        ListField = 'CODE_NAME'
        Columns = <
          item
            EditButtons = <>
            FieldName = 'CODE_NAME'
            Footers = <>
            Title.Caption = #23610#30721#32452
            Width = 121
          end
          item
            EditButtons = <>
            FieldName = 'CODE_SPELL'
            Footers = <>
            Visible = False
          end>
        DropWidth = 121
        DropHeight = 130
        ShowTitle = False
        AutoFitColWidth = True
        OnAddClick = edtSORT_IDAddClick
        ShowButton = True
        LocateStyle = lsDark
        Buttons = [zbNew]
        DropListStyle = lsFixed
        OnSaveValue = edtSORT_IDSaveValue
        MultiSelect = False
      end
      object edtREGION_ID: TzrComboBoxList
        Left = 371
        Top = 75
        Width = 121
        Height = 20
        Properties.AutoSelect = False
        Properties.Buttons = <
          item
            Default = True
          end>
        Properties.ReadOnly = True
        TabOrder = 6
        InGrid = False
        KeyValue = Null
        FilterFields = 'CODE_ID;CODE_NAME;CODE_SPELL'
        KeyField = 'CODE_ID'
        ListField = 'CODE_NAME'
        Columns = <
          item
            EditButtons = <>
            FieldName = 'CODE_NAME'
            Footers = <>
            Title.Caption = #21517#31216
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'CODE_ID'
            Footers = <>
            Title.Caption = #32534#30721
            Width = 40
          end>
        DropWidth = 176
        DropHeight = 130
        ShowTitle = True
        AutoFitColWidth = True
        OnAddClick = edtREGION_IDAddClick
        ShowButton = True
        LocateStyle = lsDark
        Buttons = [zbNew]
        DropListStyle = lsFixed
        MultiSelect = False
      end
      object edtCLIENT_CODE: TcxTextEdit
        Left = 97
        Top = 2
        Width = 121
        Height = 20
        Properties.OnChange = edtCLIENT_NAMEPropertiesChange
        TabOrder = 0
      end
      object edtSETTLE_CODE: TcxComboBox
        Left = 371
        Top = 50
        Width = 121
        Height = 20
        Properties.DropDownListStyle = lsFixedList
        TabOrder = 5
      end
      object edtPRICE_ID: TzrComboBoxList
        Left = 97
        Top = 50
        Width = 121
        Height = 20
        Properties.AutoSelect = False
        Properties.Buttons = <
          item
            Default = True
          end>
        Properties.ReadOnly = True
        TabOrder = 4
        InGrid = False
        KeyValue = Null
        FilterFields = 'PRICE_NAME;PRICE_SPELL'
        KeyField = 'PRICE_ID'
        ListField = 'PRICE_NAME'
        Columns = <
          item
            EditButtons = <>
            FieldName = 'PRICE_NAME'
            Footers = <>
            Title.Caption = #31561#32423#21517#31216
            Width = 121
          end>
        DropWidth = 121
        DropHeight = 130
        ShowTitle = False
        AutoFitColWidth = True
        ShowButton = True
        LocateStyle = lsDark
        Buttons = [zbNew]
        DropListStyle = lsFixed
        OnSaveValue = edtSORT_IDSaveValue
        MultiSelect = False
      end
    end
  end
  inherited mmMenu: TMainMenu
    Left = 267
    Top = 107
  end
  inherited actList: TActionList
    Left = 307
    Top = 107
  end
  object cdsTable: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 226
    Top = 107
  end
end
