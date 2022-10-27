unit UCEnemigo;

interface
uses   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList, UChelicoptero;

type
 Pos = Record
    x : integer;
    y : integer;
 End;

  Enemigo = class

    protected
       Direccion : Direcciones;
       x, y, ancho, alto, velocidad :integer;
       enemigoTBit: TBitmap;
       TImageListCant : integer ;
       visible : boolean;
    public
       v1, v2, v3, v4 : Pos;
    constructor crear; overload;
    constructor crear( x, y, velocidad : integer; url : string); overload;
    procedure moverse(key :word);
    procedure Nomoverse(key :word);
    procedure teMOviste();
    procedure dibujar(t:TCanvas);
    procedure setPos(x, y: integer); overload ;
    procedure setPos(x, y: integer; var vertice:Pos); overload;
    procedure SetX(x : integer); overload ;
    procedure SetY(Y : integer); overload ;
    procedure setVisible(sw : boolean);
    procedure setVelocidad(x : byte);
    procedure moverseIzquierda();
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

{ Enemigo }

constructor Enemigo.crear;
begin

end;

constructor Enemigo.crear( x, y, velocidad: integer; url : string);
begin
  self.enemigoTBit := TBitmap.Create;
  self.enemigoTBit.LoadFromFile(url);
  self.enemigoTBit.Transparent := true;
  self.velocidad := velocidad;
  self.ancho := enemigoTBit.Width;
  self.alto :=  enemigoTBit.Height;
  self.setPos(x, y);
  self.visible := true;
end;

procedure Enemigo.dibujar(t: TCanvas);
var a : byte;
begin
  if visible then
  begin
//    t.StretchDraw(RECT(v1.x+x, v1.y+y, 20, 20), enemigoTBit);
    t.Draw(v1.x+x, v1.y+y, enemigoTBit);
  end;

end;
function Enemigo.GetV1X: integer;
begin
  Result := v1.x + x;
end;

function Enemigo.GetV1Y: integer;
begin
  Result := v1.Y + Y;
end;

function Enemigo.GetV2X: integer;
begin
  Result := v2.x + x;
end;

function Enemigo.GetV2Y: integer;
begin
  Result := v2.y + y;
end;

function Enemigo.GetV3X: integer;
begin
  Result := v3.x + x;
end;

function Enemigo.GetV3Y: integer;
begin
  Result := v3.y + y;
end;

function Enemigo.GetV4X: integer;
begin
  Result := v4.x + x;
end;

function Enemigo.GetV4Y: integer;
begin
  Result := v4.Y + Y;
end;



procedure Enemigo.moverse(key: word);
begin

end;

procedure Enemigo.moverseIzquierda;
begin
  Dec(x, velocidad);
end;

procedure Enemigo.Nomoverse(key: word);
begin

end;

procedure Enemigo.setPos(x, y: integer; var vertice: Pos);
begin
  vertice.x := x;
  vertice.y := y;
end;

procedure Enemigo.setVelocidad(x: byte);
begin
  self.velocidad := x;
end;

procedure Enemigo.setVisible(sw: boolean);
begin
  Self.visible := sw;
end;

procedure Enemigo.SetX(x: integer);
begin
 self.x := x;
end;

procedure Enemigo.SetY(Y: integer);
begin
  self.y := y;
end;

procedure Enemigo.setPos(x, y: integer);
begin
  self.setPos(x, y, v1);
  self.setPos(x+self.ancho, y, v2);
  self.setPos(x+self.ancho, y+self.alto, v3);
  self.setPos(x, y+self.alto, v4);
  self.x := 0;
  self.y := 0;
end;

procedure Enemigo.teMOviste;
begin

end;

end.
