unit UCEscenario;

interface
uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,UCMatriz, UCCesped;
type
    Escenario = class
      imageWidth, imageHeight : Cardinal;
      m : Matriz;
      cesp : Cesped;
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
end;

procedure Escenario.Dibujar(t: Tcanvas);
var
  I: Integer;
  j: Integer;
  e : real;
begin
  for I := 0 to m.GetFilas-1 do begin
    for j := 0 to m.GetColumnas-1 do begin
      cesp.SetFilCol(i, j);
      cesp.Dibujar(t);
      e := m.ObtValor(i,j);
//      if e = 1 then
//      begin
//        //dibujar obstaculo
//      end else if e = 2 then
//                       //serpiete
//      else if e = 3 then
//         //pared
    end;

  end;
end;

end.
