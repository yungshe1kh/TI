object lab3: Tlab3
  Left = 500
  Top = 200
  Caption = 'lab3'
  ClientHeight = 501
  ClientWidth = 708
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
  object labelP: TLabel
    Left = 25
    Top = 49
    Width = 49
    Height = 20
    Caption = 'enter P'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
  end
  object labelXa: TLabel
    Left = 25
    Top = 145
    Width = 48
    Height = 20
    Caption = 'pick Xa'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
  end
  object labelK: TLabel
    Left = 25
    Top = 307
    Width = 41
    Height = 20
    Caption = 'pick K'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
  end
  object labelG: TLabel
    Left = 25
    Top = 81
    Width = 42
    Height = 20
    Caption = 'pick G'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
  end
  object labelPnQ: TLabel
    Left = 863
    Top = 345
    Width = 5
    Height = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
  end
  object labelXb: TLabel
    Left = 25
    Top = 177
    Width = 48
    Height = 20
    Caption = 'pick Xb'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
  end
  object labelXc: TLabel
    Left = 25
    Top = 209
    Width = 47
    Height = 20
    Caption = 'pick Xc'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
  end
  object labelXd: TLabel
    Left = 25
    Top = 241
    Width = 48
    Height = 20
    Caption = 'pick Xd'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
  end
  object labelUser: TLabel
    Left = 25
    Top = 338
    Width = 71
    Height = 20
    Caption = 'select user'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
  end
  object memoTemp: TMemo
    Left = 863
    Top = 227
    Width = 409
    Height = 62
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -7
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    Visible = False
  end
  object editP: TEdit
    Left = 90
    Top = 46
    Width = 87
    Height = 28
    BiDiMode = bdLeftToRight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    NumbersOnly = True
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 1
    OnChange = editPChange
  end
  object buttonTemp: TButton
    Left = 199
    Top = 46
    Width = 82
    Height = 28
    Caption = 'enter'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = buttonTempClick
  end
  object editXa: TEdit
    Left = 848
    Top = 210
    Width = 129
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 3
  end
  object editK: TEdit
    Left = 1144
    Top = 315
    Width = 87
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 4
  end
  object memoPrimes: TMemo
    Left = 929
    Top = 261
    Width = 185
    Height = 89
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    Lines.Strings = (
      '2'
      '3'
      '5'
      '7'
      '11'
      '13'
      '17'
      '19'
      '23'
      '29'
      '31'
      '37'
      '41'
      '43'
      '47'
      '53'
      '59'
      '61'
      '67'
      '71'
      '73'
      '79'
      '83'
      '89'
      '97'
      '101'
      '103'
      '107'
      '109'
      '113'
      '127'
      '131'
      '137'
      '139'
      '149'
      '151'
      '157'
      '163'
      '167'
      '173'
      '179'
      '181'
      '191'
      '193'
      '197'
      '199'
      '211'
      '223'
      '227'
      '229'
      '233'
      '239'
      '241'
      '251'
      '257'
      '263'
      '269'
      '271'
      '277'
      '281'
      '283'
      '293'
      '307'
      '311'
      '313'
      '317'
      '331'
      '337'
      '347'
      '349'
      '353'
      '359'
      '367'
      '373'
      '379'
      '383'
      '389'
      '397'
      '401'
      '409'
      '419'
      '421'
      '431'
      '433'
      '439'
      '443'
      '449'
      '457'
      '461'
      '463'
      '467'
      '479'
      '487'
      '491'
      '499'
      '503'
      '509'
      '521'
      '523'
      '541'
      '547'
      '557'
      '563'
      '569'
      '571'
      '577'
      '587'
      '593'
      '599'
      '601'
      '607'
      '613'
      '617'
      '619'
      '631'
      '641'
      '643'
      '647'
      '653'
      '659'
      '661'
      '673'
      '677'
      '683'
      '691'
      '701'
      '709'
      '719'
      '727'
      '733'
      '739'
      '743'
      '751'
      '757'
      '761'
      '769'
      '773'
      '787'
      '797'
      '809'
      '811'
      '821'
      '823'
      '827'
      '829'
      '839'
      '853'
      '857'
      '859'
      '863'
      '877'
      '881'
      '883'
      '887'
      '907'
      '911'
      '919'
      '929'
      '937'
      '941'
      '947'
      '953'
      '967'
      '971'
      '977'
      '983'
      '991'
      '997'
      '1009'
      '1013'
      '1019'
      '1021'
      '1031'
      '1033'
      '1039'
      '1049'
      '1051'
      '1061'
      '1063'
      '1069'
      '1087'
      '1091'
      '1093'
      '1097'
      '1103'
      '1109'
      '1117'
      '1123'
      '1129'
      '1151'
      '1153'
      '1163'
      '1171'
      '1181'
      '1187'
      '1193'
      '1201'
      '1213'
      '1217'
      '1223'
      '1229'
      '1231'
      '1237'
      '1249'
      '1259'
      '1277'
      '1279'
      '1283'
      '1289'
      '1291'
      '1297'
      '1301'
      '1303'
      '1307'
      '1319'
      '1321'
      '1327'
      '1361'
      '1367'
      '1373'
      '1381'
      '1399'
      '1409')
    ParentFont = False
    TabOrder = 5
    Visible = False
  end
  object comboBoxG: TComboBox
    Left = 90
    Top = 78
    Width = 87
    Height = 28
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnChange = comboBoxGChange
  end
  object buttonTemp2: TButton
    Left = 199
    Top = 80
    Width = 82
    Height = 26
    Caption = 'pick'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = buttonTemp2Click
  end
  object StringGrid1: TStringGrid
    Left = 327
    Top = 20
    Width = 306
    Height = 259
    ColCount = 3
    DefaultColWidth = 100
    DefaultRowHeight = 50
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    RowHeights = (
      50)
  end
  object editXd: TEdit
    Left = 848
    Top = 306
    Width = 129
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 9
  end
  object editXc: TEdit
    Left = 848
    Top = 274
    Width = 129
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 10
  end
  object editXb: TEdit
    Left = 848
    Top = 242
    Width = 129
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 11
  end
  object buttonTemp3: TButton
    Left = 199
    Top = 190
    Width = 82
    Height = 33
    Caption = 'pick'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    OnClick = buttonTemp3Click
  end
  object comboBoxXd: TComboBox
    Left = 90
    Top = 238
    Width = 87
    Height = 28
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
    OnEnter = comboBoxXdEnter
    OnKeyPress = comboBoxXdKeyPress
    OnSelect = comboBoxXdSelect
  end
  object comboBoxXc: TComboBox
    Left = 90
    Top = 206
    Width = 87
    Height = 28
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
    OnEnter = comboBoxXcEnter
    OnKeyPress = comboBoxXdKeyPress
    OnSelect = comboBoxXcSelect
  end
  object comboBoxXb: TComboBox
    Left = 90
    Top = 174
    Width = 87
    Height = 28
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 15
    OnEnter = comboBoxXbEnter
    OnKeyPress = comboBoxXdKeyPress
    OnSelect = comboBoxXbSelect
  end
  object comboBoxXa: TComboBox
    Left = 90
    Top = 142
    Width = 87
    Height = 28
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 16
    OnEnter = comboBoxXaEnter
    OnKeyPress = comboBoxXdKeyPress
    OnSelect = comboBoxXaSelect
  end
  object comboBoxXinvis: TComboBox
    Left = 985
    Top = 295
    Width = 145
    Height = 24
    TabOrder = 17
    Visible = False
  end
  object comboBoxUser: TComboBox
    Left = 115
    Top = 338
    Width = 87
    Height = 28
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 18
    OnKeyPress = comboBoxUserKeyPress
    OnSelect = comboBoxUserSelect
  end
  object buttonLoad: TButton
    Left = 58
    Top = 380
    Width = 87
    Height = 35
    Caption = 'encrypt'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 19
    OnClick = buttonLoadClick
  end
  object comboBoxK: TComboBox
    Left = 115
    Top = 304
    Width = 87
    Height = 28
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 20
    OnKeyPress = comboBoxKKeyPress
    OnSelect = comboBoxKSelect
  end
  object Memo1: TMemo
    Left = 834
    Top = 389
    Width = 176
    Height = 124
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 21
  end
  object StringGrid2: TStringGrid
    Left = 255
    Top = 338
    Width = 429
    Height = 147
    ColCount = 4
    DefaultColWidth = 100
    DefaultRowHeight = 35
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 22
  end
  object Button1: TButton
    Left = 58
    Top = 436
    Width = 87
    Height = 35
    Caption = 'decrypt'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 23
    OnClick = Button1Click
  end
  object OpenDialog1: TOpenDialog
    Left = 216
    Top = 121
  end
  object SaveDialog1: TSaveDialog
    Left = 216
    Top = 232
  end
end
