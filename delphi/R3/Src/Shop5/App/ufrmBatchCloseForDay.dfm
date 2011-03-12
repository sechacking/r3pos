inherited frmBatchCloseForDay: TfrmBatchCloseForDay
  Left = 584
  Top = 216
  Caption = #25209#37327#32467#36134
  ClientHeight = 314
  ClientWidth = 347
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited bgPanel: TRzPanel
    Width = 347
    Height = 314
    inherited RzPage: TRzPageControl
      Width = 337
      Height = 264
      FixedDimension = 20
      inherited TabSheet1: TRzTabSheet
        Caption = #25209#37327#32467#36134
        inherited RzPanel2: TRzPanel
          Width = 333
          Height = 237
          object RzPanel1: TRzPanel
            Left = 5
            Top = 5
            Width = 323
            Height = 227
            Align = alClient
            BorderOuter = fsNone
            TabOrder = 0
            object DBGridEh1: TDBGridEh
              Left = 0
              Top = 0
              Width = 323
              Height = 227
              Align = alClient
              DataSource = DsCloseForDay
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
              TabOrder = 0
              TitleFont.Charset = GB2312_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -12
              TitleFont.Name = #23435#20307
              TitleFont.Style = []
              TitleHeight = 22
              IsDrawNullRow = False
              CurrencySymbol = #65509
              DecimalNumber = 2
              DigitalNumber = 12
              OnDrawColumnCell = DBGridEh1DrawColumnCell
              Columns = <
                item
                  Checkboxes = True
                  EditButtons = <>
                  FieldName = 'selflag'
                  Footers = <>
                  KeyList.Strings = (
                    '1'
                    '0')
                  PickList.Strings = (
                    '0'
                    '1')
                  Title.Alignment = taCenter
                  Title.Caption = #36873#25321
                  Width = 22
                end
                item
                  EditButtons = <>
                  FieldName = 'SEQNO'
                  Footers = <>
                  ReadOnly = True
                  Title.Alignment = taCenter
                  Title.Caption = #24207#21495
                  Width = 30
                end
                item
                  Alignment = taRightJustify
                  EditButtons = <>
                  FieldName = 'CREA_USER'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #25910#38134#21592
                  Width = 80
                end
                item
                  DisplayFormat = '0000-00-00'
                  EditButtons = <>
                  FieldName = 'CREA_DATE'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #26410#32467#36134#26085#26399
                  Width = 80
                end
                item
                  DisplayFormat = '#0.00'
                  EditButtons = <>
                  FieldName = 'SUM_MONEY'
                  Footers = <>
                  Title.Alignment = taCenter
                  Title.Caption = #37329'  '#39069
                  Width = 80
                end>
            end
          end
        end
      end
    end
    inherited btPanel: TRzPanel
      Top = 269
      Width = 337
      object Btn_Save: TRzBitBtn
        Left = 69
        Top = 11
        Width = 83
        Height = 26
        Anchors = [akTop, akRight]
        Caption = #31435#21363#32467#36134'(&S)'
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
        Left = 193
        Top = 11
        Width = 83
        Height = 26
        Anchors = [akTop, akRight]
        Caption = #31245#21518#32467#36134'(&C)'
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
  end
  object DbCloseForDay: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 51
    Top = 130
  end
  object DsCloseForDay: TDataSource
    DataSet = DbCloseForDay
    Left = 83
    Top = 130
  end
  object PopupMenu1: TPopupMenu
    Left = 187
    Top = 138
    object N1: TMenuItem
      Caption = #20840#36873
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21453#36873
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #20840#19981#36873
      OnClick = N3Click
    end
  end
end
