inherited frmDeptInfo: TfrmDeptInfo
  Left = 205
  Top = 110
  Caption = #37096#38376#26723#26696
  ClientHeight = 351
  ClientWidth = 487
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited bgPanel: TRzPanel
    Width = 487
    Height = 351
    BorderColor = clWhite
    Color = clWhite
    inherited RzPage: TRzPageControl
      Width = 477
      Height = 301
      FixedDimension = 20
      inherited TabSheet1: TRzTabSheet
        Color = clWhite
        Caption = #37096#38376#26723#26696
        inherited RzPanel2: TRzPanel
          Width = 473
          Height = 274
          BorderColor = clWhite
          Color = clWhite
          object Label1: TLabel
            Left = 8
            Top = 15
            Width = 80
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = #37096#38376#20195#30721
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object Label2: TLabel
            Left = 168
            Top = 15
            Width = 6
            Height = 12
            Alignment = taRightJustify
            Caption = '*'
            Font.Charset = GB2312_CHARSET
            Font.Color = clRed
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object Label3: TLabel
            Left = 8
            Top = 42
            Width = 80
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = #37096#38376#21517#31216
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object Label4: TLabel
            Left = 272
            Top = 42
            Width = 6
            Height = 12
            Alignment = taRightJustify
            Caption = '*'
            Font.Charset = GB2312_CHARSET
            Font.Color = clRed
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object Label7: TLabel
            Left = 291
            Top = 42
            Width = 39
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
          object Label6: TLabel
            Left = 458
            Top = 42
            Width = 6
            Height = 12
            Alignment = taRightJustify
            Caption = '*'
            Font.Charset = GB2312_CHARSET
            Font.Color = clRed
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object Label9: TLabel
            Left = 8
            Top = 98
            Width = 80
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = #19978#32423#37096#38376
          end
          object Label26: TLabel
            Left = 8
            Top = 210
            Width = 80
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = #25551#36848
          end
          object Label5: TLabel
            Left = 8
            Top = 154
            Width = 80
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = #32852#31995#30005#35805
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object Label8: TLabel
            Left = 8
            Top = 126
            Width = 80
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
          object Label10: TLabel
            Left = 8
            Top = 183
            Width = 80
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
          object Label11: TLabel
            Left = 8
            Top = 70
            Width = 80
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = #37096#38376#31867#22411
          end
          object Label12: TLabel
            Left = 215
            Top = 70
            Width = 6
            Height = 12
            Alignment = taRightJustify
            Caption = '*'
            Font.Charset = GB2312_CHARSET
            Font.Color = clRed
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object edtDEPT_ID: TcxTextEdit
            Tag = 1
            Left = 95
            Top = 11
            Width = 71
            Height = 20
            Properties.MaxLength = 12
            TabOrder = 0
          end
          object edtDEPT_NAME: TcxTextEdit
            Left = 95
            Top = 38
            Width = 175
            Height = 20
            Properties.MaxLength = 50
            Properties.OnChange = edtDEPT_NAMEPropertiesChange
            TabOrder = 1
          end
          object edtDEPT_SPELL: TcxTextEdit
            Left = 332
            Top = 38
            Width = 124
            Height = 20
            TabStop = False
            Properties.MaxLength = 50
            TabOrder = 2
          end
          object edtUPDEPT_ID: TzrComboBoxList
            Left = 95
            Top = 94
            Width = 118
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
            FilterFields = 'DEPT_NAME;DEPT_ID;DEPT_SPELL'
            KeyField = 'LEVEL_ID'
            ListField = 'DEPT_NAME'
            Columns = <
              item
                EditButtons = <>
                FieldName = 'DEPT_NAME'
                Footers = <>
                Title.Caption = #37096#38376#21517#31216
              end
              item
                EditButtons = <>
                FieldName = 'DEPT_SPELL'
                Footers = <>
                Title.Caption = #25340#38899#30721
                Visible = False
              end>
            DataSet = drpDept
            DropWidth = 180
            DropHeight = 200
            ShowTitle = True
            AutoFitColWidth = True
            ShowButton = True
            LocateStyle = lsDark
            Buttons = [zbClear]
            DropListStyle = lsEditFixed
            OnBeforeDropList = edtUPDEPT_IDBeforeDropList
            MultiSelect = False
          end
          object edtREMARK: TcxMemo
            Left = 95
            Top = 208
            Width = 263
            Height = 43
            Properties.MaxLength = 100
            TabOrder = 7
          end
          object edtTELEPHONE: TcxTextEdit
            Left = 95
            Top = 151
            Width = 118
            Height = 20
            Properties.MaxLength = 30
            TabOrder = 5
          end
          object edtLINKMAN: TcxTextEdit
            Left = 95
            Top = 122
            Width = 118
            Height = 20
            Properties.MaxLength = 20
            TabOrder = 4
          end
          object edtFAXES: TcxTextEdit
            Left = 95
            Top = 179
            Width = 118
            Height = 20
            Properties.MaxLength = 30
            TabOrder = 6
            OnKeyPress = edtFAXESKeyPress
          end
          object edtDEPT_TYPE: TzrComboBoxList
            Left = 95
            Top = 66
            Width = 118
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
            FilterFields = 'CODE_NAME;CODE_ID'
            KeyField = 'CODE_ID'
            ListField = 'CODE_NAME'
            Columns = <
              item
                EditButtons = <>
                FieldName = 'CODE_NAME'
                Footers = <>
                Title.Caption = #37096#38376#31867#22411
              end>
            DropWidth = 160
            DropHeight = 180
            ShowTitle = True
            AutoFitColWidth = True
            ShowButton = False
            LocateStyle = lsDark
            Buttons = []
            DropListStyle = lsEditFixed
            OnBeforeDropList = edtUPDEPT_IDBeforeDropList
            MultiSelect = False
          end
        end
      end
    end
    inherited btPanel: TRzPanel
      Top = 306
      Width = 477
      Color = clWhite
      object btnOk: TRzBitBtn
        Left = 308
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
        OnClick = btnOkClick
        NumGlyphs = 2
        Spacing = 5
      end
      object btnClose: TRzBitBtn
        Left = 402
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
        OnClick = btnCloseClick
        NumGlyphs = 2
        Spacing = 5
      end
    end
  end
  inherited mmMenu: TMainMenu
    Left = 520
    Top = 64
  end
  inherited actList: TActionList
    Left = 520
    Top = 16
  end
  object drpDept: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select * from SYS_DEFINE where COMP_ID='#39'----'#39' or COMP_ID=:COMP_I' +
        'D and COMM not in ('#39'02'#39','#39'12'#39')')
    Params = <
      item
        DataType = ftUnknown
        Name = 'COMP_ID'
        ParamType = ptUnknown
      end>
    Left = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COMP_ID'
        ParamType = ptUnknown
      end>
  end
  object cdsTable: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    SQL.Strings = (
      
        'select * from SYS_DEFINE where COMP_ID='#39'----'#39' or COMP_ID=:COMP_I' +
        'D and COMM not in ('#39'02'#39','#39'12'#39')')
    Params = <
      item
        DataType = ftUnknown
        Name = 'COMP_ID'
        ParamType = ptUnknown
      end>
    Left = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COMP_ID'
        ParamType = ptUnknown
      end>
  end
end
