object lab2: Tlab2
  Left = 500
  Top = 130
  Caption = 'lab2'
  ClientHeight = 616
  ClientWidth = 619
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object labelInitialState: TLabel
    Left = 31
    Top = 65
    Width = 143
    Height = 23
    Caption = 'LFSR'#39's initial state'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
  end
  object labelPolynomial: TLabel
    Left = 154
    Top = 21
    Width = 139
    Height = 23
    Caption = 'LFSR'#39's polynomial'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
  end
  object labelOption: TLabel
    Left = 31
    Top = 21
    Width = 52
    Height = 23
    Caption = 'option'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
  end
  object editInitialState: TEdit
    Left = 195
    Top = 62
    Width = 390
    Height = 31
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    OnChange = editInitialStateChange
    OnKeyPress = editInitialStateKeyPress
  end
  object buttonLoadFile: TButton
    Left = 51
    Top = 116
    Width = 143
    Height = 48
    Caption = 'load file'
    Enabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = buttonLoadFileClick
  end
  object buttonClear: TButton
    Left = 444
    Top = 116
    Width = 121
    Height = 48
    Caption = 'clear'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = buttonClearClick
  end
  object editPolynomial: TEdit
    Left = 309
    Top = 18
    Width = 276
    Height = 31
    Enabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object memoKey: TMemo
    Left = 790
    Top = 66
    Width = 65
    Height = 30
    Enabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
    Visible = False
  end
  object buttonEncDec: TButton
    Left = 248
    Top = 116
    Width = 143
    Height = 48
    Caption = 'enc/dec'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = buttonEncDecClick
  end
  object memoPlain: TMemo
    Left = 790
    Top = 102
    Width = 65
    Height = 30
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
    Visible = False
  end
  object memoCypher: TMemo
    Left = 790
    Top = 138
    Width = 65
    Height = 30
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
    Visible = False
  end
  object StringGrid1: TStringGrid
    Left = 31
    Top = 188
    Width = 554
    Height = 406
    ColCount = 4
    DefaultColWidth = 133
    DefaultRowHeight = 33
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -22
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
  object comboBoxOption: TComboBox
    Left = 89
    Top = 18
    Width = 41
    Height = 31
    AutoComplete = False
    AutoCloseUp = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnChange = comboBoxOptionChange
    OnKeyPress = comboBoxOptionKeyPress
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10'
      '11'
      '12'
      '13'
      '14'
      '15'
      '16'
      '17'
      '18')
  end
  object memoPolynomial: TMemo
    Left = 655
    Top = 30
    Width = 200
    Height = 30
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    Lines.Strings = (
      '   x^23 + x^5 + 1'
      '   x^24 + x^4 + x^3 + x + 1'
      '   x^25 + x^3 + 1'
      '   x^26 + x^8 + x^7 + x + 1'
      '   x^27 + x^8 + x^7 + x + 1'
      '   x^28 + x^3 + 1'
      '   x^29 + x^2 + 1'
      '   x^30 + x^16 + x^15 + x + 1'
      '   x^31 + x^3 + 1'
      '   x^32 + x^28 + x^27 + x + 1'
      '   x^33 + x^13 + 1'
      '   x^34 + x^15 + x^14 + x + 1'
      '   x^35 + x^2 + 1'
      '   x^36 + x^11 + 1'
      '   x^37 + x^12 + x^10 + x^2 + 1'
      '   x^38 + x^6 + x^5 + x + 1'
      '   x^39 + x^4 + 1'
      '   x^40 + x^21 + x^19 + x^2 + 1')
    ParentFont = False
    TabOrder = 10
    Visible = False
  end
  object memoX: TMemo
    Left = 655
    Top = 66
    Width = 95
    Height = 30
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    Lines.Strings = (
      '2 23 5'
      '4 24 4 3 1'
      '2 25 3'
      '4 26 8 7 1'
      '4 27 8 7 1'
      '2 28 3'
      '2 29 2'
      '4 30 16 15 1'
      '2 31 3'
      '4 32 28 27 1'
      '2 33 13'
      '4 34 15 14 1'
      '2 35 2'
      '2 36 11'
      '4 37 12 10 2'
      '4 38 6 5 1'
      '2 39 4'
      '4 40 21 19 2')
    ParentFont = False
    TabOrder = 11
    Visible = False
  end
  object OpenDialog1: TOpenDialog
    Left = 664
    Top = 120
  end
  object SaveDialog1: TSaveDialog
    Left = 712
    Top = 120
  end
end
