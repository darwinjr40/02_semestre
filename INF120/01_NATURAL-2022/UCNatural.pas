﻿unit UCNatural;

interface
uses math, sysutils,Dialogs;
  type
  Natural = class
    private  { Private declarations }
       valor : Cardinal;     //0...(2^32)-1
//       aux : Natural;
    constructor crear(x : Cardinal; o : Natural);overload;

    public  { Public declarations }     //ctrl + shift + c
    {constructores}
    constructor crear; overload;
    constructor crear(x : cardinal); overload;
    constructor crear(x : Natural);overload;
    {function}
    function    GetValor : cardinal;
    function    GetDigito(p : byte) : byte;
    function    VerficarPrimo : boolean;
    function    GetCantDig : byte;
    function    VerifCapicua : boolean;
    function    ToLiteral() : String;  overload;
    function    toBase(b : cardinal) : String;
    function    ToRomano() : String;
    function    GetFrc(e:cardinal): byte;
    function    GetPosDigMenFre(n : Cardinal): byte;
    function    GetPosDigMenor(): byte;
    {procedure}
    procedure   SetValor(x : cardinal);
    procedure   InserDigito(p,d:byte);
    procedure   Invertir;
    procedure   UnirNumDerecha(e : Cardinal);
    procedure   UnirNumIzquierda(e : Cardinal);
    procedure   ElimPosDigito(p: byte);
    procedure   ElimPrimerDigito(e : byte);
    procedure   ElimDigito(e : byte);
    procedure   ElimPrimerNumero(e : Cardinal);
    procedure   ElimCantDigIzq(cant : byte);
    procedure   ElimCantDigDer(cant : byte);
    procedure   ToCardinal(n: extended; var cantDigFrac: byte);
    {opcional}
    procedure   MovDigMayIni();
    procedure   MovDigMayFrcIni();
    procedure   MovDigMenFrcIni();
    {modelos de examen}
    procedure   ElimDigPrimoTieneVecinoDigPrimo;
    procedure   SegFrcDesc();
    procedure   OrdIzdToDerAsc();
    {metodos estaticos, pertenecen a la clase}
    class function  Pot(b,e: Cardinal):Cardinal; static;
    class function  ToUnidad(n : byte) : String; static;
    class function  ToDecenas(n : byte) : String; static;
    class function  ToCentenas(n : word) : String; static;
    class function  ToLiteral(n : cardinal) : String; overload; static;
    class function  VerifPartFracc(x:extended):boolean; static;
    class procedure IntercamParteFraccionaria(var n: extended); static;

  end;

implementation

{ Natural }

procedure Natural.SegFrcDesc;
var n : cardinal;
begin
  repeat
    n := valor;
    self.MovDigMenFrcIni();
  until (N = VALOR);
end;

procedure Natural.SetValor(x: cardinal);
begin
  valor := x;
end;

constructor Natural.crear;
begin
//  valor := 0;
   self.crear(0)
end;

constructor Natural.crear(x: cardinal);
//var obj : Natural;
begin
//  obj := Natural.crear();
//  obj.aux := Natural.crear();
//  crear(x, obj);
  self.valor := x;
end;

constructor Natural.crear(x: Natural);
begin;
  valor := x.GetValor;
//  crear(x.GetValor, Natural.crear);
end;

constructor Natural.crear(x: Cardinal; o: Natural);
begin
  valor := x;
//  aux := o;
end;

procedure Natural.ElimPrimerDigito(e: byte);
var n : cardinal;
    p : byte;
begin
  p := 0;  n := 0;
  while (valor > 0)and ((valor mod 10)<>e) do begin
    n := (valor mod 10) * pot(10,p) + n;
    inc(p);
    valor := valor div 10;
  end;
  if valor = 0 then
    valor := n
  else begin
    valor := (valor div 10);
    UnirNumDerecha(n);
  end;
end;




procedure Natural.ElimCantDigDer(cant: byte);
begin
  if cant = 0 then
    raise Exception.Create('Posicion fuera de rango: function ElimCantDigDer')
  else
    valor := valor div (pot(10,cant));
end;

procedure Natural.ElimCantDigIzq(cant: byte);
begin
  if cant = 0 then
    raise Exception.Create('Posicion fuera de rango: function ElimCantDigIzq')
  else  begin
    if (cant <= GetCantDig)then
     valor := valor mod (pot(10,GetCantDig - cant))
    else
     valor := 0;
  end;
end;

procedure Natural.ElimDigito(e: byte);
var n : cardinal;
    p : byte;
