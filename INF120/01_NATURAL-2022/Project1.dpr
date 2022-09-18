program Project1;

uses
  Vcl.Forms,
  Form in 'Form.pas' {Form1},
  UCNatural in 'UCNatural.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
