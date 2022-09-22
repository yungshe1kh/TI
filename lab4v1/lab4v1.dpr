program lab4v1;

uses
  Vcl.Forms,
  lab4Unit in 'lab4Unit.pas' {lab4};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tlab4, lab4);
  Application.Run;
end.
