program snake;

uses
  Vcl.Forms,
  Formulario in 'Formulario.pas' {Form1},
  Model in 'models\Model.pas',
  ModelStage in 'models\ModelStage.pas',
  URecord in 'models\URecord.pas' ,
  UControllerGame in 'controllers\UControllerGame.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
