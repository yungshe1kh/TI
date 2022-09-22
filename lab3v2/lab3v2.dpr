program lab3v2;

uses
  Vcl.Forms,
  lab3Unit in 'lab3Unit.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tlab3, lab3);
  Application.Run;
end.
