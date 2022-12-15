unit UCMatriz;

interface
uses SysUtils, Vcl.Grids, Vcl.Dialogs;
Const
  MaxF = 128;
  MaxC = 128;
Type
    Matriz = class
      private
        NFilas, NColumnas : word;
        celdas : Array[1..MaxF, 1..MaxC] of Real;
        //128*128 = 16,384
      public
        procedure cargar(f, c : word); overload;
        procedure cargar(f, c, a, b:word); overload;
        procedure Descargar(t : tStringGrid);
        procedure SetFilas(f : word);
        procedure SetColumnas(c : word);
        Function GetFilas : word;
        Function GetColumnas : word;
        Function ObtValor(f,c : word) : Real;
        Procedure ModValor(f,c : word; v:real);
        Procedure AddFila;
        Procedure AddColumna;
        Procedure ElimFila(f:word);
        Procedure ElimColumna(c:word);
        Procedure InsFila(f:word);
        Procedure InsColumna(c:word);
        procedure cargarPrueba();
        {cargado caracol}
        procedure cargarFilDerecha(f, a, b:word; var e : word);
        procedure cargarFilIzq(f, a, b:word; var e : word);
        procedure cargarColAbajo(c, a, b:word; var e : word);
        procedure cargarColArriba(c, a, b:word; var e : word);
        procedure cargarCaracol();
        {cargado }
        procedure triangular();
        procedure cargarTriPrincipal();
        procedure cargarTriSecundaria();
        procedure cargarTriInfIzqui;
        procedure cargarTriInfIzqui1;
        procedure cargarTriInfIzquiEspecial;
        {examen}
        function buscIzqui(i, j:byte; e : Cardinal): boolean;
        function buscIzquiSup(i, j:byte; e : Cardinal): boolean;
        function buscSup(i, j:byte; e : Cardinal): boolean;
        function buscDerSup(i, j:byte; e : Cardinal): boolean;
        function buscDer(i, j:byte; e : Cardinal): boolean;
        function buscDerInf(i, j:byte; e : Cardinal): boolean;        
        function buscInf(i, j:byte; e : Cardinal): boolean;        
        function buscIzquiInf(i, j:byte; e : Cardinal): boolean;        
        function existe(e : cardinal): boolean;
    end;

implementation

{ Matriz }

procedure Matriz.AddColumna;
begin
  inc(NColumnas);
end;

procedure Matriz.AddFila;
begin
  inc(NFilas);
end;

function Matriz.buscDer(i, j: byte; e: Cardinal): boolean;
begin
  while ((j <= NColumnas)and (e > 0) and((e mod 10) = Self.celdas[i,j])) do
  //{se cabaron las celdas}||(ya no hay digitos)||{un elemento no coincide}
  begin
    e := e div 10;
    j := j + 1;
  end;
  result := (e = 0);
end;

function Matriz.buscDerInf(i, j: byte; e: Cardinal): boolean;
begin
  while ((j <= NColumnas)and (i <= NFilas)and (e > 0) and((e mod 10) = Self.celdas[i,j])) do
  //{se cabaron las celdas}||(ya no hay digitos)||{un elemento no coincide}
  begin
    e := e div 10;
    j := j + 1;
    i := i + 1;
  end;
  result := (e = 0);
end;

function Matriz.buscDerSup(i, j: byte; e: Cardinal): boolean;
begin
  while ((j <= NColumnas)and (i >= 1)and (e > 0) and((e mod 10) = Self.celdas[i,j])) do
  //{se cabaron las celdas}||(ya no hay digitos)||{un elemento no coincide}
  begin    
    e := e div 10;
    j := j + 1;
    i := i - 1;
  end;
  result := (e = 0);
end;

function Matriz.buscInf(i, j: byte; e: Cardinal): boolean;
begin
  while ((i <= NFilas)and (e > 0) and((e mod 10) = Self.celdas[i,j])) do
  //{se cabaron las celdas}||(ya no hay digitos)||{un elemento no coincide}
  begin
    e := e div 10;
    i := i + 1;
  end;
  result := (e = 0);
end;

function Matriz.buscIzqui(i, j : byte; e : Cardinal): boolean;
begin
  while ((j >= 1)and (e > 0) and((e mod 10) = Self.celdas[i,j])) do
  //{se cabaron las celdas}||(ya no hay digitos)||{un elemento no coincide}
  begin    
    e := e div 10; 
    j := j - 1;
  end;
  result := (e = 0);