begin
  n := 0;
  while valor > 0 do  begin
    if (valor mod 10) <> e then begin
      n := (valor mod 10) * pot(10,p) + n;
      p := p + 1;
    end;
    valor := valor div 10;
  end;
  valor := n;
end;
//22.Eliminar todos los d�gitos primos que est�n al lado de un d�gito primo
//Ejemplo: 2472835 => 24783
procedure Natural.ElimDigPrimoTieneVecinoDigPrimo;
var b, aux : Natural;
    n, p : Cardinal;
begin
  b := Natural.crear(0);
  aux := Natural.crear(0);
  p := 1;  n := 0;
  while (valor > 9) do begin
    aux.valor := (valor mod 10);
    valor := valor div 10;
    b.valor := (valor mod 10);
    if not(aux.VerficarPrimo and b.VerficarPrimo) then
    begin
      n := aux.valor * p + n;
      p := p * 10;
    end;
  end;
  valor := (valor mod 10) * p + n;
end;

procedure Natural.ElimPrimerNumero(e: Cardinal);
var p, c : byte;
    n : Cardinal;
    aux : Natural;
begin
  aux := Natural.crear(0);
  aux.valor := e;
  p := aux.GetCantDig;
  c := 0;
  n := 0;
  while (valor > 0) and (valor mod pot(10,p) <> e) do  begin
    n := (valor mod 10) * pot(10,c) + n;
    c := c + 1;
    valor := valor div 10;
  end;
  if valor = 0 then //no encontro el numero
    valor := n
  else begin
    valor := valor div pot(10,p);
    UnirNumDerecha(n);
  end;
end;



function Natural.GetFrc(e: cardinal): byte;
var cd, r : byte;
    n, d : cardinal;
    aux : Natural;
begin
  aux := Natural.crear(0);
  aux.valor := e;
  cd := aux.GetCantDig;
  n := valor;
  r := 0;
  while (n > 0) do
  begin
    d := n mod pot(10,cd);
    n := n div 10;
    if e = d then begin
      r := r + 1;
      n := n div pot(10,cd-1);
    end;
  end;
  GetFrc := r;
end;

function Natural.GetPosDigMenFre(n : Cardinal): byte;
var er, p, fr, f, fa, fb, a, b : byte;
    cant : cardinal;
begin
  if valor = 0 then
    raise Exception.Create('No hay digitos: procedure GetPosDigMenFre')
  else begin
    er:= n mod 10;
    fr := GetFrc(er);
    n := n div 10;
    while n > 0 do
    begin
      f := GetFrc(n mod 10);
      if ((f < fr)or ((f = fr) and  (n mod 10 > er))) then
      begin
        fr := f;
        er := n mod 10;
      end;
      n := n div 10;
    end;
    result := er;
  end

end;

function Natural.GetPosDigMenor: byte;
var d, i, men, p : byte;
    x, dim : cardinal;
begin
  x := valor;
  men := x mod 10;
  if x  = 0 then
  begin
    p := 0;
  end else begin
    p := 1;
    dim := trunc(Log10(x) + 1);  //get posicion
    for i := 1 to dim do begin
      d := self.GetDigito(i);
      if d < men then
      begin
        men := d;
        p := i;
      end;
    end;
  end;
  result := p;
end;

procedure Natural.ElimPosDigito(p: byte);
var k : cardinal;
begin
  if not((p >= 1) and (p <= self.GetCantDig)) then
    raise Exception.Create('Posicion fuera de rango: procedure ElimPosDigito')
  else begin
    k:= pot(10,p-1);
    valor:= (valor div (k*10)) * (k) + (valor mod k);
  end;
end;

function Natural.GetValor: cardinal;
begin
  result := valor;
end;

function Natural.GetCantDig: byte;
var r : byte;
begin
  if (valor = 0) then r:=1 else r:=trunc(log10(valor*10));
  GetCantDig := r;
end;

function Natural.GetDigito(p: byte): byte;
begin
  if p = 0 then
    raise Exception.Create('Posicion fuera de rango: function GetDigito')
  else
    GetDigito := (self.valor div pot(10, p-1)) mod 10;
end;

//N=9876   p=3 d=5   => N= 98576
//mitad = cantDigitos / 2 + 1
procedure Natural.InserDigito(p, d: byte);
var a, b, k : cardinal;
begin
  if not((p >= 1) and (p <= self.GetCantDig+1)) then
    raise Exception.Create('Posicion fuera de rango: function InserDigito')
  else begin
     k := pot(10, p-1);
     a:= (valor div k)*10 + d;
     b:= valor mod k;
     valor:= a * k + b;
  end;
