unit UCNumero;

interface
  uses math,sysutils ;
  Type
    Numero = Class
      private
        Valor: Cardinal;

      public
        {Constructor}
        constructor crear(x: Cardinal); overload;
        constructor crear();     overload;

        {Procedimientos}
        procedure setValor(x: Cardinal);
        procedure InserDigito (p,d:byte);
        procedure ElimDigito (p:byte);
        procedure Uunir2Num(x:Cardinal);
        procedure removeDigito(x:byte);
        procedure ordDesc();
        procedure invertir();

        {funciones}
        Function getValor(): Cardinal;
        function NumDigitos :byte;     //cantidad de digitos

        function unidad(val:Cardinal):string;
        function dec(val: Cardinal): string;
        function decena(val: Cardinal): string;
        function centena(val: Cardinal): string;
        function literal(): string;

        function existeNum(x:Cardinal):Boolean;
        function digMay():byte;
        function verifPrimo():boolean;
        function sacarPrimo():Integer;
        function sacarNoPrimo():Integer;
        function convertiToBaseN(b : byte) : String;
        function convertiToBase(b : byte) : Cardinal;

        function ToDecenas(n : Cardinal) : String;
        function ToCentenas(n : Cardinal) : String;
        function ToLiteral() : String;

        {examen 1-2021}
        procedure intercalarPrimoYnoPrimo();
        function tieneCero():boolean;
    End;
implementation

{ Numero }

function Numero.centena(val: Cardinal): string;
var cen:string;
    dece: Cardinal;
    obj:Numero;
begin
 cen:='';//100   1   01   5   85
 obj:= Numero.crear(val mod 100);
 case(val div 100 )of
  1:cen:='CIEN';
  2:cen:='DOSCIENTOS';
  3:cen:='TRESCIENTOS';
  4:cen:='CUATROCIENTOS';
  5:cen:='QUINIENTOS';
  6:cen:='SEISCIENTOS';
  7:cen:='SETECIENTOS';
  8:cen:='OCHOCIENTOS';
  9:cen:='NOVECIENTOS';
 end;
 if (val mod 100 <> 0) then begin
  if (val div 100 = 1) then
    cen := 'CIENTO ' + obj.literal
  else
    cen := cen +' '+ obj.literal
 end;

 Result:= cen;
end;
                                //16
function Numero.convertiToBase(b: byte): Cardinal;
var n,a : cardinal;
    d : byte;
    resultado : Cardinal;
begin
  if (b > 0) and (b < 10) then begin
     n := valor;
     resultado := 0;
     a := 1;
     while ( n > 0) do  begin
        d := n mod b;
        n := n div b;
        resultado := d * a + resultado;
      //resultado = d * 10^resultado.cantDig + resultado
        a := a * 10;
    end;
     Result := resultado;
  end;
end;

function Numero.convertiToBaseN(b: byte): String;
var n : cardinal;
    d : byte;
    c : char;
    resultado : String;
begin  //valor = 123   procesoInvertir == valor = 321
       //valor = 123   FunctionconvertiToBaseN == valor = 123
  if (b > 0) and (b < 10) or (b = 16) then begin
     n := valor;
     resultado := '';
     while ( n > 0) do  begin
        d := n mod b;
        n := n div b;
        if (d > 9) then begin
          case (d) of
            10 : resultado := 'A' + resultado;
            11 : resultado := 'B' + resultado;
            12 : resultado := 'C' + resultado;
            13 : resultado := 'D' + resultado;
            14 : resultado := 'E' + resultado;
            15 : resultado := 'F' + resultado;
          end;
        end else begin
          resultado := IntToStr(d) + resultado;
        end;
     end;
     Result := resultado;
  end;
end;

constructor Numero.crear();
begin
  valor := 0;
end;
//------------------------------------------------------------------

constructor Numero.crear(x: Cardinal);
begin
   valor := x;
end;

//------------------------------------------------------------------
{Elimina una posicion del numero
 ej valor = 456  p=2 --> valor 46}
procedure Numero.ElimDigito(p: byte);
var k,N1,N2 : cardinal;
begin
if (p>0) and (p<= NumDigitos) then
 begin
  k:= trunc(power(10,p-1));
  n1:= valor div k;
  n2:= valor mod k;
  n1:= n1 div 10;
  valor:= n1 * k + n2;
 end
 else raise Exception.Create('Posicion fuera de rango');

end;


//------------------------------------------------------------------
function Numero.getValor: Cardinal;
begin
  result := valor;
end;

//------------------------------------------------------------------
procedure Numero.InserDigito(p, d: byte);
var n1,n2,k:cardinal;
begin
   if (p>0) and (p <= NumDigitos) then
     begin
       k:=trunc(power(10,p-1));
       n1:= (valor div k)*10 + d;
       n2:= valor mod k;
       valor:=n1 *k + n2;
     end
     else
     raise Exception.Create('Posicion fuera de rango');

