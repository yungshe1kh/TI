unit lab4Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tlab4 = class(TForm)
    editP: TEdit;
    editQ: TEdit;
    buttonSelect: TButton;
    editE: TEdit;
    memoInvis: TMemo;
    buttonLoad: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    buttonLoadSigned: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    buttonClear: TButton;
    procedure buttonSelectClick(Sender: TObject);
    procedure buttonLoadClick(Sender: TObject);
    procedure buttonLoadSignedClick(Sender: TObject);
    procedure buttonClearClick(Sender: TObject);
    procedure editPChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  lab4: Tlab4;
  mes: array of char;
  p, q, r, ejl, e, d, m, S, m1, S1: integer;
  streamsize: integer;

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

procedure Tlab4.buttonClearClick(Sender: TObject);
begin
  editP.Text := '';
  editQ.Text := '';
  editE.Text := '';
  buttonLoad.Enabled := false;
  buttonLoadSigned.Enabled := false;
  setLength(mes,0);
  editP.Enabled := true;
  editQ.Enabled := true;
  editE.Enabled := true;
  memoInvis.Text := '';
end;

procedure Tlab4.buttonLoadClick(Sender: TObject);
var
  pathtofile: string;
  i, h0: integer;
  bytes: TBytes;
  f: textfile;
  flag: boolean;
begin
  if opendialog1.Execute then
    pathtofile := opendialog1.FileName;

  if pathtofile <> '' then
  Begin
    buttonLoad.Enabled := false;
    buttonLoadSigned.Enabled := false;

    bytes := nil;

    if filetobytes(pathtofile,bytes) then
    Begin
      h0 := 100;
      m := 100;
      memoInvis.Lines.Add('H[0] = 100');
      //flag := false;

      for i := 0 to streamsize-1 do
      Begin
        //flag := true;
        setLength(mes, length(mes)+1);
        mes[i] := char(bytes[i]);
        m := sqr(h0 + bytes[i]) mod r;
        h0 := m;
        memoInvis.Lines.Add('H[' + inttostr(i+1) + '] = ' + inttostr(m));
      End;

      //if flag = false then
        //m := h0;

      S := 1;

      for i := 1 to d do
        S := (S*m) mod r;

      memoInvis.Lines.Add('');
      memoInvis.Lines.Add('EDS = ' + inttostr(S));

      pathtofile := '';

      if savedialog1.Execute then
        pathtofile := savedialog1.FileName;

      if pathtofile <> '' then
      Begin
        assignfile(f, pathtofile);
        rewrite(f);

        for i := 0 to length(mes)-1 do

        write(f,mes[i]);
        writeln(f);
        write(f,inttostr(S));

        closefile(f); //ушла посылочка
      End;
    End;
  End;

  pathtofile := '';
end;

procedure Tlab4.buttonLoadSignedClick(Sender: TObject);
var
  pathtofile: string;
  bytes: TBytes;
  h0, i: integer;
begin
  if opendialog1.Execute then
    pathtofile := opendialog1.FileName;

  if pathtofile <> '' then
  Begin
    buttonLoad.Enabled := false;
    buttonLoadSigned.Enabled := false;

    bytes := nil;

    memoInvis.Lines.LoadFromFile(pathtofile);
    S1 := strtoint(memoInvis.Lines[memoInvis.Lines.Count-1]);
    memoInvis.Lines.Delete(memoInvis.Lines.Count-1);

    pathtofile := 'D:\bsuir 4сем\ТИ\labs 2-4 (SAM)\lab4v1\temp.txt';
    memoInvis.Lines.SaveToFile(pathtofile);
    memoInvis.Text := '';

    if filetobytes(pathtofile,bytes) then
    Begin
      h0 := 100;
      memoInvis.Lines.Add('H[0] = 100');

      for i := 0 to streamsize-1 do
      Begin
        //setLength(mes, length(mes)+1);
        //mes[i] := char(bytes[i]);
        if (bytes[i] <> 10) and (bytes[i] <> 13) then
        Begin
          m := sqr(h0 + bytes[i]) mod r;
          h0 := m;
          memoInvis.Lines.Add('H[' + inttostr(i+1) + '] = ' + inttostr(m));
        End;
      End;

      memoInvis.Lines.Add('');
      memoInvis.Lines.Add('EDS = ' + inttostr(S1));

      m1 := 1;

      for i := 1 to e do
        m1 := (m1*S1) mod r;

      if m = m1 then
        showmessage('confirmed!' + #13#10 + inttostr(m) + ' = ' +
                    inttostr(m1) + #13#10 + 'EDS = ' + inttostr(S1))
      else
        showmessage('not confirmed!' + #13#10 + inttostr(m) + ' <> ' +
                    inttostr(m1) + #13#10 + 'EDS = ' + inttostr(S1));
    End;
  End;
end;

procedure Tlab4.buttonSelectClick(Sender: TObject);
var
  a, b, i: integer;
  flag: boolean;
  d0, d1, x0, x1, y0, y1, qq, d2, x2, y2: integer;
begin
  buttonLoad.Enabled := true;
  buttonLoadSigned.Enabled := true;
  buttonSelect.Enabled := false;
  editP.Enabled := false;
  editQ.Enabled := false;
  editE.Enabled := false;

  p := strtoint(editP.Text);
  q := strtoint(editQ.Text);
  e := strtoint(editE.Text);

  i := 2;
  flag := true;

  while i <= sqrt(p) do
  Begin
    if p mod i = 0 then
    Begin
      showmessage('p is not prime');
      flag := false;
      break;
    End;

    inc(i);
  End;

  i := 2;
  flag := true;

  while i <= sqrt(q) do
  Begin
    if q mod i = 0 then
    Begin
      showmessage('q is not prime');
      flag := false;
      break;
    End;

    inc(i);
  End;

  if flag = true then
  Begin
    r := p*q;

    if (r <= 255) or (r > 65535) then
      showmessage('p*q has to be in range (255,65535]')
    else
    Begin
      ejl := (p-1)*(q-1);
      a := e;
      b := ejl;

      while (a <> 0) and (b <> 0) do
      if a > b then
        a := a mod b
      else
        b := b mod a;

      a := a + b;

      if a <> 1 then
      Begin
        showmessage('e is not coprime with ((p-1)*(q-1))');
        buttonClear.Click
      End
      else
      Begin
        d0 := e;
        d1 := ejl;
        x0 := 1;
        x1 := 0;
        y0 := 0;
        y1 := 1;

        while d1>1 do
        Begin
          qq := d0 div d1;
          d2 := d0 mod d1;
          x2 := x0 - qq*x1;
          y2 := y0 - qq*y1;
          d0 := d1;
          d1 := d2;
          x0 := x1;
          x1 := x2;
          y0 := y1;
          y1 := y2;
        End;

        d := x1;
      End;
    End;
  End
  else
    buttonClear.Click;
end;

procedure Tlab4.editPChange(Sender: TObject);
begin
  if ((editP.Text <> '') and (editQ.Text <> '')) and (editE.Text <> '') then
    buttonSelect.Enabled := true
  else
    buttonSelect.Enabled := false;

end;

end.
