inherited frmUnLockGuide: TfrmUnLockGuide
  Left = 484
  Top = 177
  Caption = 'frmUnLockGuide'
  ClientHeight = 350
  ClientWidth = 351
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  inherited RzPanel1: TRzPanel
    Width = 351
    Height = 322
    object RzLabel3: TRzLabel
      Left = 21
      Top = 16
      Width = 315
      Height = 75
      Caption = 
        #31995#32479#26816#27979#21040#24403#21069#20351#29992#30340#30005#33041#19981#26159#24744#24120#29992#30340#30005#33041#65292#13#26080#27861#19978#20256#25968#25454#13#13#22914#30830#35748#26356#25442#30005#33041#35831#22635#20889#20197#19979#20449#24687#21518#28857#20987#8220#35299#38145#8221#13#25110#32852#31995#23458#25143#32463#29702#24110#24744#35299#38500#38145 +
        #23450#29366#24577
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object edtBK_XSM_CODE: TRzPanel
      Left = 43
      Top = 163
      Width = 260
      Height = 31
      BorderOuter = fsStatus
      BorderWidth = 1
      Color = clWhite
      FlatColor = 9145227
      TabOrder = 1
      DesignSize = (
        260
        31)
      object RzPanel86: TRzPanel
        Left = 2
        Top = 2
        Width = 103
        Height = 27
        Align = alLeft
        BorderOuter = fsFlat
        BorderSides = [sdRight]
        FlatColor = clGray
        TabOrder = 0
        object RzLabel56: TRzLabel
          Left = 0
          Top = 0
          Width = 102
          Height = 27
          Align = alClient
          Alignment = taCenter
          Caption = #26032#21830#30431#36134#21495
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          Transparent = True
          Layout = tlCenter
          ShadowColor = 16250871
          ShadowDepth = 1
          TextStyle = tsShadow
        end
      end
      object edtXSM_CODE: TcxTextEdit
        Left = 105
        Top = 4
        Width = 153
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        Properties.MaxLength = 25
        Properties.ReadOnly = False
        TabOrder = 1
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
    end
    object edtBK_XSM_PSWD: TRzPanel
      Left = 43
      Top = 213
      Width = 260
      Height = 31
      BorderOuter = fsStatus
      BorderWidth = 1
      Color = clWhite
      FlatColor = 9145227
      TabOrder = 2
      DesignSize = (
        260
        31)
      object RzPanel84: TRzPanel
        Left = 2
        Top = 2
        Width = 103
        Height = 27
        Align = alLeft
        BorderOuter = fsFlat
        BorderSides = [sdRight]
        FlatColor = clGray
        TabOrder = 0
        object RzLabel55: TRzLabel
          Left = 0
          Top = 0
          Width = 102
          Height = 27
          Align = alClient
          Alignment = taCenter
          Caption = #26032#21830#30431#23494#30721
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          Transparent = True
          Layout = tlCenter
          ShadowColor = 16250871
          ShadowDepth = 1
          TextStyle = tsShadow
        end
      end
      object edtXSM_PSWD: TcxTextEdit
        Left = 105
        Top = 4
        Width = 153
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        Properties.EchoMode = eemPassword
        Properties.MaxLength = 25
        TabOrder = 1
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
    end
    object RzPanel2: TRzPanel
      Left = 43
      Top = 113
      Width = 260
      Height = 31
      BorderOuter = fsStatus
      BorderWidth = 1
      Color = clWhite
      FlatColor = 9145227
      TabOrder = 0
      DesignSize = (
        260
        31)
      object RzPanel3: TRzPanel
        Left = 2
        Top = 2
        Width = 103
        Height = 27
        Align = alLeft
        BorderOuter = fsFlat
        BorderSides = [sdRight]
        FlatColor = clGray
        TabOrder = 0
        object RzLabel2: TRzLabel
          Left = 0
          Top = 0
          Width = 102
          Height = 27
          Align = alClient
          Alignment = taCenter
          Caption = #32463#33829#35768#21487#35777
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          Transparent = True
          Layout = tlCenter
          ShadowColor = 16250871
          ShadowDepth = 1
          TextStyle = tsShadow
        end
      end
      object edtLICENSE_CODE: TcxTextEdit
        Left = 105
        Top = 4
        Width = 153
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        Properties.MaxLength = 25
        Properties.ReadOnly = False
        TabOrder = 1
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      end
    end
    object Save: TRzBmpButton
      Left = 86
      Top = 273
      Width = 72
      Bitmaps.TransparentColor = clFuchsia
      Bitmaps.Up.Data = {
        86190000424D86190000000000003600000028000000480000001E0000000100
        1800000000005019000000000000000000000000000000000000EBEBEBEBEBEB
        EAEAEAE6E6E6DDDDDDD4D4D4CECECECDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCD
        CDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCD
        CDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCD
        CDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCD
        CDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCD
        CDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCECECE
        D0D0D0D8D8D8E2E2E2E9E9E9EBEBEBEBEBEBEBEBEBEAEAEAE2E2E2CECECEB3B3
        B39F9F9F94949492929292929292929292929292929292929292929292929292
        9292929292929292929292929292929292929292929292929292929292929292
        9292929292929292929292929292929292929292929292929292929292929292
        9292929292929292929292929292929292929292929292929292929292929292
        9292929292929292929292929292929292929292929292929292929292929292
        929292929292929292929292929292929292929292939393989898A7A7A7C0C0
        C0D9D9D9E7E7E7EBEBEBEBEBEBE3E3E3C7C7C7BCBCBCC9C9C90EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FFD0D0D0BCBCBC959595919191B4B4B4D9D9D9E9
        E9E9E9E9E9D4D4D4D2D2D20EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FFA6A6A6919191BFBFBFE2E2E2E4E4E4DDDDDD
        DCDCDC0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FFD9D9D9939393A5A5A5D7D7D7E2E2E2E7E7E7DBDBDB0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FFC1C1C1969696CFCFCFE4E4E4E7E7E70EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FFD5D5D5929292CE
        CECEE5E5E5E7E7E70EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF929292CDCDCDE5E5E5E6E6E6
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF929292CDCDCDE5E5E5E6E6E60EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF929292CDCDCDE5E5E5E6E6E60EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF929292CD
        CDCDE5E5E5E6E6E60EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF929292CDCDCDE5E5E5E6E6E6
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF929292CDCDCDE5E5E5E6E6E60EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF929292CDCDCDE5E5E5E6E6E60EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF929292CD
        CDCDE5E5E5E6E6E60EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF929292CDCDCDE5E5E5E6E6E6
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF929292CDCDCDE5E5E5E6E6E60EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF929292CDCDCDE5E5E5E6E6E60EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF929292CD
        CDCDE5E5E5E6E6E60EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF929292CDCDCDE5E5E5E6E6E6
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF929292CDCDCDE5E5E5E6E6E60EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF929292CDCDCDE5E5E5E6E6E60EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF929292CD
        CDCDE5E5E5E6E6E60EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF939393CECECEE8E8E8E8E8E8
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF9C9C9CD2D2D2EAEAEAECECECDBDBDB0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FFCFCFCFB1B1B1DCDCDCEBEBEBF0F0F0E3E3E30EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FFBFBFBFCDCDCDE6
        E6E6EBEBEBECECECEEEEEEE3E3E3DBDBDB0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FFD3D3D3C9C9C9E3E3E3EAEAEAEBEBEBEBEBEB
        EBEBEBEBEBEBE7E7E70EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9
        FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0E
        C9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF0EC9FF
        0EC9FFD4D4D4D6D6D6E4E4E4EAEAEAEBEBEBEBEBEBEBEBEBEBEBEBEAEAEAE7E7
        E7E4E4E4E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2
        E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2
        E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2
        E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2
        E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2
        E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E1E1E1E1E1E1E5E5E5E9E9
        E9EBEBEBEBEBEBEBEBEB}
      Color = clBtnFace
      Caption = #35299#38145
      TabOrder = 3
      OnClick = SaveClick
    end
    object Cancel: TRzBmpButton
      Left = 190
      Top = 273
      Width = 72
      Bitmaps.TransparentColor = clFuchsia
      Bitmaps.Up.Data = {
        86190000424D86190000000000003600000028000000480000001E0000000100
        1800000000005019000000000000000000000000000000000000EBEBEBEBEBEB
        EAEAEAE6E6E6DDDDDDD4D4D4CECECECDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCD
        CDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCD
        CDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCD
        CDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCD
        CDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCD
        CDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCECECE
        D0D0D0D8D8D8E2E2E2E9E9E9EBEBEBEBEBEBEBEBEBEAEAEAE2E2E2CECECEB3B3
        B39F9F9F94949492929292929292929292929292929292929292929292929292
        9292929292929292929292929292929292929292929292929292929292929292
        9292929292929292929292929292929292929292929292929292929292929292
        9292929292929292929292929292929292929292929292929292929292929292
        9292929292929292929292929292929292929292929292929292929292929292
        929292929292929292929292929292929292929292939393989898A7A7A7C0C0
        C0D9D9D9E7E7E7EBEBEBEBEBEBE3E3E3C7C7C7BCBCBCC9C9C9DADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADAD0D0D0BCBCBC959595919191B4B4B4D9D9D9E9
        E9E9E9E9E9D4D4D4D2D2D2DADADADADADADBDBDBDADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADAA6A6A6919191BFBFBFE2E2E2E4E4E4DDDDDD
        DCDCDCDADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADAD9D9D9939393A5A5A5D7D7D7E2E2E2E7E7E7DBDBDBDADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DAC1C1C1969696CFCFCFE4E4E4E7E7E7DADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADAD5D5D5929292CE
        CECEE5E5E5E7E7E7DADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADA929292CDCDCDE5E5E5E6E6E6
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADA929292CDCDCDE5E5E5E6E6E6DADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADA929292CDCDCDE5E5E5E6E6E6DADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADA929292CD
        CDCDE5E5E5E6E6E6DADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADA929292CDCDCDE5E5E5E6E6E6
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADA929292CDCDCDE5E5E5E6E6E6DADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADA929292CDCDCDE5E5E5E6E6E6DADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADA929292CD
        CDCDE5E5E5E6E6E6DADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADA929292CDCDCDE5E5E5E6E6E6
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADA929292CDCDCDE5E5E5E6E6E6DADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADA929292CDCDCDE5E5E5E6E6E6DADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADA929292CD
        CDCDE5E5E5E6E6E6DADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADA929292CDCDCDE5E5E5E6E6E6
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADA929292CDCDCDE5E5E5E6E6E6DADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADA929292CDCDCDE5E5E5E6E6E6DADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADA929292CD
        CDCDE5E5E5E6E6E6DADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADA939393CECECEE8E8E8E8E8E8
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADAD9D9D99C9C9CD2D2D2EAEAEAECECECDBDBDBDADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DACFCFCFB1B1B1DCDCDCEBEBEBF0F0F0E3E3E3DADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADABFBFBFCDCDCDE6
        E6E6EBEBEBECECECEEEEEEE3E3E3DBDBDBDADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADAD3D3D3C9C9C9E3E3E3EAEAEAEBEBEBEBEBEB
        EBEBEBEBEBEBE7E7E7E4E4E4E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2
        E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2
        E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2
        E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2
        E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2
        E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E1E1E1
        DEDEDED4D4D4D6D6D6E4E4E4EAEAEAEBEBEBEBEBEBEBEBEBEBEBEBEAEAEAE7E7
        E7E4E4E4E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2
        E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2
        E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2
        E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2
        E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2
        E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E1E1E1E1E1E1E5E5E5E9E9
        E9EBEBEBEBEBEBEBEBEB}
      Color = clBtnFace
      Caption = #21462#28040
      TabOrder = 4
      OnClick = CancelClick
    end
  end
  inherited pnlAddressBar: TPanel
    Width = 351
    inherited Image3: TImage
      Width = 343
    end
    inherited RzLabel1: TRzLabel
      Width = 7
      Caption = ''
    end
    inherited Image1: TImage
      Left = 347
    end
    object RzLabel26: TRzLabel [5]
      Left = 10
      Top = 7
      Width = 61
      Height = 16
      Alignment = taCenter
      Caption = #35299#38145#25552#31034
      Transparent = True
      Layout = tlCenter
      ShadowColor = 16250871
      ShadowDepth = 1
      TextStyle = tsShadow
    end
    inherited btnClose: TRzBmpButton
      Left = 319
    end
    inherited RzBmpButton4: TRzBmpButton
      Left = 267
      Visible = False
    end
    inherited btnWindow: TRzBmpButton
      Left = 293
      Visible = False
    end
  end
end
