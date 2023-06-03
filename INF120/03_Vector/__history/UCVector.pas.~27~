unit UCVector;

interface
uses  sysutils,math, Vcl.Dialogs, UCNumero, UCCadena ;
const   MaxE = 3060;
//var a:byte;
   type
    Vector = class
    private
       Dimension:word;                               //nombre, fecha, ci, foto
       Elementos :array [1..MaxE] of real;
    public
      //polimorfismo
       constructor Create(dim : word); overload;
    {procesos}
       procedure cargarRandom(a, b, dim:word);
       procedure cargar;
       procedure setDimension(d : word);
       Procedure AddElemento (e:real);
       Procedure ModElemento (p:word; e:real);
       Procedure InsertarElemento (p:word; e:real);
       Procedure EliminarElemento (p:word);
       procedure intercambiar(x, y :word);
       procedure elimitarAllRepetidos();
    {tipos de ordenamientos}
       procedure OrdIntercambio; overload;
       procedure OrdIntercambio(a, b : word);  overload;
       procedure OrdSeleccion;  overload;
       procedure OrdSeleccion(a, b : word);  overload;
       procedure OrdBurbuja;  overload;
       procedure OrdBurbuja(a, b : word);  overload;
       procedure OrdShell;
       Procedure Quicksort;
       Procedure QSort(i,f:word);                     //el 2do mejor

       Procedure OrdMsort;
       Procedure MergeSort(a, b : vector);  overload;

       Procedure MSort;  overload;                     //el mejor
       Procedure MSort(a, b : word);   overload;
       Procedure Mezcla(a, m, b : word);   overload;

       procedure SegmentarPrimoNoPrimo(a, b : word);
       procedure sefmentarCerosNoCeros(a, b : word);
       procedure IntercalarCerosNoCeros(a, b : word);  overload;
       procedure IntercalarCerosNoCeros(); overload;
       {
       HeadSort
        }
    {Funciones}
       Function getDimension :word;
       Function getElemento (p:word):real;
       function frecuencia(a, b : word; e:real):word;
       function eleMen() : real;
       function esDivisor(e : real): Boolean;
       function mcd(): word;
    //Búsquedas
       Function BusquedaSecuencial (e:real):word;    //Devuelven posición
       Function BusquedaSecuencialOrdenada (e:real):word;
       Function BusquedaBinaria (e:real):word;       overload;
       Function BusquedaBinariaB (e:real):boolean;   overload;
    {Examenes}
       {2022-1}
      procedure CargarAsc(cad : String);
      procedure insertAsc(x : real);

      Procedure MezclaParImpar(a, m, b : word);   overload;
    end;

implementation

{ Vectores }

procedure Vector.AddElemento(e: real);
begin
  inc(dimension);
  elementos[dimension] := e;
end;
//retorna la posicion del elemento a buscar
//requisito tiene que estar ordenado el vector ascendenetemente
function Vector.BusquedaBinaria(e: real): word;
var
  a,b,m:word;
  hallado : boolean;
begin
  a:=1;
  b:= Dimension;
  hallado := false;     //1 2 3 4 5
 while(a<=b)and(not hallado)do begin
   m := (a+b) div 2;
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
//Retorna true o false si es que lo encuentra
function Vector.BusquedaBinariaB(e: real): boolean;
begin
  result := self.BusquedaBinaria(e) > 0;
end;

//vector puede estar como sea
//v[40,20,30,10]    e = 21
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

//requisito tener el vector ordenado
//v[10,20,30,40]    e = 21
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

procedure Vector.CargarAsc(cad: String);
var objetoCadena : Cadena;
    i : word;
    num : String;
begin
  objetoCadena := Cadena.Create();
  objetoCadena.CargarCadena(cad);
  i := 1;
  while (i <= objetoCadena.GetLongitud()) do
  begin
    num := objetoCadena.NextNumero(i);
    if (num <> '') then  //tiene un numero
    begin
      self.insertAsc(StrToFloat(num));        
    end;
//    ShowMessage(num);
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

constructor Vector.Create(dim: word);
begin
  Dimension := dim;
end;

function Vector.eleMen: real;
var  i : word;
      m : real;
begin
  m := double.MaxValue;
  for i := 1 to Dimension do begin
    if elementos[i] < m then
      m := elementos[i];
  end;
  result := m;
end;

procedure Vector.EliminarElemento(p: word);
var
  I: Word;
begin
  if (p>0) and (p<=dimension) then begin
    for I := p to dimension-1 do
       elementos[p]:=elementos[p+1];
    dec(dimension)
  end else raise Exception.Create('Posición fuera de rango');
