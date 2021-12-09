unit UCVector;

interface
uses  sysutils,math, Vcl.Dialogs;
const   MaxE = 3060;
//var a:byte;
   type
    Vector = class
    private
       Dimension:word;
       Elementos :array [1..MaxE] of real;
    public
    {procesos}
       procedure cargarRandom(a, b, dim:word);
       procedure cargar;
       procedure setDimension(d : word);
       Procedure AddElemento (e:real);
       Procedure ModElemento (p:word; e:real);
       Procedure InsertarElemento (p:word; e:real);
       Procedure EliminarElemento (p:word);
       procedure intercambiar(x, y :word);
    {tipos de ordenamientos}
       Procedure Quicksort;
       Procedure QSort(i,f:word);
       Procedure MergeSort;
       Procedure Msort(i,f:word);
    {Funciones}
       Function getDimension :word;
       Function ObtenerElemento (p:word):real;
    //B�squedas
       Function BusquedaSecuencial (e:real):word;    //Devuelven posici�n
       Function BusquedaSecuencialOrdenada (e:real):word;
       Function BusquedaBinaria (e:real):word;
       Function BusquedaBinaria1 (e:real):boolean;
    end;

implementation

{ Vectores }

procedure Vector.AddElemento(e: real);
begin
  inc(dimension);
  elementos[dimension] := e;
end;

function Vector.BusquedaBinaria(e: real): word;
var
  a,b,m:word;
  hallado : boolean;
begin
  //requisito tiene que estar ordenado
  a:=1;
  b:= Dimension;
  m:=0;
  hallado := false;     //1 2 3 4 5
 while(a<=b)and(not hallado)do begin
   m:=(a+b) div 2;
  if(e = Elementos[m])then
    hallado := true
  else if(e < Elementos[m])then
    b := m - 1
  else
    a := m + 1;
 end;
 if not hallado then
  m := 0;
  result := m;
end;

function Vector.BusquedaBinaria1(e: real): boolean;
begin
  result := BusquedaBinaria(e) > 0;
end;

//vector puede estar como sea
function Vector.BusquedaSecuencial(e: real): word;
var i : word;
begin                      //v-> [10, 20, 30]   e =10
  i:= 1;
  while (i<=dimension) and (elementos[i]<> e) do
    inc(i);
  if (i > Dimension) then //recorrimos todo el vector
    i := 0;
 result:= i;
end;

//vector ordenado
function Vector.BusquedaSecuencialOrdenada(e: real): word;
var i : word;
begin
  i := 1;
  while (i<=dimension)and(elementos[i]<> e)and(elementos[i] < e) do
    inc(i);
  if (i > Dimension) then
    i := 0;
 result:= i;
end;

procedure Vector.cargar;
var i:word;
begin
  Dimension:=StrToInt(InputBox('','cantidad de elementos',''));
  for i:=1 to Dimension do begin
    Elementos[i]:=StrToInt(InputBox('Elemento','v ['+IntToStr(i)+'] =',''));
  end;
end;

procedure Vector.cargarRandom(a, b, dim: word);
var i:word;
begin
  Dimension := dim;
  for i:=1 to Dimension do begin
    Elementos[i] := a+Random(b-a+1);  //   v(i) = a + Rnd() * (b - a)
  end;                         //ramdon(100)  //[1..100]
end;

procedure Vector.EliminarElemento(p: word);
var
  I: Word;
begin
  if (p>0) and (p<=dimension) then begin
    for I := p to dimension-1 do
       elementos[p]:=elementos[p+1];
    dec(dimension)
  end else raise Exception.Create('Posici�n fuera de rango');
end;

function Vector.getDimension: word;
begin
   result := dimension;
end;

procedure Vector.InsertarElemento(p: word; e: real);
var
  i: Word;
begin
 if (p>0) and (p<=dimension) then
  begin
   inc(dimension);
   for I := dimension downto p+1 do
   elementos[i]:=elementos[i-1];
   ModElemento(p,e)
  end else raise Exception.Create('Posici�n fuera de rango');
end;

procedure Vector.intercambiar(x, y: word);
var z:real;
begin
  z := elementos[x];
  elementos[x] := elementos[y];
  elementos[y] :=z;
end;

procedure Vector.MergeSort;
begin

end;

procedure Vector.ModElemento(p: word; e: real);
begin
   if (p>=1) and (p<=dimension) then
      elementos[p]:=e
   else raise Exception.Create('Error: ObtenerElemento Posici�n fuera de rango');
end;

procedure Vector.Msort(i, f: word);
begin

end;

function Vector.ObtenerElemento(p: word): real;
begin
   if (p>=1) and (p<=dimension) then
      result:=elementos[p]
   else raise Exception.Create('Error: ObtenerElemento Posici�n fuera de rango');
end;

procedure Vector.QSort(i, f: word);
var der,izq,m:word;
begin
  izq:=i; der:=f;
  m:=trunc(elementos[i]+ elementos[f])div 2;
  repeat
     while (elementos[i] < m) do
       inc(i);
     while elementos[f] > m do
         dec(f);
     if i<=f then
      begin
         intercambiar(i,f);
         i:=i+1;
         f:=f-1;
      end;
  until i>f ;
   if izq <f then Qsort(izq,f);
   if i < der then Qsort(i,der);
end;

procedure Vector.Quicksort;
begin
    Qsort(1,dimension);
end;

procedure Vector.setDimension(d: word);
begin
  Dimension := d;
end;

end.
