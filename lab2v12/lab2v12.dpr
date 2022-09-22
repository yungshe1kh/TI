program lab2v12;

uses
  Vcl.Forms,
  lab2Unit in 'lab2Unit.pas' {lab2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tlab2, lab2);
  Application.Run;
end.
