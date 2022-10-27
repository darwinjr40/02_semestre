unit UControllerGame;

interface
 uses   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList, model;

type

  ControllerGame = class
    private
//        objHelicoptero : Helicoptero;
//        objEnemigo : Enemigo;
//        VectorEnemigos : ListaEnemigos;
//        cantidadEnemigos : byte;
//        objExplosion : Explosion;
        time, delay: Cardinal;
        ancho, alto : integer;
        objModel : Modelo;
    public
    constructor crear(x : Modelo); overload;
    procedure accion();
    procedure MOverSnake;
//    procedure IniciarExplosion();
//    function  colisionaron : bool ;
//    function  ColisionaronV1 : bool ;
//    function  ColisionaronV2 : bool ;
//    function  ColisionaronV3 : bool ;
//    function  ColisionaronV4 : bool ;
  end;
implementation

{ ControllerGame }
constructor ControllerGame.crear(x: Modelo);
begin
  Self.objModel := x;
end;

procedure ControllerGame.MOverSnake;
begin

end;

procedure ControllerGame.accion;
begin
  Self.objModel.SetNextPos(4,4);
end;



end.
