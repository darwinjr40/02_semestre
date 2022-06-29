unit UCHelicoptero;

interface
uses   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList;

type
Direcciones = Record
    izquierda : Boolean;
    derecha : Boolean;
    superior : Boolean;
    inferior : Boolean;
 End;
  Helicoptero = class

    private
       x, y, velocidad : integer;
       Direccion : Direcciones;
       helicopteroTIL: TImageList;
       TImageListCant:integer;
       visible : boolean;
    public
    constructor crear; overload;
    constructor crear(Helicoptero: TImageList; x, y, velocidad : integer); overload;
    procedure moverse(key :word);
    procedure Nomoverse(key :word);
    procedure teMOviste();
    procedure dibujar(t:TCanvas);
    procedure setX(x : integer);
    function getX(): integer;
  end;

implementation

{ Helicoptero }

constructor Helicoptero.crear;
begin
   x := 0;
  y := 0;
  Direccion.izquierda := false;
  Direccion.superior := false;
  Direccion.derecha := false;
  Direccion.inferior := false;
end;

constructor Helicoptero.crear(Helicoptero: TImageList; x, y, velocidad: integer);
begin
  self.helicopteroTIL := Helicoptero;
  self.x := x; //this.
  self.y := y;
  Direccion.izquierda := false;
  Direccion.superior := false;
  Direccion.derecha := false;
  Direccion.inferior := false;
  TImageListCant := 0;
  visible := true;
  self.velocidad := velocidad;
//  helicopteroTIL.GetBitmap()
end;

procedure Helicoptero.dibujar(t: TCanvas);
begin
   if (visible) then
   begin
    helicopteroTIL.Draw(t, x, y,TImageListCant); //0.1.2
    TImageListCant := (TImageListCant+1) mod 3;
   end;

end;

function Helicoptero.getX: integer;
begin
  result := Self.x;
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

procedure Helicoptero.setX(x: integer);
begin
  self.x := x;
end;

procedure Helicoptero.teMOviste;
begin


  if (Direccion.izquierda)and(x > 0) then
    dec(x, velocidad); //x := x - velocidad
  if (Direccion.derecha) then
    inc(x, velocidad);
  if (Direccion.superior) and (y > 0) then
    dec(y, velocidad);
  if (Direccion.inferior) then  inc(y, velocidad);

  if x > 500 then
  begin
    visible := false;
  end else
  visible := true;
end;

end.
