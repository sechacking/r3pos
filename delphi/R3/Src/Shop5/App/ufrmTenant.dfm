inherited frmTenant: TfrmTenant
  Left = 508
  Top = 215
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #20225#19994#27880#20876
  ClientHeight = 355
  ClientWidth = 494
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 12
  object RzPage: TRzPageControl [0]
    Left = 0
    Top = 0
    Width = 494
    Height = 355
    ActivePage = TabSheet2
    Align = alClient
    TabIndex = 1
    TabOrder = 0
    FixedDimension = 18
    object TabSheet1: TRzTabSheet
      Caption = #20225#19994#30331#24405
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 490
        Height = 333
        Align = alClient
        TabOrder = 0
        DesignSize = (
          490
          333)
        object lblName: TLabel
          Left = 278
          Top = 92
          Width = 60
          Height = 12
          Caption = #20225#19994#24080#21495#65306
          Color = clBtnFace
          ParentColor = False
          Transparent = True
        end
        object lblPass: TLabel
          Left = 278
          Top = 121
          Width = 60
          Height = 12
          Caption = #30331#24405#21475#20196#65306
          Transparent = True
        end
        object Label19: TLabel
          Left = 300
          Top = 195
          Width = 70
          Height = 14
          Caption = #36824#27809#26377#21527#65311
          Font.Charset = GB2312_CHARSET
          Font.Color = clMaroon
          Font.Height = -14
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label20: TLabel
          Left = 382
          Top = 194
          Width = 60
          Height = 14
          Caption = #31435#21363#27880#20876
          Font.Charset = GB2312_CHARSET
          Font.Color = clNavy
          Font.Height = -14
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
          OnClick = Label20Click
        end
        object RzLabel2: TRzLabel
          Left = 5
          Top = 57
          Width = 144
          Height = 84
          Caption = #35828#26126#65306#13#13'1'#12289#24102'*'#21495#20026#24517#39035#36755#20837#36873#39033#12290#13#13'2'#12289#35831#27491#30830#36755#20837#30456#20851#20449#24687#12290#13#13'3'#12289
        end
        object Bevel1: TBevel
          Left = 247
          Top = 69
          Width = 2
          Height = 245
        end
        object cxedtPasswrd: TcxTextEdit
          Left = 338
          Top = 116
          Width = 114
          Height = 20
          Properties.EchoMode = eemPassword
          TabOrder = 0
          ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
        end
        object cxedtLOGIN_NAME: TcxTextEdit
          Left = 338
          Top = 88
          Width = 114
          Height = 20
          TabOrder = 1
          ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
        end
        object RzBitBtn1: TRzBitBtn
          Left = 380
          Top = 148
          Width = 71
          Height = 29
          Anchors = [akTop, akRight]
          Caption = #30331#24405'(&L)'
          Color = clSilver
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
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
          OnClick = RzBitBtn1Click
        end
        object TitlePanel: TPanel
          Left = 1
          Top = 1
          Width = 488
          Height = 52
          Align = alTop
          BevelOuter = bvNone
          Color = clWhite
          TabOrder = 3
          object imgStepIcon: TImage
            Left = 438
            Top = 0
            Width = 50
            Height = 50
            Align = alRight
            Center = True
            Picture.Data = {
              0A544A504547496D616765C3180000FFD8FFE000104A46494600010201004800
              480000FFED070A50686F746F73686F7020332E30003842494D03ED0000000000
              100047FFB4000200020047FFB4000200023842494D040D000000000004000000
              783842494D03F300000000000800000000000000003842494D040A0000000000
              0100003842494D271000000000000A000100000000000000023842494D03F500
              0000000048002F66660001006C66660006000000000001002F6666000100A199
              9A0006000000000001003200000001005A000000060000000000010035000000
              01002D000000060000000000013842494D03F80000000000700000FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFF03E800003842494D04080000000000100000000100000240000002
              40000000003842494D0414000000000004000000023842494D040C0000000005
              79000000010000002E000000260000008C000014C80000055D00180001FFD8FF
              E000104A46494600010201004800480000FFFE002646696C6520777269747465
              6E2062792041646F62652050686F746F73686F70A820352E32FFEE000E41646F
              626500648000000001FFDB0084000C08080809080C09090C110B0A0B11150F0C
              0C0F1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C
              0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E
              0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C
              0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC00011080026002E0301220002110103
              1101FFDD00040003FFC4013F0000010501010101010100000000000000030001
              020405060708090A0B0100010501010101010100000000000000010002030405
              060708090A0B1000010401030204020507060805030C33010002110304211231
              054151611322718132061491A1B14223241552C16233347282D14307259253F0
              E1F163733516A2B283264493546445C2A3743617D255E265F2B384C3D375E3F3
              462794A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F637475767
              778797A7B7C7D7E7F71100020201020404030405060707060535010002110321
              3112044151617122130532819114A1B14223C152D1F0332462E1728292435315
              637334F1250616A2B283072635C2D2449354A317644555367465E2F2B384C3D3
              75E3F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F62737
              475767778797A7B7C7FFDA000C03010002110311003F00F537BD8C639EF706B1
              A0973898000E5CE2AB7ED5E97FF7328FFB759FF924BAAFFC9799FF00116FFD43
              973D7F43AF26D8759981A59EA875575F5892CF5760FB3E23ABD9BBF47FD22DFF
              00B7BF448C6AFD4481E038BF0F4A9E92AEA1817582BA726AB2C77D1631ED738C
              6BA35AE54F27A8673DE3EC150348FF000CFADCF0FF00E555B1D57E8BFE13FC2F
              FC5FE92DE76BC1189D77EAE43AE339194C02F7D8F30DC5CAB376FC9A316E73B7
              5EFF007B9B67F83AFD4FD17A6CB1895938B49F5F6FE8DBA7A331A0FCEFB4B777
              F9A91AB35A8E97A2827C9FAD19B859B8D8D7B2AB5D7E4514595B5AEADCC17D95
              E3B6CDCFB2EFA1EB7ABE9FA7FA4FF835D3AF31EA6D67FCE3C4049C9B1B9D80E0
              760636969BF19BBF63ACB7F4B7383EB6D9BFD6F4FD4AF1E9AE9AFA85B6FA720A
              7FFFD0F4ECEC77E4E1646331E2B7DD53EB6D8E6EE0D2F69607BAB0EAF7ED9FA1
              EA31729D431B3FA3D7665754C8ABA9014CB5B4E3B311FED7E3E2ECB324BB36D7
              B1D5E4FF0023E87A566FAEC5D92E67EB7372B32B38D874332201A6F365ECC60D
              2E7636537D37D8CBFD47FE8AAFF03B3F4DFCEEF445022F6EBE4B7271704B84D4
              B84F09FEB7E8B8C7A9E2579556364749151B2C6573EBD4E82F3FBACC7FCD69DD
              FF006DFF00A4AD2FABF70C977527DB4D2632C0634D4C70637ECF88EF4EBF51AF
              DACDCEDDFD7FD27F38F541DD37AD55756FBB1E8DF5BDB6B5B6753A4496990E7F
              EA6D73FDDBFF00CFB7F3EDB159FABFD2728F58B7A5E466DF897E4D5666DCDC43
              8EFAD8EAFEC98ADAF7E4E2E5BAEDF4DD4FE91B6D7FCCFF0035FA6F4B1DD3E0D3
              87EAC5CB0CE04FDF23E6F47CA7D1FD6E18C11F520D6F59C50C632B69EA180E2D
              ADAD6024DF88DDE5B586B77ED6B1BBD7A4AC6E99F55F0F0738E7D97DF9F94045
              5664FA5FA391B1EEA598B462D7EA595FE8FD57B1F67A7FA3ABD3F5B23D5D94C6
              77FFD1F55585D57A7E2E4E4BECFDA5938443B6D9550DA5CD366CACFA87ED5899
              4FDFE81C7FA167A5FF005CF557CE4924A7E81FD8D8BFF97B9FFE662FFF002355
              9E838DD131BA964574E5D99BD54D61CFB72435B60A7DA3D3C7F4A8C5A3D2DE2B
              FB4FA15FA9BFECDF6BFF00B46BE7549253F5524BE5549253FFD9003842494D04
              060000000000070001000000010100FFE20C584943435F50524F46494C450001
              0100000C484C696E6F021000006D6E74725247422058595A2007CE0002000900
              0600310000616373704D53465400000000494543207352474200000000000000
              00000000000000F6D6000100000000D32D485020200000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000001163707274000001500000003364657363000001840000006C777470
              74000001F000000014626B707400000204000000147258595A00000218000000
              146758595A0000022C000000146258595A0000024000000014646D6E64000002
              5400000070646D6464000002C400000088767565640000034C00000086766965
              77000003D4000000246C756D69000003F8000000146D6561730000040C000000
              2474656368000004300000000C725452430000043C0000080C67545243000004
              3C0000080C625452430000043C0000080C7465787400000000436F7079726967
              6874202863292031393938204865776C6574742D5061636B61726420436F6D70
              616E790000646573630000000000000012735247422049454336313936362D32
              2E31000000000000000000000012735247422049454336313936362D322E3100
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000058595A20000000000000F351000100
              00000116CC58595A200000000000000000000000000000000058595A20000000
              0000006FA2000038F50000039058595A2000000000000062990000B785000018
              DA58595A2000000000000024A000000F840000B6CF6465736300000000000000
              1649454320687474703A2F2F7777772E6965632E636800000000000000000000
              001649454320687474703A2F2F7777772E6965632E6368000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000064657363000000000000002E4945432036313936362D322E312044
              656661756C742052474220636F6C6F7572207370616365202D20735247420000
              0000000000000000002E4945432036313936362D322E312044656661756C7420
              52474220636F6C6F7572207370616365202D2073524742000000000000000000
              0000000000000000000000000064657363000000000000002C5265666572656E
              63652056696577696E6720436F6E646974696F6E20696E204945433631393636
              2D322E3100000000000000000000002C5265666572656E63652056696577696E
              6720436F6E646974696F6E20696E2049454336313936362D322E310000000000
              00000000000000000000000000000000000000000076696577000000000013A4
              FE00145F2E0010CF140003EDCC0004130B00035C9E0000000158595A20000000
              00004C09560050000000571FE76D656173000000000000000100000000000000
              0000000000000000000000028F00000002736967200000000043525420637572
              76000000000000040000000005000A000F00140019001E00230028002D003200
              37003B00400045004A004F00540059005E00630068006D00720077007C008100
              86008B00900095009A009F00A400A900AE00B200B700BC00C100C600CB00D000
              D500DB00E000E500EB00F000F600FB01010107010D01130119011F0125012B01
              320138013E0145014C0152015901600167016E0175017C0183018B0192019A01
              A101A901B101B901C101C901D101D901E101E901F201FA0203020C0214021D02
              26022F02380241024B0254025D02670271027A0284028E029802A202AC02B602
              C102CB02D502E002EB02F50300030B03160321032D03380343034F035A036603
              72037E038A039603A203AE03BA03C703D303E003EC03F9040604130420042D04
              3B0448045504630471047E048C049A04A804B604C404D304E104F004FE050D05
              1C052B053A05490558056705770586059605A605B505C505D505E505F6060606
              160627063706480659066A067B068C069D06AF06C006D106E306F50707071907
              2B073D074F076107740786079907AC07BF07D207E507F8080B081F0832084608
              5A086E0882089608AA08BE08D208E708FB09100925093A094F09640979098F09
              A409BA09CF09E509FB0A110A270A3D0A540A6A0A810A980AAE0AC50ADC0AF30B
              0B0B220B390B510B690B800B980BB00BC80BE10BF90C120C2A0C430C5C0C750C
              8E0CA70CC00CD90CF30D0D0D260D400D5A0D740D8E0DA90DC30DDE0DF80E130E
              2E0E490E640E7F0E9B0EB60ED20EEE0F090F250F410F5E0F7A0F960FB30FCF0F
              EC1009102610431061107E109B10B910D710F511131131114F116D118C11AA11
              C911E81207122612451264128412A312C312E31303132313431363138313A413
              C513E5140614271449146A148B14AD14CE14F01512153415561578159B15BD15
              E0160316261649166C168F16B216D616FA171D17411765178917AE17D217F718
              1B18401865188A18AF18D518FA19201945196B199119B719DD1A041A2A1A511A
              771A9E1AC51AEC1B141B3B1B631B8A1BB21BDA1C021C2A1C521C7B1CA31CCC1C
              F51D1E1D471D701D991DC31DEC1E161E401E6A1E941EBE1EE91F131F3E1F691F
              941FBF1FEA20152041206C209820C420F0211C2148217521A121CE21FB222722
              55228222AF22DD230A23382366239423C223F0241F244D247C24AB24DA250925
              382568259725C725F726272657268726B726E827182749277A27AB27DC280D28
              3F287128A228D429062938296B299D29D02A022A352A682A9B2ACF2B022B362B
              692B9D2BD12C052C392C6E2CA22CD72D0C2D412D762DAB2DE12E162E4C2E822E
              B72EEE2F242F5A2F912FC72FFE3035306C30A430DB3112314A318231BA31F232
              2A3263329B32D4330D3346337F33B833F1342B3465349E34D83513354D358735
              C235FD3637367236AE36E937243760379C37D738143850388C38C83905394239
              7F39BC39F93A363A743AB23AEF3B2D3B6B3BAA3BE83C273C653CA43CE33D223D
              613DA13DE03E203E603EA03EE03F213F613FA23FE24023406440A640E7412941
              6A41AC41EE4230427242B542F7433A437D43C044034447448A44CE4512455545
              9A45DE4622466746AB46F04735477B47C04805484B489148D7491D496349A949
              F04A374A7D4AC44B0C4B534B9A4BE24C2A4C724CBA4D024D4A4D934DDC4E254E
              6E4EB74F004F494F934FDD5027507150BB51065150519B51E65231527C52C753
              13535F53AA53F65442548F54DB5528557555C2560F565C56A956F75744579257
              E0582F587D58CB591A596959B85A075A565AA65AF55B455B955BE55C355C865C
              D65D275D785DC95E1A5E6C5EBD5F0F5F615FB36005605760AA60FC614F61A261
              F56249629C62F06343639763EB6440649464E9653D659265E7663D669266E867
              3D679367E9683F689668EC6943699A69F16A486A9F6AF76B4F6BA76BFF6C576C
              AF6D086D606DB96E126E6B6EC46F1E6F786FD1702B708670E0713A719571F072
              4B72A67301735D73B87414747074CC7528758575E1763E769B76F8775677B378
              11786E78CC792A798979E77A467AA57B047B637BC27C217C817CE17D417DA17E
              017E627EC27F237F847FE5804780A8810A816B81CD8230829282F4835783BA84
              1D848084E3854785AB860E867286D7873B879F8804886988CE8933899989FE8A
              648ACA8B308B968BFC8C638CCA8D318D988DFF8E668ECE8F368F9E9006906E90
              D6913F91A89211927A92E3934D93B69420948A94F4955F95C99634969F970A97
              7597E0984C98B89924999099FC9A689AD59B429BAF9C1C9C899CF79D649DD29E
              409EAE9F1D9F8B9FFAA069A0D8A147A1B6A226A296A306A376A3E6A456A4C7A5
              38A5A9A61AA68BA6FDA76EA7E0A852A8C4A937A9A9AA1CAA8FAB02AB75ABE9AC
              5CACD0AD44ADB8AE2DAEA1AF16AF8BB000B075B0EAB160B1D6B24BB2C2B338B3
              AEB425B49CB513B58AB601B679B6F0B768B7E0B859B8D1B94AB9C2BA3BBAB5BB
              2EBBA7BC21BC9BBD15BD8FBE0ABE84BEFFBF7ABFF5C070C0ECC167C1E3C25FC2
              DBC358C3D4C451C4CEC54BC5C8C646C6C3C741C7BFC83DC8BCC93AC9B9CA38CA
              B7CB36CBB6CC35CCB5CD35CDB5CE36CEB6CF37CFB8D039D0BAD13CD1BED23FD2
              C1D344D3C6D449D4CBD54ED5D1D655D6D8D75CD7E0D864D8E8D96CD9F1DA76DA
              FBDB80DC05DC8ADD10DD96DE1CDEA2DF29DFAFE036E0BDE144E1CCE253E2DBE3
              63E3EBE473E4FCE584E60DE696E71FE7A9E832E8BCE946E9D0EA5BEAE5EB70EB
              FBEC86ED11ED9CEE28EEB4EF40EFCCF058F0E5F172F1FFF28CF319F3A7F434F4
              C2F550F5DEF66DF6FBF78AF819F8A8F938F9C7FA57FAE7FB77FC07FC98FD29FD
              BAFE4BFEDCFF6DFFFFFFFE002646696C65207772697474656E2062792041646F
              62652050686F746F73686F70A820352E32FFEE000E41646F6265006480000000
              01FFDB0084000C08080809080C09090C110B0A0B11150F0C0C0F151813131513
              1318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
              0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E0E14110C0C0C
              0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
              0C0C0C0C0C0C0CFFC00011080026002E03012200021101031101FFDD00040003
              FFC4013F0000010501010101010100000000000000030001020405060708090A
              0B0100010501010101010100000000000000010002030405060708090A0B1000
              010401030204020507060805030C330100021103042112310541516113227181
              32061491A1B14223241552C16233347282D14307259253F0E1F163733516A2B2
              83264493546445C2A3743617D255E265F2B384C3D375E3F3462794A485B495C4
              D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F637475767778797A7B7C7D7E7
              F711000202010204040304050607070605350100021103213112044151617122
              130532819114A1B14223C152D1F0332462E1728292435315637334F1250616A2
              B283072635C2D2449354A317644555367465E2F2B384C3D375E3F34694A485B4
              95C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F62737475767778797A7B7
              C7FFDA000C03010002110311003F00F537BD8C639EF706B1A0973898000E5CE2
              AB7ED5E97FF7328FFB759FF924BAAFFC9799FF00116FFD43973D7F43AF26D875
              9981A59EA875575F5892CF5760FB3E23ABD9BBF47FD22DFF00B7BF448C6AFD44
              81E038BF0F4A9E92AEA1817582BA726AB2C77D1631ED738C6BA35AE54F27A867
              3DE3EC150348FF000CFADCF0FF00E555B1D57E8BFE13FC2FFC5FE92DE76BC118
              9D77EAE43AE339194C02F7D8F30DC5CAB376FC9A316E73B75EFF007B9B67F83A
              FD4FD17A6CB1895938B49F5F6FE8DBA7A331A0FCEFB4B777F9A91AB35A8E97A2
              827C9FAD19B859B8D8D7B2AB5D7E4514595B5AEADCC17D95E3B6CDCFB2EFA1EB
              7ABE9FA7FA4FF835D3AF31EA6D67FCE3C4049C9B1B9D80E0760636969BF19BBF
              63ACB7F4B7383EB6D9BFD6F4FD4AF1E9AE9AFA85B6FA720A7FFFD0F4ECEC77E4
              E1646331E2B7DD53EB6D8E6EE0D2F69607BAB0EAF7ED9FA1EA31729D431B3FA3
              D7665754C8ABA9014CB5B4E3B311FED7E3E2ECB324BB36D7B1D5E4FF0023E87A
              566FAEC5D92E67EB7372B32B38D874332201A6F365ECC60D2E7636537D37D8CB
              FD47FE8AAFF03B3F4DFCEEF445022F6EBE4B7271704B84D4B84F09FEB7E8B8C7
              A9E2579556364749151B2C6573EBD4E82F3FBACC7FCD69DDFF006DFF00A4AD2F
              ABF70C977527DB4D2632C0634D4C70637ECF88EF4EBF51AFDACDCEDDFD7FD27F
              38F541DD37AD55756FBB1E8DF5BDB6B5B6753A4496990E7FEA6D73FDDBFF00CF
              B7F3EDB159FABFD2728F58B7A5E466DF897E4D5666DCDC438EFAD8EAFEC98ADA
              F7E4E2E5BAEDF4DD4FE91B6D7FCCFF0035FA6F4B1DD3E0D387EAC5CB0CE04FDF
              23E6F47CA7D1FD6E18C11F520D6F59C50C632B69EA180E2DADAD6024DF88DDE5
              B586B77ED6B1BBD7A4AC6E99F55F0F0738E7D97DF9F940455664FA5FA391B1EE
              A598B462D7EA595FE8FD57B1F67A7FA3ABD3F5B23D5D94C677FFD1F55585D57A
              7E2E4E4BECFDA5938443B6D9550DA5CD366CACFA87ED58994FDFE81C7FA167A5
              FF005CF557CE4924A7E81FD8D8BFF97B9FFE662FFF0023559E838DD131BA9645
              74E5D99BD54D61CFB72435B60A7DA3D3C7F4A8C5A3D2DE2BFB4FA15FA9BFECDF
              6BFF00B46BE7549253F5524BE5549253FFD9}
            Transparent = True
          end
          object labTitle: TLabel
            Left = 16
            Top = 16
            Width = 7
            Height = 12
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Bevel2: TBevel
            Left = 0
            Top = 50
            Width = 488
            Height = 2
            Align = alBottom
          end
          object HintL: TLabel
            Left = 7
            Top = 16
            Width = 68
            Height = 12
            Caption = #20225#19994'......'
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
    end
    object TabSheet2: TRzTabSheet
      Caption = #27880#20876#20225#19994
      DesignSize = (
        490
        333)
      object Label1: TLabel
        Left = 7
        Top = 17
        Width = 80
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = #30331#24405#21517#31216
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 7
        Top = 38
        Width = 80
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20225#19994#21517#31216
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 285
        Top = 38
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
      object Label2: TLabel
        Left = 191
        Top = 17
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
      object Label5: TLabel
        Left = 7
        Top = 59
        Width = 80
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20225#19994#31616#31216
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 212
        Top = 59
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
        Left = 7
        Top = 227
        Width = 80
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = #27861#20154#20195#34920
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 212
        Top = 80
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
        Left = 7
        Top = 164
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
        Left = 7
        Top = 185
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
      object Label11: TLabel
        Left = 7
        Top = 206
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
      object Label12: TLabel
        Left = 7
        Top = 80
        Width = 80
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = #35768#21487#35777#21495
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 7
        Top = 248
        Width = 80
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = #32852#31995#22320#22336
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 7
        Top = 269
        Width = 80
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = #37038#32534
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 7
        Top = 101
        Width = 80
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = #30331#24405#23494#30721
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 212
        Top = 101
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
      object Label17: TLabel
        Left = 7
        Top = 122
        Width = 80
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20877#27425#36755#20837#23494#30721
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label18: TLabel
        Left = 212
        Top = 122
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
      object RzLabel1: TRzLabel
        Left = 312
        Top = 14
        Width = 144
        Height = 84
        Caption = #35828#26126#65306#13#13'1'#12289#24102'*'#21495#20026#24517#39035#36755#20837#36873#39033#12290#13#13'2'#12289#35831#27491#30830#36755#20837#30456#20851#20449#24687#12290#13#13'3'#12289
      end
      object Label21: TLabel
        Left = 7
        Top = 143
        Width = 80
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = #21306#22495
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label22: TLabel
        Left = 208
        Top = 17
        Width = 72
        Height = 12
        Caption = #20363':celeb.net'
      end
      object Label23: TLabel
        Left = 212
        Top = 143
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
      object edtLOGIN_NAME: TcxTextEdit
        Tag = 1
        Left = 98
        Top = 13
        Width = 90
        Height = 20
        TabOrder = 0
      end
      object edtTENANT_NAME: TcxTextEdit
        Left = 98
        Top = 34
        Width = 185
        Height = 20
        TabOrder = 1
      end
      object edtSHORT_TENANT_NAME: TcxTextEdit
        Left = 98
        Top = 55
        Width = 111
        Height = 20
        TabOrder = 2
      end
      object edtLEGAL_REPR: TcxTextEdit
        Left = 98
        Top = 223
        Width = 111
        Height = 20
        TabOrder = 3
      end
      object edtLINKMAN: TcxTextEdit
        Left = 98
        Top = 160
        Width = 111
        Height = 20
        TabOrder = 5
      end
      object edtTELEPHONE: TcxTextEdit
        Left = 98
        Top = 181
        Width = 111
        Height = 20
        TabOrder = 6
      end
      object edtFAXES: TcxTextEdit
        Left = 98
        Top = 202
        Width = 111
        Height = 20
        TabOrder = 7
      end
      object edtLICENSE_CODE: TcxTextEdit
        Left = 98
        Top = 76
        Width = 111
        Height = 20
        TabOrder = 8
      end
      object edtADDRESS: TcxTextEdit
        Left = 98
        Top = 244
        Width = 185
        Height = 20
        TabOrder = 9
      end
      object edtPOSTALCODE: TcxTextEdit
        Left = 98
        Top = 265
        Width = 71
        Height = 20
        TabOrder = 10
      end
      object edtPASSWRD: TcxTextEdit
        Left = 98
        Top = 97
        Width = 111
        Height = 20
        Properties.EchoMode = eemPassword
        TabOrder = 11
      end
      object edtPASSWRD1: TcxTextEdit
        Left = 98
        Top = 118
        Width = 111
        Height = 20
        Properties.EchoMode = eemPassword
        TabOrder = 12
      end
      object btnOk: TRzBitBtn
        Left = 219
        Top = 289
        Width = 71
        Height = 29
        Anchors = [akTop, akRight]
        Caption = #27880#20876'(&O)'
        Color = clSilver
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
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
        OnClick = btnOkClick
        NumGlyphs = 2
        Spacing = 5
      end
      object edtREGION_ID: TzrComboBoxList
        Left = 98
        Top = 139
        Width = 111
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
            FieldName = 'CODE_ID'
            Footers = <>
            Title.Caption = #20195#30721
            Width = 38
          end
          item
            EditButtons = <>
            FieldName = 'CODE_NAME'
            Footers = <>
            Title.Caption = #22320#22495#21517#31216
            Width = 122
          end>
        DropWidth = 160
        DropHeight = 200
        ShowTitle = True
        AutoFitColWidth = False
        ShowButton = True
        LocateStyle = lsDark
        Buttons = []
        DropListStyle = lsFixed
      end
    end
  end
  inherited mmMenu: TMainMenu
    Left = 352
    Top = 256
  end
  inherited actList: TActionList
    Left = 384
    Top = 256
  end
  object CdsTable: TZQuery
    CachedUpdates = True
    Params = <>
    Left = 321
    Top = 256
  end
end
