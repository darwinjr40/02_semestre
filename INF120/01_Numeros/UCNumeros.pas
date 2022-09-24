unit UCNumeros;


interface
uses math,sysutils ;
const
decenamil :array [2..9] of string = ('veinti�n','treinta y un','cuarenta y un',
 'cincuenta y un','sesenta y un',' setenta y un','ochenta y un','noventa y un');
 Maxc = 1024;
 primo = [2,3,5,7];
 type
   Numero = class
     private
     valor: cardinal;
     Longitud : word;
     caracteres:array [1..Maxc] of char;
     public
     function ObtValor:cardinal;
     procedure CambValor (v:cardinal);
     function DigitoN (p:byte):byte;  //digito en posici�n N
     function CantDigitos :byte;     //cantidad de digitos
     procedure InserDigito (p,d:byte);

     procedure ElimDigito (p:byte);
     procedure ElimNumero (p:byte);
     procedure DeleteDig (d:byte);
     procedure DeleteNum (num:word);

     function ConvABinario:string;
     function ConvAOctal:string;
     function ConvertirAHexadecimal:string;
     function ConvertirABaseN(baseN:byte):string;
     function ConvertirARomanos :String;
     function Literal2D (n:byte): String;
     function Literal3D (n:word): String;
     function Literal6D (n:cardinal):string;

     Function ConvertirALiteral(n:cardinal):string;  // Mejorado version 2022

     procedure invertir;
     //procedure Ordenar;
      Function BinarioMayor :word;
      Function NextNum (var i : word):string;
      Function ADecimal (cad:String):word;
//----------------------------------------------------------------------
     Function LongValor :word;
     procedure ModificarValor(v:string);
     function ToStr: string;
//---------------------------------------------------------------------
     Function EsPrimo(n:byte):boolean;
    // Procedure Ordenar;
     Function ordenarP:Cardinal;
     //function SacarDig(n:cardinal):byte;
     function sacarPrimo: Integer;
     function sacarNoPrimo: Integer;
     function verifPrimo: boolean;
     procedure Uunir2Num(x: Cardinal);
     procedure intercalarPrimoYnoPrimo;

     function Realaentero(x:real):integer;

     procedure setValor(x: Cardinal);
     constructor crearX(x: Cardinal);
   end;

implementation

{ Numero }

function Numero.ObtValor: cardinal;
begin
   result:=valor;
end;

procedure Numero.CambValor(v: cardinal);
begin
    valor:=v;
end;

function Numero.DigitoN(p: byte): byte;
begin
   Result:= (valor div trunc(power(10,p-1)))mod 10;
end;

function Numero.CantDigitos: byte;
begin
 result:= trunc(log10(valor))+1;
end;


procedure Numero.InserDigito(p, d: byte);
var n1,n2,k:cardinal;
begin
   if (p>0) and (p<=CantDigitos) then
     begin
       k:=trunc(power(10,p-1));
       n1:= (valor div k)*10 + d;
       n2:= valor mod k;
       valor:=n1 *k + n2;
     end
     else
     raise Exception.Create('Posici�n fuera de rango');

end;

procedure Numero.ElimDigito(p: byte);
var k,N1,N2 : cardinal;
begin
if (p>0) and (p<= CantDigitos) then
 begin
  k:= trunc(power(10,p-1));
  n1:= valor div k;
  n2:= valor mod k;
  n1:= n1 div 10;
  valor:= n1 * k + n2;
 end
 else raise Exception.Create('Posici�n fuera de rango');

end;

procedure Numero.ElimNumero(p: byte);
begin
  if (p>0) and (p<= CantDigitos) then
  begin

  end
  else raise Exception.Create('Posici�n fuera de rango');
end;

procedure Numero.DeleteDig(d: byte);
var aux,dig:cardinal; ban:integer;   p:byte;
begin
 aux:=valor;
 ban:=-1;
 p:=0;
 while (ban<0) and (aux>0) do
 begin
    dig:= aux mod 10;
    inc(p);
       if dig = d then begin
        //inc(ban);
        ElimDigito(p);          //si esta en el ciclo elimina n veces el dig
        dec(p);
       end;

    aux:=aux div 10;
  end;

  //if ban = 0 then  ElimDigito(p);        elimina 1 dig

end;

procedure Numero.DeleteNum(num: word);
begin

end;

function Numero.ConvABinario: string;
var n:string;
    d:byte;   aux:cardinal;
begin
n:='';
aux:=valor;
  while aux>0 do
    begin
      d:= aux mod 2;
      n:=IntToStr(d)+n;
      aux:= aux div 2;
    end;
  result:=n;
end;

function Numero.ConvAOctal: string;
var new:string;
     d:byte;  aux:cardinal;
begin
new:='';
aux:=valor;
  while aux>0 do
   begin
     d:=aux mod 8;
     new:=IntToStr(d)+new;
     aux:=aux div 8;
   end;
result:=new;
end;


function Numero.ConvertirAHexadecimal: string;
var new,p:string;
     d:byte;
     aux:cardinal;
