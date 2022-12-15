unit UCMatriz;

interface
uses SysUtils, Vcl.Grids, Vcl.Dialogs, URecord;
Const
  MaxF = 128;
  MaxC = 128;
Type
    Matriz = class
      private
        NFilas, NColumnas : word;
        celdas : Array[0..MaxF, 0..MaxC] of dato;
        //128*128 = 16,384
      public
        constructor crear();
        procedure SetFilas(f : word);
        procedure SetColumnas(c : word);
        Function GetFilas : word;
        Function GetColumnas : word;
        Function ObtValor(f,c : word) : dato;
        Procedure ModValor(f,c : word; v:dato); overload;
        Procedure ModValor(f,c : word; valor: byte; d: direction  ); overload;
    end;

implementation

{ Matriz }






constructor Matriz.crear;
var
  I: Integer;
  j: Integer;
begin
  Self.NFilas := 0;
  Self.NColumnas := 0;
  for I := 0 to MaxF do
    for j := 0 to MaxC do begin
      celdas[i, j].valor := 0;
      celdas[i, j].direccion := Direction.null;
    end;
end;

function Matriz.GetColumnas: word;
begin
  Result := NColumnas;
end;

function Matriz.GetFilas: word;
begin
  Result := NFilas;
end;




procedure Matriz.ModValor(f, c: word; valor: byte; d: direction);
begin
   celdas[f,c].valor := valor;
      celdas[f,c].direccion := d;
end;

procedure Matriz.ModValor(f, c: word; v: dato);
begin
//  if (f>0)and(f<=NFilas)and(c>0)and(c<=NColumnas) then
  celdas[f,c] := v
//  else raise Exception.Create('Error Message');
end;

function Matriz.ObtValor(f, c: word): dato;
begin
//  if (f>0)and(f<=NFilas)and(c>0)and(c<=NColumnas) then
    Result := celdas[f,c]
//  else raise Exception.Create('Error Message');
end;

procedure Matriz.SetColumnas(c: word);
begin
  NColumnas := c;
end;

procedure Matriz.SetFilas(f: word);
begin
   NFilas := f;
end;


end.