end;



function Matriz.buscIzquiInf(i, j: byte; e: Cardinal): boolean;
begin
    while ((j >= 1)and (i <= NFilas)and (e > 0) and((e mod 10) = Self.celdas[i,j])) do
  //{se cabaron las celdas}||(ya no hay digitos)||{un elemento no coincide}
  begin    
    e := e div 10;
    j := j - 1;
    i := i + 1;
  end;
  result := (e = 0);
end;

function Matriz.buscIzquiSup(i, j: byte; e: Cardinal): boolean;
begin
    while ((j >= 1)and (i >= 1)and (e > 0) and((e mod 10) = Self.celdas[i,j])) do
  //{se cabaron las celdas}||(ya no hay digitos)||{un elemento no coincide}
  begin    
    e := e div 10;
    j := j - 1;
    i := i - 1;
  end;
  result := (e = 0);
end;

function Matriz.buscSup(i, j: byte; e: Cardinal): boolean;
begin
  while ( (i >= 1)and (e > 0) and((e mod 10) = Self.celdas[i,j])) do
  //{se cabaron las celdas}||(ya no hay digitos)||{un elemento no coincide}
  begin
    e := e div 10;
    i := i - 1;
  end;
  result := (e = 0);
end;

procedure Matriz.cargar(f, c : word);
var  i, j : word;
begin
  NFilas := f;
  NColumnas := c;
  for i := 1 to NFilas do
    for j := 1 to NColumnas do  begin
      celdas[i, j] := StrToFloat(inputbox('1','2','3')) ;
    end;
end;

procedure Matriz.cargarPrueba;
var  i, j, x : word;
begin
  x := 0;
  for i := 1 to NFilas do
    for j := 1 to NColumnas do  begin
      x := x + 10;
      celdas[i, j] := x;
    end;
end;

procedure Matriz.cargarTriInfIzqui;
var  i, j, k : word;
begin
  k := 0;
  for i := 1 to NFilas do
    for j := 1 to NColumnas do  begin
      if (i >= j) then begin  //Nfilas
        inc(k);
        celdas[i, j] := k;
      end;
    end;
end;

procedure Matriz.cargarTriInfIzqui1;
var  i, j, k : word;
begin
  k := 0;
  for i := 1 to NFilas do
    for j := 1 to i do  begin
      inc(k);
      celdas[i, j] := k;
    end;
end;

procedure Matriz.cargarTriInfIzquiEspecial;
var  i, j, k : word;
begin
  k := 0;
  for i := 1 to NFilas do
    for j := 1 to NColumnas do  begin
      if (i > j)and (i+j <= Nfilas) then begin  //Nfilas
        inc(k);
        celdas[i, j] := k;
      end;
    end;
end;

procedure Matriz.cargarTriPrincipal;
var i :word;
begin
  for I := 1 to NColumnas do begin
    celdas[i, i] := i;
  end;

end;

//matriz cuadrada
procedure Matriz.cargarTriSecundaria;
var  i, j, k : word;
begin
  k := 0;
  for i := NFilas downto 1 do
    for j := 1 to NColumnas do  begin
      if (i+j-1 = NColumnas) then begin  //Nfilas
        inc(k);
        celdas[i, j] := k;
      end;
    end;
end;

procedure Matriz.cargar(f, c, a, b : word);
var  i, j : word;
begin
  NFilas := f;
  NColumnas := c;
  for i := 1 to NFilas do
    for j := 1 to NColumnas do
      celdas[i, j] := a+Random(b-a+1);
end;

procedure Matriz.cargarCaracol;
var fa, ca, fb, cb, cantEleFil, canEleCol, ele :word;
begin
  fa := 1;
  ca := 1;
  fb := NFilas;
  cb := NColumnas;
  cantEleFil := fb - fa + 1;
  canEleCol := cb - ca + 1;
  ele := 1;
  while (cantEleFil > 1) and (canEleCol > 1 ) do  begin
    cargarFilDerecha(fa, ca ,cb-1, ele);
    cargarColArriba(cb, fa, fb-1, ele);
    cargarFilIzq(fb, ca+1, cb, ele);
    cargarColAbajo(ca, fa+1, fb, ele);
    inc(fa);
    inc(ca);
    dec(fb);
    dec(cb);
    cantEleFil := fb - fa + 1;
    canEleCol := cb - ca + 1;
  end;
  if (cantEleFil*canEleCol = 1) then
    celdas[fa,ca] := ele;
