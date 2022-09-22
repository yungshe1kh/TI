unit lab2Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXCtrls,
  Vcl.ExtCtrls, Vcl.Grids;

type
  Toption = record
    amount: byte;
    x1: byte;
    x2: byte;
    x3: byte;
    x4: byte;
  end;

  Tlab2 = class(TForm)
    editInitialState: TEdit;
    labelInitialState: TLabel;
    buttonLoadFile: TButton;
    buttonClear: TButton;
    OpenDialog1: TOpenDialog;
    labelPolynomial: TLabel;
    editPolynomial: TEdit;
    memoKey: TMemo;
    buttonEncDec: TButton;
    memoPlain: TMemo;
    memoCypher: TMemo;
    StringGrid1: TStringGrid;
    SaveDialog1: TSaveDialog;
    comboBoxOption: TComboBox;
    labelOption: TLabel;
    memoPolynomial: TMemo;
    memoX: TMemo;
    procedure editInitialStateKeyPress(Sender: TObject; var Key: Char);
    procedure editInitialStateChange(Sender: TObject);
    procedure buttonEncDecClick(Sender: TObject);
    procedure buttonClearClick(Sender: TObject);
    procedure buttonLoadFileClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
                                  Rect: TRect; State: TGridDrawState);
    procedure comboBoxOptionChange(Sender: TObject);
    procedure comboBoxOptionKeyPress(Sender: TObject; var Key: Char);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  lab2: Tlab2;
  pathtofile: string;
  streamsize: integer;
  option: TOption;

implementation

{$R *.dfm}

procedure Tlab2.buttonClearClick(Sender: TObject);
begin
  buttonEncDec.Enabled := false;
  editInitialState.Enabled := true;
  editInitialState.Text := '';
  buttonLoadFile.Enabled := false;
  comboboxOption.Enabled := true;

  memoKey.Clear;
  memoPlain.Clear;
  memoCypher.Clear;

  stringgrid1.RowCount := 0;
end;

function FileToBytes(const AName: string; var Bytes: TBytes): Boolean;
var
  Stream: TFileStream;
begin
  if not FileExists(AName) then
  begin
    Result := False;
    Exit;
  end;

  Stream := TFileStream.Create(AName, fmOpenRead);

  try
    SetLength(Bytes, Stream.Size);
    Stream.ReadBuffer(Pointer(Bytes)^, Stream.Size);
    streamsize := stream.Size;
  finally
    Stream.Free;
  end;

  Result := True;
end;

procedure Tlab2.buttonLoadFileClick(Sender: TObject);
var
  bytes: TBytes;
  i, temp, temp2: integer;
  tempStr: string;
begin
  if opendialog1.Execute then
    pathtofile := opendialog1.FileName;

  if pathtofile <> '' then
  Begin
    bytes := nil;

    if filetobytes(pathtofile,bytes) then
    begin
      for i := 0 to streamsize - 1 do
      Begin
        temp := bytes[i];
        temp2 := 128;
        tempStr := '';

        while temp2 <> 0 do
        Begin
          if temp div temp2 = 1 then
          Begin
            tempStr := tempStr + '1';
            temp := temp - temp2;
          End
          else
            tempStr := tempStr + '0';

          temp2 := temp2 div 2;
        End;

        memoPlain.Lines.Add(tempStr);
      End;

      buttonEncDec.Enabled := true;
      editInitialState.Enabled := false;
      buttonLoadFile.Enabled := false;
      comboBoxOption.Enabled := false;
    end;
  End;

  pathtofile := '';
end;

procedure Tlab2.comboBoxOptionChange(Sender: TObject);
var
  str: string;
begin
  editPolynomial.Text := memoPolynomial.Lines[comboBoxOption.ItemIndex];

  str := memoX.Lines[comboBoxOption.ItemIndex];

  option.amount := strtoint(str[1]);
  delete (str,1,2);

  option.x1 := strtoint(copy(str,1,2));
  delete (str,1,3);

  if option.amount = 2 then
    option.x2 := strtoint(str)
  else
  Begin
    if str[2] = ' ' then
    Begin
      option.x2 := strtoint(copy(str,1,1));
      delete(str,1,2);
    End
    else
    Begin
      option.x2 := strtoint(copy(str,1,2));
      delete(str,1,3);
    End;

    if str[2] = ' ' then
    Begin
      option.x3 := strtoint(copy(str,1,1));
      delete(str,1,2);
    End
    else
    Begin
      option.x3 := strtoint(copy(str,1,2));
      delete(str,1,3);
    End;

    option.x4 := strtoint(str);
  End;

  if length(editInitialState.Text) > option.x1 then
  Begin
    str := editInitialState.Text;
    delete(str,option.x1+1,17);
    editInitialState.Text := str;
  End;

  if length(editInitialState.Text) <> option.x1 then
    buttonLoadFile.Enabled := false
  else
    buttonLoadFile.Enabled := true;

  editInitialState.MaxLength := option.x1;
end;

procedure Tlab2.comboBoxOptionKeyPress(Sender: TObject; var Key: Char);
begin
  key := #0;
end;

procedure SaveBytesToFile(const Data: TBytes; const FileName: string);
var
  Stream: TFileStream;
begin
  Stream := TFileStream.Create(FileName, fmCreate);
  try
    if Data <> nil then
      Stream.WriteBuffer(Data[0], Length(Data));
  finally
    Stream.Free;
  end;
end;