begin
new:='';
aux:=valor;
  while aux>0 do
   begin
     d:=aux mod 16;
     case d of
       11:p:='A' ;
       12:p:='B';
       13:p:='C';
       14:p:='D';
       15:p:='E';
       16:p:='F';
     else p:= IntToStr(d);
     end;
     new:=p+new;
     aux:=aux div 16;
   end;
result:=new;

end;



function Numero.ConvertirABaseN(BaseN: byte): string;
Const Dig = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
var d:byte;  n,p:string;
    aux:cardinal;
begin
  aux:=valor; n:='';
while aux>0 do
 begin
   d:= aux mod baseN;
   n:= Dig[d+1]+n;
   aux := aux div baseN
 end;
 result:=n;
end;

function Numero.ConvertirARomanos: String;
const   digRomano:array[1..4,0..9] of string =
(('','I','II','III','IV','V','VI','VII','VIII','IX'),
('','X','XX','XXX','XL','L','LX','LXX','LXXX','XC'),
('','C','CC','CCC','CD','D','DC','DCC','DCCC','CM'),
('','M','MM','MMM','iv','v','vi','vii','viii','ix'));
var    new:string; naux:cardinal; p,i:byte;
begin
 new:='';
  naux:= valor;
  i:=1;
  while naux>0 do
  begin
    p:=naux mod 10;
    new:=digRomano[i,p]+new;
    naux:= naux div 10;
    i:=i+1;
  end;
  result:=new;
end;

//literal ----------------------------------------------------------

function Numero.ConvertirALiteral(n: cardinal): string;
Const
unidad:array [0..19] of string =
('','uno','dos','tres','cuatro','cinco','seis','siete','ocho','nueve','diez',
'once','doce','trece','catorce','quince','dieciseis','diecisiete','dieciocho','diecinueve');
Decena:array [2..9] of string = ('veinte','treinta','cuarenta','cincuenta',
'Sesenta','setenta','ochenta','noventa');
Centena:array [1..9] of string = ('ciento','doscientos','trecientos','cuatrocientos',
'quinientos','seiscientos','setecientos','ochocientos','novecientos');
var r:string;
begin
r:='';
{if n=0 then
    r:='cero'
    else} if n < 20  then
      r:= unidad[n]
      else if (n mod 10 = 0 ) and (n<100) then
           r:= decena[n div 10]
           else if (n div 10 = 2) then
                r:='veinti'+ unidad[n mod 10]
                else if n<100 then
                     r:= decena[n div 10]+' y '+unidad[n mod 10]
                     else if ((n div 100 = 1) and (n mod 100 = 0)) then
                          r:='cien'
                          else if (n<1000) then
                               r:= centena[n div 100]+' '+ConvertirALiteral(n mod 100)
                               else if n < 2000 then
                                    r:='mil '+ConvertirALiteral(n mod 1000)
                                    else if n < 1000000 then
                                         r:=ConvertirALiteral(n div 1000)+ ' mil '+
                                         ConvertirALiteral( n mod 1000);






ConvertirALiteral:= r;
end;

function Numero.Literal2D(n: byte): String;
Const
unidades:array [0..15] of string =
('','uno','dos','tres','cuatro','cinco','seis','siete','ocho','nueve','diez',
'once','doce','trece','catorce','quince');
Veinte:array [1..2] of string = ('dieci','veinti');
decenas:array [2..9] of string = ('veinte','treinta',
'cuarenta','cincuenta','sesenta','setenta','ochenta','noventa');
begin
  if n<16 then   result:= unidades[n];
  if (n>=16) and (n<20) then result :=veinte[n div 10]+unidades[n mod 10];
  if (n>=21) and (n<30) then  result:= veinte[n div 10]+unidades[n mod 10];
  if (n>=30) then result := decenas[n div 10]+' y '+ unidades[n mod 10];
  if n in [20,30,40,50,50,70,80,90] then result:= decenas[n div 10];
end;

function Numero.Literal3D(n: word): String;
Const
Centena: array [0..9] of string =('','ciento','doscientos','trescientos','cuatrocientos',
        'quinientos','seiscientos','setecientos','ochocientos','novecientos');
        var x:string;
begin
         if n<100 then result:= Literal2D(n mod 100)
         else result:= centena[n div 100]+' '+Literal2D(n mod 100);
         if n=100 then result:='cien';

         {if ((n div 1000 mod 100 )  in [21,31,41,51,61,71,81,91]) and (t=2) then begin
         x:= decenamil[n div 1000 mod 100 div 10]+' mil '+ Literal3D(n mod 1000);
         result:=x;
         end;}
end;

function Numero.Literal6D(n: cardinal): string;
Const
UMil : array [1..4] of string = ('mil','millones','billones','trillones');
 decenamil :array [2..9] of string = ('veinti�n','treinta y un','cuarenta y un',
 'cincuenta y un','sesenta y un',' setenta y un','ochenta y un','noventa y un');
 var x:string;
