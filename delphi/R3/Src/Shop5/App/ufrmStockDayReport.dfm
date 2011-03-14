inherited frmStockDayReport: TfrmStockDayReport
  Left = 198
  Top = 110
  Width = 1083
  Height = 622
  Caption = #21830#21697#36827#36135#25253#34920
  PixelsPerInch = 96
  TextHeight = 12
  inherited bgPanel: TRzPanel
    Width = 1075
    Height = 565
    inherited RzPanel2: TRzPanel
      Width = 1065
      Height = 555
      inherited RzPage: TRzPageControl
        Width = 860
        Height = 549
        ActivePage = TabSheet3
        Color = clCream
        ParentColor = False
        TabIndex = 2
        FixedDimension = 25
        inherited TabSheet1: TRzTabSheet
          Color = clCream
          Caption = #22320#21306#36827#36135#27719#24635#34920
          inherited RzPanel3: TRzPanel
            Width = 858
            Height = 522
            BorderColor = clBtnFace
            inherited Panel4: TPanel
              Width = 848
              Height = 512
              inherited w1: TRzPanel
                Width = 848
                Height = 87
                object RzLabel2: TRzLabel
                  Left = 24
                  Top = 14
                  Width = 48
                  Height = 12
                  Alignment = taRightJustify
                  Caption = #36827#36135#26085#26399
                end
                object RzLabel3: TRzLabel
                  Left = 171
                  Top = 14
                  Width = 12
                  Height = 12
                  Caption = #33267
                end
                object Label6: TLabel
                  Left = 288
                  Top = 36
                  Width = 48
                  Height = 12
                  Caption = #21830#21697#20998#31867
                end
                object Label7: TLabel
                  Left = 24
                  Top = 57
                  Width = 48
                  Height = 12
                  Caption = #21830#21697#25351#26631
                end
                object Label8: TLabel
                  Left = 288
                  Top = 57
                  Width = 48
                  Height = 12
                  Caption = #26174#31034#21333#20301
                end
                object Label5: TLabel
                  Left = 24
                  Top = 36
                  Width = 48
                  Height = 12
                  Caption = #38376#24215#32676#32452
                end
                object P1_D1: TcxDateEdit
                  Left = 80
                  Top = 10
                  Width = 85
                  Height = 20
                  Properties.DateButtons = [btnToday]
                  TabOrder = 0
                end
                object P1_D2: TcxDateEdit
                  Left = 187
                  Top = 10
                  Width = 86
                  Height = 20
                  Properties.DateButtons = [btnToday]
                  TabOrder = 1
                end
                object btnOk: TRzBitBtn
                  Left = 478
                  Top = 41
                  Width = 67
                  Height = 32
                  Action = actFind
                  Caption = #26597#35810
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
                  TabOrder = 2
                  TextStyle = tsRaised
                  ThemeAware = False
                  ImageIndex = 12
                  NumGlyphs = 2
                  Spacing = 5
                end
                object fndP1_TYPE_ID: TcxComboBox
                  Left = 80
                  Top = 53
                  Width = 73
                  Height = 20
                  Properties.DropDownListStyle = lsEditFixedList
                  Properties.Items.Strings = (
                    #20027#20379#24212#21830
                    #21697#29260#21517#31216)
                  TabOrder = 3
                end
                object fndP1_UNIT_ID: TcxComboBox
                  Left = 344
                  Top = 53
                  Width = 121
                  Height = 20
                  Properties.DropDownListStyle = lsEditFixedList
                  Properties.Items.Strings = (
                    #35745#37327#21333#20301
                    #21253#35013'1'
                    #21253#35013'2')
                  TabOrder = 4
                end
                object fndP1_STAT_ID: TzrComboBoxList
                  Tag = -1
                  Left = 154
                  Top = 53
                  Width = 119
                  Height = 20
                  Properties.AutoSelect = False
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 5
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
                    end
                    item
                      EditButtons = <>
                      FieldName = 'CODE_ID'
                      Footers = <>
                      Title.Caption = #20195#30721
                      Width = 20
                    end>
                  DropWidth = 185
                  DropHeight = 180
                  ShowTitle = True
                  AutoFitColWidth = True
                  ShowButton = True
                  LocateStyle = lsDark
                  Buttons = [zbClear]
                  DropListStyle = lsFixed
                  MultiSelect = False
                end
                object fndP1_SORT_ID: TcxButtonEdit
                  Left = 344
                  Top = 32
                  Width = 121
                  Height = 20
                  Properties.Buttons = <
                    item
                      Default = True
                      Kind = bkEllipsis
                    end>
                  Properties.ReadOnly = True
                  Properties.OnButtonClick = fndP1_SORT_IDPropertiesButtonClick
                  TabOrder = 6
                  OnKeyPress = fndP1_SORT_IDKeyPress
                end
                object fndP1_SHOP_TYPE: TcxComboBox
                  Left = 80
                  Top = 32
                  Width = 73
                  Height = 20
                  Properties.DropDownListStyle = lsEditFixedList
                  Properties.Items.Strings = (
                    #34892#25919#21306#22495
                    #31649#29702#32676#32452)
                  TabOrder = 7
                end
                object fndP1_SHOP_VALUE: TzrComboBoxList
                  Tag = -1
                  Left = 154
                  Top = 32
                  Width = 119
                  Height = 20
                  Properties.AutoSelect = False
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 8
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
                    end
                    item
                      EditButtons = <>
                      FieldName = 'CODE_ID'
                      Footers = <>
                      Title.Caption = #20195#30721
                      Width = 20
                    end>
                  DropWidth = 185
                  DropHeight = 180
                  ShowTitle = True
                  AutoFitColWidth = True
                  ShowButton = False
                  LocateStyle = lsDark
                  Buttons = [zbNew, zbClear, zbFind]
                  DropListStyle = lsFixed
                  MultiSelect = False
                end
              end
              inherited RzPanel7: TRzPanel
                Top = 87
                Width = 848
                Height = 425
                inherited DBGridEh1: TDBGridEh
                  Width = 844
                  Height = 421
                  FrozenCols = 3
                  TitleHeight = 22
                  UseMultiTitle = False
                  OnDblClick = DBGridEh1DblClick
                  Columns = <
                    item
                      Alignment = taCenter
                      EditButtons = <>
                      FieldName = 'SEQNO'
                      Footers = <>
                      Title.Caption = #24207#21495
                      Width = 30
                    end
                    item
                      EditButtons = <>
                      FieldName = 'REGION_ID'
                      Footers = <>
                      Title.Caption = #22320#21306#20195#30721
                      Width = 62
                    end
                    item
                      EditButtons = <>
                      FieldName = 'CODE_NAME'
                      Footers = <>
                      Title.Caption = #22320#21306#21517#31216
                      Width = 153
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'STOCK_AMT'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #36827#36135#25968#37327
                      Width = 60
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'STOCK_PRC'
                      Footers = <>
                      Title.Caption = #22343#20215
                      Width = 65
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'STOCK_TTL'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #36827#36135#37329#39069
                      Width = 84
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'STOCK_TAX'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #36827#39033#31246#39069
                      Width = 82
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'STOCK_MNY'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #26410#31246#37329#39069
                      Width = 76
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'STOCK_RTL'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #38646#21806#37329#39069
                      Width = 80
                    end
                    item
                      DisplayFormat = '#0.00%'
                      EditButtons = <>
                      FieldName = 'STOCK_RATE'
                      Footers = <>
                      Title.Caption = #25240#25187#29575
                      Width = 49
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'STOCK_AGO'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #35753#21033#37329#39069
                      Width = 80
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'AVG_AGIO'
                      Footers = <>
                      Title.Caption = #21333#20301#21033#28070
                      Width = 67
                    end>
                end
              end
            end
          end
        end
        object TabSheet2: TRzTabSheet
          Color = clCream
          Caption = #38376#24215#36827#36135#27719#24635#34920
          object RzPanel8: TRzPanel
            Left = 0
            Top = 0
            Width = 858
            Height = 522
            Align = alClient
            BorderOuter = fsNone
            BorderWidth = 5
            TabOrder = 0
            object Panel1: TPanel
              Left = 5
              Top = 5
              Width = 848
              Height = 512
              Align = alClient
              BevelOuter = bvNone
              Color = clWhite
              TabOrder = 0
              object RzPanel9: TRzPanel
                Left = 0
                Top = 0
                Width = 848
                Height = 87
                Align = alTop
                BorderOuter = fsGroove
                BorderSides = [sdLeft, sdTop, sdRight]
                Color = clWhite
                TabOrder = 0
                object RzLabel4: TRzLabel
                  Left = 24
                  Top = 14
                  Width = 48
                  Height = 12
                  Alignment = taRightJustify
                  Caption = #36827#36135#26085#26399
                end
                object RzLabel5: TRzLabel
                  Left = 170
                  Top = 14
                  Width = 12
                  Height = 12
                  Caption = #33267
                end
                object Label10: TLabel
                  Left = 24
                  Top = 35
                  Width = 48
                  Height = 12
                  Caption = #38376#24215#32676#32452
                end
                object Label13: TLabel
                  Left = 288
                  Top = 36
                  Width = 48
                  Height = 12
                  Caption = #21830#21697#20998#31867
                end
                object Label14: TLabel
                  Left = 24
                  Top = 56
                  Width = 48
                  Height = 12
                  Caption = #21830#21697#25351#26631
                end
                object Label15: TLabel
                  Left = 288
                  Top = 57
                  Width = 48
                  Height = 12
                  Caption = #26174#31034#21333#20301
                end
                object P2_D1: TcxDateEdit
                  Left = 80
                  Top = 10
                  Width = 85
                  Height = 20
                  Properties.DateButtons = [btnToday]
                  TabOrder = 0
                end
                object P2_D2: TcxDateEdit
                  Left = 186
                  Top = 10
                  Width = 87
                  Height = 20
                  Properties.DateButtons = [btnToday]
                  TabOrder = 1
                end
                object fndP2_SHOP_VALUE: TzrComboBoxList
                  Tag = -1
                  Left = 154
                  Top = 31
                  Width = 119
                  Height = 20
                  Properties.AutoSelect = False
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 2
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
                    end
                    item
                      EditButtons = <>
                      FieldName = 'CODE_ID'
                      Footers = <>
                      Title.Caption = #20195#30721
                      Width = 20
                    end>
                  DropWidth = 185
                  DropHeight = 180
                  ShowTitle = True
                  AutoFitColWidth = True
                  ShowButton = False
                  LocateStyle = lsDark
                  Buttons = [zbNew, zbClear, zbFind]
                  DropListStyle = lsFixed
                  MultiSelect = False
                end
                object RzBitBtn1: TRzBitBtn
                  Left = 478
                  Top = 41
                  Width = 67
                  Height = 32
                  Action = actFind
                  Caption = #26597#35810
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
                  TabOrder = 3
                  TextStyle = tsRaised
                  ThemeAware = False
                  ImageIndex = 12
                  NumGlyphs = 2
                  Spacing = 5
                end
                object fndP2_TYPE_ID: TcxComboBox
                  Left = 80
                  Top = 52
                  Width = 73
                  Height = 20
                  Properties.DropDownListStyle = lsEditFixedList
                  TabOrder = 4
                end
                object fndP2_UNIT_ID: TcxComboBox
                  Left = 344
                  Top = 53
                  Width = 121
                  Height = 20
                  Properties.DropDownListStyle = lsEditFixedList
                  Properties.Items.Strings = (
                    #35745#37327#21333#20301
                    #21253#35013'1'
                    #21253#35013'2')
                  TabOrder = 5
                end
                object fndP2_STAT_ID: TzrComboBoxList
                  Tag = -1
                  Left = 154
                  Top = 52
                  Width = 119
                  Height = 20
                  Properties.AutoSelect = False
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
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
                    end
                    item
                      EditButtons = <>
                      FieldName = 'CODE_ID'
                      Footers = <>
                      Title.Caption = #20195#30721
                      Width = 20
                    end>
                  DropWidth = 185
                  DropHeight = 180
                  ShowTitle = True
                  AutoFitColWidth = True
                  ShowButton = True
                  LocateStyle = lsDark
                  Buttons = [zbClear]
                  DropListStyle = lsFixed
                  MultiSelect = False
                end
                object fndP2_SORT_ID: TcxButtonEdit
                  Left = 344
                  Top = 32
                  Width = 121
                  Height = 20
                  Properties.Buttons = <
                    item
                      Default = True
                      Kind = bkEllipsis
                    end>
                  Properties.ReadOnly = True
                  Properties.OnButtonClick = fndP2_SORT_IDPropertiesButtonClick
                  TabOrder = 7
                  OnKeyPress = fndP2_SORT_IDKeyPress
                end
                object fndP2_SHOP_TYPE: TcxComboBox
                  Left = 80
                  Top = 31
                  Width = 73
                  Height = 20
                  Properties.DropDownListStyle = lsEditFixedList
                  Properties.Items.Strings = (
                    #34892#25919#21306#22495
                    #31649#29702#32676#32452)
                  TabOrder = 8
                end
              end
              object RzPanel10: TRzPanel
                Left = 0
                Top = 87
                Width = 848
                Height = 425
                Align = alClient
                BorderOuter = fsGroove
                Color = clWhite
                TabOrder = 1
                object DBGridEh2: TDBGridEh
                  Left = 2
                  Top = 2
                  Width = 844
                  Height = 421
                  Align = alClient
                  AllowedOperations = []
                  BorderStyle = bsNone
                  Color = clWhite
                  Ctl3D = True
                  DataSource = dsadoReport2
                  Flat = True
                  Font.Charset = GB2312_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = #23435#20307
                  Font.Style = []
                  FooterColor = clWhite
                  FooterFont.Charset = GB2312_CHARSET
                  FooterFont.Color = clWindowText
                  FooterFont.Height = -12
                  FooterFont.Name = #23435#20307
                  FooterFont.Style = []
                  FooterRowCount = 1
                  FrozenCols = 3
                  ImeName = #26497#21697#20116#31508#36755#20837#27861
                  Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                  OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection]
                  ParentCtl3D = False
                  ParentFont = False
                  ReadOnly = True
                  RowHeight = 20
                  SumList.Active = True
                  TabOrder = 0
                  TitleFont.Charset = GB2312_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -12
                  TitleFont.Name = #23435#20307
                  TitleFont.Style = [fsBold]
                  TitleHeight = 22
                  IsDrawNullRow = False
                  CurrencySymbol = #65509
                  DecimalNumber = 2
                  DigitalNumber = 12
                  OnDblClick = DBGridEh2DblClick
                  OnDrawColumnCell = DBGridEh1DrawColumnCell
                  OnGetCellParams = DBGridEh1GetCellParams
                  Columns = <
                    item
                      Alignment = taCenter
                      EditButtons = <>
                      FieldName = 'SEQNO'
                      Footers = <>
                      Title.Caption = #24207#21495
                      Width = 30
                    end
                    item
                      EditButtons = <>
                      FieldName = 'SHOP_CODE'
                      Footers = <>
                      Title.Caption = #38376#24215#20195#30721
                      Width = 59
                    end
                    item
                      EditButtons = <>
                      FieldName = 'SHOP_NAME'
                      Footers = <>
                      Title.Caption = #38376#24215#21517#31216
                      Width = 146
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'STOCK_AMT'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #36827#36135#25968#37327
                      Width = 63
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'STOCK_PRC'
                      Footers = <>
                      Title.Caption = #22343#20215
                      Width = 65
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'STOCK_TTL'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #36827#36135#37329#39069
                      Width = 84
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'STOCK_TAX'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #36827#39033#31246#39069
                      Width = 82
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'STOCK_MNY'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #26410#31246#37329#39069
                      Width = 76
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'STOCK_RTL'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #38646#21806#37329#39069
                      Width = 80
                    end
                    item
                      DisplayFormat = '#0.00%'
                      EditButtons = <>
                      FieldName = 'STOCK_RATE'
                      Footers = <>
                      Title.Caption = #25240#25187#29575
                      Width = 49
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'STOCK_AGO'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #35753#21033#37329#39069
                      Width = 80
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'AVG_AGIO'
                      Footers = <>
                      Title.Caption = #21333#20301#21033#28070
                      Width = 67
                    end>
                end
              end
            end
          end
        end
        object TabSheet3: TRzTabSheet
          Color = clCream
          Caption = #20998#31867#36827#36135#27719#24635#34920
          object RzPanel6: TRzPanel
            Left = 0
            Top = 0
            Width = 858
            Height = 522
            Align = alClient
            BorderOuter = fsNone
            BorderWidth = 5
            TabOrder = 0
            object Panel3: TPanel
              Left = 5
              Top = 5
              Width = 848
              Height = 512
              Align = alClient
              BevelOuter = bvNone
              Color = clWhite
              TabOrder = 0
              object RzPanel11: TRzPanel
                Left = 0
                Top = 0
                Width = 848
                Height = 89
                Align = alTop
                BorderOuter = fsGroove
                BorderSides = [sdLeft, sdTop, sdRight]
                Color = clWhite
                TabOrder = 0
                object RzLabel6: TRzLabel
                  Left = 24
                  Top = 14
                  Width = 48
                  Height = 12
                  Alignment = taRightJustify
                  Caption = #36827#36135#26085#26399
                end
                object RzLabel7: TRzLabel
                  Left = 170
                  Top = 14
                  Width = 12
                  Height = 12
                  Caption = #33267
                end
                object Label9: TLabel
                  Left = 24
                  Top = 58
                  Width = 48
                  Height = 12
                  Caption = #38376#24215#21517#31216
                end
                object Label19: TLabel
                  Left = 288
                  Top = 36
                  Width = 48
                  Height = 12
                  Caption = #25253#34920#31867#22411
                end
                object Label20: TLabel
                  Left = 288
                  Top = 58
                  Width = 48
                  Height = 12
                  Caption = #26174#31034#21333#20301
                end
                object Label11: TLabel
                  Left = 24
                  Top = 36
                  Width = 48
                  Height = 12
                  Caption = #38376#24215#32676#32452
                end
                object P3_D1: TcxDateEdit
                  Left = 80
                  Top = 10
                  Width = 85
                  Height = 20
                  Properties.DateButtons = [btnToday]
                  TabOrder = 0
                end
                object P3_D2: TcxDateEdit
                  Left = 186
                  Top = 10
                  Width = 87
                  Height = 20
                  Properties.DateButtons = [btnToday]
                  TabOrder = 1
                end
                object RzBitBtn2: TRzBitBtn
                  Left = 486
                  Top = 40
                  Width = 67
                  Height = 32
                  Action = actFind
                  Caption = #26597#35810
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
                  TabOrder = 2
                  TextStyle = tsRaised
                  ThemeAware = False
                  ImageIndex = 12
                  NumGlyphs = 2
                  Spacing = 5
                end
                object fndP3_SHOP_ID: TzrComboBoxList
                  Tag = -1
                  Left = 80
                  Top = 54
                  Width = 193
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
                  FilterFields = 'SHOP_ID;SHOP_NAME;SHOP_SPELL;SEQ_NO'
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
                      Title.Caption = #20195#30721
                      Width = 20
                    end>
                  DropWidth = 185
                  DropHeight = 180
                  ShowTitle = True
                  AutoFitColWidth = True
                  ShowButton = True
                  LocateStyle = lsDark
                  Buttons = [zbClear]
                  DropListStyle = lsFixed
                  MultiSelect = False
                end
                object fndP3_REPORT_FLAG: TcxComboBox
                  Left = 344
                  Top = 32
                  Width = 121
                  Height = 20
                  Properties.DropDownListStyle = lsEditFixedList
                  Properties.OnChange = fndP3_REPORT_FLAGPropertiesChange
                  TabOrder = 4
                end
                object fndP3_UNIT_ID: TcxComboBox
                  Left = 344
                  Top = 54
                  Width = 121
                  Height = 20
                  Properties.DropDownListStyle = lsEditFixedList
                  Properties.Items.Strings = (
                    #35745#37327#21333#20301
                    #21253#35013'1'
                    #21253#35013'2')
                  TabOrder = 5
                end
                object fndP3_SHOP_VALUE: TzrComboBoxList
                  Tag = -1
                  Left = 154
                  Top = 32
                  Width = 119
                  Height = 20
                  Properties.AutoSelect = False
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
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
                    end
                    item
                      EditButtons = <>
                      FieldName = 'CODE_ID'
                      Footers = <>
                      Title.Caption = #20195#30721
                      Width = 20
                    end>
                  DropWidth = 185
                  DropHeight = 180
                  ShowTitle = True
                  AutoFitColWidth = True
                  ShowButton = False
                  LocateStyle = lsDark
                  Buttons = [zbNew, zbClear, zbFind]
                  DropListStyle = lsFixed
                  MultiSelect = False
                end
                object fndP3_SHOP_TYPE: TcxComboBox
                  Left = 80
                  Top = 32
                  Width = 73
                  Height = 20
                  Properties.DropDownListStyle = lsEditFixedList
                  Properties.Items.Strings = (
                    #34892#25919#21306#22495
                    #31649#29702#32676#32452)
                  TabOrder = 7
                end
              end
              object RzPanel12: TRzPanel
                Left = 0
                Top = 89
                Width = 848
                Height = 423
                Align = alClient
                BorderOuter = fsGroove
                Color = clWhite
                TabOrder = 1
                object DBGridEh3: TDBGridEh
                  Tag = 1
                  Left = 2
                  Top = 2
                  Width = 844
                  Height = 419
                  Align = alClient
                  AllowedOperations = []
                  BorderStyle = bsNone
                  Color = clWhite
                  Ctl3D = True
                  DataSource = dsadoReport3
                  Flat = True
                  Font.Charset = GB2312_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = #23435#20307
                  Font.Style = []
                  FooterColor = clWhite
                  FooterFont.Charset = GB2312_CHARSET
                  FooterFont.Color = clWindowText
                  FooterFont.Height = -12
                  FooterFont.Name = #23435#20307
                  FooterFont.Style = []
                  FooterRowCount = 1
                  FrozenCols = 3
                  ImeName = #26497#21697#20116#31508#36755#20837#27861
                  Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                  OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection]
                  ParentCtl3D = False
                  ParentFont = False
                  ReadOnly = True
                  RowHeight = 20
                  SumList.Active = True
                  TabOrder = 0
                  TitleFont.Charset = GB2312_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -12
                  TitleFont.Name = #23435#20307
                  TitleFont.Style = [fsBold]
                  TitleHeight = 22
                  IsDrawNullRow = False
                  CurrencySymbol = #65509
                  DecimalNumber = 2
                  DigitalNumber = 12
                  OnDblClick = DBGridEh3DblClick
                  OnDrawColumnCell = DBGridEh1DrawColumnCell
                  OnGetCellParams = DBGridEh1GetCellParams
                  Columns = <
                    item
                      Alignment = taCenter
                      EditButtons = <>
                      FieldName = 'SEQNO'
                      Footers = <>
                      Title.Caption = #24207#21495
                      Width = 30
                    end
                    item
                      EditButtons = <>
                      FieldName = 'SORT_ID'
                      Footers = <>
                      Title.Caption = #20998#31867#20195#30721
                      Width = 62
                    end
                    item
                      EditButtons = <>
                      FieldName = 'SORT_NAME'
                      Footers = <>
                      Title.Caption = #20998#31867#21517#31216
                      Width = 171
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'STOCK_AMT'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #36827#36135#25968#37327
                      Width = 63
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'STOCK_PRC'
                      Footers = <>
                      Title.Caption = #22343#20215
                      Width = 65
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'STOCK_TTL'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #36827#36135#37329#39069
                      Width = 84
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'STOCK_TAX'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #36827#39033#31246#39069
                      Width = 82
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'STOCK_MNY'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #26410#31246#37329#39069
                      Width = 76
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'STOCK_RTL'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #38646#21806#37329#39069
                      Width = 80
                    end
                    item
                      DisplayFormat = '#0.00%'
                      EditButtons = <>
                      FieldName = 'STOCK_RATE'
                      Footers = <>
                      Title.Caption = #25240#25187#29575
                      Width = 49
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'STOCK_AGO'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #35753#21033#37329#39069
                      Width = 80
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'AVG_AGIO'
                      Footers = <>
                      Title.Caption = #21333#20301#21033#28070
                      Width = 67
                    end>
                end
              end
            end
          end
        end
        object TabSheet4: TRzTabSheet
          Color = clCream
          Caption = #21830#21697#36827#36135#27719#24635#34920
          object RzPanel13: TRzPanel
            Left = 0
            Top = 0
            Width = 858
            Height = 522
            Align = alClient
            BorderOuter = fsNone
            BorderWidth = 5
            TabOrder = 0
            object Panel6: TPanel
              Left = 5
              Top = 5
              Width = 848
              Height = 512
              Align = alClient
              BevelOuter = bvNone
              Color = clWhite
              TabOrder = 0
              object RzPanel14: TRzPanel
                Left = 0
                Top = 0
                Width = 848
                Height = 108
                Align = alTop
                BorderOuter = fsGroove
                BorderSides = [sdLeft, sdTop, sdRight]
                Color = clWhite
                TabOrder = 0
                object RzLabel8: TRzLabel
                  Left = 24
                  Top = 14
                  Width = 48
                  Height = 12
                  Alignment = taRightJustify
                  Caption = #36827#36135#26085#26399
                end
                object RzLabel9: TRzLabel
                  Left = 171
                  Top = 14
                  Width = 12
                  Height = 12
                  Caption = #33267
                end
                object Label21: TLabel
                  Left = 24
                  Top = 57
                  Width = 48
                  Height = 12
                  Caption = #38376#24215#21517#31216
                end
                object Label24: TLabel
                  Left = 288
                  Top = 56
                  Width = 48
                  Height = 12
                  Caption = #21830#21697#20998#31867
                end
                object Label25: TLabel
                  Left = 24
                  Top = 79
                  Width = 48
                  Height = 12
                  Caption = #21830#21697#25351#26631
                end
                object Label26: TLabel
                  Left = 288
                  Top = 80
                  Width = 48
                  Height = 12
                  Caption = #26174#31034#21333#20301
                end
                object Label12: TLabel
                  Left = 24
                  Top = 35
                  Width = 48
                  Height = 12
                  Caption = #38376#24215#32676#32452
                end
                object P4_D1: TcxDateEdit
                  Left = 80
                  Top = 10
                  Width = 85
                  Height = 20
                  Properties.DateButtons = [btnToday]
                  TabOrder = 0
                end
                object P4_D2: TcxDateEdit
                  Left = 187
                  Top = 10
                  Width = 86
                  Height = 20
                  Properties.DateButtons = [btnToday]
                  TabOrder = 1
                end
                object RzBitBtn3: TRzBitBtn
                  Left = 478
                  Top = 64
                  Width = 67
                  Height = 32
                  Action = actFind
                  Caption = #26597#35810
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
                  TabOrder = 2
                  TextStyle = tsRaised
                  ThemeAware = False
                  ImageIndex = 12
                  NumGlyphs = 2
                  Spacing = 5
                end
                object fndP4_TYPE_ID: TcxComboBox
                  Left = 80
                  Top = 76
                  Width = 73
                  Height = 20
                  Properties.DropDownListStyle = lsEditFixedList
                  TabOrder = 3
                end
                object fndP4_UNIT_ID: TcxComboBox
                  Left = 344
                  Top = 76
                  Width = 121
                  Height = 20
                  Properties.DropDownListStyle = lsEditFixedList
                  Properties.Items.Strings = (
                    #35745#37327#21333#20301
                    #21253#35013'1'
                    #21253#35013'2')
                  TabOrder = 4
                end
                object fndP4_STAT_ID: TzrComboBoxList
                  Tag = -1
                  Left = 154
                  Top = 76
                  Width = 119
                  Height = 20
                  Properties.AutoSelect = False
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 5
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
                    end
                    item
                      EditButtons = <>
                      FieldName = 'CODE_ID'
                      Footers = <>
                      Title.Caption = #20195#30721
                      Width = 20
                    end>
                  DropWidth = 185
                  DropHeight = 180
                  ShowTitle = True
                  AutoFitColWidth = True
                  ShowButton = True
                  LocateStyle = lsDark
                  Buttons = [zbClear]
                  DropListStyle = lsFixed
                  MultiSelect = False
                end
                object fndP4_SORT_ID: TcxButtonEdit
                  Left = 344
                  Top = 52
                  Width = 121
                  Height = 20
                  Properties.Buttons = <
                    item
                      Default = True
                      Kind = bkEllipsis
                    end>
                  Properties.ReadOnly = True
                  Properties.OnButtonClick = fndP4_SORT_IDPropertiesButtonClick
                  TabOrder = 6
                  OnKeyPress = fndP4_SORT_IDKeyPress
                end
                object fndP4_SHOP_ID: TzrComboBoxList
                  Tag = -1
                  Left = 80
                  Top = 54
                  Width = 193
                  Height = 20
                  Properties.AutoSelect = False
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 7
                  InGrid = False
                  KeyValue = Null
                  FilterFields = 'SHOP_ID;SHOP_NAME;SHOP_SPELL;SEQ_NO'
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
                      Title.Caption = #20195#30721
                      Width = 20
                    end>
                  DropWidth = 185
                  DropHeight = 180
                  ShowTitle = True
                  AutoFitColWidth = True
                  ShowButton = True
                  LocateStyle = lsDark
                  Buttons = [zbClear]
                  DropListStyle = lsFixed
                  MultiSelect = False
                end
                object fndP4_SHOP_VALUE: TzrComboBoxList
                  Tag = -1
                  Left = 154
                  Top = 32
                  Width = 119
                  Height = 20
                  Properties.AutoSelect = False
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 8
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
                    end
                    item
                      EditButtons = <>
                      FieldName = 'CODE_ID'
                      Footers = <>
                      Title.Caption = #20195#30721
                      Width = 20
                    end>
                  DropWidth = 185
                  DropHeight = 180
                  ShowTitle = True
                  AutoFitColWidth = True
                  ShowButton = False
                  LocateStyle = lsDark
                  Buttons = [zbNew, zbClear, zbFind]
                  DropListStyle = lsFixed
                  MultiSelect = False
                end
                object fndP4_SHOP_TYPE: TcxComboBox
                  Left = 80
                  Top = 32
                  Width = 73
                  Height = 20
                  Properties.DropDownListStyle = lsEditFixedList
                  Properties.Items.Strings = (
                    #34892#25919#21306#22495
                    #31649#29702#32676#32452)
                  TabOrder = 9
                end
              end
              object RzPanel15: TRzPanel
                Left = 0
                Top = 108
                Width = 848
                Height = 404
                Align = alClient
                BorderOuter = fsGroove
                Color = clWhite
                TabOrder = 1
                object DBGridEh4: TDBGridEh
                  Left = 2
                  Top = 2
                  Width = 844
                  Height = 400
                  Align = alClient
                  AllowedOperations = []
                  BorderStyle = bsNone
                  Color = clWhite
                  Ctl3D = True
                  DataSource = dsadoReport4
                  Flat = True
                  Font.Charset = GB2312_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = #23435#20307
                  Font.Style = []
                  FooterColor = clWhite
                  FooterFont.Charset = GB2312_CHARSET
                  FooterFont.Color = clWindowText
                  FooterFont.Height = -12
                  FooterFont.Name = #23435#20307
                  FooterFont.Style = []
                  FooterRowCount = 1
                  FrozenCols = 3
                  ImeName = #26497#21697#20116#31508#36755#20837#27861
                  Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                  OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection]
                  ParentCtl3D = False
                  ParentFont = False
                  ReadOnly = True
                  RowHeight = 20
                  SumList.Active = True
                  TabOrder = 0
                  TitleFont.Charset = GB2312_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -12
                  TitleFont.Name = #23435#20307
                  TitleFont.Style = [fsBold]
                  TitleHeight = 22
                  IsDrawNullRow = False
                  CurrencySymbol = #65509
                  DecimalNumber = 2
                  DigitalNumber = 12
                  OnDblClick = DBGridEh4DblClick
                  OnDrawColumnCell = DBGridEh1DrawColumnCell
                  OnGetCellParams = DBGridEh1GetCellParams
                  Columns = <
                    item
                      Alignment = taCenter
                      EditButtons = <>
                      FieldName = 'SEQNO'
                      Footers = <>
                      Title.Caption = #24207#21495
                      Width = 30
                    end
                    item
                      EditButtons = <>
                      FieldName = 'BARCODE'
                      Footers = <>
                      Title.Caption = #26465#30721
                      Width = 95
                    end
                    item
                      EditButtons = <>
                      FieldName = 'GODS_NAME'
                      Footers = <>
                      Title.Caption = #21830#21697#21517#31216
                      Width = 153
                    end
                    item
                      EditButtons = <>
                      FieldName = 'GODS_CODE'
                      Footers = <>
                      Title.Caption = #36135#21495
                      Width = 62
                    end
                    item
                      EditButtons = <>
                      FieldName = 'UNIT_NAME'
                      Footers = <>
                      Title.Caption = #21333#20301
                      Width = 35
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'STOCK_AMT'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #36827#36135#25968#37327
                      Width = 63
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'STOCK_PRC'
                      Footers = <>
                      Title.Caption = #22343#20215
                      Width = 65
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'STOCK_TTL'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #36827#36135#37329#39069
                      Width = 84
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'STOCK_TAX'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #36827#39033#31246#39069
                      Width = 82
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'STOCK_MNY'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #26410#31246#37329#39069
                      Width = 76
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'STOCK_RTL'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #38646#21806#37329#39069
                      Width = 80
                    end
                    item
                      DisplayFormat = '#0.00%'
                      EditButtons = <>
                      FieldName = 'STOCK_RATE'
                      Footers = <>
                      Title.Caption = #25240#25187#29575
                      Width = 49
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'STOCK_AGO'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #35753#21033#37329#39069
                      Width = 80
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'AVG_AGIO'
                      Footers = <>
                      Title.Caption = #21333#20301#21033#28070
                      Width = 67
                    end>
                end
              end
            end
          end
        end
        object TabSheet5: TRzTabSheet
          Color = clCream
          Caption = #36827#36135#21830#21697#26126#32454#34920
          object RzPanel16: TRzPanel
            Left = 0
            Top = 0
            Width = 858
            Height = 522
            Align = alClient
            BorderOuter = fsNone
            BorderWidth = 5
            TabOrder = 0
            object Panel7: TPanel
              Left = 5
              Top = 5
              Width = 848
              Height = 512
              Align = alClient
              BevelOuter = bvNone
              Color = clWhite
              TabOrder = 0
              object RzPanel17: TRzPanel
                Left = 0
                Top = 0
                Width = 848
                Height = 102
                Align = alTop
                BorderOuter = fsGroove
                BorderSides = [sdLeft, sdTop, sdRight]
                Color = clWhite
                TabOrder = 0
                object RzLabel10: TRzLabel
                  Left = 24
                  Top = 14
                  Width = 48
                  Height = 12
                  Alignment = taRightJustify
                  Caption = #36827#36135#26085#26399
                end
                object RzLabel11: TRzLabel
                  Left = 167
                  Top = 14
                  Width = 12
                  Height = 12
                  Caption = #33267
                end
                object Label17: TLabel
                  Left = 282
                  Top = 57
                  Width = 48
                  Height = 12
                  Caption = #38376#24215#21517#31216
                end
                object Label18: TLabel
                  Left = 282
                  Top = 80
                  Width = 48
                  Height = 12
                  Caption = #21830#21697#20998#31867
                end
                object Label22: TLabel
                  Left = 24
                  Top = 57
                  Width = 48
                  Height = 12
                  Caption = #21830#21697#25351#26631
                end
                object Label23: TLabel
                  Left = 568
                  Top = 16
                  Width = 48
                  Height = 12
                  Caption = #26174#31034#21333#20301
                  Visible = False
                end
                object Label28: TLabel
                  Left = 24
                  Top = 35
                  Width = 48
                  Height = 12
                  Caption = #38376#24215#32676#32452
                end
                object Label29: TLabel
                  Left = 24
                  Top = 83
                  Width = 48
                  Height = 12
                  Caption = #21333#25454#31867#22411
                end
                object P5_D1: TcxDateEdit
                  Left = 80
                  Top = 10
                  Width = 83
                  Height = 20
                  Properties.DateButtons = [btnToday]
                  TabOrder = 0
                  EditValue = 0d
                end
                object RzBitBtn4: TRzBitBtn
                  Left = 470
                  Top = 61
                  Width = 72
                  Height = 32
                  Action = actFind
                  Caption = #26597#35810
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
                  TabOrder = 2
                  TextStyle = tsRaised
                  ThemeAware = False
                  ImageIndex = 12
                  NumGlyphs = 2
                  Spacing = 5
                end
                object P5_D2: TcxDateEdit
                  Left = 183
                  Top = 10
                  Width = 90
                  Height = 20
                  Properties.DateButtons = [btnToday]
                  TabOrder = 1
                end
                object fndP5_TYPE_ID: TcxComboBox
                  Left = 80
                  Top = 54
                  Width = 73
                  Height = 20
                  Properties.DropDownListStyle = lsEditFixedList
                  TabOrder = 3
                end
                object fndP5_UNIT_ID: TcxComboBox
                  Left = 624
                  Top = 12
                  Width = 121
                  Height = 20
                  Properties.DropDownListStyle = lsEditFixedList
                  Properties.Items.Strings = (
                    #35745#37327#21333#20301
                    #21253#35013'1'
                    #21253#35013'2')
                  TabOrder = 4
                  Visible = False
                end
                object fndP5_STAT_ID: TzrComboBoxList
                  Tag = -1
                  Left = 154
                  Top = 54
                  Width = 119
                  Height = 20
                  Properties.AutoSelect = False
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 5
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
                    end
                    item
                      EditButtons = <>
                      FieldName = 'CODE_ID'
                      Footers = <>
                      Title.Caption = #20195#30721
                      Width = 20
                    end>
                  DropWidth = 185
                  DropHeight = 180
                  ShowTitle = True
                  AutoFitColWidth = True
                  ShowButton = True
                  LocateStyle = lsDark
                  Buttons = [zbClear]
                  DropListStyle = lsFixed
                  MultiSelect = False
                end
                object fndP5_SORT_ID: TcxButtonEdit
                  Left = 335
                  Top = 74
                  Width = 125
                  Height = 20
                  Properties.Buttons = <
                    item
                      Default = True
                      Kind = bkEllipsis
                    end>
                  Properties.ReadOnly = True
                  Properties.OnButtonClick = fndP5_SORT_IDPropertiesButtonClick
                  TabOrder = 6
                  OnKeyPress = fndP4_SORT_IDKeyPress
                end
                object fndP5_SHOP_ID: TzrComboBoxList
                  Tag = -1
                  Left = 334
                  Top = 52
                  Width = 126
                  Height = 20
                  Properties.AutoSelect = False
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 7
                  InGrid = False
                  KeyValue = Null
                  FilterFields = 'SHOP_ID;SHOP_NAME;SHOP_SPELL;SEQ_NO'
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
                      Title.Caption = #20195#30721
                      Width = 20
                    end>
                  DropWidth = 185
                  DropHeight = 180
                  ShowTitle = True
                  AutoFitColWidth = True
                  ShowButton = True
                  LocateStyle = lsDark
                  Buttons = [zbClear]
                  DropListStyle = lsFixed
                  MultiSelect = False
                end
                object fndP5_SHOP_VALUE: TzrComboBoxList
                  Tag = -1
                  Left = 154
                  Top = 32
                  Width = 119
                  Height = 20
                  Properties.AutoSelect = False
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 8
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
                    end
                    item
                      EditButtons = <>
                      FieldName = 'CODE_ID'
                      Footers = <>
                      Title.Caption = #20195#30721
                      Width = 20
                    end>
                  DropWidth = 185
                  DropHeight = 180
                  ShowTitle = True
                  AutoFitColWidth = True
                  ShowButton = False
                  LocateStyle = lsDark
                  Buttons = [zbNew, zbClear, zbFind]
                  DropListStyle = lsFixed
                  MultiSelect = False
                end
                object fndP5_SHOP_TYPE: TcxComboBox
                  Left = 80
                  Top = 32
                  Width = 73
                  Height = 20
                  Properties.DropDownListStyle = lsEditFixedList
                  Properties.Items.Strings = (
                    #34892#25919#21306#22495
                    #31649#29702#32676#32452)
                  TabOrder = 9
                end
                object fndP5_ALL: TcxRadioButton
                  Left = 80
                  Top = 81
                  Width = 57
                  Height = 17
                  Caption = #20840#37096
                  Checked = True
                  TabOrder = 10
                  TabStop = True
                end
                object fndP5_InStock: TcxRadioButton
                  Left = 136
                  Top = 81
                  Width = 57
                  Height = 17
                  Caption = #36827#36135#21333
                  TabOrder = 11
                end
                object fndP5_ReturnStock: TcxRadioButton
                  Left = 208
                  Top = 81
                  Width = 57
                  Height = 17
                  Caption = #36864#36135#21333
                  TabOrder = 12
                end
              end
              object RzPanel18: TRzPanel
                Left = 0
                Top = 102
                Width = 848
                Height = 410
                Align = alClient
                BorderOuter = fsGroove
                Color = clWhite
                TabOrder = 1
                object DBGridEh5: TDBGridEh
                  Left = 2
                  Top = 2
                  Width = 844
                  Height = 406
                  Align = alClient
                  AllowedOperations = []
                  BorderStyle = bsNone
                  Color = clWhite
                  Ctl3D = True
                  DataSource = dsadoReport5
                  Flat = True
                  Font.Charset = GB2312_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = #23435#20307
                  Font.Style = []
                  FooterColor = clWhite
                  FooterFont.Charset = GB2312_CHARSET
                  FooterFont.Color = clWindowText
                  FooterFont.Height = -12
                  FooterFont.Name = #23435#20307
                  FooterFont.Style = []
                  FooterRowCount = 1
                  FrozenCols = 3
                  ImeName = #26497#21697#20116#31508#36755#20837#27861
                  Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                  OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection]
                  ParentCtl3D = False
                  ParentFont = False
                  ReadOnly = True
                  RowHeight = 20
                  SumList.Active = True
                  TabOrder = 0
                  TitleFont.Charset = GB2312_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -12
                  TitleFont.Name = #23435#20307
                  TitleFont.Style = [fsBold]
                  TitleHeight = 22
                  IsDrawNullRow = False
                  CurrencySymbol = #65509
                  DecimalNumber = 2
                  DigitalNumber = 12
                  OnDblClick = DBGridEh4DblClick
                  OnDrawColumnCell = DBGridEh1DrawColumnCell
                  OnGetCellParams = DBGridEh1GetCellParams
                  Columns = <
                    item
                      Alignment = taCenter
                      EditButtons = <>
                      FieldName = 'SEQNO'
                      Footers = <>
                      Title.Caption = #24207#21495
                      Width = 30
                    end
                    item
                      EditButtons = <>
                      FieldName = 'STOCK_DATE'
                      Footers = <>
                      Title.Caption = #26085#26399
                    end
                    item
                      EditButtons = <>
                      FieldName = 'GLIDE_NO'
                      Footers = <>
                      Title.Caption = #21333#21495
                      Width = 80
                    end
                    item
                      EditButtons = <>
                      FieldName = 'CLIENT_NAME'
                      Footers = <>
                      Title.Caption = #20379#24212#21830#21517#31216
                      Width = 134
                    end
                    item
                      EditButtons = <>
                      FieldName = 'BARCODE'
                      Footers = <>
                      Title.Caption = #26465#30721
                      Width = 95
                    end
                    item
                      EditButtons = <>
                      FieldName = 'GODS_NAME'
                      Footers = <>
                      Title.Caption = #21830#21697#21517#31216
                      Width = 153
                    end
                    item
                      EditButtons = <>
                      FieldName = 'GODS_CODE'
                      Footers = <>
                      Title.Caption = #36135#21495
                      Width = 62
                    end
                    item
                      EditButtons = <>
                      FieldName = 'UNIT_NAME'
                      Footers = <>
                      Title.Caption = #21333#20301
                      Width = 31
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'AMOUNT'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #36827#36135#25968#37327
                      Width = 63
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'APRICE'
                      Footers = <>
                      Title.Caption = #21333#20215
                      Width = 55
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'CALC_MONEY'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #36827#36135#37329#39069
                      Width = 84
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'TAX_MONEY'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #36827#39033#31246#39069
                      Width = 82
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'NOTAX_MONEY'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #26410#31246#37329#39069
                      Width = 76
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'RTL_MONEY'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #38646#21806#37329#39069
                      Width = 80
                    end
                    item
                      DisplayFormat = '#0.00%'
                      EditButtons = <>
                      FieldName = 'AGIO_RATE'
                      Footers = <>
                      Title.Caption = #25240#25187#29575
                      Width = 49
                    end
                    item
                      DisplayFormat = '#0.00'
                      EditButtons = <>
                      FieldName = 'AGIO_MONEY'
                      Footer.DisplayFormat = '#0.00'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #35753#21033#37329#39069
                      Width = 80
                    end
                    item
                      EditButtons = <>
                      FieldName = 'BATCH_NO'
                      Footers = <>
                      Title.Caption = #25209#21495
                      Width = 73
                    end
                    item
                      EditButtons = <>
                      FieldName = 'LOCUS_NO'
                      Footers = <>
                      Title.Caption = #29289#27969#36319#36394#21495
                      Width = 74
                    end
                    item
                      EditButtons = <>
                      FieldName = 'IS_PRESENT'
                      Footers = <>
                      Title.Caption = #36192#21697
                      Width = 35
                    end
                    item
                      EditButtons = <>
                      FieldName = 'SHOP_NAME'
                      Footers = <>
                      Title.Caption = #36827#36135#38376#24215
                      Width = 82
                    end
                    item
                      EditButtons = <>
                      FieldName = 'GUIDE_USER_TEXT'
                      Footers = <>
                      Title.Caption = #39564#36135#21592
                      Width = 47
                    end
                    item
                      EditButtons = <>
                      FieldName = 'CREA_USER_TEXT'
                      Footers = <>
                      Title.Caption = #21046#21333#20154
                      Width = 46
                    end
                    item
                      EditButtons = <>
                      FieldName = 'CREA_DATE'
                      Footers = <>
                      Title.Caption = #21046#21333#26102#38388
                      Width = 111
                    end
                    item
                      EditButtons = <>
                      FieldName = 'STOCK_TYPE'
                      Footers = <>
                      Title.Caption = #21333#25454
                      Width = 50
                    end>
                end
              end
            end
          end
        end
      end
      inherited PanelColumnS: TPanel
        Left = 863
        Height = 549
        inherited Panel2: TPanel
          Height = 499
          inherited RzPanel1: TRzPanel [3]
          end
          inherited Panel5: TPanel [4]
            Height = 384
            inherited rzShowColumns: TRzCheckList
              Height = 380
            end
          end
        end
      end
    end
  end
  inherited RzPanel4: TRzPanel
    Width = 1075
    inherited Image1: TImage
      Width = 560
    end
    inherited Image14: TImage
      Left = 1066
    end
    inherited Image3: TImage
      Width = 560
    end
    inherited rzPanel5: TPanel
      inherited lblToolCaption: TRzLabel
        Width = 72
        Caption = #21830#21697#36827#36135#25253#34920
      end
    end
  end
  inherited mmMenu: TMainMenu
    Left = 136
    Top = 448
  end
  inherited actList: TActionList
    Left = 168
    Top = 448
    inherited actFind: TAction
      OnExecute = actFindExecute
    end
  end
  inherited dsadoReport1: TDataSource
    Left = 41
    Top = 354
  end
  inherited PrintDBGridEh1: TPrintDBGridEh
    PageHeader.CenterText.Strings = (
      #36827#36135#27719#24635#34920)
    PageHeader.Font.Charset = GB2312_CHARSET
    PageHeader.Font.Height = -16
    PageHeader.Font.Name = #23435#20307
    PageHeader.Font.Style = [fsBold]
    BeforeGridText_Data = {
      7B5C727466315C616E73695C616E73696370673933365C64656666305C646566
      6C616E67313033335C6465666C616E676665323035327B5C666F6E7474626C7B
      5C66305C666E696C5C6663686172736574313334205C2763625C2763655C2763
      635C2765353B7D7B5C66315C666E696C5C6663686172736574313334204D5320
      53616E732053657269663B7D7D0D0A5C766965776B696E64345C7563315C7061
      72645C71725C6C616E67323035325C66305C6673323420255B7768725D5C6631
      5C66733136200D0A5C706172207D0D0A00}
  end
  inherited adoReport1: TZQuery
    Left = 41
    Top = 321
  end
  object dsadoReport2: TDataSource
    DataSet = adoReport2
    Left = 89
    Top = 354
  end
  object dsadoReport3: TDataSource
    DataSet = adoReport3
    Left = 137
    Top = 354
  end
  object dsadoReport4: TDataSource
    DataSet = adoReport4
    Left = 185
    Top = 354
  end
  object dsadoReport5: TDataSource
    DataSet = adoReport5
    Left = 233
    Top = 354
  end
  object adoReport2: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 89
    Top = 321
  end
  object adoReport5: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 233
    Top = 321
  end
  object adoReport3: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 137
    Top = 321
  end
  object adoReport4: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 185
    Top = 321
  end
end
