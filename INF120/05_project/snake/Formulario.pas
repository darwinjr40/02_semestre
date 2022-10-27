unit Formulario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
   model, UControllerGame;

type
  TForm1 = class(TForm)
    TimerDibujar: TTimer;
    TimerController: TTimer;
    procedure TimerDibujarTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormOnPaint(Sender: TObject);
    procedure TimerControllerTimer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    a : Modelo;
    objController : controllerGame;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  a := Modelo.Crear;
  objController := ControllerGame.crear(a);
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  a.moverse(key);
end;

procedure TForm1.FormOnPaint(Sender: TObject);
begin
  a.Dibujar(Self.Canvas);
end;

procedure TForm1.TimerControllerTimer(Sender: TObject);
begin
  objController.accion;
end;

procedure TForm1.TimerDibujarTimer(Sender: TObject);
begin
  Self.Repaint;
end;

end.