end;


class procedure Natural.IntercamParteFraccionaria(var n: extended);
var c, cantDigEntero : byte;
    frac : cardinal;
    aux : Natural;
begin
  aux := Natural.crear(trunc(n));
  cantDigEntero := aux.GetCantDig();
  aux.ToCardinal(n, c);
  frac := aux.valor mod (Natural.Pot(10,c));
  aux.ElimCantDigDer(c);
  aux.UnirNumIzquierda(frac);
  n := aux.valor / (Natural.Pot(10,cantDigEntero));
end;

procedure Natural.Invertir;
var copia : cardinal;
begin
 copia := 0;
 while valor >= 0 do begin
   copia := copia *10 + (valor mod 10);
   valor := valor div 10;
 end;
 valor := copia;
end;
//222555508
procedure Natural.MovDigMayFrcIni;
var d : byte;
    n, a, p : cardinal;
begin
  n := valor; p := 1; a := 0;
  while (n > 9) do
  begin
    d := (n mod 10);
    n := n div 10;
    if (GetFrc(n mod 10) < GetFrc(d)) then begin
      a := (n mod 10) * p + a;
      n := (n div 10)*10+d;
    end else begin
      a := d * p + a;
    end;
    p := p *10;
  end;
  valor := n;
  UnirNumDerecha(a);
end;

procedure Natural.MovDigMayIni;
var d : byte;
    n, p : cardinal;
begin
  n := 0; p := 1;
  while (valor > 9) do
  begin
    d := (valor mod 10);
    valor := valor div 10;
    if ((valor mod 10) < d) then begin
      n := (valor mod 10) * p + n;
      p := p *10;
      valor := (valor div 10)*10+d;
    end;
  end;
  UnirNumDerecha(n);
end;


procedure Natural.MovDigMenFrcIni();
var a, b, fa, fb, i : byte;
    n, c, p : cardinal;
begin
  n := valor; p := 1; c := 0;
  i := 1;
  while ((n > 9)) do begin
    b := n mod 10;
    n := n div 10;
    a := n mod 10;
    fa := GetFrc(a);
    fb := GetFrc(b);
    if (( fa > fb ) or
       ((fa = fb) and  (a < b))) then begin
      c := a * p + c;
      n := (n div 10) * 10 + b;
    end else begin
      c := b * p + c;
    end;
    p := p *10;
    inc(i);
  end;
  valor := n;
  UnirNumDerecha(c);
end;

//valor=1652043  =>  valor=5310246
//valor=220001111 => valor=211000112
procedure Natural.OrdIzdToDerAsc;
var sw : Boolean;
    pos, d, c : byte;
    m : Natural;
begin
  sw := false;
  m := Natural.crear(0);
  c := 0;
  while valor >= 1 do
  begin
    pos := self.GetPosDigMenor();
    d := self.GetDigito(pos);
    self.ElimPosDigito(pos);     //
    if d = 0 then
    begin
      c := c + 1;
    end
    else
    begin
      if c > 0 then
      begin
        m.valor :=  d * self.pot(10,c);  //m.setValor(d * self.potencia(10,c))
        c := 0;
      end
      else
      begin
        if sw then
          m.UnirNumDerecha(d)
        else
          m.UnirNumIzquierda(d);
      end;
      sw := not(sw);
    end;
  end;
  valor := m.valor
end;

//pot(2,4) <=> 2^4 => 16
class function Natural.pot(b, e: Cardinal): Cardinal;
begin
  pot := trunc(power(b, e));
end;


function Natural.toBase(b: cardinal): String;
const VECTOR: Array[0..15] of string =
('0','1','2','3','4','5','6','7','8','9','A','B', 'C','D','E', 'F');
var n, d : cardinal;
    r : String;
begin
  n := valor;  //copia
  while n > 0 do
  begin
    d := n mod b;
    n := n div b;
    R := VECTOR[d] + r;
  end;
  result := r
end;



procedure Natural.ToCardinal(n: extended; var cantDigFrac: byte);
begin
  cantDigFrac := 0;
  while (Natural.VerifPartFracc(n)) do
  begin
    n := n * 10;
    cantDigFrac := cantDigFrac + 1;
  end;
  valor := trunc(n)
end;
class function Natural.ToCentenas(n: word): String;
const  CEN: array[0..9] of string = ('','cien','doscientos','trescientos','cuatrocientos','quinientos', 'seiscientos', 'setecientos', 'ochocientos', 'novecientos');
var r : String;
begin
  r := ' ';
  if n<100 then
    r := ''
  else if (n<200) then 
    r := 'to';
  Result := (CEN[n div 100] + r + Natural.ToDecenas(n mod 100));
