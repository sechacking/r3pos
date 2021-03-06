inherited frmIoroOrderList: TfrmIoroOrderList
  Left = 244
  Top = 145
  Width = 818
  Height = 569
  Caption = #20854#20182#36153#29992
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  inherited bgPanel: TRzPanel
    Width = 802
    Height = 494
    inherited RzPanel2: TRzPanel
      Width = 792
      Height = 484
      inherited RzPage: TRzPageControl
        Width = 786
        Height = 478
        FixedDimension = 25
        inherited TabSheet1: TRzTabSheet
          Caption = #25910#20837#20973#35777#26597#35810
          inherited RzPanel3: TRzPanel
            Width = 784
            Height = 451
            BorderInner = fsStatus
            object RzPanel1: TRzPanel
              Left = 6
              Top = 6
              Width = 772
              Height = 97
              Align = alTop
              BorderOuter = fsNone
              BorderColor = clWhite
              BorderWidth = 5
              Color = clWhite
              TabOrder = 0
              object RzLabel2: TRzLabel
                Left = 48
                Top = 11
                Width = 24
                Height = 12
                Alignment = taRightJustify
                Caption = #26085#26399
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
                Top = 74
                Width = 36
                Height = 12
                Alignment = taRightJustify
                Caption = #32463#25163#20154
              end
              object Label17: TLabel
                Left = 24
                Top = 53
                Width = 48
                Height = 12
                Alignment = taRightJustify
                Caption = #23458#25143#21517#31216
              end
              object Label40: TLabel
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
                ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                Properties.DateButtons = [btnToday]
                TabOrder = 0
              end
              object P1_D2: TcxDateEdit
                Left = 205
                Top = 7
                Width = 98
                Height = 20
                ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                Properties.DateButtons = [btnToday]
                TabOrder = 1
              end
              object btnOk: TRzBitBtn
                Left = 443
                Top = 57
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
              object fndSTATUS: TcxRadioGroup
                Left = 316
                Top = 2
                Width = 105
                Height = 87
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
              object fndIORO_USER: TzrComboBoxList
                Left = 80
                Top = 70
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
              object fndCLIENT_ID: TzrComboBoxList
                Left = 80
                Top = 49
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
                DropWidth = 296
                DropHeight = 220
                ShowTitle = True
                AutoFitColWidth = False
                ShowButton = True
                LocateStyle = lsDark
                Buttons = [zbClear]
                DropListStyle = lsFixed
                MultiSelect = False
              end
              object fndSHOP_ID: TzrComboBoxList
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
                    FieldName = 'SEQ_NO'
                    Footers = <>
                    Title.Caption = #24207#21495
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
            end
            object Panel1: TPanel
              Left = 6
              Top = 103
              Width = 772
              Height = 342
              Align = alClient
              Caption = 'Panel1'
              TabOrder = 1
              object DBGridEh1: TDBGridEh
                Left = 1
                Top = 1
                Width = 770
                Height = 340
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
                FrozenCols = 1
                ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
                Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                OptionsEh = [dghFixed3D, dghFrozen3D, dghHighlightFocus, dghClearSelection]
                ReadOnly = True
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
                OnDblClick = DBGridEh1DblClick
                OnDrawColumnCell = DBGridEh1DrawColumnCell
                OnGetCellParams = DBGridEh1GetCellParams
                Columns = <
                  item
                    Color = clBtnFace
                    EditButtons = <>
                    FieldName = 'SEQNO'
                    Footers = <>
                    Title.Caption = #24207#21495
                    Width = 31
                  end
                  item
                    DisplayFormat = '0000-00-00'
                    EditButtons = <>
                    FieldName = 'IORO_DATE'
                    Footers = <>
                    Title.Caption = #26085#26399
                    Width = 75
                  end
                  item
                    EditButtons = <>
                    FieldName = 'GLIDE_NO'
                    Footer.Value = #21512'   '#35745#65306
                    Footer.ValueType = fvtStaticText
                    Footers = <>
                    Title.Caption = #21333#21495
                    Width = 95
                  end
                  item
                    EditButtons = <>
                    FieldName = 'CLIENT_ID_TEXT'
                    Footers = <>
                    Title.Caption = #24448#26469#21333#20301
                    Width = 145
                  end
                  item
                    EditButtons = <>
                    FieldName = 'ITEM_ID_TEXT'
                    Footers = <>
                    Title.Caption = #31185#30446#21517#31216
                    Width = 79
                  end
                  item
                    EditButtons = <>
                    FieldName = 'IORO_USER_TEXT'
                    Footers = <>
                    Title.Caption = #36127#36131#20154
                    Width = 69
                  end
                  item
                    EditButtons = <>
                    FieldName = 'IORO_MNY'
                    Footers = <>
                    Title.Caption = #37329#39069
                    Width = 71
                  end
                  item
                    EditButtons = <>
                    FieldName = 'REMARK'
                    Footers = <>
                    Title.Caption = #35828#26126
                    Width = 161
                  end
                  item
                    Alignment = taRightJustify
                    EditButtons = <>
                    FieldName = 'CHK_USER_TEXT'
                    Footers = <>
                    Title.Caption = #23457#26680#20154
                    Width = 75
                  end
                  item
                    EditButtons = <>
                    FieldName = 'CHK_DATE'
                    Footers = <>
                    Title.Caption = #23457#26680#26085#26399
                    Width = 72
                  end
                  item
                    EditButtons = <>
                    FieldName = 'CREA_USER_TEXT'
                    Footers = <>
                    Title.Caption = #21046#21333#20154
                    Width = 56
                  end
                  item
                    EditButtons = <>
                    FieldName = 'CREA_DATE'
                    Footers = <>
                    Title.Caption = #21046#21333#26085#26399
                    Width = 118
                  end>
              end
            end
          end
        end
      end
    end
  end
  inherited RzPanel4: TRzPanel
    Width = 802
    inherited Image3: TImage
      Left = 374
      Width = 0
    end
    inherited Image14: TImage
      Left = 782
    end
    inherited Image1: TImage
      Left = 366
      Width = 416
    end
    inherited rzPanel5: TPanel
      Left = 374
      inherited lblToolCaption: TRzLabel
        Width = 48
        Caption = #20854#20182#36153#29992
      end
    end
    inherited CoolBar1: TCoolBar
      Width = 354
      Bands = <
        item
          Break = False
          Control = ToolBar1
          FixedSize = True
          ImageIndex = -1
          MinHeight = 354
          Width = 48
        end>
      inherited ToolBar1: TToolBar
        Width = 354
        ButtonWidth = 43
        object ToolButton2: TToolButton
          Left = 0
          Top = 0
          Action = actNew
        end
        object ToolButton4: TToolButton
          Left = 43
          Top = 0
          Action = actEdit
          Caption = #20462#25913
        end
        object ToolButton1: TToolButton
          Left = 86
          Top = 0
          Action = actInfo
          Caption = #35814#32454
        end
        object ToolButton5: TToolButton
          Left = 129
          Top = 0
          Action = actDelete
        end
        object ToolButton7: TToolButton
          Left = 172
          Top = 0
          Width = 10
          Caption = 'ToolButton7'
          ImageIndex = 3
          Style = tbsDivider
        end
        object ToolButton8: TToolButton
          Left = 182
          Top = 0
          Action = actAudit
        end
        object ToolButton3: TToolButton
          Left = 225
          Top = 0
          Action = actPrint
        end
        object ToolButton6: TToolButton
          Left = 268
          Top = 0
          Action = actPreview
        end
        object ToolButton10: TToolButton
          Left = 311
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
      OnExecute = actNewExecute
    end
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
    inherited actPreview: TAction
      OnExecute = actPreviewExecute
    end
    inherited actFind: TAction
      OnExecute = actFindExecute
    end
    inherited actInfo: TAction
      OnExecute = actInfoExecute
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
  object frfIoroOrder: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    OnGetValue = frfIoroOrderGetValue
    OnUserFunction = frfIoroOrderUserFunction
    Left = 176
    Top = 185
    ReportForm = {
      1800000049190000180000FFFF01000100FFFFFFFFFF00010000340800007805
      00002400000012000000240000001200000000FFFF00000000FFFF0000000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200D60000000B004D61737465724461746131000201000000
      00E6000000F6020000140000003000050001000000000000000000FFFFFF1F00
      0000000C0066724442446174615365743100000000000000FFFF000000000002
      000000010000000000000001000000C800000014000000010000000000000200
      500100000700B7D6D7E9CDB7310002010000000018000000F602000082000000
      3200100001000000000000000000FFFFFF1F000000001300696E7428285B5345
      514E4F5D2D31292F31332900000000000000FFFF000000000002000000010000
      000000000001000000C8000000140000000100000000000002003A0200000700
      B7D6D7E9BDC531000201000000006C010000F602000047000000300011000100
      0000000000000000FFFFFF1F0000000000000000000008000500626567696E0D
      1E0020696620436F756E74284D61737465724461746131293C3132207468656E
      0D060020626567696E0D260020202020666F7220693A3D436F756E74284D6173
      74657244617461312920746F20313120646F0D15002020202053686F7742616E
      64284368696C6431293B0D050020656E643B0D00000D0300656E6400FFFF0000
      00000002000000010000000000000001000000C8000000140000000100000000
      00000200A002000006004368696C64310002010000000014010000F602000014
      0000003000150001000000000000000000FFFFFF1F0000000000000000000000
      00000100000000000002000000010000000000000001000000C8000000140000
      000100000000000000002B03000005004D656D6F390002007B0000004F000000
      E0000000120000000300020001000000000000000000FFFFFF1F2E0200000000
      0001000E005B4954454D5F49445F544558545D00000000FFFF00000000000200
      000001000000000400CBCECCE5000A0000000000000000000800000086000200
      00000000FFFFFF0000000002000000000000000000B303000006004D656D6F35
      380002004C020000380000007300000012000000030002000100000000000000
      0000FFFFFF1F2E02000000000001000A005B474C4944455F4E4F5D00000000FF
      FF00000000000200000001000000000400CBCECCE5000A000000000000000000
      000000008600020000000000FFFFFF0000000002000000000000000000490400
      0005004D656D6F320002003A0000001D00000081020000180000000300000001
      000000000000000500FFFFFF1F2E020000000000010019005BC6F3D2B5C3FBB3
      C65DC6E4CBFB5B434F44455F4E414D455D00000000FFFF000000000002000000
      01000000000400CBCECCE500100000000200000000000A000000860002000000
      0000FFFFFF0000000002000000000000000000D004000006004D656D6F313200
      0200390000004F00000046000000120000000300000001000000000000000000
      FFFFFF1F2E02000000000001000900BFC6C4BFC3FBB3C63A00000000FFFF0000
      0000000200000001000000000400CBCECCE5000A0000000200000000000A0000
      008600020000000000FFFFFF0000000002000000000000000000580500000600
      4D656D6F33320002000802000038000000440000001200000003000000010000
      00000000000000FFFFFF1F2E02000000000001000A00CAD5D6A7B5A5BAC5A3BA
      00000000FFFF00000000000200000001000000000400CBCECCE5000A00000002
      0000000000080000008600020000000000FFFFFF000000000200000000000000
      0000DA05000006004D656D6F3336000200A00100007F000000BB0000001B0000
      0003000F0001000000000000000000FFFFFF1F2E02000000000001000400D5AA
      D2AA00000000FFFF00000000000200000001000000000400CBCECCE5000A0000
      000200000000000A0000008600020000000000FFFFFF00000000020000000000
      000000005C06000006004D656D6F3337000200310100007F0000006F0000001B
      00000003000F0001000000000000000000FFFFFF1F2E02000000000001000400
      BDF0B6EE00000000FFFF00000000000200000001000000000400CBCECCE5000A
      0000000200000000000A0000008600020000000000FFFFFF0000000002000000
      000000000000DE06000006004D656D6F3235000200390000006C010000500000
      001700000003000F0001000000000000000000FFFFFF1F2E0200000000000100
      0400BACFBCC600000000FFFF00000000000200000001000000000400CBCECCE5
      000A0000000200000000000A0000008600020000000000FFFFFF000000000200
      00000000000000006807000006004D656D6F3432000200BD0100009B01000072
      000000140000000300000001000000000000000000FFFFFF1F2E020000000000
      01000C00B2C6CEF128B8C7D5C229A3BA00000000010000000000000200000001
      000000000400CBCECCE5000A0000000200000000000800000086000200000000
      00FFFFFF0000000002000000000000000000FD07000006004D656D6F34340002
      00EA0000008501000094000000140000000100000001000000000000000000FF
      FFFF1F2E02000000000001001700C9F3BACBC8CBA3BA5B43484B5F555345525F
      544558545D00000000010000000000000200000001000000000400CBCECCE500
      0A000000020000000000080000008600020000000000FFFFFF00000000020000
      000000000000009308000006004D656D6F34310002003900000085010000A500
      0000140000000100000001000000000000000000FFFFFF1F2E02000000000001
      001800D6C6B5A5C8CBA3BA5B435245415F555345525F544558545D00000000FF
      FF00000000000200000001000000000400CBCECCE5000A000000020000000000
      080000008600020000000000FFFFFF0000000002000000000000000000600900
      0006004D656D6F3433000200890000006C0100005F0100001700000003000F00
      01000000000000000000FFFFFF1F2E02000000000001004F005B536D616C6C54
      6F426967285B544F54414C5F494F524F5F4D4E595D295D2020A3A43A5B666F72
      6D6174466C6F6174282723302E3030272C5B544F54414C5F494F524F5F4D4E59
      5D295D202020202000000000FFFF00000000000200000001000000000400CBCE
      CCE5000A000000000000000000080000008600020000000000FFFFFF00000000
      02000000000000000000DF09000006004D656D6F3535000200390000007F0000
      001B0000001B00000003000F0001000000000000000000FFFFFF1F2E02000000
      0000010001004100000000FFFF00000000000200000001000000000400CBCECC
      E5000A0000000200000000000A0000008600020000000000FFFFFF0000000002
      000000000000000000640A000005004D656D6F37000200540000007F00000090
      0000001B00000003000F0001000000000000000000FFFFFF1F2E020000000000
      01000800D5CBBBA7C3FBB3C600000000FFFF0000000000020000000100000000
      0400CBCECCE5000A0000000200000000000A0000000100020000000000FFFFFF
      0000000002000000000000000000FA0A000006004D656D6F3234000200400200
      001B0000007E000000130000000300000001000000000000000000FFFFFF1F2E
      02000000000001001800B5DA5B50414745235D2F5B544F54414C50414745535D
      D2B300000000FFFF00000000000200000001000000000400CBCECCE5000A0000
      00000000000000090000008600020000000000FFFFFF00000000020000000000
      00000000880B000006004D656D6F32360002007B00000038000000E000000012
      0000000300020001000000000000000000FFFFFF1F2E02000000000001001000
      5B434C49454E545F49445F544558545D00000000FFFF00000000000200000001
      000000000400CBCECCE5000A0000000000000000000800000086000200000000
      00FFFFFF00000000020000000000000000000F0C000006004D656D6F32370002
      00390000003800000044000000120000000300000001000000000000000000FF
      FFFF1F2E02000000000001000900CDF9C0B4C3FBB3C63A00000000FFFF000000
      00000200000001000000000400CBCECCE5000A0000000200000000000A000000
      8600020000000000FFFFFF0000000002000000000000000000970C000005004D
      656D6F33000200A0010000E6000000BB0000001400000001000F000100000000
      0000000000FFFFFF1F2E02000000000001000B005B494F524F5F494E464F5D00
      000000FFFF00000000000200000001000000000400CBCECCE5000A0000000000
      00000000080000008600020000000000FFFFFF00000000020000000000000000
      00350D000005004D656D6F3400020031010000E60000006F0000001400000001
      000F0001000000000000000000FFFFFF1F2E020000000000010021005B666F72
      6D6174466C6F6174282723302E3030272C5B494F524F5F4D4E595D295D000000
      00FFFF00000000000200000001000000000400CBCECCE5000A00000000000000
      0000090000008600020000000000FFFFFF0000000002000000000000000000B9
      0D000005004D656D6F3600020039000000E60000001B0000001400000001000F
      0001000000000000000000FFFFFF1F2E020000000000010007005B5345514E4F
      5D00000000FFFF00000000000200000001000000000400CBCECCE5000A000000
      0000000000000A0000008600020000000000FFFFFF0000000002000000000000
      000000470E000005004D656D6F3800020054000000E600000090000000140000
      0001000F0001000000000000000000FFFFFF1F2E020000000000010011005B41
      43434F554E545F49445F544558545D00000000FFFF0000000000020000000100
      0000000400CBCECCE5000A0000000000000000000A0000000100020000000000
      FFFFFF0000000002000000000000000000D00E000006004D656D6F3130000200
      AB010000380000005C000000120000000300020001000000000000000000FFFF
      FF1F2E02000000000001000B005B494F524F5F444154455D00000000FFFF0000
      0000000200000001000000000400CBCECCE5000A0000000000000000000A0000
      008600020000000000FFFFFF0000000002000000000000000000570F00000600
      4D656D6F31310002005F010000380000004C0000001200000003000000010000
      00000000000000FFFFFF1F2E02000000000001000900CAD5D6A7C8D5C6DA3A00
      000000FFFF00000000000200000001000000000400CBCECCE5000A0000000200
      000000000A0000008600020000000000FFFFFF00000000020000000000000000
      00DD0F000006004D656D6F31340002007F000000670000004002000012000000
      0300020001000000000000000000FFFFFF1F2E020000000000010008005B5245
      4D41524B5D00000000FFFF00000000000200000001000000000400CBCECCE500
      0A000000000000000000080000008600020000000000FFFFFF00000000020000
      000000000000006510000006004D656D6F313500020039000000670000004800
      0000120000000300000001000000000000000000FFFFFF1F2E02000000000001
      000A00B1B820202020D7A2A3BA00000000FFFF00000000000200000001000000
      000400CBCECCE5000A0000000200000000000A0000008600020000000000FFFF
      FF00000000020000000000000000001211000006004D656D6F3136000200E801
      00006C010000D80000001700000001000F0001000000000000000000FFFFFF1F
      2E02000000000001002F00B1BED2B3D0A1BCC63A5B666F726D6174466C6F6174
      282723302E3030272C73756D285B494F524F5F4D4E595D29295D00000000FFFF
      00000000000200000001000000000400CBCECCE5000A00000000000000000009
      0000008600020000000000FFFFFF0000000002000000000000000000A6110000
      06004D656D6F31370002003A0000009F01000014010000120000000300000001
      000000000000000000FFFFFF1F2E02000000000001001600B4F2D3A1CAB1BCE4
      3A5B444154455D205B54494D455D00000000FFFF000000000002000000010000
      00000400CBCECCE5000A000000000000000000000000000100020000000000FF
      FFFF00000000020000000000000000002412000006004D656D6F313800020030
      0200009D0100008C000000120000000300020001000000000000000000FFFFFF
      1F2E0200000000000100000000000000FFFF0000000000020000000100000000
      0400CBCECCE5000A000000000000000000000000000100020000000000FFFFFF
      0000000002000000000000000000A012000006004D656D6F3232000200A00100
      0014010000BB0000001400000003000F0001000000000000000000FFFFFF1F2E
      020000000000000000000000FFFF00000000000200000001000000000400CBCE
      CCE5000A000000000000000000080000008600020000000000FFFFFF00000000
      020000000000000000001C13000006004D656D6F323300020031010000140100
      006F0000001400000003000F0001000000000000000000FFFFFF1F2E02000000
      0000000000000000FFFF00000000000200000001000000000400CBCECCE5000A
      000000000000000000090000008600020000000000FFFFFF0000000002000000
      0000000000009813000006004D656D6F323800020039000000140100001B0000
      001400000003000F0001000000000000000000FFFFFF1F2E0200000000000000
      00000000FFFF00000000000200000001000000000400CBCECCE5000A00000000
      00000000000A0000008600020000000000FFFFFF000000000200000000000000
      00001414000006004D656D6F3239000200540000001401000090000000140000
      0003000F0001000000000000000000FFFFFF1F2E020000000000000000000000
      FFFF00000000000200000001000000000400CBCECCE5000A0000000000000000
      000A0000000100020000000000FFFFFF00000000020000000000000000009D14
      000006004D656D6F3333000200A80100004E0000001701000012000000030002
      0001000000000000000000FFFFFF1F2E02000000000001000B005B53484F505F
      4E414D455D00000000FFFF00000000000200000001000000000400CBCECCE500
      0A000000000000000000080000008600020000000000FFFFFF00000000020000
      000000000000002415000006004D656D6F3335000200620100004E0000004600
      0000120000000300000001000000000000000000FFFFFF1F2E02000000000001
      000900CBF9CAF4C3C5B5EA3A00000000FFFF0000000000020000000100000000
      0400CBCECCE5000A0000000200000000000A0000008600020000000000FFFFFF
      0000000002000000000000000000B915000005004D656D6F310002008C010000
      8501000094000000140000000100000001000000000000000000FFFFFF1F2E02
      000000000001001800BEADCAD6C8CBA3BA5B494F524F5F555345525F54455854
      5D00000000010000000000000200000001000000000400CBCECCE5000A000000
      020000000000080000008600020000000000FFFFFF0000000002000000000000
      0000003E16000005004D656D6F35000200E40000007F0000004D0000001B0000
      0003000F0001000000000000000000FFFFFF1F2E02000000000001000800D6A7
      B8B6B7BDCABD00000000FFFF00000000000200000001000000000400CBCECCE5
      000A0000000200000000000A0000000100020000000000FFFFFF000000000200
      0000000000000000C416000006004D656D6F31330002005B0200007F00000064
      0000001B00000003000F0001000000000000000000FFFFFF1F2E020000000000
      01000800B5A5BEDDB1E0BAC500000000FFFF0000000000020000000100000000
      0400CBCECCE5000A0000000200000000000A0000008600020000000000FFFFFF
      00000000020000000000000000005017000006004D656D6F3139000200E40000
      00E60000004D0000001400000001000F0001000000000000000000FFFFFF1F2E
      02000000000001000E005B5041594D5F49445F544558545D00000000FFFF0000
      0000000200000001000000000400CBCECCE5000A0000000000000000000A0000
      000100020000000000FFFFFF0000000002000000000000000000CC1700000600
      4D656D6F3230000200E4000000140100004D0000001400000003000F00010000
      00000000000000FFFFFF1F2E020000000000000000000000FFFF000000000002
      00000001000000000400CBCECCE5000A0000000000000000000A000000010002
      0000000000FFFFFF00000000020000000000000000005318000006004D656D6F
      32310002005B020000E6000000640000001400000001000F0001000000000000
      000000FFFFFF1F2E020000000000010009005B42494C4C5F4E4F5D00000000FF
      FF00000000000200000001000000000400CBCECCE5000A000000000000000000
      080000008600020000000000FFFFFF0000000002000000000000000000CF1800
      0006004D656D6F33300002005B02000014010000640000001400000003000F00
      01000000000000000000FFFFFF1F2E020000000000000000000000FFFF000000
      00000200000001000000000400CBCECCE5000A00000000000000000008000000
      8600020000000000FFFFFF000000000200000000000000FEFEFF060000000A00
      205661726961626C6573000000000200736C0014006364735F436867426F6479
      2E22534C30303030220002006A650014006364735F436867426F64792E224A45
      30303030220004006B68796800000000040079687A68000000000200647A0000
      00000000000000000000FDFF0100000000}
  end
  object PrintDBGridEh1: TPrintDBGridEh
    DBGridEh = DBGridEh1
    Options = [pghFitGridToPageWidth]
    Page.BottomMargin = 2.000000000000000000
    Page.LeftMargin = 2.000000000000000000
    Page.RightMargin = 2.000000000000000000
    Page.TopMargin = 2.000000000000000000
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'MS Sans Serif'
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = DEFAULT_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -11
    PageHeader.Font.Name = 'MS Sans Serif'
    PageHeader.Font.Style = []
    Units = MM
    Left = 144
    Top = 184
  end
  object cdsBrowser: TZQuery
    SortedFields = 'GLIDE_NO'
    FieldDefs = <>
    AfterScroll = cdsBrowserAfterScroll
    CachedUpdates = True
    Params = <>
    IndexFieldNames = 'GLIDE_NO Asc'
    Left = 159
    Top = 265
  end
end
