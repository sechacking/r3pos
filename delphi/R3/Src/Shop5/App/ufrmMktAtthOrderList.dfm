inherited frmMktAtthOrderList: TfrmMktAtthOrderList
  Left = 276
  Top = 145
  Caption = #38144#21806#38468#20214#21333
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited bgPanel: TRzPanel
    inherited RzPanel2: TRzPanel
      inherited RzPage: TRzPageControl
        FixedDimension = 25
        inherited TabSheet1: TRzTabSheet
          Caption = #38144#21806#38468#20214#21333#21015#34920
          inherited RzPanel3: TRzPanel
            inherited RzPanel1: TRzPanel
              Height = 110
              object RzLabel2: TRzLabel
                Left = 33
                Top = 4
                Width = 48
                Height = 12
                Alignment = taRightJustify
                Caption = #22635#25253#26085#26399
              end
              object RzLabel3: TRzLabel
                Left = 200
                Top = 4
                Width = 12
                Height = 12
                Caption = #33267
              end
              object RzLabel4: TRzLabel
                Left = 33
                Top = 65
                Width = 48
                Height = 12
                Alignment = taRightJustify
                Caption = #32463' '#38144' '#21830
              end
              object RzLabel5: TRzLabel
                Left = 33
                Top = 86
                Width = 48
                Height = 12
                Alignment = taRightJustify
                Caption = #30003#39046#21333#21495
              end
              object Label1: TLabel
                Left = 201
                Top = 87
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
                Top = 44
                Width = 48
                Height = 12
                Caption = #25152#23646#37096#38376
              end
              object Label40: TLabel
                Left = 33
                Top = 24
                Width = 48
                Height = 12
                Caption = #38376#24215#21517#31216
              end
              object D1: TcxDateEdit
                Left = 89
                Top = 0
                Width = 104
                Height = 20
                ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                Properties.DateButtons = [btnToday]
                TabOrder = 0
              end
              object D2: TcxDateEdit
                Left = 216
                Top = 0
                Width = 109
                Height = 20
                ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                Properties.DateButtons = [btnToday]
                TabOrder = 1
              end
              object fndCLIENT_ID: TzrComboBoxList
                Left = 89
                Top = 61
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
                Top = 82
                Width = 104
                Height = 20
                TabOrder = 3
                ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
              end
              object fndDEPT_ID: TzrComboBoxList
                Left = 89
                Top = 40
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
                Top = 76
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
                Top = 20
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
                Left = 328
                Top = 16
                Width = 129
                Height = 86
                ItemIndex = 0
                Properties.Columns = 2
                Properties.Items = <
                  item
                    Caption = #20840#37096
                  end
                  item
                    Caption = #24453#23457#26680
                  end
                  item
                    Caption = #24050#23457#26680
                  end
                  item
                    Caption = #26410#26680#38144
                  end
                  item
                    Caption = #24050#26680#38144
                  end>
                TabOrder = 7
                Caption = ''
              end
            end
            inherited DBGridEh1: TDBGridEh
              Top = 115
              Height = 306
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
                  Title.Caption = #38144#21806#21830
                  Width = 140
                end
                item
                  EditButtons = <>
                  FieldName = 'SHOP_ID_TEXT'
                  Footers = <>
                  Title.Caption = #38376#24215#21517#31216
                  Width = 120
                end
                item
                  EditButtons = <>
                  FieldName = 'DEPT_ID_TEXT'
                  Footers = <>
                  Title.Caption = #25152#23646#37096#38376
                  Width = 120
                end
                item
                  EditButtons = <>
                  FieldName = 'REQU_TYPE'
                  Footers = <>
                  Title.Caption = #36153#29992#31867#22411
                  Width = 60
                end
                item
                  EditButtons = <>
                  FieldName = 'KPI_MNY'
                  Footers = <>
                  Title.Caption = #36820#21033#37329#39069
                  Width = 60
                end
                item
                  EditButtons = <>
                  FieldName = 'REQU_USER_TEXT'
                  Footers = <>
                  Title.Caption = #22635#25253#20154
                  Width = 70
                end
                item
                  EditButtons = <>
                  FieldName = 'REQU_DATE'
                  Footers = <>
                  Title.Caption = #22635#25253#26085#26399
                  Width = 80
                end
                item
                  EditButtons = <>
                  FieldName = 'HEXIAO'
                  Footers = <>
                  Title.Caption = #26680#38144
                end
                item
                  EditButtons = <>
                  FieldName = 'REMARK'
                  Footers = <>
                  Title.Caption = #22791#27880
                  Width = 200
                end>
            end
          end
        end
      end
    end
  end
  inherited RzPanel4: TRzPanel
    inherited Image3: TImage
      Left = 581
      Width = 473
    end
    inherited rzPanel5: TPanel
      Left = 581
    end
    inherited CoolBar1: TCoolBar
      Width = 561
      Bands = <
        item
          Break = False
          Control = ToolBar1
          FixedSize = True
          ImageIndex = -1
          MinHeight = 561
          Width = 36
        end>
      inherited ToolBar1: TToolBar
        Width = 561
        object ToolButton11: TToolButton
          Left = 518
          Top = 0
          Action = actExit
        end
      end
    end
  end
  inherited mmMenu: TMainMenu
    Left = 768
    Top = 56
  end
  inherited actList: TActionList
    Left = 736
    Top = 56
    inherited actInfo: TAction
      OnExecute = actInfoExecute
    end
  end
  inherited dsList: TDataSource
    Left = 78
    Top = 280
  end
  inherited ppmReport: TPopupMenu
    Left = 798
    Top = 55
  end
  inherited cdsList: TZQuery
    Left = 46
    Top = 280
  end
  object frfMktAtthOrderList: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    OnGetValue = frfMktAtthOrderListGetValue
    Left = 112
    Top = 281
    ReportForm = {
      180000002A1D0000180000FFFF01000100FFFFFFFFFF00010000340800007805
      00002400000012000000240000001200000000FFFF00000000FFFF0000000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200D60000000B004D61737465724461746131000201000000
      00BE000000F6020000130000003000050001000000000000000000FFFFFF1F00
      0000000C0066724442446174615365743100000000000000FFFF000000000002
      000000010000000000000001000000C800000014000000010000000000000200
      520100000700B7D6D7E9CDB7310002010000000019000000F60200006D000000
      3200100001000000000000000000FFFFFF1F000000001500494E5428285B5345
      514E4F5D2D3129202F2031352900000000000000FFFF00000000000200000001
      0000000000000001000000C80000001400000001000000000000020039020000
      0700B7D6D7E9BDC5310002010000000012010000F60200004A00000030001100
      01000000000000000000FFFFFF1F000000000000000000000700050062656769
      6E0D1E0020696620436F756E74284D61737465724461746131293C3134207468
      656E0D060020626567696E0D260020202020666F7220693A3D436F756E74284D
      617374657244617461312920746F20313320646F0D15002020202053686F7742
      616E64284368696C6431293B0D050020656E643B0D0300656E6400FFFF000000
      000002000000010000000000000001000000C800000014000000010000000000
      0002009F02000006006368696C643100020100000000E8000000F60200001300
      00003000150001000000000000000000FFFFFF1F000000000000000000000000
      00FFFF000000000002000000010000000000000001000000C800000014000000
      0100000000000000002203000006004D656D6F33320002001702000032000000
      36000000120000000100000001000000000000000000FFFFFF1F2E0200000000
      0001000500B5A5BAC53A00000000FFFF00000000000200000001000000000400
      CBCECCE5000A000000020000000000110000008600020000000000FFFFFF0000
      000002000000000000000000AA03000006004D656D6F3134000200CB010000BE
      000000500000001300000001000F0001000000000000000000FFFFFF1F2E0200
      0000000001000A005B425544475F4D4E595D00000000FFFF0000000000020000
      0001000000000400CBCECCE5000A000000000000000000090000008600020000
      000000FFFFFF00000000020000000000000000003204000006004D656D6F3138
      0002001B020000BE000000500000001300000001000F00010000000000000000
      00FFFFFF1F2E02000000000001000A005B4147494F5F4D4E595D00000000FFFF
      00000000000200000001000000000400CBCECCE5000A00000000000000000009
      0000008600020000000000FFFFFF0000000002000000000000000000BB040000
      06004D656D6F323000020052000000BE000000B80000001300000001000F0001
      000000000000000000FFFFFF1F2E02000000000001000B005B474F44535F4E41
      4D455D00000000FFFF00000000000200000001000000000400CBCECCE5000A00
      0000000000000000080000008600020000000000FFFFFF000000000200000000
      00000000004805000005004D656D6F390002007B00000032000000DE00000012
      0000000100020001000000000000000000FFFFFF1F2E02000000000001001000
      5B434C49454E545F49445F544558545D00000000FFFF00000000000200000001
      000000000400CBCECCE5000A0000000000000000000800000086000200000000
      00FFFFFF0000000002000000000000000000D105000006004D656D6F34300002
      00A00100003200000076000000120000000100020001000000000000000000FF
      FFFF1F2E02000000000001000B005B524551555F444154455D00000000FFFF00
      000000000200000001000000000400CBCECCE5000A0000000000000000000800
      00008600020000000000FFFFFF00000000020000000000000000005A06000006
      004D656D6F32330002000A010000BE000000250000001300000001000F000100
      0000000000000000FFFFFF1F2E02000000000001000B005B554E49545F4E414D
      455D00000000FFFF00000000000200000001000000000400CBCECCE5000A0000
      00000000000000090000008600020000000000FFFFFF00000000020000000000
      00000000E206000006004D656D6F35380002004E020000320000006C00000012
      0000000100020001000000000000000000FFFFFF1F2E02000000000001000A00
      5B474C4944455F4E4F5D00000000FFFF00000000000200000001000000000400
      CBCECCE5000A000000000000000000080000008600020000000000FFFFFF0000
      0000020000000000000000006807000005004D656D6F330002007B010000BE00
      0000500000001300000001000F0001000000000000000000FFFFFF1F2E020000
      000000010009005B4B50495F4D4E595D00000000FFFF00000000000200000001
      000000000400CBCECCE5000A0000000000000000000900000086000200000000
      00FFFFFF0000000002000000000000000000F907000005004D656D6F32000200
      350000001900000085020000180000000100000001000000000000000500FFFF
      FF1F2E020000000000010014005BC6F3D2B5C3FBB3C65DCFFACADBB8BDBCFEB5
      A500000000FFFF00000000000200000001000000000400CBCECCE50010000000
      0200000000000A0000008600020000000000FFFFFF0000000002000000000000
      0000008008000006004D656D6F31320002003500000032000000460000001200
      00000100000001000000000000000000FFFFFF1F2E02000000000001000900BE
      AD20CFFA20C9CC3A00000000FFFF00000000000200000001000000000400CBCE
      CCE5000A000000020000000000080000008600020000000000FFFFFF00000000
      020000000000000000000809000006004D656D6F31330002005B010000320000
      0044000000120000000100000001000000000000000000FFFFFF1F2E02000000
      000001000A00CCEEB1A8C8D5C6DAA3BA00000000FFFF00000000000200000001
      000000000400CBCECCE5000A0000000200000000000800000086000200000000
      00FFFFFF00000000020000000000000000008E09000006004D656D6F33340002
      00CB01000070000000500000001600000001000F0001000000000000000000FF
      FFFF1F2E02000000000001000800CAD0B3A1B7D1D3C300000000FFFF00000000
      000200000001000000000400CBCECCE5000A0000000200000000000A00000086
      00020000000000FFFFFF0000000002000000000000000000140A000006004D65
      6D6F33360002005200000070000000B80000001600000001000F000100000000
      0000000000FFFFFF1F2E02000000000001000800C9CCC6B7C3FBB3C600000000
      FFFF00000000000200000001000000000400CBCECCE5000A0000000200000000
      000A0000008600020000000000FFFFFF00000000020000000000000000009A0A
      000006004D656D6F33370002007B01000070000000500000001600000001000F
      0001000000000000000000FFFFFF1F2E02000000000001000800CFFACADBB7B5
      C0FB00000000FFFF00000000000200000001000000000400CBCECCE5000A0000
      000200000000000A0000008600020000000000FFFFFF00000000020000000000
      000000001C0B000006004D656D6F33380002000A010000700000002500000016
      00000001000F0001000000000000000000FFFFFF1F2E02000000000001000400
      B5A5CEBB00000000FFFF00000000000200000001000000000400CBCECCE5000A
      0000000200000000000A0000008600020000000000FFFFFF0000000002000000
      000000000000F10B000006004D656D6F32350002003500000012010000B20100
      001300000001000E0001000000000000000000FFFFFF1F2E0200000000000100
      5700BACFBCC6BDF0B6EEA3BA5B536D616C6C546F426967285B524551555F4D4E
      595D295D2020A3A43A5B666F726D6174466C6F6174282723302E3030272C5B52
      4551555F4D4E595D295D20202020202020202020202020202000000000FFFF00
      000000000200000001000000000400CBCECCE5000A0000000200000000000800
      00008600020000000000FFFFFF0000000002000000000000000000770C000006
      004D656D6F34350002001B02000070000000500000001600000001000F000100
      0000000000000000FFFFFF1F2E02000000000001000800BCDBB8F1D6A7B3D600
      000000FFFF00000000000200000001000000000400CBCECCE5000A0000000200
      000000000A0000008600020000000000FFFFFF00000000020000000000000000
      00FC0C000006004D656D6F353400020035000000BE0000001D00000013000000
      01000F0001000000000000000000FFFFFF1F2E020000000000010007005B5345
      514E4F5D00000000FFFF00000000000200000001000000000400CBCECCE5000A
      0000000000000000000A0000008600020000000000FFFFFF0000000002000000
      0000000000007E0D000006004D656D6F353500020035000000700000001D0000
      001600000001000F0001000000000000000000FFFFFF1F2E0200000000000100
      0400D0F2BAC500000000FFFF00000000000200000001000000000400CBCECCE5
      000A0000000200000000000A0000008600020000000000FFFFFF000000000200
      0000000000000000140E000006004D656D6F32340002007A0200001900000056
      000000120000000100000001000000000000000000FFFFFF1F2E020000000000
      01001800B5DA5B50414745235D2F5B544F54414C50414745535DD2B300000000
      FFFF00000000000200000001000000000400CBCECCE5000A0000000000000000
      00090000008600020000000000FFFFFF0000000002000000000000000000A00E
      000006004D656D6F32360002007B00000046000000DE00000012000000010002
      0001000000000000000000FFFFFF1F2E02000000000001000E005B53484F505F
      49445F544558545D00000000FFFF00000000000200000001000000000400CBCE
      CCE5000A000000000000000000080000008600020000000000FFFFFF00000000
      02000000000000000000270F000006004D656D6F323700020035000000460000
      0046000000120000000100000001000000000000000000FFFFFF1F2E02000000
      000001000900C9EAB1A8C3C5B5EA3A00000000FFFF0000000000020000000100
      0000000400CBCECCE5000A000000020000000000080000008600020000000000
      FFFFFF0000000002000000000000000000B50F000006004D656D6F3238000200
      A00100004600000076000000120000000100020001000000000000000000FFFF
      FF1F2E020000000000010010005B524551555F545950455F544558545D000000
      00FFFF00000000000200000001000000000400CBCECCE5000A00000000000000
      0000080000008600020000000000FFFFFF00000000020000000000000000003C
      10000006004D656D6F32390002005A0100004600000046000000120000000100
      000001000000000000000000FFFFFF1F2E02000000000001000900B7D1D3C3C0
      E0D0CD3A00000000FFFF00000000000200000001000000000400CBCECCE5000A
      000000020000000000080000008600020000000000FFFFFF0000000002000000
      000000000000D110000005004D656D6F31000200370000002A0100007C000000
      140000000100000001000000000000000000FFFFFF1F2E020000000000010018
      00D6C6B5A5C8CBA3BA5B435245415F555345525F544558545D00000000010000
      000000000200000001000000000400CBCECCE5000A0000000200000000000800
      00008600020000000000FFFFFF0000000002000000000000000000B011000006
      004D656D6F3539000200C00200005C000000180000002A010000030000000100
      0000000000000000FFFFFF1F2E02000000000007000900B0D7C1AAB4E6B8F920
      0D00000D1E002020202020202020202020202020202020202020202020202020
      202020200D0C00BAECC1AABEADCFFAC9CC20200D00000D140020202020202020
      202020202020202020202020200D0800BBC6C1AABDE1CBE300000000FFFF0000
      0000000200000001000000000400CBCECCE5000A000000020000000000000000
      000100020000000000FFFFFF00000000020000000000000000002C1200000600
      4D656D6F3630000200CB010000E8000000500000001300000001000F00010000
      00000000000000FFFFFF1F2E020000000000000000000000FFFF000000000002
      00000001000000000400CBCECCE5000A00000000000000000009000000860002
      0000000000FFFFFF0000000002000000000000000000A812000006004D656D6F
      36310002001B020000E8000000500000001300000001000F0001000000000000
      000000FFFFFF1F2E020000000000000000000000FFFF00000000000200000001
      000000000400CBCECCE5000A0000000000000000000900000086000200000000
      00FFFFFF00000000020000000000000000002413000006004D656D6F36320002
      0052000000E8000000B80000001300000001000F0001000000000000000000FF
      FFFF1F2E020000000000000000000000FFFF0000000000020000000100000000
      0400CBCECCE5000A000000000000000000080000008600020000000000FFFFFF
      0000000002000000000000000000A013000006004D656D6F36330002000A0100
      00E8000000250000001300000001000F0001000000000000000000FFFFFF1F2E
      020000000000000000000000FFFF00000000000200000001000000000400CBCE
      CCE5000A0000000000000000000A0000008600020000000000FFFFFF00000000
      020000000000000000001C14000006004D656D6F36340002007B010000E80000
      00500000001300000001000F0001000000000000000000FFFFFF1F2E02000000
      0000000000000000FFFF00000000000200000001000000000400CBCECCE5000A
      000000000000000000090000008600020000000000FFFFFF0000000002000000
      0000000000009814000006004D656D6F363500020035000000E80000001D0000
      001300000001000F0001000000000000000000FFFFFF1F2E0200000000000000
      00000000FFFF00000000000200000001000000000400CBCECCE5000A00000000
      00000000000A0000008600020000000000FFFFFF000000000200000000000000
      00004A15000005004D656D6F35000200E701000012010000D400000013000000
      03000B0001000000000000000000FFFFFF1F2E02000000000001003500B1BED2
      B3D0A1BCC6A3BAA3A43A5B666F726D6174466C6F6174282723302E3030272C5B
      73756D285B524551555F4D4E595D295D295D00000000FFFF0000000000020000
      0001000000000400CBCECCE5000A000000000000000000090000000100020000
      000000FFFFFF0000000002000000000000000000D815000006004D656D6F3135
      0002004E020000460000006C0000001200000001000200010000000000000000
      00FFFFFF1F2E020000000000010010005B524551555F555345525F544558545D
      00000000FFFF00000000000200000001000000000400CBCECCE5000A00000000
      0000000000080000008600020000000000FFFFFF000000000200000000000000
      00005D16000006004D656D6F3136000200170200004600000036000000120000
      000100000001000000000000000000FFFFFF1F2E02000000000001000700CCEE
      B1A8C8CB3A00000000FFFF00000000000200000001000000000400CBCECCE500
      0A000000020000000000090000008600020000000000FFFFFF00000000020000
      00000000000000F016000005004D656D6F34000200370000004B010000140100
      00120000000300000001000000000000000000FFFFFF1F2E0200000000000100
      1600B4F2D3A1CAB1BCE43A5B444154455D205B54494D455D00000000FFFF0000
      0000000200000001000000000400CBCECCE5000A000000000000000000000000
      000100020000000000FFFFFF00000000020000000000000000007B1700000500
      4D656D6F360002007A0000005B0000009D000000120000000100020001000000
      000000000000FFFFFF1F2E02000000000001000E005B444550545F49445F5445
      58545D00000000FFFF00000000000200000001000000000400CBCECCE5000A00
      0000000000000000080000008600020000000000FFFFFF000000000200000000
      00000000000218000006004D656D6F3137000200350000005B00000046000000
      120000000100000001000000000000000000FFFFFF1F2E020000000000010009
      00CBF9CAF4B2BFC3C53A00000000FFFF00000000000200000001000000000400
      CBCECCE5000A000000020000000000080000008600020000000000FFFFFF0000
      0000020000000000000000009718000006004D656D6F3139000200C40000002A
      0100007C000000140000000100000001000000000000000000FFFFFF1F2E0200
      0000000001001700C9F3BACBC8CBA3BA5B43484B5F555345525F544558545D00
      000000010000000000000200000001000000000400CBCECCE5000A0000000200
      FFFFFF1F080000008600020000000000FFFFFF00000000020000000000000000
      001A19000006004D656D6F32310002001A0100005B0000002700000012000000
      0100000001000000000000000000FFFFFF1F2E02000000000001000500B1B8D7
      A23A00000000FFFF00000000000200000001000000000400CBCECCE5000A0000
      00020000000000080000008600020000000000FFFFFF00000000020000000000
      00000000A019000006004D656D6F3335000200410100005B0000007A01000012
      0000000100020001000000000000000000FFFFFF1F2E02000000000001000800
      5B52454D41524B5D00000000FFFF00000000000200000001000000000400CBCE
      CCE5000A000000000000000000080000008600020000000000FFFFFF00000000
      02000000000000000000251A000005004D656D6F370002006B02000070000000
      500000001600000001000F0001000000000000000000FFFFFF1F2E0200000000
      0001000800C6E4CBFCB7D1D3C300000000FFFF00000000000200000001000000
      000400CBCECCE5000A0000000200000000000A0000008600020000000000FFFF
      FF0000000002000000000000000000AC1A000005004D656D6F380002006B0200
      00BE000000500000001300000001000F0001000000000000000000FFFFFF1F2E
      02000000000001000A005B4F5448525F4D4E595D00000000FFFF000000000002
      00000001000000000400CBCECCE5000A00000000000000000009000000860002
      0000000000FFFFFF0000000002000000000000000000281B000006004D656D6F
      31300002006B020000E8000000500000001300000001000F0001000000000000
      000000FFFFFF1F2E020000000000000000000000FFFF00000000000200000001
      000000000400CBCECCE5000A0000000000000000000900000086000200000000
      00FFFFFF0000000002000000000000000000AE1B000006004D656D6F31310002
      002F010000700000004C0000001600000001000F0001000000000000000000FF
      FFFF1F2E02000000000001000800B7B5C0FBCAFDC1BF00000000FFFF00000000
      000200000001000000000400CBCECCE5000A0000000200000000000A00000086
      00020000000000FFFFFF0000000002000000000000000000341C000006004D65
      6D6F32320002002F010000BE0000004C0000001300000001000F000100000000
      0000000000FFFFFF1F2E020000000000010008005B414D4F554E545D00000000
      FFFF00000000000200000001000000000400CBCECCE5000A0000000000000000
      00090000008600020000000000FFFFFF0000000002000000000000000000B01C
      000006004D656D6F33300002002F010000E80000004C0000001300000001000F
      0001000000000000000000FFFFFF1F2E020000000000000000000000FFFF0000
      0000000200000001000000000400CBCECCE5000A000000000000000000090000
      008600020000000000FFFFFF000000000200000000000000FEFEFF060000000A
      00205661726961626C6573000000000200736C0014006364735F436867426F64
      792E22534C30303030220002006A650014006364735F436867426F64792E224A
      4530303030220004006B68796800000000040079687A68000000000200647A00
      0000000000000000000000FDFF0100000000}
  end
end