begin
 if n<1000 then result := Literal3D(n mod 1000);
 if (n>=2000) and (n<1000000) then result:=  Literal3D(n div 1000 mod 1000)
                                             +' mil '+ Literal3D(n mod 1000);
 if (n >= 1000) and (n<2000) then result:='mil '+ Literal3D(n mod 1000);
 if (n div 1000 mod 100 ) in [21,31,41,51,61,71,81,91] then begin
         x:= decenamil[n div 1000 mod 100 div 10]+' mil '+ Literal3D(n mod 1000);
         result:=x;
 end;

 if (n>=100000) and (n<1000000) then
 result:= Literal3D(n div 1000 mod 1000)+' mil '+Literal3D(n mod 1000)

end;
//--------------------------------------------------------------------------

procedure Numero.invertir;
var n:cardinal;
begin
 n:=0;
 while valor > 0 do begin
   n:= n * 10 + valor mod 10 ;
   valor:=valor div 10;
 end;
  valor:=n;
end;


{procedure Numero.invertir;
var inv:cardinal;
    x:byte;
begin
  inv:=0;
  while valor>0 do
    begin
      x:= valor mod 10;
      inv:=inv*10+x;
      valor:=valor div 10;
    end;
  valor:=inv;
end;

procedure Numero.Ordenar;
begin

end;  }

//-------------------------------------------------------------
function Numero.LongValor: word;
begin
  result:= Longitud;
end;
procedure Numero.ModificarValor(v: string);
var
  I: Integer;
begin
   Longitud:=length(v);
   for I := 1 to longitud do
       caracteres[i]:= v[i];
end;

function Numero.ToStr: string;
var s:string;   i:word;
begin
s:='';
for I := 1 to longitud do
     s:=s+caracteres[i];
  result:=s;

end;



function Numero.BinarioMayor: word;
var mayor,siguiente:string; i:word;
begin
i:=1;
 mayor:=Nextnum(i);
 while i<=longitud do
   begin
     siguiente:=nextnum(i);
     if (ADecimal(siguiente)) > (ADecimal(mayor)) then
        mayor:=siguiente;
   end;
 result:=StrToInt(mayor);
end;

function Numero.NextNum(var i: word): string;
var num:string;
begin
num:='';
  while not (caracteres[i] in ['0'..'9']) do
      inc(i);
  while caracteres[i] in ['0'..'9'] do
        begin
          num:=num+caracteres[i];
          inc(i);
        end;
  result:=num
end;

function Numero.ADecimal(cad: String): word;
var i:word; num:cardinal;
begin
  for I :=  length(cad) downto 1  do
    num:=(StrToInt(caracteres[i]) * trunc(power(2,i-1)))+num;
result:=num;
end;
//-----------------------------------------------------------------
function Numero.EsPrimo(n: byte): boolean;
begin
   if (n in primo) then
    begin
    result:=true;
    end else result:=false;
end;

{procedure Numero.Ordenar;
begin

end; }

function Numero.ordenarP: Cardinal;
var aux,num,k,s:cardinal;  d:byte;   b:boolean;
begin
aux:=valor; //651231
num:=0;
k:=1;
b:=true;
 while aux>0 do begin
  //          d:=aux div trunc(power(10,));



   num:= d +valor * k;
   k:=k*10;
 end;

 if (d in primo) and b then begin
    num:= d +valor * k;
   k:=k*10;

 end;

end;



procedure Numero.setValor(x: Cardinal);
begin
  valor := x;
end;

constructor Numero.crearX(x: Cardinal);
begin
   valor := x;
end;

function Numero.sacarPrimo: Integer;
var n, p : Cardinal;
      res:Integer;
      obj:Numero;
begin
  p := 1;
  n := 0;
  res:=-1;
  //obj := Numero.crearX(valor mod 10);
  while (valor > 0){and not(obj.verifPrimo)} do begin
    n := (valor mod 10) * p + n;
    p := p * 10;
    valor:= valor div 10;
    //obj.setValor(valor mod 10);
  end;
  if valor > 0 then begin // encontraste al  primo
    res:= valor mod 10;
    valor := valor div 10;
  end;
  //Uunir2Num(n);
  result := res;
end;



function Numero.sacarNoPrimo: Integer;
var n, p : Cardinal;
      res:Integer;
      obj:Numero;
begin
  p := 1;
  n := 0;
  res:=-1;
  obj := Numero.crearX(valor mod 10);
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

procedure Numero.Uunir2Num(x: Cardinal);
var objeto:Numero;
begin  //123     46
        //123 *100 + 46 ===> 12346
  objeto := Numero.crearX(x);
  valor := valor * trunc(power(10,objeto.CantDigitos)) + objeto.Valor;
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


function Numero.Realaentero(x: real): integer;
var r:real;    y:integer;    c:string;
begin
y := trunc(x);
//r:= floattoInt(y);
c:='123';
r:=StrToInt(c);
result := trunc(x);
end;


end.
