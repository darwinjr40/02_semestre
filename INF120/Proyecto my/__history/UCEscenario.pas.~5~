unit UCEscenario;

interface

uses   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList, UCHelicoptero;

type

  Escenario = class
    private
      objHelicoptero : Helicoptero;
    public
    //constructor : por defecto, parametrizado, copia(obj:Escenario)
    constructor crear; overload;
    constructor crear(H: TImageList); overload;
    function getHelicoptero : Helicoptero;
    procedure FormKeyDown(key : word);
    procedure FormKeyUp(key: word);
    procedure Dibujar(t:TCanvas);
    procedure accion();
  end;

implementation

{ Escenario }

constructor Escenario.crear;
begin

end;


procedure Escenario.accion;
begin

end;

constructor Escenario.crear(H: TImageList);
begin

  objHelicoptero := Helicoptero.crear(H, 0, 0, 2);
end;

procedure Escenario.Dibujar(t: TCanvas);
begin
  //dibuja a todos tus objectos
  objHelicoptero.dibujar(t);
end;

procedure Escenario.FormKeyDown(key: word);
begin
      objHelicoptero.moverse(key);

end;

procedure Escenario.FormKeyUp(key: word);
begin
    objHelicoptero.Nomoverse(key);
end;

function Escenario.getHelicoptero: Helicoptero;
begin
  result := self.objHelicoptero;
end;

end.
