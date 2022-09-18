program Numeros;

uses
  Vcl.Forms,
  UFPrincipal in 'UFPrincipal.pas' {Form1},
  UCNumeros in 'UCNumeros.pas',
  Vcl.Themes,
  Vcl.Styles,
  UCCadenas in 'UCCadenas.pas',
  UCNatural in '..\UCNatural.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Turquoise Gray');
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
