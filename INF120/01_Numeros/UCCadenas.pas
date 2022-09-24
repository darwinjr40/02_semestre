unit UCCadenas;

interface
 uses sysutils;
 Const MaxC = 1024;

 type
   Cadena = class
     private
       longitud:word;
       caracteres:array [1..Maxc] of char;

     public
//-------------------------------------------------------------
       function LongCadena(c:string):word;
       procedure AdicionarCaracter (c:char);
       procedure InsertarCaracter (p:byte;c:char);
       Procedure EliminarCaracter (p:byte);
   //    Procedure EliminarCaracter2 (c:char);
       procedure ModificarCaracter(p:byte;c:char);
       function ObtenerCaracter (p:word):char;
//--------------------------------------------------------------
       procedure ModificarString(s: string);
       function ToStr : string;
//--------------------------------------------------------------

//--------------------------------------------------------------
     {  function CantidadConsonantes:word;
       procedure InvertirCadena;
       procedure UpperCase; }
       Procedure LowerCase;
     {  Function CantidadPalabras:byte;
       Procedure PalabraN;
       procedure EliminarPalabra (p:byte);
       procedure EliminarPalabra2 (c:string); }

       procedure Mayus;
       procedure Minus;
   end;
implementation

{ Cadena }

function Cadena.LongCadena(c:string): word;
begin
   result:=longitud;
end;

procedure Cadena.AdicionarCaracter(c: char);
begin
   longitud:= longitud+1;
   caracteres[longitud]:= c;
end;

procedure Cadena.InsertarCaracter(p: byte; c: char);
var
  i: Word;
begin
 if(p>0) and (p<=longitud) then
 begin
   longitud:=longitud+1;
    for i := longitud downto p+1 do
         caracteres[i]:=caracteres[i-1];
    caracteres[p]:=c;
 end else raise Exception.Create('Posici�n fuera de rango');
end;

procedure Cadena.EliminarCaracter(p: byte);
var i:byte;
begin
 if (p>0) and (p<=Longitud) then
    begin
    for i := p to longitud-1 do
         caracteres[i]:=caracteres[i+1];
     longitud:=longitud-1;
 end else raise Exception.Create('Posici�n fuera de rango');

end;

procedure Cadena.ModificarCaracter(p: byte; c: char);
begin
if (p>0) and (p<=longitud) then  begin
caracteres[p]:=c;
end else raise Exception.Create('Posici�n fuera de Rango')
end;


function Cadena.ObtenerCaracter(p: word): char;
begin
if (p>0) and (p<=longitud) then
  result:= caracteres[p];
  raise Exception.Create('Posici�n fuera de rango');
end;

 //----------------------------------------------
procedure Cadena.ModificarString(s: string);
var
  I: Integer;
begin
   longitud := length(s);
   for I := 1 to longitud do
       caracteres[i]:= s [i];
end;

function Cadena.ToStr: string;
var s:string;   i:word;
begin
s:='';
for I := 1 to longitud do
     s:=s+caracteres[i];
  result:=s;

end;

//-----------------------------------------------













procedure Cadena.Mayus;
var aux:string;
begin
//aux:=cad;

end;



procedure Cadena.Minus;
var i:word;
begin
  for I := 1 to longitud do
   begin
     if True then

   end;
end;







procedure cadena.LowerCase;    //a minusculas
var
    i:word;
begin
    for I := 1 to longitud do
    begin
     if caracteres[i] in ['A'..'Z'] then
       begin
         caracteres[i]:= chr(ord(caracteres[i])+32)       //(chr(ord(caracteres[i]))+32);
       end;
       //if caracteres[i] = '�' then caracteres[i]:= '�';
       case caracteres[i] of
         '�':caracteres[i]:='�';
         '�':caracteres[i]:='�';
         '�':caracteres[i]:='�';
         '�':caracteres[i]:='�';
         '�':caracteres[i]:='�';
         '�':caracteres[i]:='�';
         end;
    end;
end;
end.