end;

class function Natural.ToDecenas(n : byte): String;
const 
  DEC: array[1..2, 0..9] of string = (
     ('','diez', 'veinte', 'treinta', 'cuarenta', 'cincuenta', 'sesenta', 'setenta', 'ochenta', 'noventa'),
     ('','once', 'doce', 'trece', 'catorce', 'quince', 'dieciseis', 'diecisiete', 'dieciocho', 'diecinueve') 
  );
var r : String;
begin       
  if(n>10)and(n<20)then //11..19 
    Result := (DEC[2, n mod 10])
  else begin        
    if (n mod 10 = 0)or(n <= 30) then r:='' else r:=' y ';
    Result := (DEC[1, n div 10] + r + Natural.ToUnidad(n mod 10));
  end;    
end;


function Natural.ToLiteral: String;
const UNIDADES:Array[0..19] of string =
('','uno','dos','tres','cuatro','cinco','seis','siete','ocho','nueve','diez',
'once','doce','trece','catorce','quince', 'dieciseis', 'diecisiete', 'dieciocho','diecinueve');
const DECENAS:Array[2..9] of string = ('veinte', 'treinta',
'cuarenta','cincuenta','sesenta','setenta','ochenta','noventa');
VAR  r : string;
     n : Cardinal;
begin
  n := valor;
  if (n < 20) then
    r := UNIDADES[n]            //2
  else if((n mod 10) = 0) then //decena completa
    r := DECENAS[n div 10]
  else if ((n div 10) = 2) then    //23= veintitres
    r := 'veinti'+ unidades[n mod 10]
  else //31..99                       //cuarenta y uno
    r := DECENAS[n div 10] + ' y ' + UNIDADES[n mod 10];
  result := r;
end;

class function Natural.ToLiteral(n: cardinal): String;
const VEC:Array[0..3] of string = ('', ' mil ',' millon ',' billon ');
var r, cad : string;
    p, d  : word;
begin
  r := '';
  p := 0;
  while n > 0 do  begin
    d := n mod 1000;
    n := n div 1000;
    r := Natural.ToCentenas(d) + VEC[p] + r;
    p := p + 1;   
  end;
  result := r;
end;

function Natural.ToRomano: String;
const ROM : Array[1..30] of string =(
  'I','II','III','IV','V','VI','VII','VII','IX','X',
  'XX','XXX','XL','L','LX','LXX','LXX','XC','C','CC',
  'CCC','CD','D','DC','DCC','DCCC','CM','M','MM','MMM'
);
var r : string;
    n : cardinal;
    c : byte;
begin
  n := self.valor ;
  r := '';
  c := 0;
  while (n > 0) do begin
    if ((n mod 10) <> 0) then
      r := ROM[n mod 10 + (c*10-c)] + r;
    inc(c);
    n := n div 10;
  end;
  result := r;
end;


//n = 41  mod 10 => 1
//n = 41  div 10 => 4
//987451  mil    unidad(987451 mod 100)
class function Natural.ToUnidad(n: byte): String;
const UNI:Array[0..9] of string = ('','uno','dos','tres','cuatro','cinco','seis','siete','ocho','nueve');
begin
  result := UNI[n];
end;

procedure Natural.UnirNumDerecha(e: Cardinal);
var aux : Natural;
begin
  if e > 0 then begin
    aux := Natural.crear(e);
    valor := valor * (pot(10, aux.GetCantDig)) + e;
  end;
end;

procedure Natural.UnirNumIzquierda(e: Cardinal);
var aux : Natural;
begin
  aux := Natural.crear(e);
  valor := e * (pot(10, GetCantDig)) + valor;
end;

function Natural.VerficarPrimo: boolean;
var i : cardinal;
    sw : Boolean;
begin
  i := valor div 2;
  while (i > 1) and (valor mod i <> 0) do
    dec(i);
  if i > 1 then sw := false else sw := true;
  VerficarPrimo := sw;
end;

function Natural.VerifCapicua: boolean;
var aux : Natural;
begin
  if valor = 0 then
  begin
   result:= false;
  end else begin
    aux := Natural.crear(self.valor);
    aux.Invertir;
    VerifCapicua := (valor = aux.valor);
  end;

end;

class function Natural.VerifPartFracc(x: extended): boolean;
var n : extended;
begin
  n := x - trunc(x);
  result := ((n > 0.01));    //(not (x = trunc(x)));
end;

end.

