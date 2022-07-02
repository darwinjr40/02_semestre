unit UCControllerGame;

interface
 uses   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList, UCHelicoptero, UCEscenario, UCENEMIGO;

type

  ControllerGame = class
    private
        objHelicoptero : Helicoptero;
        objEnemigo : Enemigo;
        time, delay: Cardinal;
    public
    constructor crear(E : Escenario); overload;
    procedure accion();
    procedure IniciarExplosion();
    function  colisionaron : bool ;
    function  ColisionaronV1 : bool ;
    function  ColisionaronV2 : bool ;
    function  ColisionaronV3 : bool ;
    function  ColisionaronV4 : bool ;
  end;
implementation

{ ControllerGame }

procedure ControllerGame.accion;
begin
    objHelicoptero.teMOviste;

   if ((Colisionaron) ) then
   begin
      objHelicoptero.SetVisible(false);
   end else begin
      objHelicoptero.SetVisible(true);
   end;


//      objEnemigo.moverseIzquierda;
//   if objEnemigo.GetV2X < 0 then
//   begin
//      objEnemigo.setx(ancho);
////      objEnemigo.setY(0+Random(self.alto-(objEnemigo.v4.y -objEnemigo.v1.y +1)));
//      objEnemigo.setY(0+Random(self.alto-(objEnemigo.v4.y -objEnemigo.v1.y +1)-objEnemigo.v1.y ));
//   end;

//    Application.ProcessMessages;
//    if ((GetTickCount - time) mod delay = 0) then
////    if ((GetTickCount - time) = 3000) then
//    begin
//      objHelicoptero.setX(objHelicoptero.getX + 10);
//    end;

end;


function ControllerGame.colisionaron: bool;
begin
   result := (ColisionaronV1)
          or (ColisionaronV2)
          or (ColisionaronV3)
          or (ColisionaronV4);
end;

function ControllerGame.ColisionaronV1: bool;
begin
  result := (objHelicoptero.GetV1X >= objEnemigo.GetV1X)
            and (objHelicoptero.GetV1Y >= objEnemigo.GetV1Y)
            and (objHelicoptero.GetV1X <= objEnemigo.GetV3X)
            and (objHelicoptero.GetV1Y <= objEnemigo.GetV3Y);
end;

function ControllerGame.ColisionaronV2: bool;
begin
   result := (objHelicoptero.GetV2X >= objEnemigo.GetV1X)
            and (objHelicoptero.GetV2Y >= objEnemigo.GetV1Y)
            and (objHelicoptero.GetV2X <= objEnemigo.GetV3X)
            and (objHelicoptero.GetV2Y <= objEnemigo.GetV3Y);
end;

function ControllerGame.ColisionaronV3: bool;
begin
    result := (objHelicoptero.GetV3X >= objEnemigo.GetV1X)
            and (objHelicoptero.GetV3Y >= objEnemigo.GetV1Y)
            and (objHelicoptero.GetV3X <= objEnemigo.GetV3X)
            and (objHelicoptero.GetV3Y <= objEnemigo.GetV3Y);
end;

function ControllerGame.ColisionaronV4: bool;
begin
   result := (objHelicoptero.GetV4X >= objEnemigo.GetV1X)
            and (objHelicoptero.GetV4Y >= objEnemigo.GetV1Y)
            and (objHelicoptero.GetV4X <= objEnemigo.GetV3X)
            and (objHelicoptero.GetV4Y <= objEnemigo.GetV3Y);
end;

constructor ControllerGame.crear(E: Escenario);
begin
  objHelicoptero := e.getHelicoptero;
  Self.objEnemigo := e.GetObjEnemigo;
  time := GetTickCount;
  delay := 1000;
end;

procedure ControllerGame.IniciarExplosion;
var ms, timeIni : integer;
begin
  ms := 600;
  timeIni := GetTickCount;

end;

end.
