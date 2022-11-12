unit UCEscenario;

interface
uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,UCMatriz, UCCesped, UCSnake, URecord;
type
    Escenario = class
      private

      imageWidth, imageHeight : Cardinal;
      m : Matriz;
      cesp : Cesped;
      cabeza, cola, cuerpo : Snake;

      public

      constructor Crear(width, height : integer);
      procedure Dibujar(t : Tcanvas);
      function getCabeza(): Snake;
      function getCola(): Snake;
      function getMatriz(): Matriz;
    end;
implementation

{ Escenario }

constructor Escenario.Crear(width, height : integer);
begin

  m := Matriz.Create;
  m.SetFilas(20);
  m.SetColumnas(20);
  Self.imageWidth := width div m.GetColumnas ;
  self.imageHeight := height div m.GetFilas;
  Self.cesp := Cesped.Crear(Self.imageWidth, self.imageHeight);

  self.cabeza := Snake.Crear(Self.imageWidth, self.imageHeight);
  self.cabeza.SetFilCol(1, 3);
    self.cuerpo := Snake.Crear(Self.imageWidth, self.imageHeight);
    self.cuerpo.SetFilCol(1, 2);
  self.cola := Snake.Crear(Self.imageWidth, self.imageHeight);
    self.cola.SetFilCol(1, 1);
  m.ModValor(1, 3, Snake.value, Direction.derecha);
  m.ModValor(1, 2, Snake.value, Direction.derecha);
  m.ModValor(1, 1, Snake.value, Direction.derecha);
end;

procedure Escenario.Dibujar(t: Tcanvas);
var
  I: Integer;
  j: Integer;
  e : byte;
begin
  for I := 0 to m.GetFilas-1 do begin
    for j := 0 to m.GetColumnas-1 do begin
      cesp.SetFilCol(i, j);
      cesp.Dibujar(t);
      e := m.ObtValor(i,j).valor;
      cabeza.Dibujar(t);
      cola.Dibujar(t);
     if e = Snake.value then begin
       if not ((cabeza.GetFil = i) and (cabeza.Getcol = j) or
          (cola.GetFil = i) and (cola.Getcol = j)) then //es la cabeza
       begin
         cuerpo.SetFilCol(i,j);
         cuerpo.Dibujar(t);
       end;
      end else if e = 3 then
         //pared
    end;

  end;
end;

function Escenario.getCabeza: Snake;
begin
  Result := Self.cabeza;
end;

function Escenario.getCola: Snake;
begin
  Result := Self.cola;
end;

function Escenario.getMatriz: Matriz;
begin
  Result := Self.m;
end;

end.
