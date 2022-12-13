program Project1;

uses
  Vcl.Forms,
  Formulario in 'Formulario.pas' {Form1},
  UCVector in 'UCVector.pas',
  UCNumero in 'UCNumero.pas',
  UCCadena in '..\02_cadena\UCCadena.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
