unit Form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList, UCHelicoptero, UCEscenario, UCControllerGame, Vcl.StdCtrls;

type


  TForm1 = class(TForm)
    TimerHelicoptero: TTimer;
    TImageHelicoptero: TImageList;
    TimerController: TTimer;
    TImageExplosion: TImageList;       //TPNGImage
    procedure FormCreate(Sender: TObject);
    procedure TimerHelicopteroTimer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TimerControllerTimer(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  ObjEscenario : Escenario;
  objController : ControllerGame;

implementation

{$R *.dfm}



procedure TForm1.FormCreate(Sender: TObject);
begin
  ObjEscenario := Escenario.crear(TImageHelicoptero,TImageExplosion, Form1.ClientHeight, Form1.ClientWidth);
  objController := ControllerGame.crear(ObjEscenario);
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ObjEscenario.FormKeyDown(key);
end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  ObjEscenario.FormKeyUp(key);
end;

procedure TForm1.TimerControllerTimer(Sender: TObject);
begin
 //controla lac acciones que sucederan
  objController.accion;
end;

procedure TForm1.TimerHelicopteroTimer(Sender: TObject);
begin
 Repaint;  //50 ms
 ObjEscenario.Dibujar(canvas);
end;

end.