end;

procedure Matriz.cargarColAbajo(c, a, b: word; var e: word);
var f : word;
begin
  for f := b downto a do begin
    celdas[f, c] := e;
    inc(e);
  end;
end;

procedure Matriz.cargarColArriba(c, a, b: word; var e: word);
var f : word;
begin
  for f := a to b do begin
    celdas[f, c] := e;
    inc(e);
  end;
end;

procedure Matriz.cargarFilDerecha(f, a, b: word; var e: word);
var c : word;
begin
  for c := a to b do begin
    celdas[f, c] := e;
    inc(e);
  end;
end;

procedure Matriz.cargarFilIzq(f, a, b: word; var e: word);
var c : word;
begin
  for c := b downto a do begin
    celdas[f, c] := e;
    inc(e);
  end;
end;

procedure Matriz.Descargar(t: tStringGrid);
var i,j : word;
begin
   t.RowCount := NFilas;
   t.ColCount := NColumnas;
   for i := 1 to t.RowCount do  begin
    for j := 1 to t.ColCount do begin
        t.Cells[j-1, i-1] := FloatToStr(celdas[i, j]);
    end;
   end;
end;

procedure Matriz.ElimColumna(c: word);
var i,j : word;
begin
  for j := c to NColumnas-1 do
    for i := 1 to NFilas do
      celdas[i, j] := celdas[i, j+1];
  dec(NColumnas);
end;

procedure Matriz.ElimFila(f: word);
begin

end;

function Matriz.existe(e: cardinal): boolean;
var
  i: Integer;
  j: Integer;
  sw : boolean;  
begin
  sw := false;
  i := 1;  
  while (i<= Self.NFilas) and (not sw) do
  begin
    j := 1;
    while (j <= self.NColumnas) and (not sw) do
    begin
      if (self.celdas[i,j] = (e mod 10)) then 
      begin
        if (buscIzqui(i, j, e) or buscIzquiSup(i, j, e) 
        or buscSup(i, j, e) or buscDerSup(i, j, e) 
        or buscDer(i, j, e) or buscDerInf(i, j, e) 
        or buscInf(i, j, e) or buscIzquiInf(i, j, e)) then begin
          sw := true;
//          ShowMessage(inttostr(i) + '-' +inttostr(j));
        end;           
      end;
      j := j + 1;
    end;
    i := i + 1;
  end;
  result := sw;
end;

function Matriz.GetColumnas: word;
begin
  Result := NColumnas;
end;

function Matriz.GetFilas: word;
begin
  Result := NFilas;
end;

procedure Matriz.InsColumna(c: word);
var i,j : word;
begin
  inc(NColumnas);
  for j := NColumnas downto c+1 do
    for i := 1 to NFilas do
      celdas[i, j] := celdas[i, j-1];
end;

procedure Matriz.InsFila(f: word);
var i,j : word;
begin
  inc(NFilas);
  for I := NFilas downto f+1 do
    for j := 1 to NColumnas do
      celdas[i, j] := celdas[i-1, j];
end;

procedure Matriz.ModValor(f, c: word; v: real);
begin
  if (f>0)and(f<=NFilas)and(c>0)and(c<=NColumnas) then
  celdas[f,c] := v
  else raise Exception.Create('Error Message');
end;

function Matriz.ObtValor(f, c: word): Real;
begin
  if (f>0)and(f<=NFilas)and(c>0)and(c<=NColumnas) then
    Result := celdas[f,c]
  else raise Exception.Create('Error Message');
end;

procedure Matriz.SetColumnas(c: word);
begin
  NColumnas := c;
end;

procedure Matriz.SetFilas(f: word);
begin
   NFilas := f;
end;
//matriz cuadrada
procedure Matriz.triangular;
var k, f, c : word;
begin
  k := 0;
  f := 1;
  c := 1;
  for k := 1 to (NFilas*NColumnas) do begin
    celdas[f, c] := k;
    if c = NColumnas then begin
      c := f+1;
      f := NFilas;
    end else if f = 1 then begin
      f := c + 1;
      c := 1;
    end else begin
      dec(f);
      inc(c);
    end;
  end;
end;

end.
