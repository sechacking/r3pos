inherited frmCheckOrderList: TfrmCheckOrderList
  Left = 191
  Top = 108
  Width = 891
  Height = 571
  Caption = #30424#28857#21333
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited bgPanel: TRzPanel
    Width = 875
    Height = 503
    inherited RzPanel2: TRzPanel
      Width = 865
      Height = 493
      inherited RzPage: TRzPageControl
        Width = 859
        Height = 487
        FixedDimension = 25
        inherited TabSheet1: TRzTabSheet
          Caption = #30424#28857#21333#26597#35810
          inherited RzPanel3: TRzPanel
            Width = 857
            Height = 460
            inherited RzPanel1: TRzPanel
              Width = 847
              Height = 91
              object RzLabel2: TRzLabel
                Left = 57
                Top = 3
                Width = 24
                Height = 12
                Alignment = taRightJustify
                Caption = #26085#26399
              end
              object RzLabel3: TRzLabel
                Left = 200
                Top = 3
                Width = 12
                Height = 12
                Caption = #33267
              end
              object RzLabel5: TRzLabel
                Left = 57
                Top = 64
                Width = 24
                Height = 12
                Alignment = taRightJustify
                Caption = #21333#21495
              end
              object Label1: TLabel
                Left = 201
                Top = 66
                Width = 120
                Height = 12
                Caption = #25903#25345#27169#22359','#36755#21518'4'#20301#26597#35810
                Font.Charset = GB2312_CHARSET
                Font.Color = clNavy
                Font.Height = -12
                Font.Name = #23435#20307
                Font.Style = []
                ParentFont = False
              end
              object RzLabel6: TRzLabel
                Left = 45
                Top = 44
                Width = 36
                Height = 12
                Alignment = taRightJustify
                Caption = #30424#28857#20154
              end
              object Label40: TLabel
                Left = 33
                Top = 23
                Width = 48
                Height = 12
                Caption = #38376#24215#21517#31216
              end
              object D1: TcxDateEdit
                Left = 89
                Top = -1
                Width = 104
                Height = 20
                Properties.DateButtons = [btnToday]
                TabOrder = 0
              end
              object D2: TcxDateEdit
                Left = 216
                Top = -1
                Width = 109
                Height = 20
                Properties.DateButtons = [btnToday]
                TabOrder = 1
              end
              object fndPRINT_DATE: TcxTextEdit
                Left = 89
                Top = 59
                Width = 104
                Height = 20
                TabOrder = 2
              end
              object btnOk: TRzBitBtn
                Left = 480
                Top = 52
                Width = 67
                Height = 26
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
              object fndSTATUS: TcxRadioGroup
                Left = 360
                Top = -6
                Width = 105
                Height = 85
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
                TabOrder = 4
                Caption = ''
              end
              object fndCHECK_EMPL: TzrComboBoxList
                Left = 89
                Top = 39
                Width = 152
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
              object fndSHOP_ID: TzrComboBoxList
                Tag = -1
                Left = 89
                Top = 19
                Width = 236
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
                    FieldName = 'SHOP_ID'
                    Footers = <>
                    Title.Caption = #20195#30721
                    Width = 20
                  end>
                DropWidth = 236
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
            inherited DBGridEh1: TDBGridEh
              Top = 96
              Width = 847
              Height = 359
              OnDblClick = actInfoExecute
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'SEQNO'
                  Footers = <>
                  Title.Caption = #24207#21495
                  Width = 32
                end
                item
                  DisplayFormat = '0000-00-00'
                  EditButtons = <>
                  FieldName = 'PRINT_DATE'
                  Footers = <>
                  Title.Caption = #30424#28857#26085#26399
                  Width = 92
                end
                item
                  EditButtons = <>
                  FieldName = 'CREA_USER_TEXT'
                  Footers = <>
                  Title.Caption = #30424#28857#20154
                  Width = 71
                end
                item
                  EditButtons = <>
                  FieldName = 'CREA_DATE'
                  Footers = <>
                  Title.Caption = #36755#20837#26102#38388
                  Width = 155
                end
                item
                  EditButtons = <>
                  FieldName = 'CHECK_TYPE'
                  Footers = <>
                  Title.Caption = #30424#28857#31867#22411
                  Width = 81
                end
                item
                  EditButtons = <>
                  FieldName = 'CHECK_STATUS'
                  Footers = <>
                  Title.Caption = #29366#24577
                  Width = 54
                end
                item
                  EditButtons = <>
                  FieldName = 'CHK_USER_TEXT'
                  Footers = <>
                  Title.Caption = #23457#26680#20154
                  Width = 52
                end
                item
                  EditButtons = <>
                  FieldName = 'CHK_DATE'
                  Footers = <>
                  Title.Caption = #23457#26680#26085#26399
                  Width = 58
                end
                item
                  EditButtons = <>
                  FieldName = 'REMARK'
                  Footers = <>
                  Title.Caption = #22791#27880
                  Width = 273
                end>
            end
          end
        end
      end
    end
  end
  inherited RzPanel4: TRzPanel
    Width = 875
    inherited Image1: TImage
      Left = 741
      Width = 125
    end
    inherited Image14: TImage
      Left = 866
    end
    inherited Image3: TImage
      Left = 741
      Width = 125
    end
    inherited rzPanel5: TPanel
      inherited lblToolCaption: TRzLabel
        Width = 36
        Caption = #30424#28857#21333
      end
    end
    inherited CoolBar1: TCoolBar
      Width = 565
      Bands = <
        item
          Break = False
          Control = ToolBar1
          FixedSize = True
          ImageIndex = -1
          MinHeight = 565
          Width = 30
        end>
      inherited ToolBar1: TToolBar
        Width = 565
        object ToolButton11: TToolButton
          Left = 522
          Top = 0
          Action = actExit
        end
      end
    end
  end
  inherited mmMenu: TMainMenu
    Left = 184
    Top = 248
  end
  inherited actList: TActionList
    Left = 216
    Top = 248
    inherited actPreview: TAction
      Visible = False
    end
    inherited actInfo: TAction
      OnExecute = actInfoExecute
    end
  end
  inherited ppmReport: TPopupMenu
    Top = 72
  end
  inherited cdsList: TZQuery
    AfterScroll = cdsListAfterScroll
  end
end
