inherited frmMktBudgOrderList: TfrmMktBudgOrderList
  Left = 225
  Top = 158
  Width = 942
  Height = 532
  Caption = #26680#38144#21333
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited bgPanel: TRzPanel
    Width = 934
    Height = 468
    inherited RzPanel2: TRzPanel
      Width = 924
      Height = 458
      inherited RzPage: TRzPageControl
        Width = 918
        Height = 452
        FixedDimension = 25
        inherited TabSheet1: TRzTabSheet
          Caption = #26680#38144#21333#21015#34920
          inherited RzPanel3: TRzPanel
            Width = 916
            Height = 425
            inherited RzPanel1: TRzPanel
              Width = 906
              Height = 116
              object RzLabel2: TRzLabel
                Left = 33
                Top = 8
                Width = 48
                Height = 12
                Alignment = taRightJustify
                Caption = #26680#38144#26085#26399
              end
              object RzLabel3: TRzLabel
                Left = 200
                Top = 8
                Width = 12
                Height = 12
                Caption = #33267
              end
              object RzLabel4: TRzLabel
                Left = 33
                Top = 69
                Width = 48
                Height = 12
                Alignment = taRightJustify
                Caption = #32463' '#38144' '#21830
              end
              object RzLabel5: TRzLabel
                Left = 33
                Top = 90
                Width = 48
                Height = 12
                Alignment = taRightJustify
                Caption = #26680#38144#21333#21495
              end
              object Label1: TLabel
                Left = 201
                Top = 91
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
              object Label3: TLabel
                Left = 33
                Top = 48
                Width = 48
                Height = 12
                Caption = #25152#23646#37096#38376
              end
              object Label40: TLabel
                Left = 33
                Top = 28
                Width = 48
                Height = 12
                Caption = #38376#24215#21517#31216
              end
              object D1: TcxDateEdit
                Left = 89
                Top = 4
                Width = 104
                Height = 20
                ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                Properties.DateButtons = [btnToday]
                TabOrder = 0
              end
              object D2: TcxDateEdit
                Left = 216
                Top = 4
                Width = 109
                Height = 20
                ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                Properties.DateButtons = [btnToday]
                TabOrder = 1
              end
              object fndCLIENT_ID: TzrComboBoxList
                Left = 89
                Top = 65
                Width = 236
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
                FilterFields = 'CLIENT_CODE;CLIENT_NAME;CLIENT_SPELL'
                KeyField = 'CLIENT_ID'
                ListField = 'CLIENT_NAME'
                Columns = <
                  item
                    EditButtons = <>
                    FieldName = 'CLIENT_CODE'
                    Footers = <>
                    Title.Caption = #20195#30721
                    Width = 60
                  end
                  item
                    EditButtons = <>
                    FieldName = 'CLIENT_NAME'
                    Footers = <>
                    Title.Caption = #20379#24212#21830#21517#31216
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
                DropWidth = 236
                DropHeight = 180
                ShowTitle = True
                AutoFitColWidth = False
                ShowButton = True
                LocateStyle = lsDark
                Buttons = [zbClear]
                DropListStyle = lsFixed
                MultiSelect = False
              end
              object fndGLIDE_NO: TcxTextEdit
                Left = 89
                Top = 86
                Width = 104
                Height = 20
                TabOrder = 3
                ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
              end
              object fndDEPT_ID: TzrComboBoxList
                Left = 89
                Top = 44
                Width = 236
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
                ShowButton = True
                LocateStyle = lsDark
                Buttons = [zbClear]
                DropListStyle = lsFixed
                MultiSelect = False
              end
              object btnOk: TRzBitBtn
                Left = 480
                Top = 80
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
                TabOrder = 5
                TextStyle = tsRaised
                ThemeAware = False
                ImageIndex = 12
                NumGlyphs = 2
                Spacing = 5
              end
              object fndSHOP_ID: TzrComboBoxList
                Tag = -1
                Left = 89
                Top = 24
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
              object fndSTATUS: TcxRadioGroup
                Left = 344
                Top = 20
                Width = 113
                Height = 86
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
                TabOrder = 7
                Caption = ''
              end
            end
            inherited DBGridEh1: TDBGridEh
              Top = 121
              Width = 906
              OnDblClick = DBGridEh1DblClick
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'SEQNO'
                  Footers = <>
                  Title.Caption = #24207#21495
                  Width = 40
                end
                item
                  EditButtons = <>
                  FieldName = 'GLIDE_NO'
                  Footers = <>
                  Title.Caption = #27969#27700#21495
                  Width = 100
                end
                item
                  EditButtons = <>
                  FieldName = 'CLIENT_ID_TEXT'
                  Footers = <>
                  Title.Caption = #32463#38144#21830
                  Width = 200
                end
                item
                  EditButtons = <>
                  FieldName = 'SHOP_ID_TEXT'
                  Footers = <>
                  Title.Caption = #38376#24215#21517#31216
                  Width = 150
                end
                item
                  EditButtons = <>
                  FieldName = 'DEPT_ID_TEXT'
                  Footers = <>
                  Title.Caption = #26680#38144#37096#38376
                  Width = 100
                end
                item
                  DisplayFormat = '0000-00-00'
                  EditButtons = <>
                  FieldName = 'BUDG_DATE'
                  Footers = <>
                  Title.Caption = #26680#38144#26085#26399
                  Width = 80
                end
                item
                  DisplayFormat = '#0.00'
                  EditButtons = <>
                  FieldName = 'BUDG_VRF'
                  Footers = <>
                  Title.Caption = #26680#38144#37329#39069
                  Width = 80
                end
                item
                  EditButtons = <>
                  FieldName = 'BUDG_USER_TEXT'
                  Footers = <>
                  Title.Caption = #26680#38144#20154
                  Width = 80
                end
                item
                  EditButtons = <>
                  FieldName = 'REMARK'
                  Footers = <>
                  Title.Caption = #22791#27880
                  Width = 200
                end
                item
                  EditButtons = <>
                  FieldName = 'CREA_DATE'
                  Footers = <>
                  Title.Caption = #25805#20316#26102#38388
                  Width = 100
                end
                item
                  EditButtons = <>
                  FieldName = 'CREA_USER_TEXT'
                  Footers = <>
                  Title.Caption = #25805#20316#20154#21592
                  Width = 80
                end>
            end
          end
        end
      end
    end
  end
  inherited RzPanel4: TRzPanel
    Width = 934
    inherited Image3: TImage
      Left = 579
      Width = 315
    end
    inherited Image14: TImage
      Left = 914
    end
    inherited Image1: TImage
      Left = 894
    end
    inherited rzPanel5: TPanel
      Left = 579
    end
    inherited CoolBar1: TCoolBar
      Width = 559
      Bands = <
        item
          Break = False
          Control = ToolBar1
          FixedSize = True
          ImageIndex = -1
          MinHeight = 559
          Width = 48
        end>
      inherited ToolBar1: TToolBar
        Width = 559
        object ToolButton15: TToolButton
          Left = 516
          Top = 0
          Action = actExit
        end
      end
    end
  end
  inherited mmMenu: TMainMenu
    Left = 240
    Top = 230
  end
  inherited actList: TActionList
    Left = 272
    Top = 230
    inherited actInfo: TAction
      OnExecute = actInfoExecute
    end
  end
  inherited cdsList: TZQuery
    AfterScroll = cdsListAfterScroll
  end
  object frfMktBudgOrder: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    OnGetValue = frfMktBudgOrderGetValue
    OnUserFunction = frfMktBudgOrderUserFunction
    Left = 416
    Top = 241
    ReportForm = {
      180000003B190000180000FFFF01000100FFFFFFFFFF00010000340800007805
      00002400000012000000240000001200000000FFFF00000000FFFF0000000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200D60000000B004D61737465724461746131000201000000
      00A4000000F6020000130000003000050001000000000000000000FFFFFF1F00
      0000000C0066724442446174615365743100000000000000FFFF000000000002
      000000010000000000000001000000C800000014000000010000000000000200
      500100000700B7D6D7E9CDB7310002010000000019000000F60200006D000000
      3200100001000000000000000000FFFFFF1F000000001300696E7428285B5345
      514E4F5D2D31292F31352900000000000000FFFF000000000002000000010000
      000000000001000000C800000014000000010000000000000200370200000700
      B7D6D7E9BDC5310002010000000012010000F602000045000000300011000100
      0000000000000000FFFFFF1F0000000000000000000007000500626567696E0D
      1E0020696620436F756E74284D61737465724461746131293C3135207468656E
      0D060020626567696E0D260020202020666F7220693A3D436F756E74284D6173
      74657244617461312920746F20313420646F0D15002020202053686F7742616E
      64284368696C6431293B0D050020656E643B0D0300656E6400FFFF0000000000
      02000000010000000000000001000000C8000000140000000100000000000002
      009D02000006006368696C643100020100000000CC000000F602000013000000
      3000150001000000000000000000FFFFFF1F00000000000000000000000000FF
      FF000000000002000000010000000000000001000000C8000000140000000100
      000000000000004403000006004D656D6F31340002008A010000A40000004200
      00001300000001000F0001000000000000000000FFFFFF1F2E02000000000001
      0029005B466F726D6174466C6F6174282723302E303023272C5B44455441494C
      5F425544475F5652465D295D00000000FFFF0000000000020000000100000000
      0400CBCECCE5000A000000000000000000090000008600020000000000FFFFFF
      0000000002000000000000000000D103000006004D656D6F3138000200CC0100
      00A4000000E90000001300000001000F0001000000000000000000FFFFFF1F2E
      02000000000001000F005B44455441494C5F52454D41524B5D00000000FFFF00
      000000000200000001000000000400CBCECCE5000A0000000000000000000800
      00008600020000000000FFFFFF00000000020000000000000000005F04000006
      004D656D6F3230000200FE000000A40000008C0000001300000001000F000100
      0000000000000000FFFFFF1F2E020000000000010010005B4143544956455F49
      445F544558545D00000000FFFF00000000000200000001000000000400CBCECC
      E5000A000000000000000000080000008600020000000000FFFFFF0000000002
      000000000000000000EC04000005004D656D6F390002007400000033000000EF
      000000120000000100020001000000000000000000FFFFFF1F2E020000000000
      010010005B434C49454E545F49445F544558545D00000000FFFF000000000002
      00000001000000000400CBCECCE5000A00000000000000000008000000860002
      0000000000FFFFFF00000000020000000000000000007505000006004D656D6F
      34300002009A0100003300000076000000120000000100020001000000000000
      000000FFFFFF1F2E02000000000001000B005B425544475F444154455D000000
      00FFFF00000000000200000001000000000400CBCECCE5000A00000000000000
      0000080000008600020000000000FFFFFF0000000002000000000000000000FC
      05000006004D656D6F31320002002E0000003300000046000000120000000100
      000001000000000000000000FFFFFF1F2E02000000000001000900BEAD20CFFA
      20C9CC3A00000000FFFF00000000000200000001000000000400CBCECCE5000A
      000000020000000000090000008600020000000000FFFFFF0000000002000000
      0000000000007F06000006004D656D6F31330002006401000033000000350000
      00120000000100000001000000000000000000FFFFFF1F2E0200000000000100
      0500C8D5C6DA3A00000000FFFF00000000000200000001000000000400CBCECC
      E5000A000000020000000000110000008600020000000000FFFFFF0000000002
      0000000000000000000507000006004D656D6F33340002008A01000070000000
      420000001600000001000F0001000000000000000000FFFFFF1F2E0200000000
      0001000800BBEEB6AFB7D1D3C300000000FFFF00000000000200000001000000
      000400CBCECCE5000A0000000200000000000A0000008600020000000000FFFF
      FF00000000020000000000000000008B07000006004D656D6F3336000200FE00
      0000700000008C0000001600000001000F0001000000000000000000FFFFFF1F
      2E02000000000001000800BBEEB6AFC3FBB3C600000000FFFF00000000000200
      000001000000000400CBCECCE5000A0000000200000000000A00000086000200
      00000000FFFFFF00000000020000000000000000002108000006004D656D6F34
      3100020030000000290100008100000012000000010000000100000000000000
      0000FFFFFF1F2E02000000000001001800D6C6B5A5C8CBA3BA5B435245415F55
      5345525F544558545D00000000FFFF00000000000200000001000000000400CB
      CECCE5000A000000020000000000080000008600020000000000FFFFFF000000
      0002000000000000000000A308000006004D656D6F3435000200CC0100007000
      0000E90000001600000001000F0001000000000000000000FFFFFF1F2E020000
      00000001000400B1B8D7A200000000FFFF000000000002000000010000000004
      00CBCECCE5000A0000000200000000000A0000008600020000000000FFFFFF00
      000000020000000000000000002809000006004D656D6F35340002002F000000
      A40000001B0000001300000001000F0001000000000000000000FFFFFF1F2E02
      0000000000010007005B5345514E4F5D00000000FFFF00000000000200000001
      000000000400CBCECCE5000A0000000000000000000A00000086000200000000
      00FFFFFF0000000002000000000000000000A709000006004D656D6F35350002
      002F000000700000001B0000001600000001000F0001000000000000000000FF
      FFFF1F2E020000000000010001004100000000FFFF0000000000020000000100
      0000000400CBCECCE5000A0000000200000000000A0000008600020000000000
      FFFFFF00000000020000000000000000002C0A000005004D656D6F370002004A
      00000070000000B40000001600000001000F0001000000000000000000FFFFFF
      1F2E02000000000001000800D6B8B1EAC3FBB3C600000000FFFF000000000002
      00000001000000000400CBCECCE5000A0000000200000000000A000000010002
      0000000000FFFFFF0000000002000000000000000000B60A000005004D656D6F
      380002004A000000A4000000B40000001300000001000F000100000000000000
      0000FFFFFF1F2E02000000000001000D005B4B50495F49445F544558545D0000
      0000FFFF00000000000200000001000000000400CBCECCE5000A000000000000
      000000080000000100020000000000FFFFFF0000000002000000000000000000
      6D0B000006004D656D6F3131000200E501000012010000D00000001300000001
      000B0001000000000000000000FFFFFF1F2E02000000000001003900B1BED2B3
      D0A1BCC6A3BAA3A45B666F726D6174466C6F6174282723302E3030272C73756D
      285B44455441494C5F425544475F5652465D29295D00000000FFFF0000000000
      0200000001000000000400CBCECCE5000A000000000000000000090000008600
      020000000000FFFFFF0000000002000000000000000000F50B000006004D656D
      6F31360002002F000000120100004A0000001300000001000E00010000000000
      00000000FFFFFF1F2E02000000000001000A00BACFBCC6BDF0B6EEA3BA000000
      00FFFF00000000000200000001000000000400CBCECCE5000A00000002000000
      00000A0000008600020000000000FFFFFF000000000200000000000000000078
      0C000006004D656D6F3332000200100200003300000037000000120000000100
      000001000000000000000000FFFFFF1F2E02000000000001000500B5A5BAC53A
      00000000FFFF00000000000200000001000000000400CBCECCE5000A00000002
      0000000000090000008600020000000000FFFFFF000000000200000000000000
      0000000D000006004D656D6F353800020047020000330000006E000000120000
      000100020001000000000000000000FFFFFF1F2E02000000000001000A005B47
      4C4944455F4E4F5D00000000FFFF00000000000200000001000000000400CBCE
      CCE5000A000000000000000000000000008600020000000000FFFFFF00000000
      020000000000000000008D0D000005004D656D6F320002002F00000019000000
      86020000180000000100000001000000000000000500FFFFFF1F2E0200000000
      00010010005BC6F3D2B5C3FBB3C65DBACBCFFAB5A500000000FFFF0000000000
      0200000001000000000400CBCECCE500100000000200000000000A0000008600
      020000000000FFFFFF0000000002000000000000000000230E000006004D656D
      6F32340002005B0200001B0000007A0000000F00000001000000010000000000
      00000000FFFFFF1F2E02000000000001001800B5DA5B50414745235D2F5B544F
      54414C50414745535DD2B300000000FFFF000000000002000000010000000004
      00CBCECCE5000A000000000000000000090000008600020000000000FFFFFF00
      00000002000000000000000000B70E000005004D656D6F31000200C800000028
      01000080000000140000000100000001000000000000000000FFFFFF1F2E0200
      0000000001001700C9F3BACBC8CBA3BA5B43484B5F555345525F544558545D00
      000000010000000000000200000001000000000400CBCECCE5000A0000000200
      FFFFFF1F080000008600020000000000FFFFFF00000000020000000000000000
      008C0F000006004D656D6F343300020079000000120100006D01000013000000
      01000A0001000000000000000000FFFFFF1F2E020000000000010057005B536D
      616C6C546F426967285B666F726D6174466C6F6174282723302E3030272C5B42
      5544475F5652465D295D295D20A3A4A3BA5B666F726D6174466C6F6174282723
      302E303023272C5B425544475F5652465D295D2000000000FFFF000000000002
      00000001000000000400CBCECCE5000A00000000000000000008000000860002
      0000000000FFFFFF00000000020000000000000000001310000006004D656D6F
      33310002002D0000004700000048000000120000000300000001000000000000
      000000FFFFFF1F2E02000000000001000900BACBCFFAC3C5B5EA3A00000000FF
      FF00000000000200000001000000000400CBCECCE5000A000000020000000000
      090000000100020000000000FFFFFF00000000020000000000000000009F1000
      0006004D656D6F35300002007300000047000000F10000001200000003000200
      01000000000000000000FFFFFF1F2E02000000000001000E005B53484F505F49
      445F544558545D00000000FFFF00000000000200000001000000000400CBCECC
      E5000A000000000000000000080000000100020000000000FFFFFF0000000002
      0000000000000000002411000006004D656D6F35360002006401000047000000
      36000000120000000300000001000000000000000000FFFFFF1F2E0200000000
      0001000700BACBCFFAC8CB3A00000000FFFF0000000000020000000100000000
      0400CBCECCE5000A000000020000000000110000000100020000000000FFFFFF
      0000000002000000000000000000B211000006004D656D6F35370002009B0100
      004700000074000000120000000300020001000000000000000000FFFFFF1F2E
      020000000000010010005B425544475F555345525F544558545D00000000FFFF
      00000000000200000001000000000400CBCECCE5000A00000000000000000008
      0000000100020000000000FFFFFF00000000020000000000000000002E120000
      06004D656D6F36300002008A010000CC000000420000001300000001000F0001
      000000000000000000FFFFFF1F2E020000000000000000000000FFFF00000000
      000200000001000000000400CBCECCE5000A0000000000000000000900000086
      00020000000000FFFFFF0000000002000000000000000000AA12000006004D65
      6D6F3631000200CC010000CC000000E90000001300000001000F000100000000
      0000000000FFFFFF1F2E020000000000000000000000FFFF0000000000020000
      0001000000000400CBCECCE5000A000000000000000000090000008600020000
      000000FFFFFF00000000020000000000000000002613000006004D656D6F3632
      000200FE000000CC0000008C0000001300000001000F00010000000000000000
      00FFFFFF1F2E020000000000000000000000FFFF000000000002000000010000
      00000400CBCECCE5000A000000000000000000080000008600020000000000FF
      FFFF0000000002000000000000000000A413000006004D656D6F36350002002F
      000000CC0000001B0000001300000001000F0001000000000000000000FFFFFF
      1F2E0200000000000100000000000000FFFF0000000000020000000100000000
      0400CBCECCE5000A0000000000000000000A0000008600020000000000FFFFFF
      00000000020000000000000000002214000006004D656D6F36360002004A0000
      00CC000000B40000001300000001000F0001000000000000000000FFFFFF1F2E
      0200000000000100000000000000FFFF00000000000200000001000000000400
      CBCECCE5000A000000000000000000080000000100020000000000FFFFFF0000
      0000020000000000000000000115000006004D656D6F3638000200C002000061
      000000140000002E0100000300000001000000000000000000FFFFFF1F2E0200
      0000000007000900B0D7C1AAB4E6B8F9200D00000D1E00202020202020202020
      2020202020202020202020202020202020202020200D0C00BAECC1AABEADCFFA
      C9CC20200D00000D140020202020202020202020202020202020202020200D08
      00BBC6C1AABDE1CBE300000000FFFF00000000000200000001000000000400CB
      CECCE5000A000000020000000000000000000100020000000000FFFFFF000000
      00020000000000000000008615000006004D656D6F3130000200100200004700
      000036000000120000000300000001000000000000000000FFFFFF1F2E020000
      00000001000700C9EAC1ECBAC53A00000000FFFF000000000002000000010000
      00000400CBCECCE5000A000000020000000000090000000100020000000000FF
      FFFF00000000020000000000000000001216000006004D656D6F313500020047
      020000470000006E000000120000000300020001000000000000000000FFFFFF
      1F2E02000000000001000E005B524551555F49445F544558545D00000000FFFF
      00000000000200000001000000000400CBCECCE5000A00000000000000000008
      0000000100020000000000FFFFFF000000000200000000000000000098160000
      05004D656D6F34000200310000005B0000004400000012000000030000000100
      0000000000000000FFFFFF1F2E02000000000001000900BACBCFFAB2BFC3C53A
      00000000FFFF00000000000200000001000000000400CBCECCE5000A00000002
      0000000000090000000100020000000000FFFFFF000000000200000000000000
      00002317000005004D656D6F36000200720000005B000000F300000012000000
      0300020001000000000000000000FFFFFF1F2E02000000000001000E005B4445
      50545F49445F544558545D00000000FFFF000000000002000000010000000004
      00CBCECCE5000A000000000000000000080000000100020000000000FFFFFF00
      00000002000000000000000000A617000006004D656D6F313700020064010000
      5B00000036000000120000000300000001000000000000000000FFFFFF1F2E02
      000000000001000500B1B8D7A23A00000000FFFF000000000002000000010000
      00000400CBCECCE5000A000000020000000000090000000100020000000000FF
      FFFF00000000020000000000000000002C18000006004D656D6F31390002009B
      0100005B0000001A010000120000000300020001000000000000000000FFFFFF
      1F2E020000000000010008005B52454D41524B5D00000000FFFF000000000002
      00000001000000000400CBCECCE5000A00000000000000000008000000010002
      0000000000FFFFFF0000000002000000000000000000C118000006004D656D6F
      3235000200300000004101000088010000120000000300000001000000000000
      000000FFFFFF1F2E02000000000001001600B4F2D3A1CAB1BCE43A5B44415445
      5D205B54494D455D00000000FFFF000000000002000000010000000005004172
      69616C000A000000000000000000000000000100020000000000FFFFFF000000
      000200000000000000FEFEFF060000000A00205661726961626C657300000000
      0200736C0014006364735F436867426F64792E22534C30303030220002006A65
      0014006364735F436867426F64792E224A4530303030220004006B6879680000
      0000040079687A68000000000200647A000000000000000000000000FDFF0100
      000000}
  end
end
