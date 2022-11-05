unit UCEscenario;

interface
uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,UCMatriz, UCCesped, UCSnake, URecord;
type
    Escenario = class
      imageWidth, imageHeight : Cardinal;
      m : Matriz;
      cesp : Cesped;
      cabeza, cola, cuerpo : Snake;
      constructor Crear(width, height : integer);
      procedure Dibujar(t : Tcanvas);
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

  self.cabeza := Snake.Crear;
  self.cabeza.SetFilCol(1, 3);
    self.cuerpo := Snake.Crear;
    self.cuerpo.SetFilCol(1, 2);
  self.cola := Snake.Crear;
    self.cola.SetFilCol(1, 1);
  m.ModValor(1, 3, 2, Direction.derecha);
  m.ModValor(1, 2, 2, Direction.derecha);
  m.ModValor(1, 1, 2, Direction.derecha);
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
      if e = 1 then
      begin
        //dibujar obstaculo
      end else if e = 2 then begin
          if (cabeza.GetFil = i) and (cabeza.Getcol = j) then
          begin
//            cabeza.Dibujar(t);
          end
          else
      end else if e = 3 then
         //pared
    end;

  end;
end;

end.
