inherited frameBaseReport: TframeBaseReport
  Left = 220
  Top = 4
  Width = 790
  Height = 549
  Caption = #25253#34920#22522#31867
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 12
  inherited bgPanel: TRzPanel
    Width = 774
    Height = 474
    inherited RzPanel2: TRzPanel
      Width = 764
      Height = 464
      inherited RzPage: TRzPageControl
        Width = 559
        Height = 458
        OnChange = RzPageChange
        FixedDimension = 25
        inherited TabSheet1: TRzTabSheet
          inherited RzPanel3: TRzPanel
            Width = 557
            Height = 431
            object Panel4: TPanel
              Left = 5
              Top = 5
              Width = 547
              Height = 421
              Align = alClient
              BevelOuter = bvNone
              Color = clWhite
              TabOrder = 0
              object w1: TRzPanel
                Left = 0
                Top = 0
                Width = 547
                Height = 81
                Align = alTop
                BorderOuter = fsNone
                BorderSides = [sdLeft, sdTop, sdRight]
                TabOrder = 0
              end
              object RzPanel7: TRzPanel
                Left = 0
                Top = 81
                Width = 547
                Height = 340
                Align = alClient
                BorderOuter = fsGroove
                Color = clWhite
                TabOrder = 1
                object DBGridEh1: TDBGridEh
                  Left = 2
                  Top = 2
                  Width = 543
                  Height = 336
                  Align = alClient
                  AllowedOperations = []
                  BorderStyle = bsNone
                  Color = clWhite
                  Ctl3D = True
                  DataSource = dsadoReport1
                  Flat = True
                  Font.Charset = GB2312_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = #23435#20307
                  Font.Style = []
                  FooterColor = clWhite
                  FooterFont.Charset = GB2312_CHARSET
                  FooterFont.Color = clWindowText
                  FooterFont.Height = -12
                  FooterFont.Name = #23435#20307
                  FooterFont.Style = []
                  FooterRowCount = 1
                  ImeName = #26497#21697#20116#31508#36755#20837#27861
                  Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                  OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection]
                  ParentCtl3D = False
                  ParentFont = False
                  ReadOnly = True
                  RowHeight = 20
                  SumList.Active = True
                  TabOrder = 0
                  TitleFont.Charset = GB2312_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -12
                  TitleFont.Name = #23435#20307
                  TitleFont.Style = [fsBold]
                  TitleHeight = 30
                  UseMultiTitle = True
                  IsDrawNullRow = False
                  CurrencySymbol = #65509
                  DecimalNumber = 2
                  DigitalNumber = 12
                  OnDrawColumnCell = DBGridEh1DrawColumnCell
                  OnGetCellParams = DBGridEh1GetCellParams
                end
              end
            end
          end
        end
      end
      object PanelColumnS: TPanel
        Left = 562
        Top = 3
        Width = 199
        Height = 458
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 199
          Height = 437
          Align = alTop
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelInner = bvLowered
          BorderStyle = bsSingle
          TabOrder = 0
          DesignSize = (
            195
            433)
          object Image5: TImage
            Left = 2
            Top = 84
            Width = 191
            Height = 25
            Align = alTop
            Picture.Data = {
              07544269746D617096220000424D962200000000000036000000280000007500
              0000190000000100180000000000602200000000000000000000000000000000
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF00FFFDF1B6A290CCB498CDAD89D3B085D4AF83D0AB7FD3B085D0B087CEAF88
              CCAF8ACCAF88CCB087CEB185CEB185CEB087CEB087CEB087CEB087CEB087CEB0
              87CEB087CEB087CEB087CEB087CEB087CEB087CEB087CEB087CEB087CEB087CE
              B087CEB087CEB087CEB087CEB087CEB087CEB087CEB087CEB087CEB087CEB087
              CEB087CEB087CEB087CEB087CEB087CEB087CEB087CEB087CEB087CEB087CEB0
              87CEB087CEB087CEB087CEB087CEB087CEB087CEB087CEB087CEB087CEB087CE
              B087CEB087CEB087CEB087CEB087CEB087CEB087CEB087CEB087CEB087CEB087
              CEB087CEB087CEB087CEB087CEB087CEB087CEB087CEB087CEB087CEB087CEB0
              87CEB087CEB087CEB087CEB087CEB087CEB087CEB087CEB087CEB087CEB087CE
              B087CEB087CEB087CEB087CEB087CEB087CEB087CEB087CEB087CEB087CEB087
              CEB087CEB087CEB087CEB087CEB087CEB087CEB087CEB087CEB087CEB087CEB0
              8700FFFFF7C4B2A1F2DBC1FFE7C5FFEDC6FFEEC6FFF1C8FFECC5FFECC7FFECC8
              FFEBC9FFECC8FFECC7FFEDC5FFEDC5FFECC7FFECC7FFECC7FFECC7FFECC7FFEC
              C7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FF
              ECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7
              FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFEC
              C7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FF
              ECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7
              FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFEC
              C7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FF
              ECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7
              FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFECC7FFEC
              C700FFFDF3C0B09FF6E0C7FFECCDFFE9C6FFE4BDFFE4BDFFE7C4FFE7C5FEE7C7
              FCE7C8FEE7C7FFE7C5FFE8C4FFE8C3FFE8C4FEE8C5FEE8C5FEE8C5FEE8C5FEE8
              C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FE
              E8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5
              FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8
              C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FE
              E8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5
              FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8
              C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FE
              E8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5
              FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8C5FEE8
              C500FFFFF7B9A999FAE5CFFEE4C6FFE9C7FFE8C5FFE8C5FFE7C7FCE7C8FBE6CA
              FBE6CBFCE6CAFCE7C7FFE7C5FFE7C5FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7
              C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FC
              E7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7
              FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7
              C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FC
              E7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7
              FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7
              C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FC
              E7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7
              FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7C7FCE7
              C700FFFFF7B8A999F9E4CEFCE4C8FFE7C8FFE7C5FFE7C5FEE6C8FBE6CAF9E5CC
              F9E5CCF9E6CBFBE7C8FEE7C7FEE7C7FCE7C8FBE7C8FBE6CAFBE7C8FBE6CAFBE7
              C8FBE6CAFBE7C8FBE6CAFBE7C8FBE6CAFBE7C8FBE6CAFBE7C8FBE6CAFBE7C8FB
              E6CAFBE7C8FBE6CAFBE7C8FBE6CAFBE7C8FBE6CAFBE7C8FBE6CAFBE7C8FBE6CA
              FBE7C8FBE6CAFBE7C8FBE6CAFBE7C8FBE6CAFBE7C8FBE6CAFBE7C8FBE6CAFBE7
              C8FBE6CAFBE7C8FBE6CAFBE7C8FBE6CAFBE7C8FBE6CAFBE7C8FBE6CAFBE7C8FB
              E6CAFBE7C8FBE6CAFBE7C8FBE6CAFBE7C8FBE6CAFBE7C8FBE6CAFBE7C8FBE6CA
              FBE7C8FBE6CAFBE7C8FBE6CAFBE7C8FBE6CAFBE7C8FBE6CAFBE7C8FBE6CAFBE7
              C8FBE6CAFBE7C8FBE6CAFBE7C8FBE6CAFBE7C8FBE6CAFBE7C8FBE6CAFBE7C8FB
              E6CAFBE7C8FBE6CAFBE7C8FBE6CAFBE7C8FBE6CAFBE7C8FBE6CAFBE7C8FBE6CA
              FBE7C8FBE6CAFBE7C8FBE6CAFBE7C8FBE6CAFBE7C8FBE6CAFBE7C8FBE6CAFBE7
              C800FFFFF7B8A999F9E4CEFCE4C8FFE8C8FFE7C7FEE7C7FBE5C9F8E4CBF4E4CD
              F4E4CDF6E5CAF8E6C9FBE6C7FBE6C6FAE5C9F8E6C9F8E5CAF8E6C9F8E5CAF8E6
              C9F8E5CAF8E6C9F8E5CAF8E6C9F8E5CAF8E6C9F8E5CAF8E6C9F8E5CAF8E6C9F8
              E5CAF8E6C9F8E5CAF8E6C9F8E5CAF8E6C9F8E5CAF8E6C9F8E5CAF8E6C9F8E5CA
              F8E6C9F8E5CAF8E6C9F8E5CAF8E6C9F8E5CAF8E6C9F8E5CAF8E6C9F8E5CAF8E6
              C9F8E5CAF8E6C9F8E5CAF8E6C9F8E5CAF8E6C9F8E5CAF8E6C9F8E5CAF8E6C9F8
              E5CAF8E6C9F8E5CAF8E6C9F8E5CAF8E6C9F8E5CAF8E6C9F8E5CAF8E6C9F8E5CA
              F8E6C9F8E5CAF8E6C9F8E5CAF8E6C9F8E5CAF8E6C9F8E5CAF8E6C9F8E5CAF8E6
              C9F8E5CAF8E6C9F8E5CAF8E6C9F8E5CAF8E6C9F8E5CAF8E6C9F8E5CAF8E6C9F8
              E5CAF8E6C9F8E5CAF8E6C9F8E5CAF8E6C9F8E5CAF8E6C9F8E5CAF8E6C9F8E5CA
              F8E6C9F8E5CAF8E6C9F8E5CAF8E6C9F8E5CAF8E6C9F8E5CAF8E6C9F8E5CAF8E6
              C900FFFFF5B9A998F9E4CEFBE3C7FFE6C8FFE6C6FDE5C7F9E4C9F5E3CCF3E2CD
              F1E3CCF3E4CAF7E5C8FAE5C6FAE5C6F9E4C8F7E4C9F7E4C9F7E4C9F7E4C9F7E4
              C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7
              E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9
              F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4
              C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7
              E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9
              F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4
              C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7
              E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9
              F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4C9F7E4
              C900FFFFF5B9A998F9E4CEFBE3C7FFE5C7FCE4C6FAE4C8F7E3CAF3E3CCF1E3CD
              F1E3CDF3E3CCF7E4C9F9E5C6FAE5C6F9E4C9F9E3CAF9E3CAF9E3CAF9E3CAF9E3
              CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9
              E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CA
              F9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3
              CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9
              E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CA
              F9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3
              CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9
              E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CA
              F9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3CAF9E3
              CA00FFFFF4BBAA97F8E3CDFAE2C6FFE5C7FBE3C5F9E3C7F6E2C9F2E2CBF0E1CE
              F0E2CCF2E2CBF6E3C8F8E4C5F9E4C5F9E2C8F8E2C9F8E2C9F8E2C9F8E2C9F8E2
              C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8
              E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9
              F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2
              C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8
              E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9
              F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2
              C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8
              E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9
              F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2C9F8E2
              C900FFFFF4BDA997FAE3CDFAE2C6FEE4C6FBE3C5F8E2C6F3E2C8F1E1CAEFE0CD
              EFE1CBF1E1CAF5E2C7F8E3C4F8E3C4F8E1C7F8E0C8F8E0C8F8E0C8F8E0C8F8E0
              C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8
              E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8
              F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0
              C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8
              E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8
              F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0
              C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8
              E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8
              F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0C8F8E0
              C800FFFFF2BDA997FAE4CBFAE2C6FEE5C5FCE3C3FAE2C4F5E2C7F1E1CAF1E0CB
              F1E0CBF3E2C8F7E2C7FAE2C4FAE2C4FAE2C6F8E1C7F8E1C7F8E1C7F8E1C7F8E1
              C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8
              E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7
              F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1
              C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8
              E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7
              F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1
              C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8
              E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7
              F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1C7F8E1
              C700FFFFF1BFAD96F2DCC0FDE4C4F8DDBBFFE4C2F9E0C0F7E1C5F4E1C6F4E0C7
              F4E0C7F6E1C6F7E1C5FBE2C2FBE2C2F9E1C3F9E1C5F9E1C5F9E1C5F9E1C5F9E1
              C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9
              E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5
              F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1
              C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9
              E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5
              F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1
              C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9
              E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5
              F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1C5F9E1
              C500FFFFF1BFAD96F1DCC0FDE4C4F8DDBBFFE4C2F9E0C0F6E0C4F5E0C5F3DFC6
              F3DFC6F5E0C5F6E0C4FAE0C2FAE1C1F8E0C2F6E0C4F6E0C4F6E0C4F6E0C4F6E0
              C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6
              E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4
              F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0
              C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6
              E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4
              F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0
              C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6
              E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4
              F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0C4F6E0
              C400FFFFF4BBAC99EFDBC2FBE3C7F5DCBCFCE3C3F6DEC0F3DEC3EFDDC6EDDCC7
              EDDCC7EFDDC6F1DEC3F4DEC2F4DEC2F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DE
              C3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3
              DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3
              F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DE
              C3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3
              DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3
              F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DE
              C3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3
              DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3
              F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DEC3F3DE
              C300FFFFF5BAAC9AEDDBC4F7E2C7F1DCBDF9E1C5F2DDC1F1DCC6EDDCC7EBDCC9
              EBDCC9EDDCC7EFDDC6F3DEC3F3DEC3F1DDC4EFDEC4F1DCC6EFDEC4F1DCC6EFDE
              C4F1DCC6EFDEC4F1DCC6EFDEC4F1DCC6EFDEC4F1DCC6EFDEC4F1DCC6EFDEC4F1
              DCC6EFDEC4F1DCC6EFDEC4F1DCC6EFDEC4F1DCC6EFDEC4F1DCC6EFDEC4F1DCC6
              EFDEC4F1DCC6EFDEC4F1DCC6EFDEC4F1DCC6EFDEC4F1DCC6EFDEC4F1DCC6EFDE
              C4F1DCC6EFDEC4F1DCC6EFDEC4F1DCC6EFDEC4F1DCC6EFDEC4F1DCC6EFDEC4F1
              DCC6EFDEC4F1DCC6EFDEC4F1DCC6EFDEC4F1DCC6EFDEC4F1DCC6EFDEC4F1DCC6
              EFDEC4F1DCC6EFDEC4F1DCC6EFDEC4F1DCC6EFDEC4F1DCC6EFDEC4F1DCC6EFDE
              C4F1DCC6EFDEC4F1DCC6EFDEC4F1DCC6EFDEC4F1DCC6EFDEC4F1DCC6EFDEC4F1
              DCC6EFDEC4F1DCC6EFDEC4F1DCC6EFDEC4F1DCC6EFDEC4F1DCC6EFDEC4F1DCC6
              EFDEC4F1DCC6EFDEC4F1DCC6EFDEC4F1DCC6EFDEC4F1DCC6EFDEC4F1DCC6EFDE
              C400FFFFF7B8AB9BEAD9C4F4E0C7EFDABEF6DFC5EFDCC1EFDCC7EBDCC9EADCCA
              EADCCAEBDCC9EDDCC7F1DDC4F1DDC4EFDDC6EDDDC6EFDCC7EDDDC6EFDCC7EDDD
              C6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EF
              DCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7
              EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDD
              C6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EF
              DCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7
              EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDD
              C6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EF
              DCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7
              EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDD
              C600FFFFF7B8AB9BEAD9C4F4E0C7EED9BDF5DEC4EEDBC0EFDCC7EBDCC9EADCCA
              EADCCAEBDCC9EDDCC7F1DDC4F1DDC4EFDDC6EDDDC6EFDCC7EDDDC6EFDCC7EDDD
              C6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EF
              DCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7
              EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDD
              C6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EF
              DCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7
              EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDD
              C6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EF
              DCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7
              EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDDC6EFDCC7EDDD
              C600FFFFF5BAAC9AECDAC3F6E1C6EFDABBF7DFC3F0DBBFEFDAC4EBDAC5E8DAC8
              E8DAC8EBDAC5EDDBC4F1DCC1F1DCC1EFDBC2EDDCC2EFDAC4EDDCC2EFDAC4EDDC
              C2EFDAC4EDDCC2EFDAC4EDDCC2EFDAC4EDDCC2EFDAC4EDDCC2EFDAC4EDDCC2EF
              DAC4EDDCC2EFDAC4EDDCC2EFDAC4EDDCC2EFDAC4EDDCC2EFDAC4EDDCC2EFDAC4
              EDDCC2EFDAC4EDDCC2EFDAC4EDDCC2EFDAC4EDDCC2EFDAC4EDDCC2EFDAC4EDDC
              C2EFDAC4EDDCC2EFDAC4EDDCC2EFDAC4EDDCC2EFDAC4EDDCC2EFDAC4EDDCC2EF
              DAC4EDDCC2EFDAC4EDDCC2EFDAC4EDDCC2EFDAC4EDDCC2EFDAC4EDDCC2EFDAC4
              EDDCC2EFDAC4EDDCC2EFDAC4EDDCC2EFDAC4EDDCC2EFDAC4EDDCC2EFDAC4EDDC
              C2EFDAC4EDDCC2EFDAC4EDDCC2EFDAC4EDDCC2EFDAC4EDDCC2EFDAC4EDDCC2EF
              DAC4EDDCC2EFDAC4EDDCC2EFDAC4EDDCC2EFDAC4EDDCC2EFDAC4EDDCC2EFDAC4
              EDDCC2EFDAC4EDDCC2EFDAC4EDDCC2EFDAC4EDDCC2EFDAC4EDDCC2EFDAC4EDDC
              C200FFFFF4BBAC99EEDAC1F6E0C4F0D9B9F8DEC0F0DBBCF0DAC1ECDAC3E8D9C6
              E8D9C6ECDAC3EEDAC1F1DBBFF1DBBFF0DBC0EEDBC0F0DAC1EEDBC0F0DAC1EEDB
              C0F0DAC1EEDBC0F0DAC1EEDBC0F0DAC1EEDBC0F0DAC1EEDBC0F0DAC1EEDBC0F0
              DAC1EEDBC0F0DAC1EEDBC0F0DAC1EEDBC0F0DAC1EEDBC0F0DAC1EEDBC0F0DAC1
              EEDBC0F0DAC1EEDBC0F0DAC1EEDBC0F0DAC1EEDBC0F0DAC1EEDBC0F0DAC1EEDB
              C0F0DAC1EEDBC0F0DAC1EEDBC0F0DAC1EEDBC0F0DAC1EEDBC0F0DAC1EEDBC0F0
              DAC1EEDBC0F0DAC1EEDBC0F0DAC1EEDBC0F0DAC1EEDBC0F0DAC1EEDBC0F0DAC1
              EEDBC0F0DAC1EEDBC0F0DAC1EEDBC0F0DAC1EEDBC0F0DAC1EEDBC0F0DAC1EEDB
              C0F0DAC1EEDBC0F0DAC1EEDBC0F0DAC1EEDBC0F0DAC1EEDBC0F0DAC1EEDBC0F0
              DAC1EEDBC0F0DAC1EEDBC0F0DAC1EEDBC0F0DAC1EEDBC0F0DAC1EEDBC0F0DAC1
              EEDBC0F0DAC1EEDBC0F0DAC1EEDBC0F0DAC1EEDBC0F0DAC1EEDBC0F0DAC1EEDB
              C000FFFFF2BBAA95ECD7BCF7DFC1F1D8B6F2D6B7F8E1C1F3DCC2F0DCC3EEDCC5
              EEDCC5F0DCC3F2DDC2F5DDBFF5DDBFF3DDC1F2DDC1F3DCC2F2DDC1F3DCC2F2DD
              C1F3DCC2F2DDC1F3DCC2F2DDC1F3DCC2F2DDC1F3DCC2F2DDC1F3DCC2F2DDC1F3
              DCC2F2DDC1F3DCC2F2DDC1F3DCC2F2DDC1F3DCC2F2DDC1F3DCC2F2DDC1F3DCC2
              F2DDC1F3DCC2F2DDC1F3DCC2F2DDC1F3DCC2F2DDC1F3DCC2F2DDC1F3DCC2F2DD
              C1F3DCC2F2DDC1F3DCC2F2DDC1F3DCC2F2DDC1F3DCC2F2DDC1F3DCC2F2DDC1F3
              DCC2F2DDC1F3DCC2F2DDC1F3DCC2F2DDC1F3DCC2F2DDC1F3DCC2F2DDC1F3DCC2
              F2DDC1F3DCC2F2DDC1F3DCC2F2DDC1F3DCC2F2DDC1F3DCC2F2DDC1F3DCC2F2DD
              C1F3DCC2F2DDC1F3DCC2F2DDC1F3DCC2F2DDC1F3DCC2F2DDC1F3DCC2F2DDC1F3
              DCC2F2DDC1F3DCC2F2DDC1F3DCC2F2DDC1F3DCC2F2DDC1F3DCC2F2DDC1F3DCC2
              F2DDC1F3DCC2F2DDC1F3DCC2F2DDC1F3DCC2F2DDC1F3DCC2F2DDC1F3DCC2F2DD
              C100FFFDEDC0AF9AF7E4C9FFF2D4FFEBCBFBE2C2FAE2C4F7E2C7F5E1C8F3E1CA
              F3E1CAF5E1C8F7E2C7FAE2C4FAE2C4F8E2C6F7E2C7F8E1C7F7E2C7F8E1C7F7E2
              C7F8E1C7F7E2C7F8E1C7F7E2C7F8E1C7F7E2C7F8E1C7F7E2C7F8E1C7F7E2C7F8
              E1C7F7E2C7F8E1C7F7E2C7F8E1C7F7E2C7F8E1C7F7E2C7F8E1C7F7E2C7F8E1C7
              F7E2C7F8E1C7F7E2C7F8E1C7F7E2C7F8E1C7F7E2C7F8E1C7F7E2C7F8E1C7F7E2
              C7F8E1C7F7E2C7F8E1C7F7E2C7F8E1C7F7E2C7F8E1C7F7E2C7F8E1C7F7E2C7F8
              E1C7F7E2C7F8E1C7F7E2C7F8E1C7F7E2C7F8E1C7F7E2C7F8E1C7F7E2C7F8E1C7
              F7E2C7F8E1C7F7E2C7F8E1C7F7E2C7F8E1C7F7E2C7F8E1C7F7E2C7F8E1C7F7E2
              C7F8E1C7F7E2C7F8E1C7F7E2C7F8E1C7F7E2C7F8E1C7F7E2C7F8E1C7F7E2C7F8
              E1C7F7E2C7F8E1C7F7E2C7F8E1C7F7E2C7F8E1C7F7E2C7F8E1C7F7E2C7F8E1C7
              F7E2C7F8E1C7F7E2C7F8E1C7F7E2C7F8E1C7F7E2C7F8E1C7F7E2C7F8E1C7F7E2
              C700FFFFF5C3B5A3EDDBC4FFE9CFFFEACCFFECCEFFEFD3FFEED5FEEDD8FCEDDA
              FCEDDAFEEDD8FFEED5FFEFD3FFEFD3FFEED5FFEED5FFEED5FFEED5FFEED5FFEE
              D5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FF
              EED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5
              FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEE
              D5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FF
              EED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5
              FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEE
              D5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FF
              EED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5
              FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEED5FFEE
              D500FCF7EEB7AB9FC3B5A3C1AF98BBA78EBEAA91BDAB94BAAB98B7AB99B7AA9C
              B5AB9AB9AA9ABAAB98BEAC95BEAC95BCAB96BCAB98BCAB98BCAB98BCAB98BCAB
              98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BC
              AB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98
              BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB
              98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BC
              AB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98
              BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB
              98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BC
              AB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98
              BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB98BCAB
              9800FFFFFEF1EBE6FFFFF7FFFFF2FFFFF0FFFFF1FFFFF2FFFFF4FFFFF6FFFFF8
              FFFFF7FFFFF7FFFFF4FFFFF3FFFFF1FFFFF3FFFFF4FFFFF4FFFFF4FFFFF4FFFF
              F4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FF
              FFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4
              FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFF
              F4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FF
              FFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4
              FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFF
              F4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FF
              FFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4
              FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFFF4FFFF
              F400}
            Stretch = True
          end
          object Label1: TLabel
            Left = 8
            Top = 90
            Width = 39
            Height = 12
            Caption = #26174#31034#21015
            Font.Charset = GB2312_CHARSET
            Font.Color = clTeal
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Label2: TLabel
            Left = 147
            Top = 90
            Width = 40
            Height = 12
            Cursor = crHandPoint
            Anchors = [akTop, akRight]
            Caption = #20851#38381'>>'
            Font.Charset = GB2312_CHARSET
            Font.Color = clNavy
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = [fsBold, fsUnderline]
            ParentFont = False
            Transparent = True
            OnClick = actColumnVisibleExecute
          end
          object Panel5: TPanel
            Left = 2
            Top = 109
            Width = 191
            Height = 322
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 2
            Color = clWhite
            TabOrder = 0
            object rzShowColumns: TRzCheckList
              Left = 2
              Top = 2
              Width = 187
              Height = 318
              OnChange = rzShowColumnsChange
              Align = alClient
              FrameVisible = True
              ImeName = #26497#21697#20116#31508#36755#20837#27861
              ItemHeight = 20
              TabOrder = 0
            end
          end
          object RzPanel1: TRzPanel
            Left = 2
            Top = 2
            Width = 191
            Height = 82
            Align = alTop
            BorderOuter = fsNone
            Color = clWhite
            TabOrder = 1
            object Label27: TLabel
              Left = 13
              Top = 14
              Width = 168
              Height = 60
              Caption = '    '#35831#35201#19979#38754#21015#34920#20013#36873#25321#20320#35201#26174#13#13#31034#30340#26639#30446#21517#65292#36719#20214#23558#20026#20320#20445#30041#26368#13#13#21518#35774#32622#12290
              Font.Charset = GB2312_CHARSET
              Font.Color = clMaroon
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentFont = False
            end
          end
        end
      end
    end
  end
  inherited RzPanel4: TRzPanel
    Width = 774
    inherited Image3: TImage
      Left = 354
      Width = 0
    end
    inherited Image14: TImage
      Left = 754
    end
    inherited Image1: TImage
      Left = 342
      Width = 412
    end
    inherited rzPanel5: TPanel
      Left = 354
    end
    inherited CoolBar1: TCoolBar
      Width = 334
      Bands = <
        item
          Break = False
          Control = ToolBar1
          FixedSize = True
          ImageIndex = -1
          MinHeight = 334
          Width = 48
        end>
      inherited ToolBar1: TToolBar
        Width = 334
        ButtonWidth = 43
        object ToolButton1: TToolButton
          Left = 0
          Top = 0
          Action = actFind
        end
        object ToolButton2: TToolButton
          Left = 43
          Top = 0
          Action = actPrior
        end
        object ToolButton6: TToolButton
          Left = 86
          Top = 0
          Action = actColumnVisible
        end
        object ToolButton5: TToolButton
          Left = 129
          Top = 0
          Width = 8
          Caption = 'ToolButton5'
          ImageIndex = 14
          Style = tbsSeparator
        end
        object ToolButton3: TToolButton
          Left = 137
          Top = 0
          Action = actExport
          Style = tbsDropDown
        end
        object ToolButton9: TToolButton
          Left = 197
          Top = 0
          Action = actPrint
        end
        object ToolButton10: TToolButton
          Left = 240
          Top = 0
          Action = actPreview
        end
        object ToolButton8: TToolButton
          Left = 283
          Top = 0
          Width = 8
          Caption = 'ToolButton8'
          ImageIndex = 16
          Style = tbsSeparator
        end
        object ToolButton4: TToolButton
          Left = 291
          Top = 0
          Action = actExit
        end
      end
    end
  end
  inherited mmMenu: TMainMenu
    Left = 120
    Top = 80
  end
  inherited actList: TActionList
    Left = 152
    Top = 80
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
    inherited actPreview: TAction
      OnExecute = actPreviewExecute
    end
    object actFilter: TAction
      Caption = #26597#25214
      ImageIndex = 43
      OnExecute = actFilterExecute
    end
    object actExport: TAction
      Caption = #23548#20986
      ImageIndex = 4
      OnExecute = actExportExecute
    end
    object actColumnVisible: TAction
      Caption = #26174#31034#21015
      ImageIndex = 30
      OnExecute = actColumnVisibleExecute
    end
    object actPrior: TAction
      Caption = #36820#22238
      ImageIndex = 49
      OnExecute = actPriorExecute
    end
    object actFindNext: TAction
      Caption = #26597#25214#19979#19968#20010
    end
  end
  object dsadoReport1: TDataSource
    DataSet = adoReport1
    Left = 169
    Top = 330
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'xls'
    Filter = 'Excel '#25991#20214'|*.xls'
    Left = 341
    Top = 212
  end
  object adoReport1: TZQuery
    FieldDefs = <>
    CachedUpdates = True
    Params = <>
    Left = 168
    Top = 300
  end
  object PrintDBGridEh1: TPrintDBGridEh
    Options = [pghFitGridToPageWidth]
    Page.BottomMargin = 2.000000000000000000
    Page.LeftMargin = 2.000000000000000000
    Page.RightMargin = 0.500000000000000000
    Page.TopMargin = 2.000000000000000000
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'MS Sans Serif'
    PageFooter.Font.Style = []
    PageHeader.CenterText.Strings = (
      #35843#25972#27719#24635#34920)
    PageHeader.Font.Charset = GB2312_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -16
    PageHeader.Font.Name = #23435#20307
    PageHeader.Font.Style = [fsBold]
    Units = MM
    Left = 136
    Top = 152
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
