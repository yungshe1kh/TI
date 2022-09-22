unit lab3Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Math, Vcl.Grids;

type
  Tlab3 = class(TForm)
    memoTemp: TMemo;
    editP: TEdit;
    buttonTemp: TButton;
    labelP: TLabel;
    labelXa: TLabel;
    labelK: TLabel;
    labelG: TLabel;
    editXa: TEdit;
    editK: TEdit;
    memoPrimes: TMemo;
    comboBoxG: TComboBox;
    buttonTemp2: TButton;
    labelPnQ: TLabel;
    StringGrid1: TStringGrid;
    labelXb: TLabel;
    labelXc: TLabel;
    labelXd: TLabel;
    editXd: TEdit;
    editXc: TEdit;
    editXb: TEdit;
    buttonTemp3: TButton;
    comboBoxXd: TComboBox;
    comboBoxXc: TComboBox;
    comboBoxXb: TComboBox;
    comboBoxXa: TComboBox;
    comboBoxXinvis: TComboBox;
    comboBoxUser: TComboBox;
    OpenDialog1: TOpenDialog;
    buttonLoad: TButton;
    comboBoxK: TComboBox;
    labelUser: TLabel;
    Memo1: TMemo;
    StringGrid2: TStringGrid;
    SaveDialog1: TSaveDialog;
    Button1: TButton;
    procedure buttonTempClick(Sender: TObject);
    procedure buttonTemp2Click(Sender: TObject);
    procedure editPChange(Sender: TObject);
    procedure comboBoxGChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure comboBoxXaSelect(Sender: TObject);
    procedure comboBoxXbSelect(Sender: TObject);
    procedure comboBoxXcSelect(Sender: TObject);
    procedure comboBoxXdSelect(Sender: TObject);
    procedure comboBoxXcEnter(Sender: TObject);
    procedure comboBoxXdEnter(Sender: TObject);
    procedure comboBoxXbEnter(Sender: TObject);
    procedure comboBoxXaEnter(Sender: TObject);
    procedure comboBoxXdKeyPress(Sender: TObject; var Key: Char);
    procedure buttonTemp3Click(Sender: TObject);
    procedure comboBoxUserKeyPress(Sender: TObject; var Key: Char);
    procedure buttonLoadClick(Sender: TObject);
    procedure comboBoxKKeyPress(Sender: TObject; var Key: Char);
    procedure comboBoxKSelect(Sender: TObject);
    procedure comboBoxUserSelect(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  lab3: Tlab3;
  p, g, streamsize: integer;

implementation

{$R *.dfm}

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

procedure Tlab3.Button1Click(Sender: TObject);
var
  pathtofile, str, str1: string;
  f: textfile;
  i, i1, a, b, m1, x, y: integer;
  cypher: array of integer;
begin
  if opendialog1.Execute then
    pathtofile := opendialog1.FileName;

  if pathtofile <> '' then
  Begin
    x := strtoint(stringgrid1.Cells[1,comboBoxUser.ItemIndex+1]);
    y := strtoint(stringgrid1.Cells[2,comboBoxUser.ItemIndex+1]);
    assignfile(f,pathtofile);
    reset(f);

    read(f,str);
    str := str + ' ';

    closefile(f);

    for i := 1 to length(str) do
    Begin
      if str[i] <> ' ' then
        str1 := str1 + str[i]
      else
      Begin
        setlength(cypher,length(cypher)+1);
        cypher[length(cypher)-1] := strtoint(str1);
        str1 := '';
      End;
    End;

    str := '';

    for i := 0 to (length(cypher) div 2)-1 do
    Begin
      a := cypher[i*2];
      b := cypher[i*2+1];

      m1 := 1;

      for i1 := 1 to (p-1-x) do
        m1 := (m1 * a) mod p;

      m1 := (m1 * b) mod p;

      str := str + char(m1);
    End;

    pathtofile := '';

    if savedialog1.Execute then
      pathtofile := savedialog1.FileName;

    if pathtofile <> '' then
    Begin
      assignfile(f,pathtofile);
      rewrite(f);

      write(f,str);

      closefile(f);
    End;
  End;
end;

procedure Tlab3.buttonLoadClick(Sender: TObject);
var
  pathtofile, pathtosavefile: string;
  bytes: TBytes;
  save: array of string;
  text: array of char;
  i, i1, x, y, k, m, m1, a, b: integer;
  f: textfile;
  j: Integer;
begin
  k := strtoint(comboBoxK.Text);
  x := strtoint(stringgrid1.Cells[1,comboBoxUser.ItemIndex+1]);
  y := strtoint(stringgrid1.Cells[2,comboBoxUser.ItemIndex+1]);

  if openDialog1.Execute then
    pathtofile := openDialog1.FileName;

  if pathtofile <> '' then
  Begin
    buttonLoad.Enabled := false;
    labelK.Enabled := false;
    comboBoxK.Enabled := false;
    labelUser.Enabled := false;
    comboBoxUser.Enabled := false;

    bytes := nil;

    if filetobytes(pathtofile,bytes) then
      for i := 0 to streamsize-1 do
      Begin
        m := bytes[i];

        a := 1;
        b := 1;

        for i1 := 1 to k do
        Begin
          a := (a * g) mod p;
          b := (b * y) mod p;
        End;

        b := (b * m) mod p;

        setLength(save,length(save)+2);
        save[i*2] := inttostr(a);
        save[i*2+1] := inttostr(b);

        //m1 := 1;

        //for i1 := 1 to (p-1-x) do
          //m1 := (m1 * a) mod p;

        //m1 := (m1 * b) mod p;

        stringgrid2.RowCount := stringgrid2.RowCount + 1;
        stringgrid2.Cells[0,i+1] := char(bytes[i]);
        stringgrid2.Cells[2,i+1] := '(' + inttostr(a) + ',' + inttostr(b) + ')';
        stringgrid2.Cells[1,i+1] := inttostr(m);
        //stringgrid2.Cells[3,i+1] := inttostr(m1);

        {if i = 0 then
        Begin
          editXa.Text := inttostr(a);
          editXb.Text := inttostr(b);
          editXc.Text := inttostr(m);
          editXd.Text := inttostr(m1);
        End
        else
        Begin
          editXa.Text := editXa.Text + ' ' + inttostr(a);
          editXb.Text := editXb.Text + ' ' + inttostr(b);
          editXc.Text := editXc.Text + ' ' + inttostr(m);
          editXd.Text := editXd.Text + ' ' + inttostr(m1);
        End;}
      End;

    pathtofile := '';

    if savedialog1.Execute then
      pathtofile := savedialog1.FileName;

    if pathtofile <> '' then
    Begin
      assignfile(f,pathtofile);
      rewrite(f);

      for i := 0 to length(save)-1 do
        if i <> length(save)-1 then
          write(f,save[i] + ' ')
        else
          write(f,save[i]);

      closefile(f);
    End;
  End;

  pathtofile := '';
end;

procedure Tlab3.buttonTemp2Click(Sender: TObject);
var
  temp: integer;
begin
  g := strtoint(comboBoxG.Text);
  labelPnQ.Caption := 'p = ' + inttostr(p) + ', g = ' + inttostr(g);
  //stringgrid1.Visible := true;

  buttonTemp2.Enabled := false;
  comboBoxG.Enabled := false;
  labelG.Enabled := false;

  if p = 5 then
  Begin
    stringgrid1.RowCount := 5;
    temp := (round(exp(ln(g)*2)) mod p);
    stringgrid1.Cells[2,1] := inttostr(temp);
    temp := (round(exp(ln(g)*3)) mod p);
    stringgrid1.Cells[2,2] := inttostr(temp);
    comboBoxUser.Enabled := true;
    comboBoxUser.Items.Add('Alice');
    comboBoxUser.Items.Add('Bob');
    comboBoxK.Enabled := true;
    labelK.Enabled := true;
    comboBoxUser.Enabled := true;
    labelUser.Enabled := true;
  End
  else
    if p = 7 then
    Begin
      stringgrid1.RowCount := 5;
      temp := (round(exp(ln(g)*2)) mod p);
      stringgrid1.Cells[2,1] := inttostr(temp);
      temp := (round(exp(ln(g)*3)) mod p);
      stringgrid1.Cells[2,2] := inttostr(temp);
      temp := (round(exp(ln(g)*4)) mod p);
      stringgrid1.Cells[2,3] := inttostr(temp);
      temp := (round(exp(ln(g)*5)) mod p);
      stringgrid1.Cells[2,4] := inttostr(temp);
      comboBoxUser.Enabled := true;

      comboBoxUser.Items.Add('Alice');
      comboBoxUser.Items.Add('Bob');
      comboBoxUser.Items.Add('Charlie');
      comboBoxUser.Items.Add('Dominic');
      comboBoxK.Enabled := true;
      labelK.Enabled := true;
      comboBoxUser.Enabled := true;
      labelUser.Enabled := true;
    End
    else
    Begin
      labelXa.Enabled := true;
      labelXb.Enabled := true;
      labelXc.Enabled := true;
      labelXd.Enabled := true;
      comboBoxXa.Enabled := true;
      comboBoxXb.Enabled := true;
      comboBoxXc.Enabled := true;
      comboBoxXd.Enabled := true;
    End;
end;

procedure Tlab3.buttonTemp3Click(Sender: TObject);
var
  temp: int64;
  i: integer;
begin
  buttonTemp3.Enabled := false;
  labelXa.Enabled := false;
  labelXb.Enabled := false;
  labelXc.Enabled := false;
  labelXd.Enabled := false;
  comboBoxXa.Enabled := false;
  comboBoxXb.Enabled := false;
  comboBoxXc.Enabled := false;
  comboBoxXd.Enabled := false;
  comboBoxK.Enabled := true;
  labelK.Enabled := true;
  comboBoxUser.Enabled := true;
  labelUser.Enabled := true;

  temp := 1;

  for i := 1 to strtoint(comboBoxXa.Text) do
    temp := (temp * g) mod p;

  //temp := (round(exp(ln(g)*strtoint(comboBoxXa.Text))) mod p);

  stringgrid1.Cells[1,1] := comboBoxXa.Text;
  stringgrid1.Cells[2,1] := inttostr(temp);

  temp := 1;

  for i := 1 to strtoint(comboBoxXb.Text) do
    temp := (temp * g) mod p;

  //temp := (round(exp(ln(g)*strtoint(comboBoxXb.Text))) mod p);

  stringgrid1.Cells[1,2] := comboBoxXb.Text;
  stringgrid1.Cells[2,2] := inttostr(temp);

  temp := 1;

  for i := 1 to strtoint(comboBoxXc.Text) do
    temp := (temp * g) mod p;

  //temp := (round(exp(ln(g)*strtoint(comboBoxXc.Text))) mod p);

  stringgrid1.Cells[1,3] := comboBoxXc.Text;
  stringgrid1.Cells[2,3] := inttostr(temp);

  temp := 1;

  for i := 1 to strtoint(comboBoxXd.Text) do
    temp := (temp * g) mod p;

  //temp := (round(exp(ln(g)*strtoint(comboBoxXd.Text))) mod p);

  stringgrid1.Cells[1,4] := comboBoxXd.Text;
  stringgrid1.Cells[2,4] := inttostr(temp);

  comboBoxUser.Enabled := true;

  comboBoxUser.Items.Add('Alice');
  comboBoxUser.Items.Add('Bob');
  comboBoxUser.Items.Add('Charlie');
  comboBoxUser.Items.Add('Dominic');
end;

procedure Tlab3.buttonTempClick(Sender: TObject);
var
  i, j, k, sqrtI, arrDivSize, count: integer;
  temp: int64;
  flagPrime, flagRoot: boolean;
  arrDiv, arrRoot: array of integer;
  str: string;
begin
  p := strtoint(editP.Text);
  comboBoxG.Clear;
  flagPrime := true;

  if (p=2) or (p=3) then
  Begin
    showmessage('p cannot be equal to ' + inttostr(p) + ' because g has to be in range [2, p-2]');
    editP.Text := '';
  End
  else
    if p > 2000000 then
    Begin
      showmessage('the entered number is too large. enter a number less than 2M');
      editP.Text := '';
    End
    else
    Begin
      for i := 0 to memoPrimes.Lines.Count - 1 do
      Begin
        if strtoint(memoPrimes.Lines[i]) <= floor(sqrt(p)) then
        Begin
          if (p mod strtoint(memoPrimes.Lines[i]) = 0) then
          Begin
            flagPrime := false;
            break;
          End;
        End
        else
          break;
      End;

      if flagPrime = false then
      Begin
        showmessage('the entered number is not prime');
        editP.Text := '';
      End
      else
      Begin
        comboBoxG.Enabled := true;
        buttonTemp.Enabled := false;
        editP.Enabled := false;
        labelP.Enabled := false;
        labelG.Enabled := true;
        stringgrid1.Enabled := true;

        setLength(arrDiv,1);
        arrDiv[0] := 2;

        //for i := 3 to ((p-1) div 2) do
        for i := 1 to memoPrimes.Lines.Count - 1 do
          if (strtoint(memoPrimes.Lines[i])) > (p-1) div 2 then
            break
          else
          if ((p-1) mod strtoint(memoPrimes.Lines[i]) = 0) then
          Begin
            {sqrtI := floor(sqrt(i));
            flagPrime := true;

            for j := 2 to sqrtI do
              if (i mod j = 0) then
              Begin
                flagPrime := false;
                break;
              End;}

            //if flagPrime = true then
            //Begin
              setLength(arrDiv,(length(arrDiv)+1));
              arrDiv[length(arrDiv)-1] := strtoint(memoPrimes.Lines[i]);
            //End;
          End;

        count := 0;

        memoTemp.Lines.Add('---------------------------------------');
        memoTemp.Lines.Add('calculating privirive roots for ' + inttostr(p) + ':');
        memoTemp.Lines.Add('---------------------------------------');

        for i := 2 to p-2 do
        Begin
          flagRoot := true;

          for j := (length(arrDiv)-1) downto 0 do
          Begin
            temp := 1;

            for k := 1 to ((p-1) div arrDiv[j]) do
              temp := temp*i mod p;

            //temp := round(exp(ln(i)*((p-1)/arrDiv[j])));

            str := inttostr(i) + '^(' + inttostr(p-1) + '/' + inttostr(arrDiv[j]) + ') mod ' +
                   inttostr(p) + ' = ' + inttostr(temp);
            memoTemp.Lines.Add(str);

            if (temp mod p = 1) then
            Begin
              flagRoot := false;
              break;
            End;
          End;

          memoTemp.Lines.Add('---------------------------------------');

          if flagRoot = true then
          Begin
            setLength(arrRoot,(length(arrRoot)+1));
            arrRoot[length(arrRoot)-1] := i;
            comboBoxG.Items.Add(inttostr(i));
            inc(count);
          End;
        End;

        memoTemp.Lines.Add('primitive roots for ' + inttostr(p) + ':');
        memoTemp.Lines.Add('---------------------------------------');
        memoTemp.Lines.Add('');

        for i := 0 to (length(arrRoot)-1) do
        Begin
          if (i <> 0) and (i mod 10 = 0) then
            memoTemp.Lines.Add('');
          memoTemp.Lines[memoTemp.Lines.Count-1] := memoTemp.Lines[memoTemp.Lines.Count-1] + inttostr(arrRoot[i]) + ' ';
        End;

        memoTemp.Lines.Add('---------------------------------------');
        memoTemp.Lines.Add('count of primitive roots = ' + inttostr(count));
        memoTemp.Lines.Add('---------------------------------------');
        memoTemp.Lines.SaveToFile('D:\bsuir 4ρεμ\ÒΘ\labs 2-4 (SAM)\lab3v2\test\log.log');

        comboBoxG.Enabled := true;
        comboBoxK.Items.Add('1');

        if p >= 11 then
        Begin
          for i := 2 to p-2 do
          Begin
            comboBoxXa.Items.Add(inttostr(i));
            comboBoxXb.Items.Add(inttostr(i));
            comboBoxXc.Items.Add(inttostr(i));
            comboBoxXd.Items.Add(inttostr(i));
            comboBoxXinvis.Items.Add(inttostr(i));
            comboBoxK.Items.Add(inttostr(i));
          End;

          stringgrid1.RowCount := 5;
          stringgrid1.Cells[0,3] := '  Charlie';
          stringgrid1.Cells[0,4] := '  Dominic';
          stringgrid1.Cells[0,1] := '    Alice';
          stringgrid1.Cells[0,2] := '     Bob';
        End
        else
        Begin
          if p = 5 then
          Begin
            comboBoxXa.Items.Add('2');
            comboBoxXa.ItemIndex := 0;
            comboBoxXb.Items.Add('3');
            comboBoxXb.ItemIndex := 0;
            stringgrid1.RowCount := 5;
            stringgrid1.Cells[0,3] := '-------------';
            stringgrid1.Cells[0,4] := '-------------';
            stringgrid1.Cells[0,1] := '    Alice';
            stringgrid1.Cells[0,2] := '     Bob';
            stringgrid1.Cells[1,1] := '2';
            stringgrid1.Cells[1,2] := '3';
            stringgrid1.Cells[1,3] := '-------------';
            stringgrid1.Cells[2,3] := '-------------';
            stringgrid1.Cells[1,4] := '-------------';
            stringgrid1.Cells[2,4] := '-------------';

            //stringgrid1.Visible := true;
          End
          else
          Begin
            stringgrid1.RowCount := 5;
            stringgrid1.Cells[0,3] := '  Charlie';
            stringgrid1.Cells[0,4] := '  Dominic';
            stringgrid1.Cells[0,1] := '    Alice';
            stringgrid1.Cells[0,2] := '     Bob';

            if p = 7 then
            Begin
              comboBoxXa.Items.Add('2');
              comboBoxXa.ItemIndex := 0;
              comboBoxXb.Items.Add('3');
              comboBoxXb.ItemIndex := 0;
              comboBoxXc.Items.Add('4');
              comboBoxXc.ItemIndex := 0;
              comboBoxXd.Items.Add('5');
              comboBoxXd.ItemIndex := 0;
              stringgrid1.Cells[1,1] := '2';
              stringgrid1.Cells[1,2] := '3';
              stringgrid1.Cells[1,3] := '4';
              stringgrid1.Cells[1,4] := '5';
            End;

            //stringgrid1.Visible := true;
          End;

          for i := 2 to p-2 do
            comboBoxK.Items.Add(inttostr(i));
        End;
      End;
    End;
end;

procedure Tlab3.comboBoxGChange(Sender: TObject);
begin
  if comboBoxG.ItemIndex = -1 then
    buttonTemp2.Enabled := false
  else
    buttonTemp2.Enabled := true;
end;

procedure Tlab3.comboBoxKKeyPress(Sender: TObject; var Key: Char);
begin
  key := #0;
end;

procedure Tlab3.comboBoxKSelect(Sender: TObject);
begin
  if (comboBoxK.ItemIndex <> -1) and (comboBoxUser.ItemIndex <> -1) then
    buttonLoad.Enabled := true
  else
    buttonLoad.Enabled := false;
end;

procedure Tlab3.comboBoxUserKeyPress(Sender: TObject; var Key: Char);
begin
  key := #0;
end;

procedure Tlab3.comboBoxUserSelect(Sender: TObject);
begin
  if (comboBoxK.ItemIndex <> -1) and (comboBoxUser.ItemIndex <> -1) then
    buttonLoad.Enabled := true
  else
    buttonLoad.Enabled := false;
end;

procedure Tlab3.comboBoxXaEnter(Sender: TObject);
var
  temp: string;
begin
  if p>=11 then
  Begin
    temp := comboBoxXa.Text;
    comboBoxXa.Items := comboBoxXinvis.Items;
    comboBoxXa.Items.Delete(comboBoxXa.Items.IndexOf(comboBoxXb.Text));
    comboBoxXa.Items.Delete(comboBoxXa.Items.IndexOf(comboBoxXc.Text));
    comboBoxXa.Items.Delete(comboBoxXa.Items.IndexOf(comboBoxXd.Text));
    comboBoxXa.ItemIndex := comboBoxXa.Items.IndexOf(temp);
  End;
end;

procedure Tlab3.comboBoxXaSelect(Sender: TObject);
var
  temp: string;
begin
  if p>=11 then
  Begin
    temp := comboBoxXa.Text;
    comboBoxXa.Items := comboBoxXinvis.Items;
    comboBoxXa.Items.Delete(comboBoxXa.Items.IndexOf(comboBoxXb.Text));
    comboBoxXa.Items.Delete(comboBoxXa.Items.IndexOf(comboBoxXc.Text));
    comboBoxXa.Items.Delete(comboBoxXa.Items.IndexOf(comboBoxXd.Text));
    comboBoxXa.ItemIndex := comboBoxXa.Items.IndexOf(temp);

    comboBoxXb.Items.Delete(comboBoxXb.Items.IndexOf(comboBoxXa.Text));
    comboBoxXc.Items.Delete(comboBoxXc.Items.IndexOf(comboBoxXa.Text));
    comboBoxXd.Items.Delete(comboBoxXd.Items.IndexOf(comboBoxXa.Text));

    buttonTemp3.Enabled := false;

    if comboBoxXa.ItemIndex <> -1 then
      if comboBoxXb.ItemIndex <> -1 then
        if comboBoxXc.ItemIndex <> -1 then
          if comboBoxXd.ItemIndex <> -1 then
            buttonTemp3.Enabled := true;
  End;
end;

procedure Tlab3.comboBoxXbEnter(Sender: TObject);
var
  temp: string;
begin
  if p>=11 then
  Begin
    temp := comboBoxXb.Text;
    comboBoxXb.Items := comboBoxXinvis.Items;
    comboBoxXb.Items.Delete(comboBoxXb.Items.IndexOf(comboBoxXa.Text));
    comboBoxXb.Items.Delete(comboBoxXb.Items.IndexOf(comboBoxXc.Text));
    comboBoxXb.Items.Delete(comboBoxXb.Items.IndexOf(comboBoxXd.Text));
    comboBoxXb.ItemIndex := comboBoxXb.Items.IndexOf(temp);
  End;
end;

procedure Tlab3.comboBoxXbSelect(Sender: TObject);
var
  temp: string;
begin
  if p>=11 then
  Begin
    temp := comboBoxXb.Text;
    comboBoxXb.Items := comboBoxXinvis.Items;
    comboBoxXb.Items.Delete(comboBoxXb.Items.IndexOf(comboBoxXa.Text));
    comboBoxXb.Items.Delete(comboBoxXb.Items.IndexOf(comboBoxXc.Text));
    comboBoxXb.Items.Delete(comboBoxXb.Items.IndexOf(comboBoxXd.Text));
    comboBoxXb.ItemIndex := comboBoxXb.Items.IndexOf(temp);

    comboBoxXa.Items.Delete(comboBoxXa.Items.IndexOf(comboBoxXb.Text));
    comboBoxXc.Items.Delete(comboBoxXc.Items.IndexOf(comboBoxXb.Text));
    comboBoxXd.Items.Delete(comboBoxXd.Items.IndexOf(comboBoxXb.Text));

    buttonTemp3.Enabled := false;

    if comboBoxXa.ItemIndex <> -1 then
      if comboBoxXb.ItemIndex <> -1 then
        if comboBoxXc.ItemIndex <> -1 then
          if comboBoxXd.ItemIndex <> -1 then
            buttonTemp3.Enabled := true;
  End;
end;

procedure Tlab3.comboBoxXcEnter(Sender: TObject);
var
  temp: string;
begin
  if p>=11 then
  Begin
    temp := comboBoxXc.Text;
    comboBoxXc.Items := comboBoxXinvis.Items;
    comboBoxXc.Items.Delete(comboBoxXc.Items.IndexOf(comboBoxXa.Text));
    comboBoxXc.Items.Delete(comboBoxXc.Items.IndexOf(comboBoxXb.Text));
    comboBoxXc.Items.Delete(comboBoxXc.Items.IndexOf(comboBoxXd.Text));
    comboBoxXc.ItemIndex := comboBoxXc.Items.IndexOf(temp);
  End;
end;

procedure Tlab3.comboBoxXcSelect(Sender: TObject);
var
  temp: string;
begin
  if p>=11 then
  Begin
    temp := comboBoxXc.Text;
    comboBoxXc.Items := comboBoxXinvis.Items;
    comboBoxXc.Items.Delete(comboBoxXc.Items.IndexOf(comboBoxXa.Text));
    comboBoxXc.Items.Delete(comboBoxXc.Items.IndexOf(comboBoxXb.Text));
    comboBoxXc.Items.Delete(comboBoxXc.Items.IndexOf(comboBoxXd.Text));
    comboBoxXc.ItemIndex := comboBoxXc.Items.IndexOf(temp);

    comboBoxXa.Items.Delete(comboBoxXa.Items.IndexOf(comboBoxXc.Text));
    comboBoxXb.Items.Delete(comboBoxXb.Items.IndexOf(comboBoxXc.Text));
    comboBoxXd.Items.Delete(comboBoxXd.Items.IndexOf(comboBoxXc.Text));

    buttonTemp3.Enabled := false;

    if comboBoxXa.ItemIndex <> -1 then
      if comboBoxXb.ItemIndex <> -1 then
        if comboBoxXc.ItemIndex <> -1 then
          if comboBoxXd.ItemIndex <> -1 then
            buttonTemp3.Enabled := true;
  End;
end;

procedure Tlab3.comboBoxXdEnter(Sender: TObject);
var
  temp: string;
begin
  if p>=11 then
  Begin
    temp := comboBoxXd.Text;
    comboBoxXd.Items := comboBoxXinvis.Items;
    comboBoxXd.Items.Delete(comboBoxXd.Items.IndexOf(comboBoxXa.Text));
    comboBoxXd.Items.Delete(comboBoxXd.Items.IndexOf(comboBoxXb.Text));
    comboBoxXd.Items.Delete(comboBoxXd.Items.IndexOf(comboBoxXc.Text));
    comboBoxXd.ItemIndex := comboBoxXd.Items.IndexOf(temp);
  End;
end;

procedure Tlab3.comboBoxXdKeyPress(Sender: TObject; var Key: Char);
begin
  key := #0;
end;

procedure Tlab3.comboBoxXdSelect(Sender: TObject);
var
  temp: string;
begin
  if p>=11 then
  Begin
    temp := comboBoxXd.Text;
    comboBoxXd.Items := comboBoxXinvis.Items;
    comboBoxXd.Items.Delete(comboBoxXd.Items.IndexOf(comboBoxXa.Text));
    comboBoxXd.Items.Delete(comboBoxXd.Items.IndexOf(comboBoxXb.Text));
    comboBoxXd.Items.Delete(comboBoxXd.Items.IndexOf(comboBoxXc.Text));
    comboBoxXd.ItemIndex := comboBoxXd.Items.IndexOf(temp);

    comboBoxXa.Items.Delete(comboBoxXa.Items.IndexOf(comboBoxXd.Text));
    comboBoxXb.Items.Delete(comboBoxXb.Items.IndexOf(comboBoxXd.Text));
    comboBoxXc.Items.Delete(comboBoxXc.Items.IndexOf(comboBoxXd.Text));

    buttonTemp3.Enabled := false;

    if comboBoxXa.ItemIndex <> -1 then
      if comboBoxXb.ItemIndex <> -1 then
        if comboBoxXc.ItemIndex <> -1 then
          if comboBoxXd.ItemIndex <> -1 then
            buttonTemp3.Enabled := true;
  End;
end;

procedure Tlab3.editPChange(Sender: TObject);
begin
  if (editP.Text = '') or (strtoint(editP.Text) = 0) then
    editP.Text := '';
end;

procedure Tlab3.FormCreate(Sender: TObject);
begin
  stringgrid1.Cells[0,0] := '    user';
  stringgrid1.Cells[1,0] := '       X';
  stringgrid1.Cells[2,0] := '       Y';
  //stringgrid1.Cells[0,1] := '    Alice';
  //stringgrid1.Cells[0,2] := '     Bob';
  //stringgrid1.Cells[0,3] := '  Charlie';
  //stringgrid1.Cells[0,4] := '  Dominic';
  stringgrid2.Cells[0,0] := '     text';
  stringgrid2.Cells[1,0] := '       M';
  stringgrid2.Cells[2,0] := '     (a,b)';
  stringgrid2.Cells[3,0] := '       M''';
end;
end.
