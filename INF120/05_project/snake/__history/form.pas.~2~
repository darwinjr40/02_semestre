unit form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, UCEscenario;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormOnPaint(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    esc :  Escenario;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
//  Self.Width;
//  Self.Height;
  self.esc := Escenario.Crear(Self.Width, Self.Height);
//  ShowMessage(inttostr(Width));
end;

procedure TForm1.FormOnPaint(Sender: TObject);
begin
  esc.Dibujar(self.Canvas);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Self.Repaint;
end;

end.