end;

procedure Vector.elimitarAllRepetidos;
var i, j, c : word;
begin
  j := 0;
  for i := 1 to Dimension do begin
    c := frecuencia(1, Dimension, elementos[i] );
    if c = 1 then begin //es unico
      inc(j);
      intercambiar(j, i);
    end;
  end;
  Dimension := j;
end;

function Vector.esDivisor(e: real): Boolean;
var i : word;
    b : Boolean;
begin
  b := true;
  i := 1;
  while (i <= Dimension)and (b) do begin
    if ((trunc(Elementos[i]) mod trunc(e)) <> 0) then  //no es divisor
      b := false;
    inc(i);
  end;
  result := b;
end;

function Vector.frecuencia(a, b: word; e: real): word;
var c, i, n:Integer;
begin
  n := b - a + 1;
  if (n > 0) then begin
    c:=0;
    for i := a to b do begin   //while(a <= b and c < 1)
      if(Elementos[i] = e)then //
        inc(c);                //
    end;                       //a = a +1;
    Result:=c;                 //result := c>=2  (booleano)
  end else raise Exception.Create('Posición fuera de rango');
end;

function Vector.getDimension: word;
begin
   result := dimension;
end;

procedure Vector.InsertarElemento(p: word; e: real);
var
  i: Word;
begin
 if (p>=1) and (p<=dimension) then
  begin
   inc(dimension);
   for I := dimension downto p+1 do  begin
     elementos[i] := elementos[i-1];
   end;
   ModElemento(p,e)
  end else raise Exception.Create('Posición fuera de rango');
end;

{[1,3,5] x=4 => [1,2,4,5] }
procedure Vector.insertAsc(x: real);
var i : byte;
begin
    i := Dimension;        
    while ((i >= 1) and (x < Elementos[i])) do
    begin
      elementos[i+1] := elementos[i];
      i := i - 1;
    end;
    dimension := dimension + 1;
    ModElemento(i+1, x);    
end;

procedure Vector.IntercalarCerosNoCeros;
begin
   IntercalarCerosNoCeros(1, Dimension);
end;

procedure Vector.IntercalarCerosNoCeros(a, b: word);
var i,j:integer;
      x, y : Numero;
      sw :Boolean;
begin
  x := Numero.crear(5);//create
  y := Numero.crear();
  sw := true;
  for i := a to b-1 do begin  //intercambio
    for j := i+1 to b do begin
        if (sw) then
        begin
          x.setValor(trunc(elementos[i]));
          y.setValor(trunc(elementos[j]));
        end else begin
          y.setValor(trunc(elementos[i]));
          x.setValor(trunc(elementos[j]));
        end;
        if (NOT x.tieneCero and y.tieneCero)
        or ((x.tieneCero and y.tieneCero) and (elementos[i] > elementos[j]))
        or ((not x.tieneCero and not y.tieneCero) and (elementos[i] > elementos[j]))
        then begin
           intercambiar(i, j);
        end;
    end;
    sw := not sw;
  end;
end;

procedure Vector.intercambiar(x, y: word);
var z:real;
begin
  z := elementos[x];
  elementos[x] := elementos[y];
  elementos[y] :=z;
end;

function Vector.mcd: word;
var men : word;
  I: Real;
  b : Boolean;
begin
  men := trunc(eleMen());
  b := false;
  while (men > 0) and (not b) do   begin
    if (esDivisor(men)) then
      b := true
   else
      dec(men);
  end;
  result := men;
end;

procedure Vector.OrdBurbuja(a, b: word);
var n, i, j : word;
begin
  n := b - a + 1;
  if (n > 0) then begin
    for i := Dimension downto (2) do
      for j:= 1 to (i - 1) do
        if(Elementos[j]>Elementos[j+1])then
          intercambiar(j, j+1);
  end else begin
    raise Exception.Create('Error intercambio: Posición fuera de rango');
  end;
end;

procedure Vector.OrdBurbuja;
begin
    OrdBurbuja(1, Dimension);
end;
                               //3 ..5--3,4,5
procedure Vector.OrdIntercambio(a, b: word);
var n, i, j : word;
begin
  n := b - a + 1;  //5-3+1
  if (n > 1) then begin
    for i:=a to (b-1) do
      for j:=i+1 to b do
        if(Elementos[i]>Elementos[j])then
          intercambiar(i, j);
  end else begin
    raise Exception.Create('Error intercambio: Posición fuera de rango');
  end;
end;


