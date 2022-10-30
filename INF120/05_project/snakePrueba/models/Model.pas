unit Model;

interface
  uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,JPEG, ExtCtrls, pngimage,
  URecord;
  Type
    Modelo =  class abstract
//        var1: type, var2: type, ...
//        procedure method_1; abstract;
//        function method_2(); return-type;
    protected
      imageWidth, imageHeight, f, c : word;
      image : TJPegImage;
      image1, image2, image3 : TPNGImage;
      url : String;
      dir : Direction;
      Bmp1, Bmp2: TBitmap;
      newImage : TImage;
    public
      constructor Crear(); //virtual ;abstract;
      procedure Dibujar(t:TCanvas);  virtual ;//abstract;
      procedure SetFil(f :word);
      procedure SetCol(c :word);
      procedure SetFilCol(f, c : word);
      procedure SetNextPos(Nfil, Ncol : word);
      procedure Moverse(k : word);
      function GetFil():word;
      function GetCOl():word;

  end;
implementation

{ Modelo }

constructor Modelo.Crear;
begin

  self.url := 'images/snake.png';
  Self.SetFilCol(0,0);
//  Self.image := TJPegImage.Create;
//  Self.image.LoadFromFile(Self.url);
  Self.image1 := TPNGImage.Create();
  Self.image1.LoadFromFile(self.url);



  //aqui para abajo


//  newImage := TImage.Create();
  Bmp1 := TBitmap.Create;
//  Bmp1.Assign(image1);
  Bmp1.LoadFromFile('images/snake.bmp');
//  Bmp1.Canvas.Rectangle(547,2088,547+384,2088+384);
//    Bmp1.Canvas.;
//  Bmp1.Transparent := true;

  dir := Direction.derecha;
  Self.imageWidth := 350;
  Self.imageHeight := 350;  //Modelo.c

  Bmp2 := TBitmap.Create;
  Bmp2.Width := imageWidth;
  Bmp2.Height := imageHeight;
  Bmp2.Canvas.CopyRect(Rect(1, 1, imageWidth, imageHeight),
   Bmp1.Canvas, Rect(547,3246,547+384,3246+384));
  Bmp2.Transparent := true;
//  Bmp2.Canvas.Brush.Color := clYellow;
//  Self.image2 := TPNGImage.Create();
//  Self.image2.LoadFromFile(self.url);
//  image2.Canvas.CopyRect(Rect(0, 0, imageWidth, imageHeight), image1.Canvas, Rect(547,2088,547+384,2088+384));
//  image2.SetSize(imageWidth, imageHeight);

//  Self.image3 := TPNGImage.Create();
//  Self.image3.Assign(bmp2);
end;

//imageWidth = col
//imageHeight = fil
procedure Modelo.Dibujar(t: TCanvas);
begin
//    t.StretchDraw(RECT(v1.x+x, v1.y+y, 20, 20), enemigoTBit);
//    t.Draw(v1.x+x, v1.y+y, enemigoTBit);
//    t.Draw(c*imageWidth, f*imageHeight, Self.image1);
  t.StretchDraw(
  RECT(c*imageWidth, f*imageHeight, c*imageWidth +imageWidth, f*imageHeight+imageHeight),
   Self.Bmp2);
//  t.StretchDraw(RECT(50, 0, imageWidth, imageHeight), Self.image1);
end;

function Modelo.GetCOl: word;
begin
  Result := Self.c;
end;

function Modelo.GetFil: word;
begin
  Result := Self.f;
end;
//para el teclado
procedure Modelo.Moverse(k: word);
begin
  if k = 37 then  //izquierda
    Self.dir := Direction.izquierda
  else if k = 38 then  //superior
    Self.dir := Direction.superior
  else if k = 39 then  //derecha
    Self.dir := Direction.derecha
  else if k = 40 then  //inferior
    Self.dir := Direction.inferior;

  SetNextPos(4,4);
end;

procedure Modelo.SetCol(c: word);
begin
  Self.c := c;
end;

procedure Modelo.SetFil(f: word);
begin
  Self.f := f;
end;

procedure Modelo.SetFilCol(f, c: word);
begin
  Self.f := f;
  Self.c := c;
end;
//siguiente posicion para avanzar
procedure Modelo.SetNextPos(Nfil, Ncol : word);
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