procedure Tlab2.buttonEncDecClick(Sender: TObject);
var
  flagOne: boolean;
  i, j, k, temp, cypher: integer;
  reg, regOut, regXor: string;
  bytes: TBytes;
begin
  buttonEncDec.Enabled := false;
  reg := editInitialState.Text;
  memoKey.Text := '';
  bytes := nil;
  setLength(bytes, streamsize);
  j := 0;

  for i := 1 to streamsize * 8 do
  Begin
    flagOne := false;

    if reg[1] = '1' then
    Begin
      if flagOne = true then
        flagOne := false
      else
        flagOne := true;
    End;

    if reg[option.x1 + 1 - option.x2] = '1' then
    Begin
      if flagOne = true then
        flagOne := false
      else
        flagOne := true;
    End;

    if option.amount = 4 then
    Begin
      if reg[option.x1 + 1 - option.x3] = '1' then
      Begin
        if flagOne = true then
          flagOne := false
        else
          flagOne := true;
      End;

      if reg[option.x1 + 1 - option.x4] = '1' then
      Begin
        if flagOne = true then
          flagOne := false
        else
          flagOne := true;
      End;
    End;

    if flagOne = true then
      regXor := '1'
    else
      regXor := '0';

    if ((i mod 8 = 1) and (i <> 1)) then
    Begin
      memoKey.Lines.Add(reg[1]);
      memoCypher.Lines.Add('');
      inc(j);

      stringgrid1.RowCount := j + 2;
      stringgrid1.Cells[0,j] := inttostr(j);
      stringgrid1.Cells[1,j] := memoKey.Lines[j-1];
      stringgrid1.Cells[2,j] := memoPlain.Lines[j-1];
      stringgrid1.Cells[3,j] := memoCypher.Lines[j-1];

      temp := 128;
      cypher := 0;

      for k := 1 to 8 do
      Begin
        if memoCypher.Lines[j-1][k] = '1' then
          cypher := cypher + temp;

        temp := temp div 2;
      End;

      bytes[j-1] := cypher;
    End
    else
      memoKey.Lines[j] := memoKey.Lines[j] + reg[1];

    {if (reg[1] = '1') then
      if (memoPlain.Lines[j][((i-1) mod 8) + 1] = '1') then
        memoCypher.Lines[j] := memoCypher.Lines[j] + '0'
      else
        memoCypher.Lines[j] := memoCypher.Lines[j] + '1'
    else
      if (memoPlain.Lines[j][((i-1) mod 8) + 1] = '0') then
        memoCypher.Lines[j] := memoCypher.Lines[j] + '0'
      else
        memoCypher.Lines[j] := memoCypher.Lines[j] + '1';}

    if (reg[1] = memoPlain.Lines[j][((i-1) mod 8) + 1]) then
      memoCypher.Lines[j] := memoCypher.Lines[j] + '0'
    else
      memoCypher.Lines[j] := memoCypher.Lines[j] + '1';

    delete(reg, 1, 1);
    reg := reg + regXor;
  End;

  stringgrid1.Cells[0,j+1] := inttostr(j+1);
  stringgrid1.Cells[1,j+1] := memoKey.Lines[j];
  stringgrid1.Cells[2,j+1] := memoPlain.Lines[j];
  stringgrid1.Cells[3,j+1] := memoCypher.Lines[j];

  temp := 128;
  cypher := 0;

  for k := 1 to 8 do
  Begin
    if memoCypher.Lines[j][k] = '1' then
      cypher := cypher + temp;

    temp := temp div 2;
  End;

  bytes[j] := cypher;

  if savedialog1.Execute then
    pathtofile := savedialog1.FileName;

  if pathtofile <> '' then
    SaveBytesToFile(Bytes, pathtofile);

  pathtofile := '';
end;

procedure Tlab2.editInitialStateChange(Sender: TObject);
var
  strTemp: string;
  flag: boolean;
  i: byte;
begin
  flag := false;

  for i := 1 to length(editInitialState.Text) do
    if editInitialState.Text[i] = '1' then
    Begin
      flag := true;
      break;
    End;

  if (length(editInitialState.Text) = option.x1) and (flag = true) then
    buttonLoadFile.Enabled := true
  else
    buttonLoadFile.Enabled := false;
end;

procedure Tlab2.editInitialStateKeyPress(Sender: TObject; var Key: Char);
begin
  if not ((key = '1') or (key = '0') or (key = #8)) then
    key := #0;
end;

procedure Tlab2.FormCreate(Sender: TObject);
begin
  stringgrid1.Cells[0,0] := '      byte   ';
  stringgrid1.Cells[1,0] := '       key';
  stringgrid1.Cells[2,0] := '      plain';
  stringgrid1.Cells[3,0] := '     cypher';

  comboBoxOption.ItemIndex := 11;
  editPolynomial.Text := memoPolynomial.Lines[11];

  option.amount := 4;
  option.x1 := 34;
  option.x2 := 15;
  option.x3 := 14;
  option.x4 := 1;

  editInitialState.MaxLength := 34;
end;

procedure Tlab2.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
 Rect: TRect; State: TGridDrawState);
begin
 if gdSelected in State then
  with TStringGrid(Sender), TStringGrid(Sender).Canvas do
  Begin
    Brush.Color := clWhite;
    FillRect (Rect);
    TextRect (Rect, Rect.Left+2, Rect.Top+2, Cells[ACol, ARow]);
  end;
end;
end.
