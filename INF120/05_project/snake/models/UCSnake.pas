unit UCSnake;

interface
   uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,JPEG, ExtCtrls, pngimage,
  URecord;

  type
   Snake = class
   protected
      imageWidth, imageHeight, f, c : word;
      image : TJPegImage;
      image1, image2, image3 : TPNGImage;
      url : String;
      dir : Direction;
      Bmp1, Bmp2: TBitmap;
      newImage : TImage;
    public
      const value = 2;
      constructor Crear(width, height : integer); //virtual ;abstract;
      procedure Dibujar(t:TCanvas);  virtual ;//abstract;
      procedure SetFil(f :word);
      procedure SetCol(c :word);
      procedure SetFilCol(f, c : word);
      procedure SetNextPos(Nfil, Ncol : word);
      procedure SetDirection(x : Direction);
      procedure Moverse(k : word);
      function GetFil():word;
      function GetCOl():word;
      function GetDirection(): Direction;
   end;
implementation

{ Snake }

constructor Snake.Crear(width, height : integer);
begin
  Bmp1 := TBitmap.Create;
  Bmp1.LoadFromFile('images/snake.bmp');

  dir := Direction.derecha;
  Self.imageWidth := width;
  Self.imageHeight := height;

  Bmp2 := TBitmap.Create;
  Bmp2.Width := imageWidth;
  Bmp2.Height := imageHeight;
  Bmp2.Canvas.CopyRect(Rect(1, 1, imageWidth, imageHeight),
   Bmp1.Canvas, Rect(547, 2088,547+384,2088+384));
  Bmp2.Transparent := true;
end;

procedure Snake.Dibujar(t: TCanvas);
begin
    t.StretchDraw(
  RECT(c*imageWidth, f*imageHeight, c*imageWidth +imageWidth, f*imageHeight+imageHeight),
   Self.Bmp2);
end;

function Snake.GetCOl: word;
begin
   Result := Self.c;
end;

function Snake.GetDirection: Direction;
begin
  Result := self.dir;
end;

function Snake.GetFil: word;
begin
   Result := Self.f;
end;

procedure Snake.Moverse(k: word);
begin
  if k = 37  then  //izquierda
    Self.dir := Direction.izquierda
  else if k = 38 then  //superior
    Self.dir := Direction.superior
  else if k = 39 then  //derecha
    Self.dir := Direction.derecha
  else if k = 40 then  //inferior
    Self.dir := Direction.inferior;

end;

procedure Snake.SetCol(c: word);
begin
  Self.c := c;
end;

procedure Snake.SetDirection(x: Direction);
begin
  Self.dir := x;
end;

procedure Snake.SetFil(f: word);
begin
  Self.f := f;
end;

procedure Snake.SetFilCol(f, c: word);
begin
  Self.f := f;
  Self.c := c;
end;

//siguiente posicion para avanzar
procedure Snake.SetNextPos(Nfil, Ncol: word);
begin
    if dir = Direction.inferior then
    Self.f := (f+1) mod NFil
  else if dir = Direction.izquierda then
    self.c := (c-1+NCol) mod NCol
  else if dir = Direction.superior then
    self.f := (f-1+NFil) mod NFil
  else if dir = Direction.derecha then
    self.c := (c+1) mod NCol;  //c+1 mod 4
end;

end.
