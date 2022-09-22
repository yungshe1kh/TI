unit lab1Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.NumberBox,
  Vcl.ExtCtrls, Vcl.Grids, System.Generics.Collections;

type
  Tlab1 = class(TForm)
    memoEnc: TMemo;
    memoDec: TMemo;
    buttonMain: TButton;
    buttonLoadCipher: TButton;
    Label1: TLabel;
    Label2: TLabel;
    buttonLoadPlain: TButton;
    buttonClear: TButton;
    Label3: TLabel;
    railsCount: TNumberBox;
    buttonSet: TButton;
    RadioGroup1: TRadioGroup;
    buttonReset: TButton;
    Label4: TLabel;
    memoInvis: TMemo;
    StringGrid1: TStringGrid;
    editKey: TEdit;
    buttonSavePlain: TButton;
    buttonSaveCipher: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure memoEncChange(Sender: TObject);
    procedure buttonSetClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure memoDecChange(Sender: TObject);
    procedure railsCountChange(Sender: TObject);
    procedure buttonMainClick(Sender: TObject);
    procedure buttonClearClick(Sender: TObject);
    procedure buttonResetClick(Sender: TObject);
    procedure editKeyChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure buttonLoadPlainClick(Sender: TObject);
    procedure buttonLoadCipherClick(Sender: TObject);
    procedure buttonSavePlainClick(Sender: TObject);
    procedure buttonSaveCipherClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  lab1: Tlab1;
  Alphabet: set of char = ['A'..'Z','a'..'z'];
//  AlphabetRus: array of char = ['à','á','â','ã','ä','å','¸','æ','ç','è','é','ê','ë','ì','í','î','ï','ð','ñ','ò','','','','','','',  'å'];
  key, pathtofile, s: string;
  dictionary, dictionaryEng: TDictionary <string, integer>;
  dictionary1, dictionaryEng1: TDictionary <integer, string>;
  f: textfile;

implementation

{$R *.dfm}

procedure Tlab1.buttonClearClick(Sender: TObject);
begin
  memoInvis.text := '';
  memoEnc.text := '';
  memoDec.text := '';
  memoEnc.Enabled := true;
  memoDec.Enabled := true;

  if radiogroup1.ItemIndex = 1 then
  Begin
    dictionaryEng.Clear;
    dictionaryEng1.Clear;

    dictionaryEng1.Add(1,'a');
    dictionaryEng1.Add(2,'b');
    dictionaryEng1.Add(3,'c');
    dictionaryEng1.Add(4,'d');
    dictionaryEng1.Add(5,'e');
    dictionaryEng1.Add(6,'f');
    dictionaryEng1.Add(7,'g');
    dictionaryEng1.Add(8,'h');
    dictionaryEng1.Add(9,'i');
    dictionaryEng1.Add(100,'j');
    dictionaryEng1.Add(10,'k');
    dictionaryEng1.Add(11,'l');
    dictionaryEng1.Add(12,'m');
    dictionaryEng1.Add(13,'n');
    dictionaryEng1.Add(14,'o');
    dictionaryEng1.Add(15,'p');
    dictionaryEng1.Add(16,'q');
    dictionaryEng1.Add(17,'r');
    dictionaryEng1.Add(18,'s');
    dictionaryEng1.Add(19,'t');
    dictionaryEng1.Add(20,'u');
    dictionaryEng1.Add(21,'v');
    dictionaryEng1.Add(22,'w');
    dictionaryEng1.Add(23,'x');
    dictionaryEng1.Add(24,'y');
    dictionaryEng1.Add(25,'z');

  for var i: integer in dictionaryEng1.keys do
    dictionaryEng.AddOrSetValue(dictionaryEng1[i],i);
  End;
end;

procedure Tlab1.buttonLoadCipherClick(Sender: TObject);
begin
  if opendialog1.Execute then
    pathtofile := opendialog1.FileName;

  if pathtofile <> '' then
  Begin
    assignfile (f, pathtofile);
    reset (f);

    while not eof(f) do
    Begin
      readln (f, s);
      memoDec.Text := memoDec.Text + Utf8ToAnsi(s);
    End;

    closefile (f);
  End;

  pathtofile := '';
end;