procedure Vector.OrdSeleccion(a, b: word);
var n, pos, i, j:word;
begin
  n := b - a + 1;
  if (n > 0) then begin
    for i:=a to b-1 do  begin
      pos:=i;
      for j:= i+1 to b do  begin
        if(Elementos[pos] > Elementos[j]) then
         pos:= j;
      end;
      if (pos<> i)then
         intercambiar(pos, i);
    end;
  end else begin
    raise Exception.Create('Error intercambio: Posición fuera de rango');
  end;
end;

procedure Vector.OrdShell;
Var
   Fact,i : Word;
   sw : Boolean;
begin
     fact:=Dimension div 2;
     while fact>0 do
     Begin
          i:=1;sw:=false;
          while i<=Dimension-fact do
          Begin
              if Elementos[i]>Elementos[i+fact] then
              Begin
                 Intercambiar(i,i+fact);
                 sw:=True;
              End;
          End;
          if sw=false then
             fact:=fact div 2;
     End;
end;

procedure Vector.OrdSeleccion;
begin
   OrdSeleccion(1, Dimension);
end;

procedure Vector.OrdIntercambio;
begin
  OrdIntercambio(1, Dimension);
end;



procedure Vector.ModElemento(p: word; e: real);
begin
   if (p>=1) and (p<=dimension) then
      elementos[p]:=e
   else raise Exception.Create('Error: ObtenerElemento Posición fuera de rango');
end;

procedure Vector.MSort;
begin
  MSort(1, Dimension);
end;

procedure Vector.Msort(a, b: word);
var n, m : word;
begin
  n := b - a + 1;
  if (N >= 2 ) then
  begin
    m := (a+b) div 2;
    MSort(a, m);
    MSort(m+1, b);
    Mezcla(a, m, b);
  end;
end;

procedure Vector.Mezcla(a, m, b: word);
var i, j, k, aDimension, bDimension : word;
    v : Vector;
begin
  v := Vector.Create();
  i := a;
  j := m+1;
  while (i <= m) and (j <= b) do begin
    if (Elementos[i] <= Elementos[j]) then begin  //desc  (Elementos[i] > Elementos[j])
      v.AddElemento(Elementos[i]);
      inc(i);
    end else begin
      v.AddElemento(Elementos[j]);
      inc(j);
    end;
  end;

  while (i <= m) do begin
    v.AddElemento(Elementos[i]);
    inc(i);
  end;

  while (j <= b) do begin
    v.AddElemento(Elementos[j]);
    inc(j);
  end;

  for i := a to b do begin
    Elementos[i] := v.Elementos[i-a+1];
  end;

end;

{[1,2,3,4,5] => [2,3,5,1,4]}
{[2,1,3,4,5]}
//--------------
{[2,3,1,4,5]}
//----------
{[2,3,5,4,1]}
//-------------
{[2,3,5,4,1]}
{[2,3,5,1,4]   => [par ...impares]}
//mezcla
{[3,4,5] [4] => [4,3]} {par asc[men..may], impar desc[may..men]}

procedure Vector.MezclaParImpar(a, m, b: word);
var i, j, k, aDimension, bDimension, x, y : word;
    v : Vector;
    //[2][3] => [2]
    //[3][2] => [2]

    //[3][5] => [5]
    //[5][3] => [5]
    
    //[4][2] => [2]
    //[2][4] => [2]
begin
  v := Vector.Create();
  i := a;
  j := m+1;
  while (i <= m) and (j <= b) do begin
    x := trunc(Elementos[i]);
    y := trunc(Elementos[j]);
    if ((x mod 2 = 0)and (y mod 2 = 1) ) then
    begin
      v.AddElemento(x);
      inc(i);
    end else if ((x mod 2 = 1)and (y mod 2 = 0) ) then
    begin
      v.AddElemento(y);
      inc(j);
    end else if ((x mod 2 = 0)and (y mod 2 = 0)) then begin  //desc  (Elementos[i] > Elementos[j])
      if (x <= y) then begin
        v.AddElemento(x);
        inc(i);
      end else begin
        v.AddElemento(y);
        inc(j);
      end;      
    end else if ((x mod 2 = 1)and (y mod 2 = 1) ) then begin
        if (x > y) then
        begin
          v.AddElemento(x);
          inc(i);
        end
        else
        begin
          v.AddElemento(y);
          inc(j);
        end;        
    end;
 
  end;
//  []
  while (i <= m) do begin
    v.AddElemento(Elementos[i]);
    inc(i);
  end;

  while (j <= b) do begin
    v.AddElemento(Elementos[j]);
    inc(j);
  end;

  for i := a to b do begin
    Elementos[i] := v.Elementos[i-a+1];
  end;

