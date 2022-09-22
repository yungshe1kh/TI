program lab1v4;

uses
  Vcl.Forms,
  lab1Unit in 'lab1Unit.pas' {lab1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tlab1, lab1);
  Application.Run;
end.
