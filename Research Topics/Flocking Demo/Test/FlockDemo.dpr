program FlockDemo;

uses
  Forms,
  FlockMain in 'FlockMain.pas' {frmMain},
  Flock in '..\Flock.pas',
  Vector in '..\Vector.pas',
  FlockReg in '..\FlockReg.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