procedure Tlab1.buttonLoadPlainClick(Sender: TObject);
begin
  if opendialog1.Execute then
    pathtofile := opendialog1.FileName;

  if pathtofile <> '' then
  Begin
    assignfile (f, pathtofile);
    reset (f);

    while not eof(f) do
    Begin
      readln (f, s);
      memoEnc.Text := memoEnc.Text + Utf8ToAnsi(s);
    End;

    closefile (f);
  End;

  pathtofile := '';
end;

procedure Tlab1.buttonMainClick(Sender: TObject);
var
  i,j,k,count,rails,temp1,temp2,index: integer;
  flagRails, flag1, flag2: boolean;
  symbol, c1, c2: char;
  str, str1: string;
  col1,row1,col2,row2: integer;
begin
  if radiogroup1.ItemIndex = 2 then //rail fence
  Begin
    rails := strtoint(railsCount.Text);
    temp1 := (rails - 1) * 2;

    for i := 1 to rails - 1 do
      memoInvis.Lines.Add('');

    if memoEnc.Enabled = true then
    Begin
      {count := -1;
      flagCount := true;
      for i := 1 to length(memoEnc.Text) do
      Begin
        symbol := memoEnc.Text[i];

        if symbol in Alphabet then
        Begin
          if count = 0 then
            flagRails := true
          else
            if count = railsCount.Value - 1 then
              flagRails := false;

          if flagRails = true then
          Begin
            inc(count);

            if count >= memoInvis.Lines.Count then
            Begin
              memoInvis.Lines.Add(memoEnc.Text[i]);
              continue;
            End;
          End
          else
            dec(count);

          memoInvis.Lines[count] := memoInvis.Lines[count] + symbol;
        End;
      End;

      for i := 0 to memoInvis.Lines.Count - 1 do
        memoDec.Text := memoDec.Text + memoInvis.Lines[i];    }

      i := 0;

      while i <= length(memoEnc.Text) - 1 do
      Begin
        temp2 := i mod temp1;
        index := rails - 1 - abs(rails - 1 - temp2);

        if memoEnc.Text[i+1] in Alphabet then
        Begin
          memoInvis.Lines[index] := memoInvis.Lines[index] + memoEnc.Text[i+1];
          inc(i);
        End
        else
        Begin
          str := memoEnc.Text;
          delete (str,i+1,1);
          memoEnc.Text := str;
        End;
      End;

      for i := 0 to memoInvis.Lines.Count - 1 do
        memoDec.Text := memoDec.Text + memoInvis.Lines[i];
    End
    else
    Begin
      str := memoDec.Text;
      i := 0;

      while i <= length(str) - 1 do
      Begin
        if str[i+1] in Alphabet then
        Begin
          temp2 := i mod temp1;
          index := rails - 1 - abs(rails - 1 - temp2);
          memoInvis.Lines[index] := memoInvis.Lines[index] + '*';
          inc(i);
        End
        else
          delete (str,i+1,1);
      End;

      memoDec.Text := str;
      temp2 := 1;

      for i := 0 to memoInvis.Lines.Count - 1 do
      Begin
        temp1 := length(memoInvis.Lines[i]);
        str := memoInvis.Lines[i];
        insert (copy (memoDec.Text,temp2,temp1),str,1);
        memoInvis.Lines[i] := str;
        temp2 := temp2 + temp1;
      End;

      temp2 := -1;
      flagRails := true;

      for i := 0 to length(memoDec.Text)*2+1 do
      Begin
        if temp2 = memoInvis.Lines.Count - 1 then
          flagRails := false
        else
          if temp2 = 0 then
            flagRails := true;

        if flagRails = true then
          inc(temp2)
        else
          dec(temp2);

        str := memoInvis.Lines[temp2];

        if not (str[1] in Alphabet) then
          continue;

        memoEnc.Text := memoEnc.Text + copy (str,1,1);
        delete (str,1,1);
        memoInvis.Lines[temp2] := str;
      End;
    End;
  End
  else //vigenere
    if radioGroup1.ItemIndex = 0 then
    Begin
      key := editKey.Text;
      temp2 := length(key);

      if memoEnc.Enabled = true then
      Begin
        str := memoEnc.Text;
        i := 1;

        while i <= length(str) do
          if dictionary.ContainsKey(str[i]) = false then
            delete (str,i,1)
          else
            inc(i);

        temp1 := length(str);

        if temp1 > temp2 then
        Begin
          for i := (temp2 + 1) to temp1 do
          Begin
            index := dictionary[key[i - temp2]] + 1;
            if index > 33 then
              index := index - 33;

            key := key + dictionary1[index];
          End;
        End;

        for i := 1 to temp1 do
        Begin
          index := dictionary[str[i]] + dictionary[key[i]] - 1;

          if index > 33 then
            index := index - 33;

          memoDec.Text := memoDec.Text + dictionary1[index];
        End;
      End
      else
      Begin
        str := memoDec.Text;
        temp1 := length(str);

        if temp1 > temp2 then
        Begin
          for i := (temp2 + 1) to temp1 do
          Begin
            index := dictionary[key[i - temp2]] + 1;
            if index > 33 then
              index := index - 33;

            key := key + dictionary1[index];
          End;
        End;

        for i := 1 to temp1 do
        Begin
          index := dictionary[str[i]] - dictionary[key[i]] + 1;

          if index < 0 then
            index := index + 33;

          memoEnc.Text := memoEnc.Text + dictionary1[index];
        End;
      End;
    End
    else //playfer
    Begin
      key := editKey.Text;
      i := 1;

      while i <= length(key) do
        if dictionaryEng[key[i]] <> 0 then
        Begin
          if key[i] = 'i' then
            dictionaryEng['j'] := 0
          else
            if key[i] = 'j' then
              dictionaryEng['i'] := 0;

          dictionaryEng[key[i]] := 0;
          inc(i);
        End
        else
          delete (key,i,1);

      temp1 := 1;
      temp2 := length(key);
      count := 1;

      for j := 0 to 4 do
        for i := 0 to 4 do
        Begin
          if temp1 <= temp2 then
          Begin
            //if (key[temp1] = 'i') or (key[temp1] = 'j') then
              //stringgrid1.Cells[i,j] := 'i/j'
            if (key[temp1] = 'j') then
              stringgrid1.Cells[i,j] := 'i'
            else
              stringgrid1.Cells[i,j] := key[temp1];

            inc (temp1);
          End
          else
          Begin
            while true do
              if dictionaryEng[dictionaryEng1[count]] <> 0 then
                Begin
                  if (dictionaryEng1[count] = 'j') then
                    stringgrid1.Cells[i,j] := 'i'
                  else
                    stringgrid1.Cells[i,j] := dictionaryEng1[count];

                  inc(count);
                  break;
                End
              else
                inc(count);
          End;
        End;

      if memoEnc.Enabled = true then
      Begin
        str1 := memoEnc.Text;

        for i := 1 to length(str1) do
          if str1[i] = 'j' then
          Begin
            delete(str1,i,1);
            insert('i',str1,i);
          End;

        str := '';
        i := 1;

        while i <= length(str1) do
          if dictionaryEng.ContainsKey(str1[i]) then
          Begin
            if str1[i] <> str1[i+1] then
            Begin
              if i <> length(str1) then
                str := str + str1[i] + str1[i+1]
              else
                str := str + str1[i];
            End
            else
            Begin
              if str1[i] <> 'x' then
                str := str + str1[i] + 'x'
              else
                str := str + str1[i] + 'q';

              dec(i);
            End;

            inc(i);
            inc(i);
          End
          else
            inc(i);

        if length(str) mod 2 = 1 then
          if str[length(str)] <> 'x' then
            str := str + 'x'
          else
            str := str + 'q';

        memoInvis.Text := str;

        k := 1;

        while k <= length(str) do
        Begin
          c1 := str[k];
          inc(k);
          c2 := str[k];
          inc(k);
          flag1 := false;
          flag2 := false;

          for i := 0 to 4 do
            for j := 0 to 4 do
            Begin
              if (flag1 = true) and (flag2 = true) then
                break;

              if stringgrid1.Cells[i,j] = c1 then
              Begin
                col1 := i;
                row1 := j;
                flag1 := true;
              End
              else
                if stringgrid1.Cells[i,j] = c2 then
                Begin
                  col2 := i;
                  row2 := j;
                  flag2 := true;
                End;
            End;

          flag1 := true;

          if col1 = col2 then
          Begin
            if row1 <= 3 then
              inc(row1)
            else
            Begin
              row1 := row1 - 4;
              flag1 := false;
            End;

            if row2 <= 3 then
              inc(row2)
            else
            Begin
              row2 := row2 - 4;
              flag1 := false;
            End;

            {//if flag1 = true then
            Begin
              temp1 := row1;
              row1 := row2;
              row2 := temp1;
            End;}
          End
          else
            if row1 = row2 then
            Begin
              if col1 <= 3 then
                inc(col1)
              else
              Begin
                col1 := col1 - 4;
                flag1 := false;
              End;

              if col2 <= 3 then
                inc (col2)
              else
              Begin
                col2 := col2 - 4;
                flag1 := false;
              End;

              //if flag1 = true then
              Begin
                temp1 := col1;
                col1 := col2;
                col2 := temp1;
              End;
            End;

            memoDec.Text := memoDec.Text + stringgrid1.Cells[col2,row1]
                                         + stringgrid1.Cells[col1,row2];
        End;
      End
      else
      Begin
        str := memoDec.Text;
        k := 1;

        while k <= length(str) do
        Begin
          c1 := str[k];
          inc(k);
          c2 := str[k];
          inc(k);
          flag1 := false;
          flag2 := false;

          memoInvis.Text := memoInvis.Text + c1 + c2 + ' ';

          for i := 0 to 4 do
            for j := 0 to 4 do
            Begin
              if (flag1 = true) and (flag2 = true) then
                break;

              if stringgrid1.Cells[i,j] = c1 then
              Begin
                col1 := i;
                row1 := j;
                flag1 := true;
              End
              else
                if stringgrid1.Cells[i,j] = c2 then
                Begin
                  col2 := i;
                  row2 := j;
                  flag2 := true;
                End;
            End;

          flag1 := true;

          if col1 = col2 then
          Begin
            if row1 > 0 then
              dec(row1)
            else
            Begin
              row1 := row1 + 4;
              flag1 := false;
            End;

            if row2 > 0 then
              dec(row2)
            else
            Begin
              row2 := row2 + 4;
              flag1 := false;
            End;

            {//if flag1 = true then
            Begin
              temp1 := row1;
              row1 := row2;
              row2 := temp1;
            End;}
          End
          else
            if row1 = row2 then
            Begin
              if col1 > 0 then
                dec(col1)
              else
              Begin
                col1 := col1 + 4;
                flag1 := false;
              End;

              if col2 > 0 then
                dec (col2)
              else
              Begin
                col2 := col2 + 4;
                flag1 := false;
              End;

              //if flag1 = true then
              Begin
                temp1 := col1;
                col1 := col2;
                col2 := temp1;
              End;
            End;

            memoEnc.Text := memoEnc.Text + stringgrid1.Cells[col2,row1]
                                         + stringgrid1.Cells[col1,row2];
        End;
      End;
    End;

  buttonMain.Enabled := false;
