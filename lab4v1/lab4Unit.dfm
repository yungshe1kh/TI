object lab4: Tlab4
  Left = 0
  Top = 0
  Caption = 'lab4'
  ClientHeight = 327
  ClientWidth = 386
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 25
    Top = 29
    Width = 49
    Height = 20
    Caption = 'enter P'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 23
    Top = 71
    Width = 51
    Height = 20
    Caption = 'enter Q'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 25
    Top = 113
    Width = 49
    Height = 20
    Caption = 'enter E'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
  end
  object editP: TEdit
    Left = 88
    Top = 26
    Width = 89
    Height = 28
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 0
    OnChange = editPChange
  end
  object editQ: TEdit
    Left = 88
    Top = 68
    Width = 89
    Height = 28
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 1
    OnChange = editPChange
  end
  object buttonSelect: TButton
    Left = 48
    Top = 160
    Width = 107
    Height = 33
    Caption = 'select'
    Enabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = buttonSelectClick
  end
  object editE: TEdit
    Left = 88
    Top = 110
    Width = 89
    Height = 28
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 3
    OnChange = editPChange
  end
  object memoInvis: TMemo
    Left = 208
    Top = 26
    Width = 153
    Height = 284
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object buttonLoad: TButton
    Left = 48
    Top = 199
    Width = 107
    Height = 33
    Caption = 'sign'
    Enabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = buttonLoadClick
  end
  object buttonLoadSigned: TButton
    Left = 48
    Top = 238
    Width = 107
    Height = 33
    Caption = 'check'
    Enabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = buttonLoadSignedClick
  end
  object buttonClear: TButton
    Left = 48
    Top = 277
    Width = 107
    Height = 33
    Caption = 'clear'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = buttonClearClick
  end
  object OpenDialog1: TOpenDialog
    Left = 248
    Top = 96
  end
  object SaveDialog1: TSaveDialog
    Left = 248
    Top = 144
  end
end
