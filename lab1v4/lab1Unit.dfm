object lab1: Tlab1
  Left = 0
  Top = 0
  Caption = 'lab1'
  ClientHeight = 440
  ClientWidth = 838
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 578
    Top = 11
    Width = 69
    Height = 23
    Caption = 'Plaintext'
    Enabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 566
    Top = 263
    Width = 81
    Height = 23
    Caption = 'Ciphertext'
    Enabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 152
    Top = 187
    Width = 43
    Height = 23
    Caption = 'Rails:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label4: TLabel
    Left = 33
    Top = 233
    Width = 32
    Height = 23
    Caption = 'Key:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object memoEnc: TMemo
    Left = 424
    Top = 40
    Width = 377
    Height = 121
    Enabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = memoEncChange
  end
  object memoDec: TMemo
    Left = 424
    Top = 292
    Width = 377
    Height = 121
    Enabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnChange = memoDecChange
  end
  object buttonMain: TButton
    Left = 440
    Top = 188
    Width = 153
    Height = 57
    Caption = 'Encrypt / Decrypt'
    Enabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = buttonMainClick
  end
  object buttonLoadCipher: TButton
    Left = 34
    Top = 357
    Width = 161
    Height = 64
    Caption = 'Load ciphertext'
    Enabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = buttonLoadCipherClick
  end
  object buttonLoadPlain: TButton
    Left = 34
    Top = 279
    Width = 161
    Height = 64
    Caption = 'Load plaintext'
    Enabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = buttonLoadPlainClick
  end
  object buttonClear: TButton
    Left = 632
    Top = 188
    Width = 152
    Height = 57
    Caption = 'Clear'
    Enabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = buttonClearClick
  end
  object railsCount: TNumberBox
    Left = 201
    Top = 184
    Width = 41
    Height = 31
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Visible = False
    OnChange = railsCountChange
  end
  object buttonSet: TButton
    Left = 269
    Top = 178
    Width = 113
    Height = 43
    Caption = 'Set'
    Enabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = buttonSetClick
  end
  object RadioGroup1: TRadioGroup
    Left = 16
    Top = 32
    Width = 377
    Height = 140
    Caption = 'Select encryption algorithm:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    Items.Strings = (
      #1072#1083#1075#1086#1088#1080#1090#1084' '#1042#1080#1078#1077#1085#1077#1088#1072', '#1087#1088#1086#1075#1088#1077#1089#1089#1080#1074#1085#1099#1081' '#1082#1083#1102#1095
      #1096#1080#1092#1088' '#1055#1083#1077#1081#1092#1077#1088#1072
      #1084#1077#1090#1086#1076' "'#1078#1077#1083#1077#1079#1085#1086#1076#1086#1088#1086#1078#1085#1086#1081' '#1080#1079#1075#1086#1088#1086#1076#1080'"')
    ParentFont = False
    TabOrder = 8
    OnClick = RadioGroup1Click
  end
  object buttonReset: TButton
    Left = 16
    Top = 178
    Width = 113
    Height = 43
    Caption = 'Reset'
    Enabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = buttonResetClick
  end
  object memoInvis: TMemo
    Left = 848
    Top = 188
    Width = 369
    Height = 89
    TabOrder = 10
    Visible = False
  end
  object StringGrid1: TStringGrid
    Left = 848
    Top = 44
    Width = 329
    Height = 128
    FixedCols = 0
    FixedRows = 0
    TabOrder = 11
    Visible = False
  end
  object editKey: TEdit
    Left = 80
    Top = 230
    Width = 281
    Height = 31
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    Visible = False
    OnChange = editKeyChange
  end
  object buttonSavePlain: TButton
    Left = 221
    Top = 279
    Width = 161
    Height = 64
    Caption = 'Save plaintext'
    Enabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
    OnClick = buttonSavePlainClick
  end
  object buttonSaveCipher: TButton
    Left = 221
    Top = 357
    Width = 161
    Height = 64
    Caption = 'Save ciphertext'
    Enabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
    OnClick = buttonSaveCipherClick
  end
  object OpenDialog1: TOpenDialog
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' (*.txt)|*.txt'
    Left = 384
  end
  object SaveDialog1: TSaveDialog
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' (*.txt)|*.txt'
    Left = 424
  end
end