end;

procedure Tlab1.buttonResetClick(Sender: TObject);
begin
  buttonClear.Click;
  radiogroup1.ItemIndex := -1;

  memoDec.Enabled := false;
  memoEnc.Enabled := false;
  label1.Enabled := false;
  label2.Enabled := false;
  buttonReset.Enabled := false;

  railsCount.Enabled := false;
  label3.Enabled := false;
  label3.Visible := false;
  railsCount.Visible := false;

  editKey.Enabled := false;
  label4.Enabled := false;
  label4.Visible := false;
  editKey.Visible := false;

  buttonLoadCipher.Enabled := false;
  buttonLoadPlain.Enabled := false;

  buttonMain.Enabled := false;
  buttonClear.Enabled := false;

  radiogroup1.Enabled := true;
end;

procedure Tlab1.buttonSaveCipherClick(Sender: TObject);
begin
  if savedialog1.Execute then
    pathtofile := savedialog1.FileName;

  if pathtofile <> '' then
  Begin
    assignfile (f, pathtofile);
    rewrite (f);

    for var i: integer := 0 to memoDec.Lines.Count - 1 do
      write(f, memoDec.Lines[i]);

    closefile (f);
  End;

  pathtofile := '';
end;

procedure Tlab1.buttonSavePlainClick(Sender: TObject);
begin
  if savedialog1.Execute then
    pathtofile := savedialog1.FileName;

  if pathtofile <> '' then
  Begin
    assignfile (f, pathtofile);
    rewrite (f);

    for var i: integer := 0 to memoEnc.Lines.Count - 1 do
      write(f, memoEnc.Lines[i]);

    closefile (f);
  End;

  pathtofile := '';
