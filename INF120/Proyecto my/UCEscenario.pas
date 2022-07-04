unit UCEscenario;

interface

uses   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList, UCHelicoptero, UCEnemigo, UCExplosion ;

type

  Escenario = class
    private
      objHelicoptero : Helicoptero;
      objEnemigo : Enemigo;
      objExplosion : Explosion;
      ancho, alto : integer;
    public
    //constructor : por defecto, parametrizado, copia(obj:Escenario)
    constructor crear(H, E: TImageList; alto, ancho:integer); overload;

    procedure FormKeyDown(key : word);
    procedure FormKeyUp(key: word);
    procedure Dibujar(t:TCanvas);
    function GetHelicoptero : Helicoptero;
    function GetObjEnemigo : Enemigo;
    function  GetExplosion : Explosion;
    function GetAncho : integer;
    function GetAlto : integer;
  end;

implementation

{ Escenario }



constructor Escenario.crear(H, E: TImageList; alto, ancho:integer);
begin
  Self.alto := alto;
  Self.ancho := ancho;
  objHelicoptero := Helicoptero.crear(H, 0, 0, 5);
  objExplosion :=  Explosion.crear(E, 500, 300, 2);
  objEnemigo := Enemigo.crear(200, 200, 2, 'obstacles/pajaro.bmp');
end;

procedure Escenario.Dibujar(t: TCanvas);
begin
  //dibuja a todos tus objectos

  objEnemigo.dibujar(t);
  objHelicoptero.dibujar(t);
  objExplosion.dibujar(t);
end;

procedure Escenario.FormKeyDown(key: word);
begin
      objHelicoptero.moverse(key);

end;

procedure Escenario.FormKeyUp(key: word);
begin
    objHelicoptero.Nomoverse(key);
end;

function Escenario.GetAlto: integer;
begin
  Result := self.alto;
end;

function Escenario.GetAncho: integer;
begin
    Result := self.ancho;
end;

function Escenario.GetExplosion: Explosion ;
begin
  result := self.objExplosion;
end;

function Escenario.getHelicoptero: Helicoptero;
begin
  result := self.objHelicoptero;
end;

function Escenario.GetObjEnemigo: Enemigo;
begin
  Result := Self.objEnemigo;
end;

end.
