inherited frmMktRequOrder: TfrmMktRequOrder
  Left = 194
  Top = 106
  Width = 938
  Height = 605
  Caption = #36153#29992#30003#39046#21333
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited RzPanel1: TRzPanel
    Width = 930
    Height = 578
    inherited RzPanel2: TRzPanel
      Width = 920
      Height = 107
      object lblSTOCK_DATE: TLabel [0]
        Left = 562
        Top = 17
        Width = 48
        Height = 12
        Alignment = taRightJustify
        Caption = #22635#25253#26085#26399
      end
      object lblCLIENT_ID: TLabel [1]
        Left = 195
        Top = 17
        Width = 48
        Height = 12
        Alignment = taRightJustify
        Caption = #32463' '#38144' '#21830
      end
      object Label2: TLabel [2]
        Left = 195
        Top = 80
        Width = 48
        Height = 12
        Alignment = taRightJustify
        Caption = #22791'    '#27880
      end
      object Label5: TLabel [3]
        Left = 392
        Top = 59
        Width = 48
        Height = 12
        Alignment = taRightJustify
        Caption = #36820#36824#31867#22411
      end
      object Label6: TLabel [4]
        Left = 404
        Top = 38
        Width = 36
        Height = 12
        Alignment = taRightJustify
        Caption = #22635#25253#20154
      end
      object Label40: TLabel [5]
        Left = 195
        Top = 38
        Width = 48
        Height = 12
        Caption = #30003#25253#38376#24215
      end
      object Label3: TLabel [6]
        Left = 195
        Top = 59
        Width = 48
        Height = 12
        Caption = #25152#23646#37096#38376
      end
      object Label8: TLabel [7]
        Left = 562
        Top = 38
        Width = 48
        Height = 12
        Alignment = taRightJustify
        Caption = #23457#26680#26085#26399
      end
      object Label9: TLabel [8]
        Left = 562
        Top = 59
        Width = 48
        Height = 12
        Alignment = taRightJustify
        Caption = #23457#26680#29992#25143
      end
      inherited RzPanel4: TRzPanel
        Height = 91
        TabOrder = 7
        inherited Image1: TImage
          Left = 95
          Top = 39
        end
      end
      object edtCLIENT_ID: TzrComboBoxList
        Left = 251
        Top = 13
        Width = 264
        Height = 20
        Properties.AutoSelect = False
        Properties.Buttons = <
          item
            Default = True
          end>
        Properties.ReadOnly = True
        Properties.OnChange = edtCLIENT_IDPropertiesChange
        TabOrder = 0
        InGrid = False
        KeyValue = Null
        FilterFields = 'CLIENT_NAME;CLIENT_SPELL;CLIENT_CODE;LICENSE_CODE;TELEPHONE2'
        KeyField = 'CLIENT_ID'
        ListField = 'CLIENT_NAME'
        Columns = <
          item
            EditButtons = <>
            FieldName = 'CLIENT_CODE'
            Footers = <>
            Title.Caption = #23458#25143#21495
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'CLIENT_NAME'
            Footers = <>
            Title.Caption = #23458#25143#21517#31216
            Width = 150
          end
          item
            EditButtons = <>
            FieldName = 'LINKMAN'
            Footers = <>
            Title.Caption = #32852#31995#20154
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'TELEPHONE2'
            Footers = <>
            Title.Caption = #32852#31995#30005#35805
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'LICENSE_CODE'
            Footers = <>
            Title.Caption = #35777#20214#21495
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'ADDRESS'
            Footers = <>
            Title.Caption = #22320#22336
            Width = 150
          end>
        DropWidth = 314
        DropHeight = 281
        ShowTitle = True
        AutoFitColWidth = False
        ShowButton = True
        LocateStyle = lsDark
        Buttons = [zbNew, zbFind]
        DropListStyle = lsFixed
        MultiSelect = False
      end
      object edtREQU_DATE: TcxDateEdit
        Left = 619
        Top = 13
        Width = 121
        Height = 20
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 6
      end
      object edtREMARK: TcxTextEdit
        Left = 251
        Top = 76
        Width = 286
        Height = 20
        TabOrder = 5
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object edtREQU_TYPE: TcxComboBox
        Left = 448
        Top = 55
        Width = 89
        Height = 20
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        Properties.DropDownListStyle = lsFixedList
        Properties.OnChange = edtREQU_TYPEPropertiesChange
        TabOrder = 4
      end
      object edtREQU_USER: TzrComboBoxList
        Left = 448
        Top = 34
        Width = 89
        Height = 20
        Properties.AutoSelect = False
        Properties.Buttons = <
          item
            Default = True
          end>
        Properties.ReadOnly = True
        TabOrder = 2
        InGrid = False
        KeyValue = Null
        FilterFields = 'ACCOUNT;USER_NAME;USER_SPELL'
        KeyField = 'USER_ID'
        ListField = 'USER_NAME'
        Columns = <
          item
            EditButtons = <>
            FieldName = 'ACCOUNT'
            Footers = <>
            Title.Caption = #24080#21495
          end
          item
            EditButtons = <>
            FieldName = 'USER_NAME'
            Footers = <>
            Title.Caption = #22995#21517
            Width = 130
          end>
        DropWidth = 180
        DropHeight = 150
        ShowTitle = True
        AutoFitColWidth = True
        ShowButton = True
        LocateStyle = lsDark
        Buttons = [zbNew]
        DropListStyle = lsFixed
        MultiSelect = False
      end
      object edtSHOP_ID: TzrComboBoxList
        Left = 251
        Top = 34
        Width = 131
        Height = 20
        Properties.AutoSelect = False
        Properties.Buttons = <
          item
            Default = True
          end>
        Properties.ReadOnly = False
        TabOrder = 1
        InGrid = False
        KeyValue = Null
        FilterFields = 'SHOP_ID;SHOP_NAME;SHOP_SPELL'
        KeyField = 'SHOP_ID'
        ListField = 'SHOP_NAME'
        Columns = <
          item
            EditButtons = <>
            FieldName = 'SHOP_NAME'
            Footers = <>
            Title.Caption = #21517#31216
          end
          item
            EditButtons = <>
            FieldName = 'SEQ_NO'
            Footers = <>
            Title.Caption = #24207#21495
            Width = 20
          end>
        DropWidth = 185
        DropHeight = 180
        ShowTitle = True
        AutoFitColWidth = True
        ShowButton = False
        LocateStyle = lsDark
        Buttons = []
        DropListStyle = lsFixed
        MultiSelect = False
      end
      object edtDEPT_ID: TzrComboBoxList
        Left = 251
        Top = 55
        Width = 131
        Height = 20
        Properties.AutoSelect = False
        Properties.Buttons = <
          item
            Default = True
          end>
        Properties.ReadOnly = False
        TabOrder = 3
        InGrid = False
        KeyValue = Null
        FilterFields = 'DEPT_NAME;DEPT_SPELL'
        KeyField = 'DEPT_ID'
        ListField = 'DEPT_NAME'
        Columns = <
          item
            EditButtons = <>
            FieldName = 'DEPT_NAME'
            Footers = <>
            Title.Caption = #21517#31216
          end>
        DropWidth = 185
        DropHeight = 180
        ShowTitle = True
        AutoFitColWidth = True
        ShowButton = False
        LocateStyle = lsDark
        Buttons = []
        DropListStyle = lsFixed
        MultiSelect = False
      end
      object RzBitBtn1: TRzBitBtn
        Left = 514
        Top = 13
        Width = 23
        Height = 20
        Caption = #35814
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
        TabOrder = 8
        TabStop = False
        TextStyle = tsRaised
        ThemeAware = False
        NumGlyphs = 2
        Spacing = 5
      end
      object edtCHK_DATE: TcxTextEdit
        Tag = 1
        Left = 619
        Top = 34
        Width = 121
        Height = 20
        TabOrder = 9
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object edtCHK_USER_TEXT: TcxTextEdit
        Tag = 1
        Left = 619
        Top = 55
        Width = 121
        Height = 20
        TabOrder = 10
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
    end
    inherited RzPanel3: TRzPanel
      Top = 459
      Width = 920
      Height = 42
      object Label1: TLabel
        Left = 9
        Top = 14
        Width = 65
        Height = 12
        Alignment = taRightJustify
        Caption = #24453#20998#25674#36820#21033
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 212
        Top = 14
        Width = 78
        Height = 12
        Alignment = taRightJustify
        Caption = #24453#20998#25674#24066#22330#36153
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 431
        Top = 14
        Width = 91
        Height = 12
        Alignment = taRightJustify
        Caption = #24453#20998#25674#20215#26684#25903#25345
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 663
        Top = 14
        Width = 91
        Height = 12
        Alignment = taRightJustify
        Caption = #24453#20998#25674#20854#20182#36153#29992
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtKPI_MNY: TcxTextEdit
        Tag = 1
        Left = 83
        Top = 10
        Width = 121
        Height = 20
        TabOrder = 0
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object edtBUDG_MNY: TcxTextEdit
        Tag = 1
        Left = 299
        Top = 10
        Width = 121
        Height = 20
        TabOrder = 1
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object edtAGIO_MNY: TcxTextEdit
        Tag = 1
        Left = 531
        Top = 10
        Width = 121
        Height = 20
        TabOrder = 2
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
      object edtOTHR_MNY: TcxTextEdit
        Tag = 1
        Left = 763
        Top = 10
        Width = 121
        Height = 20
        TabOrder = 3
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
    end
    inherited DBGridEh1: TDBGridEh
      Top = 145
      Width = 920
      Height = 183
      Columns = <
        item
          EditButtons = <>
          FieldName = 'SEQNO'
          Footers = <>
          Title.Caption = #24207#21495
          Width = 31
        end
        item
          EditButtons = <>
          FieldName = 'GODS_NAME'
          Footers = <>
          Title.Caption = #21830#21697#21517#31216
          Title.Hint = #25903#25345' "'#36135#21495#12289#21830#21697#21517#31216#12289#25340#38899#30721#12289#35745#37327#21333#20301#26465#30721'" '#26597#35810
          Width = 142
          Control = fndGODS_ID
          OnBeforeShowControl = DBGridEh1Columns1BeforeShowControl
        end
        item
          EditButtons = <>
          FieldName = 'GODS_CODE'
          Footers = <>
          ReadOnly = True
          Tag = 1
          Title.Caption = #36135#21495
          Width = 61
        end
        item
          EditButtons = <>
          FieldName = 'BARCODE'
          Footers = <>
          Tag = 1
          Title.Caption = #26465#30721
          Width = 93
        end
        item
          EditButtons = <>
          FieldName = 'UNIT_ID'
          Footers = <>
          Title.Caption = #21333#20301
          Width = 41
          Control = fndUNIT_ID
          OnBeforeShowControl = DBGridEh1Columns3BeforeShowControl
        end
        item
          EditButtons = <>
          FieldName = 'AMOUNT'
          Footer.DisplayFormat = '#0.00'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #25968#37327
          Width = 53
        end
        item
          EditButtons = <>
          FieldName = 'KPI_MNY'
          Footer.DisplayFormat = '#0.00'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #38144#21806#36820#21033
          Width = 69
          OnUpdateData = DBGridEh1Columns6UpdateData
        end
        item
          EditButtons = <>
          FieldName = 'BUDG_MNY'
          Footer.DisplayFormat = '#0.00'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #24066#22330#36153#29992
          Width = 67
          OnUpdateData = DBGridEh1Columns7UpdateData
        end
        item
          EditButtons = <>
          FieldName = 'AGIO_MNY'
          Footer.DisplayFormat = '#0.00'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #20215#26684#25903#25345
          Width = 66
          OnUpdateData = DBGridEh1Columns8UpdateData
        end
        item
          EditButtons = <>
          FieldName = 'OTHR_MNY'
          Footer.DisplayFormat = '#0.00'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #20854#23427#37329#39069
          Width = 61
          OnUpdateData = DBGridEh1Columns9UpdateData
        end
        item
          EditButtons = <>
          FieldName = 'REMARK'
          Footers = <>
          Title.Caption = #25688#35201
          Width = 200
        end>
    end
    inherited pnlBarCode: TRzPanel [3]
      Top = 112
      Width = 920
      inherited lblInput: TLabel
        Left = 583
        Visible = False
      end
      inherited lblHint: TLabel
        Left = 885
        Visible = False
      end
      inherited edtInput: TcxTextEdit
        Left = 673
        Visible = False
      end
      object RzTab: TRzTabControl
        Left = 0
        Top = 1
        Width = 920
        Height = 29
        Align = alTop
        TabHeight = 29
        TabIndex = 0
        TabOrder = 1
        Tabs = <
          item
            Caption = #21830#21697#28165#21333
          end
          item
            Caption = #36153#29992#20998#25674
          end>
        OnChange = RzTabChange
        FixedDimension = 29
      end
    end
    inherited stbHint: TRzPanel [4]
      Top = 549
      Width = 920
    end
    inherited rzHelp: TRzPanel [5]
      Top = 501
      Width = 920
    end
    inherited fndUNIT_ID: TcxComboBox [6]
      Top = 184
    end
    object DBGridEh2: TDBGridEh [7]
      Left = 5
      Top = 328
      Width = 920
      Height = 131
      Align = alBottom
      AllowedOperations = [alopUpdateEh]
      DataSource = dsDetail2
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = GB2312_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -12
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      FooterRowCount = 1
      FrozenCols = 2
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection]
      PopupMenu = PopupMenu2
      RowHeight = 17
      SumList.Active = True
      TabOrder = 8
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      TitleHeight = 20
      UseMultiTitle = True
      VertScrollBar.VisibleMode = sbAlwaysShowEh
      IsDrawNullRow = False
      CurrencySymbol = #65509
      DecimalNumber = 2
      DigitalNumber = 12
      OnDrawColumnCell = DBGridEh2DrawColumnCell
      OnDrawFooterCell = DBGridEh2DrawFooterCell
      OnKeyPress = DBGridEh2KeyPress
      OnMouseDown = DBGridEh2MouseDown
      Columns = <
        item
          EditButtons = <>
          FieldName = 'SEQNO'
          Footers = <>
          Title.Caption = #24207#21495
          Width = 31
        end
        item
          EditButtons = <>
          FieldName = 'KPI_ID_TEXT'
          Footers = <>
          Title.Caption = #25351#26631#21517#31216
          Width = 204
          Control = edtKPI_ID
          OnUpdateData = DBGridEh2Columns1UpdateData
          OnBeforeShowControl = DBGridEh2Columns1BeforeShowControl
        end
        item
          EditButtons = <>
          FieldName = 'KPI_YEAR'
          Footers = <>
          ReadOnly = True
          Tag = 1
          Title.Caption = #24180#24230
          Width = 60
          Control = edtKPI_YEAR
          OnBeforeShowControl = DBGridEh2Columns2BeforeShowControl
        end
        item
          DisplayFormat = '#0.00'
          EditButtons = <>
          FieldName = 'KPI_MNY'
          Footer.DisplayFormat = '#0.00'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #36820#21033#37329#39069
          Width = 67
          OnUpdateData = DBGridEh2Columns3UpdateData
        end
        item
          DisplayFormat = '#0.00'
          EditButtons = <>
          FieldName = 'BUDG_MNY'
          Footer.DisplayFormat = '#0.00'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #24066#22330#36153#29992
          Width = 63
          OnUpdateData = DBGridEh2Columns4UpdateData
        end
        item
          EditButtons = <>
          FieldName = 'AGIO_MNY'
          Footer.DisplayFormat = '#0.00'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #20215#26684#25903#25345
          Width = 63
          OnUpdateData = DBGridEh2Columns5UpdateData
        end
        item
          EditButtons = <>
          FieldName = 'OTHR_MNY'
          Footer.DisplayFormat = '#0.00'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #20854#23427#37329#39069
          OnUpdateData = DBGridEh2Columns6UpdateData
        end
        item
          EditButtons = <>
          FieldName = 'REMARK'
          Footers = <>
          Title.Caption = #25688#35201
          Width = 200
        end>
    end
    object edtKPI_YEAR: TzrComboBoxList [8]
      Left = 256
      Top = 368
      Width = 73
      Height = 20
      Properties.AutoSelect = False
      Properties.Buttons = <
        item
          Default = True
        end>
      Properties.ReadOnly = True
      TabOrder = 10
      Visible = False
      OnEnter = edtKPI_YEAREnter
      OnExit = edtKPI_YEARExit
      OnKeyDown = edtKPI_YEARKeyDown
      OnKeyPress = edtKPI_YEARKeyPress
      InGrid = False
      KeyValue = Null
      KeyField = 'KPI_YEAR'
      ListField = 'KPI_YEAR'
      Columns = <
        item
          EditButtons = <>
          FieldName = 'KPI_YEAR'
          Footers = <>
          Title.Caption = #24180#20221
        end>
      DataSet = cdsKPI_YEAR
      DropWidth = 73
      DropHeight = 200
      ShowTitle = False
      AutoFitColWidth = True
      ShowButton = False
      LocateStyle = lsDark
      Buttons = []
      DropListStyle = lsFixed
      OnSaveValue = edtKPI_YEARSaveValue
      MultiSelect = False
    end
    inherited fndGODS_ID: TzrComboBoxList [9]
      Left = 48
      Top = 187
      Buttons = [zbFind]
    end
    object edtKPI_ID: TzrComboBoxList
      Left = 128
      Top = 368
      Width = 121
      Height = 20
      Properties.AutoSelect = False
      Properties.Buttons = <
        item
          Default = True
        end>
      Properties.ReadOnly = True
      TabOrder = 9
      Visible = False
      OnEnter = edtKPI_IDEnter
      OnExit = edtKPI_IDExit
      OnKeyDown = edtKPI_IDKeyDown
      OnKeyPress = edtKPI_IDKeyPress
      InGrid = False
      KeyValue = Null
      FilterFields = 'KPI_NAME;KPI_SPELL'
      KeyField = 'KPI_ID'
      ListField = 'KPI_NAME'
      Columns = <
        item
          EditButtons = <>
          FieldName = 'KPI_NAME'
          Footers = <>
          Title.Caption = #25351#26631#21517#31216
        end
        item
          EditButtons = <>
          FieldName = 'KPI_SPELL'
          Footers = <>
          Title.Caption = #25340#38899#30721
        end>
      DataSet = cdsKPI_ID
      DropWidth = 290
      DropHeight = 228
      ShowTitle = True
      AutoFitColWidth = True
      ShowButton = True
      LocateStyle = lsDark
      Buttons = []
      DropListStyle = lsFixed
      OnSaveValue = edtKPI_IDSaveValue
      MultiSelect = False
    end
  end
  inherited dsTable: TDataSource
    Left = 109
    Top = 250
  end
  inherited PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    object N4: TMenuItem [9]
      Caption = #29983#25104#38144#21806#35746#21333
      OnClick = N4Click
    end
    object N3: TMenuItem [10]
      Caption = '-'
    end
  end
  inherited edtTable: TZQuery
    FieldDefs = <
      item
        Name = 'SEQNO'
        DataType = ftInteger
      end
      item
        Name = 'GODS_ID'
        DataType = ftString
        Size = 36
      end
      item
        Name = 'BARCODE'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'GODS_CODE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'GODS_NAME'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'UNIT_ID'
        DataType = ftString
        Size = 36
      end
      item
        Name = 'BATCH_NO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'IS_PRESENT'
        DataType = ftInteger
      end
      item
        Name = 'LOCUS_NO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'BOM_ID'
        DataType = ftString
        Size = 36
      end
      item
        Name = 'AMOUNT'
        DataType = ftFloat
      end
      item
        Name = 'CALC_AMOUNT'
        DataType = ftFloat
      end
      item
        Name = 'KPI_MNY'
        DataType = ftFloat
      end
      item
        Name = 'BUDG_MNY'
        DataType = ftFloat
      end
      item
        Name = 'AGIO_MNY'
        DataType = ftFloat
      end
      item
        Name = 'OTHR_MNY'
        DataType = ftFloat
      end
      item
        Name = 'REMARK'
        DataType = ftString
        Size = 100
      end>
    AfterScroll = edtTableAfterScroll
    AfterPost = edtTableAfterPost
    Left = 77
    Top = 250
  end
  inherited edtProperty: TZQuery
    Left = 96
    Top = 296
  end
  object cdsHeader: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 77
    Top = 181
  end
  object cdsKPI_ID: TZQuery
    FieldDefs = <
      item
        Name = 'SEQNO'
        DataType = ftInteger
      end
      item
        Name = 'GODS_ID'
        DataType = ftString
        Size = 36
      end
      item
        Name = 'BARCODE'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'GODS_CODE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'GODS_NAME'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'UNIT_ID'
        DataType = ftString
        Size = 36
      end
      item
        Name = 'BATCH_NO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'IS_PRESENT'
        DataType = ftInteger
      end
      item
        Name = 'LOCUS_NO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'BOM_ID'
        DataType = ftString
        Size = 36
      end>
    CachedUpdates = True
    Params = <>
    Left = 168
    Top = 392
  end
  object cdsKPI_YEAR: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 196
    Top = 391
  end
  object cdsDetail: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 77
    Top = 213
  end
  object dsDetail2: TDataSource
    DataSet = cdsDetail2
    Left = 104
    Top = 392
  end
  object cdsDetail2: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    AfterPost = cdsDetail2AfterPost
    Params = <>
    Left = 72
    Top = 392
  end
  object PopupMenu2: TPopupMenu
    Left = 136
    Top = 392
    object N1: TMenuItem
      Caption = #21024#38500#25351#26631
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #25351#26631#23646#24615
      OnClick = N2Click
    end
  end
end
