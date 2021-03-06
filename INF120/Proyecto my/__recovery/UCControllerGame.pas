unit UCControllerGame;

interface
 uses   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList, UCHelicoptero, UCEscenario, UCENEMIGO, UCEXPLOSION;

type

  ControllerGame = class
    private
        objHelicoptero : Helicoptero;
        objEnemigo : Enemigo;
        VectorEnemigos : ListaEnemigos;
        cantidadEnemigos : byte;
        objExplosion : Explosion;
        time, delay: Cardinal;
        ancho, alto : integer;
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
var i : byte;
begin
    objHelicoptero.teMOviste;
//    objHelicoptero.gravedad;

   if ((ColisionaronV1)) then
   begin
//     objHelicoptero.SetVisible(false);  //helicoptero invisible
//      if not objExplosion.GetVisible then
//      begin
//
//        IniciarExplosion;
//      end


   end else begin
      objHelicoptero.SetVisible(true);
      //muevance enemigos
      for I := 1 to cantidadEnemigos do
      begin
         VectorEnemigos[i].moverseIzquierda;  //mover enemigo
         if VectorEnemigos[i].GetV2X < 0 then  //salio de la pantalla
       begin
          VectorEnemigos[i].setPos(ancho, VectorEnemigos[i].v1.y);
          VectorEnemigos[i].setVelocidad(1+Random(3)); //1..3
    //      VectorEnemigos[i].setx(ancho);
    //      VectorEnemigos[i].setY(Random(self.alto-(objEnemigo.v4.y -objEnemigo.v1.y +1)-objEnemigo.v1.y ));
       end;
      end;
   end;


   //mover enemigo

//   if objEnemigo.GetV2X < 0 then  //salio de la pantalla
//   begin
//      objEnemigo.setx(ancho);
////      objEnemigo.setY(0+Random(self.alto-(objEnemigo.v4.y -objEnemigo.v1.y +1)));
//      objEnemigo.setY(Random(self.alto-(objEnemigo.v4.y -objEnemigo.v1.y +1)-objEnemigo.v1.y ));
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
var i : word;
    sw : boolean;
begin
  i := 1;
  sw := false;
  while (i <= cantidadEnemigos) and not(sw) do
  begin
      if (objHelicoptero.GetV1X >= VectorEnemigos[i].GetV1X)
          and (objHelicoptero.GetV1Y >= VectorEnemigos[i].GetV1Y)
          and (objHelicoptero.GetV1X <= VectorEnemigos[i].GetV3X)
          and (objHelicoptero.GetV1Y <= VectorEnemigos[i].GetV3Y)
      then
      begin
         sw := true;
      end;
      inc(i);
  end;
  result := sw;
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

constructor ControllerGame.crear(e: Escenario);
begin
  objHelicoptero := e.getHelicoptero;
    objExplosion := e.GetExplosion;
  self.VectorEnemigos := e.GetVectorEnemigos;
  self.cantidadEnemigos := e.GetCantidadEnemigos;
  Self.objEnemigo := e.GetObjEnemigo;
  Self.ancho := e.GetAncho;
  Self.alto := e.GetAlto;
  time := GetTickCount;
  delay := 1000;
end;

procedure ControllerGame.IniciarExplosion;
var ms, timeIni : integer;
begin
  ms := 600;
  timeIni := GetTickCount;
  objExplosion.setPos(objHelicoptero.GetV1X, objHelicoptero.GetV1Y);
  SELF.objExplosion.init(5000, 1000);
end;

end.
