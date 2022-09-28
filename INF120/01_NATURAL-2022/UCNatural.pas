unit UCNatural;

interface
uses math, sysutils;
  type
  Natural = class
    private
    { Private declarations }
       //0...(2^32)-1
       valor : Cardinal;
       aux : Natural;
       constructor crear(x : Cardinal; o : Natural);overload;
    public
    { Public declarations }     //ctrl + shift + c
    constructor crear; overload;
    constructor crear(x : cardinal); overload;
    constructor crear(x : Natural);overload;   
    {function}
    function    GetValor : cardinal;
    function    GetDigito(p : byte) : byte;
    function    VerficarPrimo : boolean;
    function    GetCantDig : byte;
    function    VerifCapicua : boolean;
    function    unidad(n : cardinal) : String;
    function    toBase(b : cardinal) : String;
    function    ToRomano() : String;
    function    GetFrc(e:cardinal): byte;
    class function pot(b,e: Cardinal):Cardinal; static;    
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
    procedure   ElimDigPrimoTieneVecinoDigPrimo;
    procedure   MovDigMayIni();
    procedure   MovDigMayFrcIni();
    procedure   MovDigMenFrcIni();
    procedure   SegFrcDesc();

    
  end;
implementation

{ Natural }

procedure Natural.SegFrcDesc;
var d : byte;
    n : cardinal;
begin
  n := 0;
  while valor > 0 do
  begin
    self.MovDigMenFrcIni;
//    d := self.GetDigito(self.GetCantDig);
//    self.ElimPosDigito(self.GetCantDig);
//    n := n * 10 + d;
  end;
  valor := n;
end;

procedure Natural.SetValor(x: cardinal);
begin
  valor := x;
end;

constructor Natural.crear;
begin
  valor := 0;
end;

constructor Natural.crear(x: cardinal);
var obj : Natural;
begin
  obj := Natural.crear();
  obj.aux := Natural.crear();
  crear(x, obj);
end;

constructor Natural.crear(x: Natural);
begin;
  crear(x.GetValor, Natural.crear);
end;

constructor Natural.crear(x: Cardinal; o: Natural);
begin
  valor := x;
  aux := o;
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
//22.Eliminar todos los dígitos primos que estén al lado de un dígito primo
//Ejemplo: 2472835 => 24783
procedure Natural.ElimDigPrimoTieneVecinoDigPrimo;
var b : Natural;
    n, p : Cardinal;
begin
  b := Natural.crear(0);  
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
begin
  self.aux.valor := e;
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
begin
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

procedure Natural.InserDigito(p, d: byte);
var a, b, k:cardinal;
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

procedure Natural.Invertir;
var copia : cardinal;
begin
 copia := 0;
 while valor > 0 do
 begin
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

procedure Natural.MovDigMenFrcIni;
var a, b, fa, fb : byte;
    n, c, p : cardinal;
begin
  n := valor; p := 1; c := 0;
  while (n > 9) do
  begin
    b := (n mod 10);
    n := n div 10;
    a := (n mod 10);
    fa := GetFrc(a);
    fb := GetFrc(b);
    if (( fa > fb ) or
       ((fa = fb) and  (a < b))) then begin
      c := (n mod 10) * p + c;
      n := (n div 10)*10+b;
    end else begin
      c := b * p + c;
    end;
    p := p *10;
  end;
  valor := n;
  UnirNumDerecha(c);
end;

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
function Natural.unidad(n: cardinal): String;
const UNIDADES:Array[0..19] of string = ('','uno','dos','tres','cuatro','cinco',
'seis','siete','ocho','nueve','diez',
'once','doce','trece','catorce','quince', 'dieciseis', 'diecisiete', 'dieciocho','diecinueve');
const DECENAS:Array[2..9] of string = ('veinte', 'treinta',
'cuarenta','cincuenta','sesenta','setenta','ochenta','noventa');
VAR  r : string;
begin
  if (n < 20) then
    r := UNIDADES[n]            //2
  else if((n mod 10) = 0) then //decena completa
    r := DECENAS[n div 10]
  else if ((n div 10) = 2) then    //23= veintitres
    r := 'veinti'+ unidades[n mod 10]
  else      //31..99                       //cuarenta y uno
    r := DECENAS[n div 10] + ' y ' + UNIDADES[n mod 10];
  result := r;
end;

procedure Natural.UnirNumDerecha(e: Cardinal);
begin
  if e > 0 then begin
    aux.valor := e;
    valor := valor * (pot(10, aux.GetCantDig)) + e;
  end;  
end;

procedure Natural.UnirNumIzquierda(e: Cardinal);
begin
  aux.valor := e;
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
begin
  aux.valor := valor;
  aux.Invertir;
  VerifCapicua := (valor = aux.valor);
end;

end.