end;
procedure Numero.intercalarPrimoYnoPrimo;
var sw : Boolean;
     x : Integer;
     n : Cardinal;
begin
  invertir();
  sw := true;
  n := 0;
  while (valor > 0) do begin
    if sw then begin
      x := sacarPrimo();
    end else begin
      x := sacarNoPrimo();
    end;

    if x >= 0  then begin
       n := n * 10 + x;
    end;
    sw := not(sw);
  end;
  valor := n;
end;

procedure Numero.invertir;
var n:Cardinal;
begin
  n := 0;
  while Valor > 0 do begin
    n := n *10 +(valor mod 10);
    Valor := valor div 10;
  end;
  valor := n;
end;

//------------------------------------------------------------------
//cantidad de digitos
function Numero.NumDigitos: byte;
var res: byte;
begin
  if valor = 0 then begin
    res := 0;
  end else begin
    res := trunc(log10(valor))+1;
  end;
  result:= res;
end;
//------------------------------------------------------------------
//ordear el numero descendentemente
procedure Numero.ordDesc;
var n:cardinal;
    d:byte;
begin
  n := 0;
  while valor > 0 do begin
    d := digMay;
    n := n * 10 + d;
    removeDigito(d); //procedure
  end;
  valor := n;
end;

//------------------------------------------------------------------
{eliminar un digito x
 ej valor = 785;x = 8 ---> valor=75 }
procedure Numero.removeDigito(x: byte);
var d:byte;
    n,pot:Cardinal;
    sw:boolean;
begin
    n := 0;
    sw := true;
    pot := 1;
    while (valor > 0) and (sw) do begin
      d := valor mod 10;

      if d = x  then  begin
        sw := false;
      end else begin
        n := d * pot + n;
        pot := pot * 10;
      end;
      valor := valor div 10;
    end;
    Uunir2Num(n);
end;

//------------------------------------------------------------------
{si un numero se encuentra en otro}
function Numero.existeNum(x: Cardinal): Boolean;
var  cd: byte;
    val, d, n: Cardinal;
    cantD: Numero;  //objeto
    sw:boolean;
begin
  val := valor;
  cantD := Numero.crear(x);
  cd := cantD.NumDigitos;
  n:=0;
  sw := false;
  while val > 0 do begin
     d := val MOD trunc(power(10, cd));//39;
     if d = x then begin
      val := 0;
      sw := true;
     end else begin
      n := n * 10 + d;
      val := val div 10;
     end;
  end;
  result := sw;
end;

//------------------------------------------------------------------
function Numero.sacarNoPrimo: Integer;
var n, p : Cardinal;
      res:Integer;
      obj:Numero;
begin
  p := 1;
  n := 0;
  res:=-1;
  obj := Numero.crear(valor mod 10);
  while (valor > 0)and (obj.verifPrimo) do begin
    n := (valor mod 10) * p + n;
    p := p * 10;
    valor:= valor div 10;
    obj.setValor(valor mod 10);
  end;
  if valor > 0 then begin // encontraste al no primo
    res:= valor mod 10;
    valor := valor div 10;
  end;
  Uunir2Num(n);
  result := res;
end;

function Numero.sacarPrimo: Integer;
var n, p : Cardinal;
      res:Integer;
      obj:Numero;
begin
  p := 1;
  n := 0;
  res:=-1;
  obj := Numero.crear(valor mod 10);
  while (valor > 0)and not(obj.verifPrimo) do begin
    n := (valor mod 10) * p + n;
    p := p * 10;
    valor:= valor div 10;
    obj.setValor(valor mod 10);
  end;
  if valor > 0 then begin // encontraste al  primo
    res:= valor mod 10;
    valor := valor div 10;
  end;
  Uunir2Num(n);
  result := res;
end;

procedure Numero.setValor(x: Cardinal);
begin
  valor := x;
end;
function Numero.tieneCero: boolean;
var n : cardinal;
begin
    n := valor;
    while (n > 0) and ((n mod 10)<>0) do//10
    begin
      n := n div 10;
    end;
    result := n > 0;
end;

function Numero.ToCentenas(n: Cardinal): String;
Const
      Centenas: array [0..9] of string =('','ciento','doscientos','trescientos','cuatrocientos',
        'quinientos','seiscientos','setecientos','ochocientos','novecientos');
VAR  r : string;
begin  //100
  if (n = 100) then      //000 mod 100 = 0
     r := 'cien' //100 mod 100 = 0
  else
     r := Centenas[n div 100] + ' ' + ToDecenas(n mod 100);

  Result := r;
end;