end;

procedure Vector.MergeSort(a, b : vector);
var i, j, k, aDimension, bDimension : word;
begin
  aDimension := a.Dimension;
  bDimension := b.Dimension;
  i := 1;
  j := 1;
  k := 1;
  while (i <= aDimension) and (j <= bDimension) do begin
    if (a.Elementos[i] <= b.Elementos[j]) then begin
      Elementos[k] := a.Elementos[i];
      inc(i);
    end else begin
      Elementos[k] := b.Elementos[j];
      inc(j);
    end;
    inc(k);
  end;

  while (i <= aDimension) do begin
    Elementos[k] := a.Elementos[i];
    inc(i);
    inc(k);
  end;

  while (j <= bDimension) do begin
     Elementos[k] := b.Elementos[j];
     inc(j);
     inc(k);
  end;
end;



procedure Vector.OrdMsort();
var a, b : Vector;
    mitad, i : word;
begin
  if Dimension > 1 then begin
    mitad := Dimension div 2;
    a := Vector.Create(mitad);
    b := Vector.Create(Dimension - mitad);
    for i := 1 to mitad do begin  //cargar vector a
      a.Elementos[i] := Elementos[i];    //a.ModElemento(i, Elementos[i]);
    end;
    for i := mitad+1 to Dimension do begin //cargar vector b
      b.Elementos[i - mitad] := Elementos[i];
    end;
    a.OrdMsort();
    b.OrdMsort();
    MergeSort(a, b);
  end;
end;

function Vector.getElemento(p: word): real;
begin
   if (p>=1) and (p<=dimension) then
      result:=elementos[p]
   else raise Exception.Create('Error: ObtenerElemento Posición fuera de rango');
end;
//ord asc
{
  [1,8,4, 5]  m =3
   f i    
}
procedure Vector.QSort(i, f: word);
var der,izq,m, n:word;
begin
  izq:=i; der:=f;
  m:=trunc(elementos[i]+ elementos[f])div 2;
//  n := f - i + 1;
//  m := elementos[n div 2];  
  ShowMessage(inttostr(m));
  repeat
     while (elementos[i] < m) do   //busca [i] < m   //desc  [i] > m
       inc(i);
     while elementos[f] > m do     //busca [f] > m   //desc  [f] < m
       dec(f);
     if i<=f then
      begin
         intercambiar(i,f);
         i:=i+1;
         f:=f-1;
      end;
  until i>f ;
  ShowMessage(inttostr(i));
  ShowMessage(inttostr(f));
   if izq <f then Qsort(izq,f);
   if i < der then Qsort(i,der);
end;

procedure Vector.Quicksort;
begin
    Qsort(1,dimension);
end;

procedure Vector.sefmentarCerosNoCeros(a, b: word);
var i,j:integer;
      x, y : Numero;
      na, nb :boolean;
begin
  x := Numero.crear(5);//create
  y := Numero.crear();
  for i := a to b-1 do begin  //ord intercambio
    for j := i+1 to b do begin
        x.setValor(trunc(elementos[i]));  //entera
        y.setValor(trunc(elementos[j]));  //y.valor =
        if (NOT x.tieneCero and y.tieneCero)
        or ((x.tieneCero and y.tieneCero) and (elementos[i] > elementos[j]))
        or ((not x.tieneCero and not y.tieneCero) and (elementos[i] > elementos[j]))
        then begin
           intercambiar(i, j);
        end;
    end;
  end;
end;
{[1,2,3,4,5] => [2,3,5,1,4]}
{[2,1,3,4,5]}
//--------------
{[2,3,1,4,5]}
//----------
{[2,3,5,4,1]}
//-------------
{[2,3,5,4,1]}
{[2,3,5,1,4]}
procedure Vector.SegmentarPrimoNoPrimo(a, b: word);
var i,j:integer;
      x, y : Numero;
begin
  x := Numero.crear(5);//create
  y := Numero.crear();
  for i := a to b-1 do begin  //intercambio
    for j := i+1 to b do begin
        x.setValor(trunc(elementos[i]));  //x.valor =
        y.setValor(trunc(elementos[j]));  //y.valor =
        if (NOT x.verifPrimo and y.verifPrimo)
        or (x.verifPrimo and y.verifPrimo and (elementos[i] > elementos[j]))or
           (NOT x.verifPrimo and NOT y.verifPrimo and (elementos[i] > elementos[j]))
        then begin
           intercambiar(i, j);
        end;
    end;
  end;
end;

procedure Vector.setDimension(d: word);
begin
  Dimension := d;
end;

end.