end;

procedure Tlab1.buttonSetClick(Sender: TObject);
var
  flag: boolean;
begin
  flag := true;

  if radiogroup1.ItemIndex = 0 then
    for var i: integer := 1 to length(editKey.Text) do
      if dictionary.ContainsKey(editKey.Text[i]) = false then
      Begin
        flag := false;
        showMessage ('The key has to contain Russian letters only.');
        break;
      End;

  if radiogroup1.ItemIndex = 1 then
    for var i: integer := 1 to length(editKey.Text) do
      if dictionaryEng.ContainsKey(editKey.Text[i]) = false then
      Begin
        flag := false;
        showMessage ('The key has to contain English letters only.');
        break;
      End;

  if flag = true then
  Begin
    memoDec.Enabled := true;
    memoEnc.Enabled := true;
    label1.Enabled := true;
    label2.Enabled := true;
    buttonReset.Enabled := true;
    railsCount.Enabled := false;

    buttonLoadCipher.Enabled := true;
    buttonLoadPlain.Enabled := true;

    radiogroup1.Enabled := false;

    buttonSet.Enabled := false;
    editKey.Enabled := false;
  End
  else
    editKey.Text := '';
end;

procedure Tlab1.editKeyChange(Sender: TObject);
begin
  if editKey.Text <> '' then
    buttonSet.Enabled := true
  else
    buttonSet.Enabled := false;
