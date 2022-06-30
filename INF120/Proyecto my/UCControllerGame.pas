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

   if (ColisionaronV1) then
   begin
      objHelicoptero.SetVisible(false);
   end else begin
      objHelicoptero.SetVisible(true);
   end;

//    Application.ProcessMessages;
//    if ((GetTickCount - time) mod delay = 0) then
////    if ((GetTickCount - time) = 3000) then
//    begin
//      objHelicoptero.setX(objHelicoptero.getX + 10);
//    end;

end;


function ControllerGame.colisionaron: bool;
var sw : bool;
begin

end;

function ControllerGame.ColisionaronV1: bool;
begin
  result := (objHelicoptero.GetV3X >= objEnemigo.GetV1X)
            and (objHelicoptero.GetV3Y >= objEnemigo.GetV1Y) ;
end;

function ControllerGame.ColisionaronV2: bool;
begin

end;

function ControllerGame.ColisionaronV3: bool;
begin

end;

function ControllerGame.ColisionaronV4: bool;
begin

end;

constructor ControllerGame.crear(E: Escenario);
begin
  objHelicoptero := e.getHelicoptero;
  Self.objEnemigo := e.GetObjEnemigo;
  time := GetTickCount;
  delay := 1000;
end;

end.
