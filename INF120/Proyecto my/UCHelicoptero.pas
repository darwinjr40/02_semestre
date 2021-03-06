unit UCHelicoptero;

interface
uses   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList ;

type
Pos = Record
    x : integer;
    y : integer;
 End;
Direcciones = Record
    izquierda : Boolean;
    derecha : Boolean;
    superior : Boolean;
    inferior : Boolean;
 End;
  Helicoptero = class

    protected //private

       x, y, velocidad : integer;
       Direccion : Direcciones;
       helicopteroTIL: TImageList;
       TImageListCant:integer;
       visible : boolean;
    public
      v1, v2, v3, v4 : Pos;
    constructor crear; overload;
    constructor crear(Helicoptero: TImageList; x, y, velocidad : integer); overload;
    procedure moverse(key :word);
    procedure Nomoverse(key :word);
    procedure teMOviste();
    procedure dibujar(t:TCanvas);
    procedure setX(x : integer);
    function getX(): integer;
    procedure setPos(x, y: integer); overload ;
    procedure setPos(x, y: integer; var vertice:Pos); overload;
    procedure SetVisible(visible : boolean);
    procedure gravedad();
    function GetVisible:boolean;
    function GetV1X:integer;
    function GetV2X:integer;
    function GetV3X:integer;
    function GetV4X:integer;
    function GetV1Y:integer;
    function GetV2Y:integer;
    function GetV3Y:integer;
    function GetV4Y:integer;

  end;

implementation

{ Helicoptero }

constructor Helicoptero.crear;
begin
  v1.x := 0;
  v1.y := 0;
  Direccion.izquierda := false;
  Direccion.superior := false;
  Direccion.derecha := false;
  Direccion.inferior := false;
end;

constructor Helicoptero.crear(Helicoptero: TImageList; x, y, velocidad: integer);
begin
  self.helicopteroTIL := Helicoptero;
  self.setPos(x, y);
//  self.setPos(x, y, v1);
//  self.setPos(x+Helicoptero.Width, y, v2);
//  self.setPos(x+Helicoptero.Width, y+Helicoptero.Height, v3);
//  self.setPos(x, y+Helicoptero.Height, v4);

  Direccion.izquierda := false;
  Direccion.superior := false;
  Direccion.derecha := false;
  Direccion.inferior := false;
  TImageListCant := 0;
  self.visible := true;
  self.velocidad := velocidad;
//  helicopteroTIL.GetBitmap()
end;

procedure Helicoptero.dibujar(t: TCanvas);
begin
   if (self.visible) then
   begin
    helicopteroTIL.Draw(t, v1.x+x, v1.y+y,TImageListCant); //0.1.2
    //ctrl + /
    TImageListCant := (TImageListCant+1) mod helicopteroTIL.Count;
   end;

end;

function Helicoptero.GetV1X: integer;
begin
  Result := v1.x + x;
end;

function Helicoptero.GetV1Y: integer;
begin
  Result := v1.Y + Y;
end;

function Helicoptero.GetV2X: integer;
begin
  Result := v2.x + x;
end;

function Helicoptero.GetV2Y: integer;
begin
  Result := v2.y + y;
end;

function Helicoptero.GetV3X: integer;
begin
  Result := v3.x + x;
end;

function Helicoptero.GetV3Y: integer;
begin
  Result := v3.y + y;
end;

function Helicoptero.GetV4X: integer;
begin
  Result := v4.x + x;
end;

function Helicoptero.GetV4Y: integer;
begin
  Result := v4.Y + Y;
end;

function Helicoptero.GetVisible: boolean;
begin
  result := self.visible;
end;

function Helicoptero.getX: integer;
begin
  result := Self.v1.x;
end;

procedure Helicoptero.gravedad;
begin
    if not Direccion.izquierda
       and  not Direccion.superior
       and  not Direccion.derecha
       and  not Direccion.inferior
    then
    begin
      inc(y, 2);
    end;
end;

procedure Helicoptero.moverse(key: word);
begin
  case key of

   37:  begin  //izquierda
          Direccion.izquierda := true;
        end;

   38:  begin  //superior
          Direccion.superior := true;
        end;

   39:  begin  //derecha

           Direccion.derecha := true;
        end;


   40:  begin  //inferior
          Direccion.inferior := true;
        end;


   32:  begin  //espacio

        end;

 end;
end;

procedure Helicoptero.Nomoverse(key: word);
begin
     case key of

   37:  begin  //izquierda
          Direccion.izquierda := false;
        end;

   38:  begin  //superior
          Direccion.superior := false;
        end;

   39:  begin  //derecha
           Direccion.derecha := false;
        end;


   40:  begin  //inferior
          Direccion.inferior := false;
        end;


   32:  begin  //espacio

        end;

 end;
end;

procedure Helicoptero.setPos(x, y: integer; var vertice: Pos);
begin
  vertice.x := x;
  vertice.y := y;


end;

procedure Helicoptero.SetVisible(visible: boolean);
begin
  Self.visible := visible;
end;

//setea todas las posiciones desde el cm y las coordenadas relativas
procedure Helicoptero.setPos(x, y: integer);
begin
  self.setPos(x, y, v1);
  self.setPos(x+self.helicopteroTIL.Width, y, v2);
  self.setPos(x+self.helicopteroTIL.Width, y+self.helicopteroTIL.Height, v3);
  self.setPos(x, y+self.helicopteroTIL.Height, v4);
  self.x := 0;   //desplazamiento 0
  self.y := 0;   //desplazamiento 0
end;

procedure Helicoptero.setX(x: integer);
begin
  x := x;
end;

procedure Helicoptero.teMOviste;
begin


  if (Direccion.izquierda) then
    dec(x, velocidad); //x := x - velocidad
  if (Direccion.derecha) then
    inc(x, velocidad);
  if (Direccion.superior) then
    dec(y, velocidad);
  if (Direccion.inferior) then
    inc(y, velocidad);

//
//  if x > 500 then
//  begin
//    visible := false;
//  end else
//  visible := true;
end;

end.