end;

procedure Tlab1.FormCreate(Sender: TObject);
begin
  dictionary := TDictionary <string, integer>.create;
  dictionary1 := TDictionary <integer, string>.create;

  dictionary.Add('à',1);
  dictionary.Add('á',2);
  dictionary.Add('â',3);
  dictionary.Add('ã',4);
  dictionary.Add('ä',5);
  dictionary.Add('å',6);
  dictionary.Add('¸',7);
  dictionary.Add('æ',8);
  dictionary.Add('ç',9);
  dictionary.Add('è',10);
  dictionary.Add('é',11);
  dictionary.Add('ê',12);
  dictionary.Add('ë',13);
  dictionary.Add('ì',14);
  dictionary.Add('í',15);
  dictionary.Add('î',16);
  dictionary.Add('ï',17);
  dictionary.Add('ð',18);
  dictionary.Add('ñ',19);
  dictionary.Add('ò',20);
  dictionary.Add('ó',21);
  dictionary.Add('ô',22);
  dictionary.Add('õ',23);
  dictionary.Add('ö',24);
  dictionary.Add('÷',25);
  dictionary.Add('ø',26);
  dictionary.Add('ù',27);
  dictionary.Add('ú',28);
  dictionary.Add('û',29);
  dictionary.Add('ü',30);
  dictionary.Add('ý',31);
  dictionary.Add('þ',32);
  dictionary.Add('ÿ',33);

  for var s: string in dictionary.Keys do
    dictionary1.AddOrSetValue(dictionary[s],s);

  dictionaryEng := TDictionary <string, integer>.create;
  dictionaryEng1 := TDictionary <integer, string>.Create;

  dictionaryEng1.Add(1,'a');
  dictionaryEng1.Add(2,'b');
  dictionaryEng1.Add(3,'c');
  dictionaryEng1.Add(4,'d');
  dictionaryEng1.Add(5,'e');
  dictionaryEng1.Add(6,'f');
  dictionaryEng1.Add(7,'g');
  dictionaryEng1.Add(8,'h');
  dictionaryEng1.Add(9,'i');
  dictionaryEng1.Add(100,'j');
  dictionaryEng1.Add(10,'k');
  dictionaryEng1.Add(11,'l');
  dictionaryEng1.Add(12,'m');
  dictionaryEng1.Add(13,'n');
  dictionaryEng1.Add(14,'o');
  dictionaryEng1.Add(15,'p');
  dictionaryEng1.Add(16,'q');
  dictionaryEng1.Add(17,'r');
  dictionaryEng1.Add(18,'s');
  dictionaryEng1.Add(19,'t');
  dictionaryEng1.Add(20,'u');
  dictionaryEng1.Add(21,'v');
  dictionaryEng1.Add(22,'w');
  dictionaryEng1.Add(23,'x');
  dictionaryEng1.Add(24,'y');
  dictionaryEng1.Add(25,'z');

  for var i: integer in dictionaryEng1.keys do
    dictionaryEng.AddOrSetValue(dictionaryEng1[i],i);

  {stringgrid1.Cells[0,0] := 'à';
  stringgrid1.Cells[1,0] := 'á';
  stringgrid1.Cells[2,0] := 'â';
  stringgrid1.Cells[3,0] := 'ã';
  stringgrid1.Cells[4,0] := 'ä';
  stringgrid1.Cells[5,0] := 'å';
  stringgrid1.Cells[6,0] := '¸';
  stringgrid1.Cells[7,0] := 'æ';
  stringgrid1.Cells[8,0] := 'ç';
  stringgrid1.Cells[9,0] := 'è';
  stringgrid1.Cells[10,0] := 'é';
  stringgrid1.Cells[11,0] := 'ê';
  stringgrid1.Cells[12,0] := 'ë';
  stringgrid1.Cells[13,0] := 'ì';
  stringgrid1.Cells[14,0] := 'í';
  stringgrid1.Cells[15,0] := 'î';
  stringgrid1.Cells[16,0] := 'ï';
  stringgrid1.Cells[17,0] := 'ð';
  stringgrid1.Cells[18,0] := 'ñ';
  stringgrid1.Cells[19,0] := 'ò';
  stringgrid1.Cells[20,0] := 'ó';
  stringgrid1.Cells[21,0] := 'ô';
  stringgrid1.Cells[22,0] := 'õ';
  stringgrid1.Cells[23,0] := 'ö';
  stringgrid1.Cells[24,0] := '÷';
  stringgrid1.Cells[25,0] := 'ø';
  stringgrid1.Cells[26,0] := 'ù';
  stringgrid1.Cells[27,0] := 'ú';
  stringgrid1.Cells[28,0] := 'û';
  stringgrid1.Cells[29,0] := 'ü';
  stringgrid1.Cells[30,0] := 'ý';
  stringgrid1.Cells[31,0] := 'þ';
  stringgrid1.Cells[32,0] := 'ÿ';}
