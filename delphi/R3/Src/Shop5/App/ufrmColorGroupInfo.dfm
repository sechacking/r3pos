inherited frmColorGroupInfo: TfrmColorGroupInfo
  Left = 350
  Top = 192
  Caption = #39068#33394#19982#39068#33394#32452#32452#31649#29702
  ClientHeight = 371
  ClientWidth = 562
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited bgPanel: TRzPanel
    Width = 562
    Height = 371
    BorderColor = clWhite
    Color = clWhite
    inherited RzPage: TRzPageControl
      Width = 552
      Height = 321
      TabIndex = -1
      FixedDimension = 20
      inherited TabSheet1: TRzTabSheet
        Color = clWhite
        TabVisible = False
        Caption = #23610#30721#19982#23610#30721#32452#26723#26696
        inherited RzPanel2: TRzPanel
          Width = 548
          Height = 317
          BorderColor = clWhite
          Color = clWhite
          object RzPanel1: TRzPanel
            Left = 5
            Top = 5
            Width = 180
            Height = 307
            Align = alLeft
            BorderOuter = fsNone
            Color = clWhite
            TabOrder = 0
            object rzTree: TRzTreeView
              Left = 0
              Top = 0
              Width = 180
              Height = 307
              SelectionPen.Color = clBtnShadow
              Align = alClient
              FrameVisible = True
              HideSelection = False
              Indent = 19
              ReadOnly = True
              RowSelect = True
              TabOrder = 0
              OnChange = rzTreeChange
            end
          end
          object RzPanel3: TRzPanel
            Left = 185
            Top = 5
            Width = 358
            Height = 307
            Align = alClient
            BorderOuter = fsNone
            Color = clWhite
            TabOrder = 1
            DesignSize = (
              358
              307)
            object Label1: TLabel
              Left = -21
              Top = 16
              Width = 80
              Height = 12
              Alignment = taRightJustify
              AutoSize = False
              Caption = #21517#31216
            end
            object Label2: TLabel
              Left = -21
              Top = 50
              Width = 80
              Height = 12
              Alignment = taRightJustify
              AutoSize = False
              Caption = #25340#38899#30721
            end
            object Label11: TLabel
              Left = 187
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
              Left = 156
              Top = 48
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
            object BtnColorGroup: TRzBitBtn
              Left = 267
              Top = 13
              Width = 83
              Height = 26
              Anchors = [akTop, akRight]
              Caption = #26032#22686#32452'(&A)'
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
              OnClick = BtnColorGroupClick
              NumGlyphs = 2
              Spacing = 5
            end
            object BtnColor: TRzBitBtn
              Left = 267
              Top = 46
              Width = 83
              Height = 26
              Anchors = [akTop, akRight]
              Caption = #26032#22686#39068#33394'(&N)'
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
              OnClick = BtnColorClick
              NumGlyphs = 2
              Spacing = 5
            end
            object edtSORT_SPELL: TcxTextEdit
              Left = 65
              Top = 44
              Width = 90
              Height = 20
              Properties.OnChange = edtSPELLPropertiesChange
              TabOrder = 2
            end
            object edtSORT_NAME: TcxTextEdit
              Left = 65
              Top = 11
              Width = 121
              Height = 20
              Properties.OnChange = edtNAMEPropertiesChange
              TabOrder = 3
            end
            object RzPanel4: TRzPanel
              Left = 0
              Top = 114
              Width = 358
              Height = 193
              Align = alBottom
              BorderOuter = fsNone
              Color = clWhite
              TabOrder = 4
              object RzPanel5: TRzPanel
                Left = 0
                Top = 0
                Width = 86
                Height = 193
                Align = alLeft
                BorderOuter = fsNone
                Color = clWhite
                TabOrder = 0
                object BtnAddAll: TRzBitBtn
                  Left = 2
                  Top = 24
                  Width = 83
                  Height = 26
                  Caption = '<< '#28155#21152#25152#26377
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
                  OnClick = BtnAddAllClick
                  NumGlyphs = 2
                  Spacing = 5
                end
                object BtnAddSelected: TRzBitBtn
                  Left = 2
                  Top = 56
                  Width = 83
                  Height = 26
                  Caption = ' < '#28155#21152#36873#20013
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
                  OnClick = BtnAddSelectedClick
                  NumGlyphs = 2
                  Spacing = 5
                end
                object BtnDeleteSelected: TRzBitBtn
                  Left = 2
                  Top = 112
                  Width = 83
                  Height = 26
                  Caption = #21024#38500#36873#20013' > '
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
                  OnClick = BtnDeleteSelectedClick
                  NumGlyphs = 2
                  Spacing = 5
                end
                object BtnDeleteAll: TRzBitBtn
                  Left = 2
                  Top = 144
                  Width = 83
                  Height = 26
                  Caption = #21024#38500#25152#26377' >>'
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
                  OnClick = BtnDeleteAllClick
                  NumGlyphs = 2
                  Spacing = 5
                end
              end
              object RzPanel6: TRzPanel
                Left = 86
                Top = 0
                Width = 272
                Height = 193
                Align = alClient
                BorderOuter = fsNone
                Color = clWhite
                TabOrder = 1
                object DBGridEh1: TDBGridEh
                  Left = 0
                  Top = 0
                  Width = 272
                  Height = 193
                  Align = alClient
                  AutoFitColWidths = True
                  DataSource = DsSizeInfo
                  Flat = True
                  FooterColor = clWindow
                  FooterFont.Charset = GB2312_CHARSET
                  FooterFont.Color = clWindowText
                  FooterFont.Height = -12
                  FooterFont.Name = #23435#20307
                  FooterFont.Style = []
                  FrozenCols = 1
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                  Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                  OptionsEh = [dghFixed3D, dghFrozen3D, dghHighlightFocus, dghClearSelection, dghEnterAsTab]
                  RowHeight = 20
                  TabOrder = 0
                  TitleFont.Charset = GB2312_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -12
                  TitleFont.Name = #23435#20307
                  TitleFont.Style = []
                  UseMultiTitle = True
                  IsDrawNullRow = False
                  CurrencySymbol = #65509
                  DecimalNumber = 2
                  DigitalNumber = 12
                  OnDrawColumnCell = DBGridEh1DrawColumnCell
                  Columns = <
                    item
                      Checkboxes = True
                      EditButtons = <>
                      FieldName = 'FLAG'
                      Footers = <>
                      KeyList.Strings = (
                        '1'
                        '0')
                      PickList.Strings = (
                        '0'
                        '1')
                      Title.Caption = #36873#25321
                      Title.Color = clWhite
                      Width = 30
                    end
                    item
                      EditButtons = <>
                      FieldName = 'SEQ_NO'
                      Footers = <>
                      ReadOnly = True
                      Title.Caption = #24207#21495
                      Title.Color = clWhite
                      Width = 36
                    end
                    item
                      EditButtons = <>
                      FieldName = 'SORT_NAME'
                      Footers = <>
                      ReadOnly = True
                      Title.Caption = #23610#30721#21517#31216
                      Title.Color = clWhite
                      Width = 100
                    end
                    item
                      EditButtons = <>
                      FieldName = 'SORT_SPELL'
                      Footers = <>
                      ReadOnly = True
                      Title.Caption = #25340#38899#30721
                      Title.Color = clWhite
                      Width = 87
                    end>
                end
              end
            end
          end
        end
      end
    end
    inherited btPanel: TRzPanel
      Top = 326
      Width = 552
      Color = clWhite
      object BtnSave: TRzBitBtn
        Left = 216
        Top = 6
        Width = 71
        Height = 27
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
        OnClick = BtnSaveClick
        NumGlyphs = 2
        Spacing = 5
      end
      object BtnExit: TRzBitBtn
        Left = 473
        Top = 6
        Width = 70
        Height = 26
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
        TabOrder = 3
        TextStyle = tsRaised
        ThemeAware = False
        OnClick = BtnExitClick
        NumGlyphs = 2
        Spacing = 5
      end
      object BtnDelete: TRzBitBtn
        Left = 389
        Top = 6
        Width = 70
        Height = 26
        Anchors = [akTop, akRight]
        Caption = #21024#38500'(&D)'
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
        OnClick = BtnDeleteClick
        NumGlyphs = 2
        Spacing = 5
      end
      object BtnCancel: TRzBitBtn
        Left = 303
        Top = 6
        Width = 70
        Height = 26
        Anchors = [akTop, akRight]
        Caption = #21462#28040'(&R)'
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
        OnClick = BtnCancelClick
        NumGlyphs = 2
        Spacing = 5
      end
    end
  end
  inherited mmMenu: TMainMenu
    Left = 14
    Top = 276
  end
  inherited actList: TActionList
    Left = 54
    Top = 276
  end
  object CdsColorInfo: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 13
    Top = 334
  end
  object CdsColorGroupInfo: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 45
    Top = 334
  end
  object CdsColorGroupRelation: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 77
    Top = 334
  end
  object DsSizeInfo: TDataSource
    DataSet = CdsColorInfo
    Left = 14
    Top = 305
  end
end