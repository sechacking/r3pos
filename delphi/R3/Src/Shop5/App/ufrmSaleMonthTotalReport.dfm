inherited frmSaleMonthTotalReport: TfrmSaleMonthTotalReport
  Top = 125
  Width = 958
  Height = 558
  Caption = #21488#24080#20998#26512#25253#34920
  PixelsPerInch = 96
  TextHeight = 12
  inherited bgPanel: TRzPanel
    Width = 950
    Height = 494
    inherited RzPanel2: TRzPanel
      Width = 940
      Height = 484
      inherited RzPage: TRzPageControl
        Width = 735
        Height = 478
        FixedDimension = 25
        inherited TabSheet1: TRzTabSheet
          Caption = #21488#24080#20998#26512#25253#34920
          inherited RzPanel3: TRzPanel
            Width = 733
            Height = 451
            inherited Panel4: TPanel
              Width = 723
              Height = 441
              inherited w1: TRzPanel
                Width = 723
                Height = 102
                OnResize = w1Resize
                object Label3: TLabel
                  Left = 16
                  Top = 37
                  Width = 48
                  Height = 12
                  Caption = #25253#34920#26679#24335
                end
                object Label5: TLabel
                  Left = 16
                  Top = 79
                  Width = 48
                  Height = 12
                  Caption = #21830#21697#25351#26631
                end
                object Label16: TLabel
                  Left = 579
                  Top = 79
                  Width = 48
                  Height = 12
                  Anchors = [akTop, akRight]
                  Caption = #26174#31034#21333#20301
                end
                object Label23: TLabel
                  Left = 16
                  Top = 58
                  Width = 48
                  Height = 12
                  Caption = #38376#24215#32676#32452
                end
                object RzLabel1: TRzLabel
                  Left = 16
                  Top = 12
                  Width = 48
                  Height = 12
                  Alignment = taRightJustify
                  Caption = #25152#23646#26085#26399
                end
                object RzLabel12: TRzLabel
                  Left = 162
                  Top = 12
                  Width = 12
                  Height = 12
                  Caption = #33267
                end
                object Label21: TLabel
                  Left = 273
                  Top = 58
                  Width = 48
                  Height = 12
                  Caption = #38376#24215#21517#31216
                end
                object Label13: TLabel
                  Left = 273
                  Top = 79
                  Width = 48
                  Height = 12
                  Caption = #21830#21697#21517#31216
                end
                object rptTemplate: TcxComboBox
                  Left = 72
                  Top = 33
                  Width = 193
                  Height = 20
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                  Properties.DropDownListStyle = lsFixedList
                  TabOrder = 2
                end
                object btnNew: TRzBitBtn
                  Left = 272
                  Top = 33
                  Width = 48
                  Height = 21
                  Caption = #28155#21152
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
                  TabOrder = 13
                  TextStyle = tsRaised
                  ThemeAware = False
                  OnClick = btnNewClick
                  NumGlyphs = 2
                  Spacing = 5
                end
                object btnEdit: TRzBitBtn
                  Left = 321
                  Top = 33
                  Width = 48
                  Height = 21
                  Caption = #20462#25913
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
                  TabOrder = 14
                  TextStyle = tsRaised
                  ThemeAware = False
                  OnClick = btnEditClick
                  NumGlyphs = 2
                  Spacing = 5
                end
                object RzBitBtn1: TRzBitBtn
                  Left = 470
                  Top = 67
                  Width = 72
                  Height = 29
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
                  TabOrder = 11
                  TextStyle = tsRaised
                  ThemeAware = False
                  ImageIndex = 12
                  NumGlyphs = 2
                  Spacing = 5
                end
                object fndP1_TYPE_ID: TcxComboBox
                  Left = 72
                  Top = 75
                  Width = 73
                  Height = 20
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                  Properties.DropDownListStyle = lsEditFixedList
                  Properties.Items.Strings = (
                    #20027#20379#24212#21830
                    #21697#29260#21517#31216)
                  TabOrder = 6
                end
                object fndP1_UNIT_ID: TcxComboBox
                  Left = 630
                  Top = 75
                  Width = 80
                  Height = 20
                  Anchors = [akTop, akRight]
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #35745#37327#21333#20301
                    #21253#35013'1'
                    #21253#35013'2')
                  TabOrder = 10
                end
                object fndP1_STAT_ID: TzrComboBoxList
                  Tag = -1
                  Left = 146
                  Top = 75
                  Width = 119
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
                  Left = 146
                  Top = 75
                  Width = 119
                  Height = 20
                  Properties.Buttons = <
                    item
                      Default = True
                      Kind = bkEllipsis
                    end>
                  Properties.ReadOnly = False
                  Properties.OnButtonClick = fndP1_SORT_IDPropertiesButtonClick
                  TabOrder = 8
                  OnKeyPress = fndP1_SORT_IDKeyPress
                end
                object fndP1_SHOP_TYPE: TcxComboBox
                  Left = 72
                  Top = 54
                  Width = 73
                  Height = 20
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                  Properties.DropDownListStyle = lsEditFixedList
                  Properties.Items.Strings = (
                    #34892#25919#22320#21306
                    #31649#29702#32676#32452)
                  TabOrder = 3
                end
                object fndP1_SHOP_VALUE: TzrComboBoxList
                  Tag = -1
                  Left = 146
                  Top = 54
                  Width = 119
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
                object fndP1_SHOP_ID: TzrComboBoxList
                  Tag = -1
                  Left = 326
                  Top = 54
                  Width = 124
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
                  ShowButton = False
                  LocateStyle = lsDark
                  Buttons = []
                  DropListStyle = lsFixed
                  MultiSelect = False
                end
                object btnDelete: TRzBitBtn
                  Left = 370
                  Top = 33
                  Width = 48
                  Height = 21
                  Caption = #21024#38500
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
                  TabOrder = 15
                  TextStyle = tsRaised
                  ThemeAware = False
                  OnClick = btnDeleteClick
                  NumGlyphs = 2
                  Spacing = 5
                end
                object P1_D1: TcxDateEdit
                  Left = 72
                  Top = 7
                  Width = 85
                  Height = 20
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                  TabOrder = 0
                end
                object P1_D2: TcxDateEdit
                  Left = 180
                  Top = 7
                  Width = 85
                  Height = 20
                  ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                  TabOrder = 1
                end
                inline P1_DateControl: TfrmDateControl
                  Left = 270
                  Top = 8
                  Width = 170
                  Height = 20
                  TabOrder = 12
                end
                object fndP1_GODS_ID: TzrComboBoxList
                  Tag = 100
                  Left = 326
                  Top = 75
                  Width = 124
                  Height = 20
                  Properties.AutoSelect = False
                  Properties.Buttons = <
                    item
                      Default = True
                    end>
                  Properties.ReadOnly = False
                  TabOrder = 9
                  InGrid = True
                  KeyValue = Null
                  FilterFields = 'GODS_CODE;GODS_NAME;GODS_SPELL;BARCODE'
                  KeyField = 'GODS_ID'
                  ListField = 'GODS_NAME'
                  Columns = <
                    item
                      EditButtons = <>
                      FieldName = 'GODS_NAME'
                      Footers = <>
                      Title.Caption = #21830#21697#21517#31216
                      Width = 150
                    end
                    item
                      EditButtons = <>
                      FieldName = 'GODS_CODE'
                      Footers = <>
                      Title.Caption = #36135#21495
                      Width = 50
                    end
                    item
                      EditButtons = <>
                      FieldName = 'BARCODE'
                      Footers = <>
                      Title.Caption = #26465#30721
                      Width = 65
                    end>
                  DropWidth = 380
                  DropHeight = 250
                  ShowTitle = True
                  AutoFitColWidth = True
                  ShowButton = True
                  LocateStyle = lsDark
                  Buttons = [zbNew, zbFind]
                  DropListStyle = lsFixed
                  MultiSelect = False
                  ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
                end
              end
              inherited RzPanel7: TRzPanel
                Top = 102
                Width = 723
                Height = 339
                inherited DBGridEh1: TDBGridEh
                  Width = 719
                  Height = 335
                  OnGetFooterParams = DBGridEh1GetFooterParams
                end
              end
            end
          end
        end
      end
      inherited PanelColumnS: TPanel
        Left = 738
        Height = 478
        Visible = False
        inherited Panel2: TPanel
          Height = 444
          inherited Panel5: TPanel
            Height = 329
            inherited rzShowColumns: TRzCheckList
              Height = 325
            end
          end
        end
      end
    end
  end
  inherited RzPanel4: TRzPanel
    Width = 950
    inherited Image14: TImage
      Left = 930
    end
    inherited Image1: TImage
      Width = 580
    end
  end
  inherited mmMenu: TMainMenu
    Left = 112
    Top = 224
  end
  inherited actList: TActionList
    Left = 144
    Top = 224
    inherited actFind: TAction
      OnExecute = actFindExecute
    end
    object actTemplate: TAction
      Caption = #34920#26679
    end
  end
  inherited PrintDBGridEh1: TPrintDBGridEh
    Left = 200
    Top = 248
    BeforeGridText_Data = {
      7B5C727466315C616E73695C616E73696370673933365C64656666305C646566
      6C616E67313033335C6465666C616E676665323035327B5C666F6E7474626C7B
      5C66305C666E696C5C6663686172736574313334205C2763625C2763655C2763
      635C2765353B7D7B5C66315C666E696C5C6663686172736574313334204D5320
      53616E732053657269663B7D7D0D0A5C766965776B696E64345C7563315C7061
      72645C6C616E67323035325C66305C6673323020255B7768725D5C66315C6673
      3136200D0A5C706172207D0D0A00}
    AfterGridText_Data = {
      7B5C727466315C616E73695C616E73696370673933365C64656666305C646566
      6C616E67313033335C6465666C616E676665323035327B5C666F6E7474626C7B
      5C66305C666E696C5C6663686172736574313334205C2763625C2763655C2763
      635C2765353B7D7B5C66315C666E696C5C6663686172736574313334204D5320
      53616E732053657269663B7D7D0D0A5C766965776B696E64345C7563315C7061
      72645C71725C66305C667332305C2762345C2766325C2764335C2761315C2763
      615C2762315C2762635C2765345C6C616E67323035325C66315C66733136200D
      0A5C706172207D0D0A00}
  end
end