end;

procedure Tlab1.memoDecChange(Sender: TObject);
begin
  if memoDec.Text <> '' then
  Begin
    memoEnc.Enabled := false;
    label1.Enabled := false;
    buttonClear.Enabled := true;
    buttonMain.Enabled := true;

    buttonLoadCipher.Enabled := false;
    buttonLoadPlain.Enabled := false;
    buttonSaveCipher.Enabled := true;
  End
  else
  Begin
    memoEnc.Enabled := true;
    label1.Enabled := true;
    buttonClear.Enabled := false;
    buttonMain.Enabled := false;

    buttonLoadCipher.Enabled := true;
    buttonLoadPlain.Enabled := true;
    buttonSaveCipher.Enabled := false;
  End;
end;

procedure Tlab1.memoEncChange(Sender: TObject);
begin
  if memoEnc.Text <> '' then
  Begin
    memoDec.Enabled := false;
    label2.Enabled := false;
    buttonClear.Enabled := true;
    buttonMain.Enabled := true;

    buttonLoadCipher.Enabled := false;
    buttonLoadPlain.Enabled := false;
    buttonSavePlain.Enabled := true;
  End
  else
  Begin
    memoDec.Enabled := true;
    label2.Enabled := true;
    buttonClear.Enabled := false;
    buttonMain.Enabled := false;

    buttonLoadCipher.Enabled := true;
    buttonLoadPlain.Enabled := true;
    buttonSavePlain.Enabled := false;
  End;
end;

procedure Tlab1.RadioGroup1Click(Sender: TObject);
begin
  editKey.Text := '';
  railsCount.Value := 0;

  if radiogroup1.ItemIndex = 2 then
  Begin
    label3.Visible := true;
    railsCount.Visible := true;
    label3.Enabled := true;
    railsCount.Enabled := true;

    label4.Visible := false;
    editKey.Visible := false;
    label4.Enabled := false;
    editKey.Enabled := false;
  End
  else
  Begin
    label3.Visible := false;
    railsCount.Visible := false;
    label3.Enabled := false;
    railsCount.Enabled := false;

    label4.Visible := true;
    editKey.Visible := true;
    label4.Enabled := true;
    editKey.Enabled := true;
  End
end;

procedure Tlab1.railsCountChange(Sender: TObject);
begin
  if railsCount.Value <> 0 then
    buttonSet.Enabled := true
  else
    buttonSet.Enabled := false;
end;

end.
