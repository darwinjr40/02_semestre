program Juego;

uses
  Vcl.Forms,
  Form in 'Form.pas' {Form1},
  UCHelicoptero in 'UCHelicoptero.pas',
  UCEscenario in 'UCEscenario.pas',
  UCControllerGame in 'UCControllerGame.pas',
  UCEnemigo in 'UCEnemigo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
