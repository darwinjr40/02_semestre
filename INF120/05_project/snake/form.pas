unit form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, UCEscenario, UCController;

type
  TForm1 = class(TForm)
    dibujar: TTimer;
    TimerController: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormOnPaint(Sender: TObject);
    procedure dibujarTimer(Sender: TObject);
    procedure OnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TimerControllerTimer(Sender: TObject);
  private
    objEsc :  Escenario;
    objControlador : Controller;
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
  self.objEsc := Escenario.Crear(Self.Width, Self.Height);
  self.objControlador := Controller.crear(self.objEsc, TimerController );

//  ShowMessage(inttostr(Width));
end;

procedure TForm1.FormOnPaint(Sender: TObject);
begin
  objEsc.Dibujar(self.Canvas);
end;

procedure TForm1.OnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Self.objControlador.moverse(Key);
end;

procedure TForm1.dibujarTimer(Sender: TObject);
begin
  Self.Repaint;
end;

procedure TForm1.TimerControllerTimer(Sender: TObject);
begin
  Self.objControlador.accion;
end;

end.