function Numero.ToDecenas(n: Cardinal): String;
const UNIDADES:Array[0..19] of string = ('','uno','dos','tres','cuatro','cinco','seis','siete','ocho','nueve','diez',
'once','doce','trece','catorce','quince', 'dieciseis', 'diecisiete', 'dieciocho','diecinueve');
const DECENAS:Array[2..9] of string = ('veinte','treinta',
'cuarenta','cincuenta','sesenta','setenta','ochenta','noventa');
VAR  r : string;
begin
  if (n < 20) then
     r := UNIDADES[n]            //16
  else if((n mod 10) = 0) then //decena completa
        r := DECENAS[n div 10]
  else if ((n div 10) = 2) then    //21= veintiuno  veintidos
        r := 'veinti'+ unidades[n mod 10]
  else      //31..99
        r := DECENAS[n div 10] + ' y ' + UNIDADES[n mod 10];
  result := r;
end;

function Numero.ToLiteral: String;
const
UMIL : array [1..4] of string = ('mil','millones','billones','trillones');
VAR  r : string;
begin
  if (valor = 0) then  //123 999
    r := '0'             //1000
  else if (valor < 1000 ) then  //unidades de centenas
    r := ToCentenas(valor)
  else if (valor = 1000) then
    r := UMIL[1]
  else if (valor < 1000000) then //unidades de mil  (123 999)
    //r := ToCentenas(valor div 1000) + ' '+UMIL[1] + ' ' + ToCentenas(valor mod 1000);
      r := ToCentenas(valor div 1000) + ' mil ' + ToCentenas(valor mod 1000)
  else if (valor = 1000000) then
    r := 'millon';
  result := r;
end;

//------------------------------------------------------------------

function Numero.unidad(val: Cardinal): string;
var uni:string;
begin
 uni:='';
 case (val )of
   0: uni:='CERO';
   1: uni:='UNO';
   2: uni:='DOS';
   3: uni:='TRES';
   4: uni:='CUATRO';
   5: uni:='CINCO';
   6: uni:='SEIS';
   7: uni:='SIETE';
   8: uni:='OCHO';
   9: uni:='NUEVE';
 end;
  result:= uni;
end;
//------------------------------------------------------------------
{unir 2 numeros}
procedure Numero.Uunir2Num(x: Cardinal);
var objeto:Numero;
begin  //123     46
        //123 *100 + 46 ===> 12346
  objeto := Numero.crear(x);
  valor := valor * trunc(power(10,objeto.NumDigitos)) + objeto.Valor;
end;

function Numero.verifPrimo: boolean;
var i: Cardinal;
    sw : Boolean;
begin
  if valor = 1 then begin
    Result := false;
  end else begin
     i := Valor div 2;
     sw := true;
    while ( i > 1)and sw do begin
      if (valor mod i) = 0 then
        sw := false;
      i:= i - 1;
    end;
    result := sw;
  end;
end;

//------------------------------------------------------------------
function Numero.dec(val: Cardinal): string;
var helps:string;
begin
 helps:='';
   case(val ) of
    10:helps:='DIEZ ';
    11:helps:='ONCE ';
    12:helps:='DOCE ';
    13:helps:='TRECE ';
    14:helps:='CATORCE ';
    15:helps:='QUINCE ';
    16:helps:='DIECISEIS ';
    17:helps:='DIECISIETE ';
    18:helps:='DIECIOCHO ';
    19:helps:='DIECINUEVE ';
   end;
      result:=helps;
end;
//-------------------------------------------------------------------
function Numero.decena(val: Cardinal): string;
var dece:string;
    d, m : byte;
begin
 dece:='';//20
 m := val mod 10; // 0
 d := val div 10; //3

    case( d )of
      2:dece:='VEINTE';
      3:dece:='TREINTA';
      4:dece:='CUARENTA';
      5:dece:='CINCUENTA';
      6:dece:='SESENTA';
      7:dece:='SETENTA';
      8:dece:='OCHENTA';
      9:dece:='NOVENTA';
    end;

  if (m <> 0) then begin
     if (d = 2) then  //21...29
        dece := 'VEINTI'+ unidad(m)
     else   //31...99
        dece := dece + ' Y '+ unidad(m);
  end;
  result := dece;
end;
//-------------------------------------------------------------------

function Numero.digMay: byte;
var n:Cardinal;
    d, may:byte;
begin
  n := valor;
  may := 0;
  while n > 0 do begin
    d := n mod 10;
    n := n div 10;
    if d > may then
      may := d;
  end;
  result := may;
end;

//--------------------------------------------------------------
function Numero.literal(): string;
var cad:string;
begin
 cad:=''; //20
 case(Valor)of
  0..9:  cad := unidad(valor);
  10..19: cad := dec(valor);
  20..99: cad := decena(valor);
  100..999: cad := centena(valor)
  else
    cad:= 'fuera de rango';
 end;
  result:= cad;
end;
//------------------------------------------------------------------

end.
