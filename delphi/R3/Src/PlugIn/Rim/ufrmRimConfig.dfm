object frmRimConfig: TfrmRimConfig
  Left = 415
  Top = 210
  BorderStyle = bsDialog
  Caption = 'RIM'#25509#21475#21442#25968
  ClientHeight = 190
  ClientWidth = 401
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 25
    Top = 16
    Width = 48
    Height = 12
    Caption = #26381#21153#22320#22336
  end
  object Label2: TLabel
    Left = 80
    Top = 40
    Width = 163
    Height = 13
    Caption = #20363#65306'http://10.73.39.121:9081/rim'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 81
    Top = 14
    Width = 265
    Height = 20
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    TabOrder = 0
  end
  object Button1: TButton
    Left = 208
    Top = 152
    Width = 75
    Height = 25
    Caption = #30830#35748'(&O)'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 296
    Top = 152
    Width = 75
    Height = 25
    Caption = #21462#28040'(&C)'
    TabOrder = 2
    OnClick = Button2Click
  end
  object chkTWO_PHASE_COMMIT: TCheckBox
    Left = 80
    Top = 64
    Width = 169
    Height = 17
    Caption = #26159#21542#21551#29992#20998#24067#24335#20107#21153
    TabOrder = 3
  end
end
