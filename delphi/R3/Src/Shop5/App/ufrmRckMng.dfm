inherited frmRckMng: TfrmRckMng
  Left = 187
  Top = 149
  Width = 818
  Height = 569
  Caption = #32467#36134#31649#29702
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited bgPanel: TRzPanel
    Width = 802
    Height = 501
    inherited RzPanel2: TRzPanel
      Width = 792
      Height = 491
      inherited RzPage: TRzPageControl
        Width = 786
        Height = 485
        OnChange = RzPageChange
        FixedDimension = 25
        inherited TabSheet1: TRzTabSheet
          Caption = #25910#38134#21592#20132#29677#32467#36134
          inherited RzPanel3: TRzPanel
            Width = 784
            Height = 458
            BorderInner = fsStatus
            object RzPanel1: TRzPanel
              Left = 6
              Top = 6
              Width = 772
              Height = 80
              Align = alTop
              BorderOuter = fsNone
              BorderColor = clWhite
              BorderWidth = 5
              Color = clWhite
              TabOrder = 0
              object RzLabel2: TRzLabel
                Left = 24
                Top = 11
                Width = 48
                Height = 12
                Alignment = taRightJustify
                Caption = #32467#36134#26085#26399
              end
              object RzLabel3: TRzLabel
                Left = 186
                Top = 11
                Width = 12
                Height = 12
                Caption = #33267
              end
              object Label4: TLabel
                Left = 38
                Top = 53
                Width = 36
                Height = 12
                Alignment = taRightJustify
                Caption = #25910#38134#21592
              end
              object Label6: TLabel
                Left = 24
                Top = 32
                Width = 48
                Height = 12
                Caption = #25152#23646#38376#24215
              end
              object P1_D1: TcxDateEdit
                Left = 80
                Top = 7
                Width = 97
                Height = 20
                Properties.DateButtons = [btnToday]
                TabOrder = 0
              end
              object P1_D2: TcxDateEdit
                Left = 205
                Top = 7
                Width = 98
                Height = 20
                Properties.DateButtons = [btnToday]
                TabOrder = 1
              end
              object btnOk: TRzBitBtn
                Left = 435
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
              object fndP1_STATUS: TcxRadioGroup
                Left = 316
                Top = 2
                Width = 105
                Height = 71
                ItemIndex = 0
                Properties.Items = <
                  item
                    Caption = #20840#37096
                  end
                  item
                    Caption = #24453#23457#26680
                  end
                  item
                    Caption = #24050#23457#26680
                  end>
                TabOrder = 3
                Caption = ''
              end
              object fndP1_CREA_USER: TzrComboBoxList
                Left = 80
                Top = 49
                Width = 114
                Height = 20
                Properties.AutoSelect = False
                Properties.Buttons = <
                  item
                    Default = True
                  end>
                Properties.ReadOnly = False
                TabOrder = 4
                InGrid = False
                KeyValue = Null
                FilterFields = 'ACCOUNT;USER_NAME'
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
                Buttons = [zbClear]
                DropListStyle = lsFixed
                MultiSelect = False
              end
              object fndP1_SHOP_ID: TzrComboBoxList
                Tag = -1
                Left = 80
                Top = 28
                Width = 223
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
            end
            object Panel1: TPanel
              Left = 6
              Top = 86
              Width = 772
              Height = 366
              Align = alClient
              Caption = 'Panel1'
              TabOrder = 1
              object DBGridEh1: TDBGridEh
                Left = 1
                Top = 1
                Width = 770
                Height = 364
                Align = alClient
                AllowedOperations = [alopUpdateEh]
                DataSource = DataSource1
                Flat = True
                FooterColor = clWindow
                FooterFont.Charset = GB2312_CHARSET
                FooterFont.Color = clWindowText
                FooterFont.Height = -12
                FooterFont.Name = #23435#20307
                FooterFont.Style = []
                FrozenCols = 2
                Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                OptionsEh = [dghFixed3D, dghFrozen3D, dghHighlightFocus, dghClearSelection]
                RowHeight = 20
                SumList.Active = True
                TabOrder = 0
                TitleFont.Charset = GB2312_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -12
                TitleFont.Name = #23435#20307
                TitleFont.Style = []
                TitleHeight = 20
                UseMultiTitle = True
                IsDrawNullRow = False
                CurrencySymbol = #65509
                DecimalNumber = 2
                DigitalNumber = 12
                OnDrawColumnCell = DBGridEh1DrawColumnCell
                OnGetCellParams = DBGridEh1GetCellParams
                Columns = <
                  item
                    Color = clBtnFace
                    EditButtons = <>
                    FieldName = 'SEQNO'
                    Footers = <>
                    ReadOnly = True
                    Title.Caption = #24207#21495
                    Width = 28
                  end
                  item
                    EditButtons = <>
                    FieldName = 'SHOP_ID_TEXT'
                    Footer.Value = #21512'   '#35745#65306
                    Footer.ValueType = fvtStaticText
                    Footers = <>
                    ReadOnly = True
                    Title.Caption = #38376#24215#21517#31216
                    Width = 120
                  end
                  item
                    EditButtons = <>
                    FieldName = 'CREA_USER_TEXT'
                    Footers = <>
                    Title.Caption = #25910#38134#21592
                    Width = 75
                  end
                  item
                    DisplayFormat = '0000-00-00'
                    EditButtons = <>
                    FieldName = 'CLSE_DATE'
                    Footers = <>
                    ReadOnly = True
                    Title.Caption = #32467#36134#26085#26399
                    Width = 80
                  end
                  item
                    EditButtons = <>
                    FieldName = 'TOTAL_MNY'
                    Footers = <>
                    Title.Caption = #21512#35745#37329#39069
                    Width = 70
                  end
                  item
                    EditButtons = <>
                    FieldName = 'BALANCE'
                    Footers = <>
                    Title.Caption = #20445#30041#38646#38065
                    Width = 70
                  end
                  item
                    EditButtons = <>
                    FieldName = 'REMARK'
                    Footers = <>
                    Title.Caption = #35828'  '#26126
                    Width = 160
                  end
                  item
                    Alignment = taRightJustify
                    EditButtons = <>
                    FieldName = 'CHK_USER_TEXT'
                    Footers = <>
                    ReadOnly = True
                    Title.Caption = #23457#26680#20154
                    Width = 75
                  end
                  item
                    EditButtons = <>
                    FieldName = 'CHK_DATE'
                    Footers = <>
                    ReadOnly = True
                    Title.Caption = #23457#26680#26085#26399
                    Width = 80
                  end
                  item
                    EditButtons = <>
                    FieldName = 'CREA_DATE'
                    Footers = <>
                    Title.Caption = #32467#36134#26102#38388
                    Width = 120
                  end>
              end
            end
          end
        end
        object TabSheet2: TRzTabSheet
          Caption = #36130#21153#26085#32467#36134
          object RzPanel6: TRzPanel
            Left = 0
            Top = 0
            Width = 784
            Height = 458
            Align = alClient
            BorderInner = fsGroove
            BorderOuter = fsNone
            BorderWidth = 5
            TabOrder = 0
            object RzPanel7: TRzPanel
              Left = 7
              Top = 81
              Width = 770
              Height = 370
              Align = alClient
              BorderOuter = fsNone
              Color = clWhite
              TabOrder = 0
              object DBGridEh2: TDBGridEh
                Left = 0
                Top = 0
                Width = 770
                Height = 370
                Align = alClient
                AllowedOperations = [alopUpdateEh]
                DataSource = Ds_CloseDay
                Flat = True
                FooterColor = clWindow
                FooterFont.Charset = GB2312_CHARSET
                FooterFont.Color = clWindowText
                FooterFont.Height = -12
                FooterFont.Name = #23435#20307
                FooterFont.Style = []
                FrozenCols = 2
                Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                OptionsEh = [dghFixed3D, dghFrozen3D, dghHighlightFocus, dghClearSelection]
                RowHeight = 20
                SumList.Active = True
                TabOrder = 0
                TitleFont.Charset = GB2312_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -12
                TitleFont.Name = #23435#20307
                TitleFont.Style = []
                TitleHeight = 20
                UseMultiTitle = True
                IsDrawNullRow = False
                CurrencySymbol = #65509
                DecimalNumber = 2
                DigitalNumber = 12
                OnDrawColumnCell = DBGridEh2DrawColumnCell
                OnGetCellParams = DBGridEh1GetCellParams
                Columns = <
                  item
                    Color = clBtnFace
                    EditButtons = <>
                    FieldName = 'SEQNO'
                    Footers = <>
                    ReadOnly = True
                    Title.Caption = #24207#21495
                    Width = 28
                  end
                  item
                    DisplayFormat = '0000-00-00'
                    EditButtons = <>
                    FieldName = 'CREA_DATE'
                    Footers = <>
                    Title.Caption = #32467#36134#26085#26399
                    Width = 120
                  end
                  item
                    EditButtons = <>
                    FieldName = 'CREA_USER_TEXT'
                    Footers = <>
                    Title.Caption = #32467#36134#20154
                    Width = 75
                  end
                  item
                    Alignment = taRightJustify
                    DisplayFormat = '0000-00-00'
                    EditButtons = <>
                    FieldName = 'CHK_USER_TEXT'
                    Footers = <>
                    ReadOnly = True
                    Title.Caption = #23457#26680#20154
                    Width = 75
                  end
                  item
                    EditButtons = <>
                    FieldName = 'CHK_DATE'
                    Footers = <>
                    ReadOnly = True
                    Title.Caption = #23457#26680#26085#26399
                    Width = 80
                  end>
              end
            end
            object RzPanel10: TRzPanel
              Left = 7
              Top = 7
              Width = 770
              Height = 74
              Align = alTop
              BorderOuter = fsNone
              Color = clWhite
              TabOrder = 1
              object RzLabel1: TRzLabel
                Left = 24
                Top = 15
                Width = 48
                Height = 12
                Alignment = taRightJustify
                Caption = #32467#36134#26085#26399
              end
              object RzLabel4: TRzLabel
                Left = 186
                Top = 15
                Width = 12
                Height = 12
                Caption = #33267
              end
              object Label1: TLabel
                Left = 38
                Top = 42
                Width = 36
                Height = 12
                Alignment = taRightJustify
                Caption = #32467#36134#20154
              end
              object P2_D1: TcxDateEdit
                Left = 80
                Top = 11
                Width = 97
                Height = 20
                Properties.DateButtons = [btnToday]
                TabOrder = 0
              end
              object P2_D2: TcxDateEdit
                Left = 205
                Top = 11
                Width = 98
                Height = 20
                Properties.DateButtons = [btnToday]
                TabOrder = 1
              end
              object RzBitBtn1: TRzBitBtn
                Left = 443
                Top = 33
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
              object fndP2_STATUS: TcxRadioGroup
                Left = 316
                Top = 2
                Width = 105
                Height = 63
                ItemIndex = 0
                Properties.Items = <
                  item
                    Caption = #20840#37096
                  end
                  item
                    Caption = #24453#23457#26680
                  end
                  item
                    Caption = #24050#23457#26680
                  end>
                TabOrder = 3
                Caption = ''
              end
              object fndP2_CREA_USER: TzrComboBoxList
                Left = 80
                Top = 38
                Width = 114
                Height = 20
                Properties.AutoSelect = False
                Properties.Buttons = <
                  item
                    Default = True
                  end>
                Properties.ReadOnly = False
                TabOrder = 4
                InGrid = False
                KeyValue = Null
                FilterFields = 'ACCOUNT;USER_NAME'
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
                Buttons = [zbClear]
                DropListStyle = lsFixed
                MultiSelect = False
              end
            end
          end
        end
        object TabSheet3: TRzTabSheet
          Caption = #36130#21153#26376#32467#36134
          object RzPanel8: TRzPanel
            Left = 0
            Top = 0
            Width = 784
            Height = 458
            Align = alClient
            BorderInner = fsFlat
            BorderOuter = fsNone
            BorderWidth = 5
            TabOrder = 0
            object RzPanel9: TRzPanel
              Left = 6
              Top = 79
              Width = 772
              Height = 373
              Align = alClient
              BorderOuter = fsNone
              Color = clWhite
              TabOrder = 0
              object DBGridEh3: TDBGridEh
                Left = 0
                Top = 0
                Width = 772
                Height = 373
                Align = alClient
                AllowedOperations = [alopUpdateEh]
                DataSource = Ds_CloseMonth
                Flat = True
                FooterColor = clWindow
                FooterFont.Charset = GB2312_CHARSET
                FooterFont.Color = clWindowText
                FooterFont.Height = -12
                FooterFont.Name = #23435#20307
                FooterFont.Style = []
                FrozenCols = 2
                Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                OptionsEh = [dghFixed3D, dghFrozen3D, dghHighlightFocus, dghClearSelection]
                RowHeight = 20
                SumList.Active = True
                TabOrder = 0
                TitleFont.Charset = GB2312_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -12
                TitleFont.Name = #23435#20307
                TitleFont.Style = []
                TitleHeight = 20
                UseMultiTitle = True
                IsDrawNullRow = False
                CurrencySymbol = #65509
                DecimalNumber = 2
                DigitalNumber = 12
                OnDrawColumnCell = DBGridEh3DrawColumnCell
                OnGetCellParams = DBGridEh1GetCellParams
                Columns = <
                  item
                    Color = clBtnFace
                    EditButtons = <>
                    FieldName = 'SEQNO'
                    Footers = <>
                    ReadOnly = True
                    Title.Caption = #24207#21495
                    Width = 26
                  end
                  item
                    EditButtons = <>
                    FieldName = 'SHOP_ID_TEXT'
                    Footer.Value = #21512'   '#35745#65306
                    Footer.ValueType = fvtStaticText
                    Footers = <>
                    ReadOnly = True
                    Title.Caption = #38376#24215#21517#31216
                    Width = 120
                  end
                  item
                    DisplayFormat = '0000-00-00'
                    EditButtons = <>
                    FieldName = 'BEGIN_DATE'
                    Footers = <>
                    ReadOnly = True
                    Title.Caption = #32467#36134#26085#26399
                    Width = 80
                  end
                  item
                    DisplayFormat = '0000-00-00'
                    EditButtons = <>
                    FieldName = 'END_DATE'
                    Footers = <>
                    Title.Caption = #35828'  '#26126
                    Width = 160
                  end
                  item
                    Alignment = taRightJustify
                    EditButtons = <>
                    FieldName = 'CHK_USER_TEXT'
                    Footers = <>
                    ReadOnly = True
                    Title.Caption = #23457#26680#20154
                    Width = 75
                  end
                  item
                    DisplayFormat = '0000-00-00'
                    EditButtons = <>
                    FieldName = 'CHK_DATE'
                    Footers = <>
                    ReadOnly = True
                    Title.Caption = #23457#26680#26085#26399
                    Width = 80
                  end
                  item
                    EditButtons = <>
                    FieldName = 'CREA_USER_TEXT'
                    Footers = <>
                    Title.Caption = #21046#21333#20154
                    Width = 75
                  end
                  item
                    DisplayFormat = '0000-00-00'
                    EditButtons = <>
                    FieldName = 'MONTH'
                    Footers = <>
                    Title.Caption = #21046#21333#26102#38388
                    Width = 120
                  end>
              end
            end
            object RzPanel11: TRzPanel
              Left = 6
              Top = 6
              Width = 772
              Height = 73
              Align = alTop
              BorderOuter = fsNone
              Color = clWhite
              TabOrder = 1
              object RzLabel5: TRzLabel
                Left = 24
                Top = 16
                Width = 48
                Height = 12
                Alignment = taRightJustify
                Caption = #32467#36134#26085#26399
              end
              object RzLabel6: TRzLabel
                Left = 186
                Top = 16
                Width = 12
                Height = 12
                Caption = #33267
              end
              object Label3: TLabel
                Left = 38
                Top = 41
                Width = 36
                Height = 12
                Alignment = taRightJustify
                Caption = #32467#36134#20154
              end
              object RzBitBtn2: TRzBitBtn
                Left = 443
                Top = 33
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
                TabOrder = 0
                TextStyle = tsRaised
                ThemeAware = False
                ImageIndex = 12
                NumGlyphs = 2
                Spacing = 5
              end
              object fndP3_STATUS: TcxRadioGroup
                Left = 316
                Top = 2
                Width = 105
                Height = 63
                ItemIndex = 0
                Properties.Items = <
                  item
                    Caption = #20840#37096
                  end
                  item
                    Caption = #24453#23457#26680
                  end
                  item
                    Caption = #24050#23457#26680
                  end>
                TabOrder = 1
                Caption = ''
              end
              object fndP3_CREA_USER: TzrComboBoxList
                Left = 80
                Top = 37
                Width = 114
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
                FilterFields = 'ACCOUNT;USER_NAME'
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
                Buttons = [zbClear]
                DropListStyle = lsFixed
                MultiSelect = False
              end
              object P3_M1: TzrMonthEdit
                Left = 80
                Top = 12
                Width = 97
                Height = 20
                Properties.Buttons = <
                  item
                    Default = True
                  end>
                Properties.ReadOnly = False
                TabOrder = 3
                Text = '2011/03'
                Year = 0
                Month = 0
                asString = '000000'
                asFormatString = '0000-00'
              end
              object P3_M2: TzrMonthEdit
                Left = 206
                Top = 12
                Width = 97
                Height = 20
                Properties.Buttons = <
                  item
                    Default = True
                  end>
                Properties.ReadOnly = False
                TabOrder = 4
                Text = '2011/03'
                Year = 0
                Month = 0
                asString = '000000'
                asFormatString = '0000-00'
              end
            end
          end
        end
      end
    end
  end
  inherited RzPanel4: TRzPanel
    Width = 802
    inherited Image1: TImage
      Left = 444
      Width = 349
    end
    inherited Image14: TImage
      Left = 793
    end
    inherited Image3: TImage
      Left = 444
      Width = 349
    end
    inherited rzPanel5: TPanel
      inherited lblToolCaption: TRzLabel
        Caption = #24403#21069#20301#32622'->'#32467#36134#31649#29702
      end
    end
    inherited CoolBar1: TCoolBar
      Width = 268
      Bands = <
        item
          Break = False
          Control = ToolBar1
          FixedSize = True
          ImageIndex = -1
          MinHeight = 268
          Width = 30
        end>
      inherited ToolBar1: TToolBar
        Width = 268
        ButtonHeight = 30
        ButtonWidth = 43
        object ToolButton2: TToolButton
          Left = 0
          Top = 0
          Action = actNew
        end
        object ToolButton5: TToolButton
          Left = 43
          Top = 0
          Action = actDelete
        end
        object ToolButton7: TToolButton
          Left = 86
          Top = 0
          Width = 10
          Caption = 'ToolButton7'
          ImageIndex = 3
          Style = tbsDivider
        end
        object ToolButton8: TToolButton
          Left = 96
          Top = 0
          Action = actAudit
        end
        object ToolButton3: TToolButton
          Left = 139
          Top = 0
          Action = actPrint
        end
        object ToolButton6: TToolButton
          Left = 182
          Top = 0
          Action = actPreview
        end
        object ToolButton10: TToolButton
          Left = 225
          Top = 0
          Action = actExit
        end
      end
    end
  end
  inherited mmMenu: TMainMenu
    Left = 112
    Top = 232
  end
  inherited actList: TActionList
    Left = 160
    Top = 232
    inherited actNew: TAction
      Caption = #32467#36134
      OnExecute = actNewExecute
    end
    inherited actDelete: TAction
      Caption = #25764#28040
      OnExecute = actDeleteExecute
    end
    inherited actFind: TAction
      OnExecute = actFindExecute
    end
    inherited actAudit: TAction
      OnExecute = actAuditExecute
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsBrowser
    Left = 113
    Top = 266
  end
  object cdsBrowser: TZQuery
    FieldDefs = <>
    AfterScroll = cdsBrowserAfterScroll
    CachedUpdates = True
    Params = <>
    Left = 159
    Top = 265
  end
  object Db_CloseDay: TZQuery
    FieldDefs = <>
    AfterScroll = cdsBrowserAfterScroll
    CachedUpdates = True
    Params = <>
    Left = 159
    Top = 303
  end
  object Ds_CloseDay: TDataSource
    DataSet = Db_CloseDay
    Left = 113
    Top = 304
  end
  object Db_CloseMonth: TZQuery
    FieldDefs = <>
    AfterScroll = cdsBrowserAfterScroll
    CachedUpdates = True
    Params = <>
    Left = 159
    Top = 335
  end
  object Ds_CloseMonth: TDataSource
    DataSet = Db_CloseMonth
    Left = 113
    Top = 336
  end
end
