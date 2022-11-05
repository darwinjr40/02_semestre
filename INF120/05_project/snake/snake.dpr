program snake;

uses
  Vcl.Forms,
  form in 'form.pas' {Form1},
  UCEscenario in 'models\UCEscenario.pas',
  UCMatriz in 'models\estructuras\UCMatriz.pas',
  UCCesped in 'models\UCCesped.pas',
  URecord in 'models\estructuras\URecord.pas',
  UCSnake in 'models\UCSnake.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
