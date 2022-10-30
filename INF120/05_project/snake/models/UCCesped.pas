unit UCCesped;

interface
uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;
type
  Cesped = class
  private
    imageWidth, imageHeight, f, c : cardinal;
    url : String;
    bmp1, bmp2: TBitmap;
    public
    constructor Crear(width, height : integer);
    procedure Dibujar(t : Tcanvas);
    procedure SetFilCol(f, c : word);
  end;
implementation

{ Cesped }

constructor Cesped.Crear(width, height : integer);
begin
Self.imageWidth := width;
  Self.imageHeight := height;
  Self.f := 0;
  self.c := 0;
  Bmp1 := TBitmap.Create;
  Bmp1.LoadFromFile('images/snake.bmp');


  Bmp2 := TBitmap.Create;
  Bmp2.Width := imageWidth;
  Bmp2.Height := imageHeight;
  Bmp2.Canvas.CopyRect(Rect(1, 1, imageWidth, imageHeight),
   Bmp1.Canvas, Rect(547,3246,547+384,3246+384));
  Bmp2.Transparent := true;
end;

procedure Cesped.Dibujar(t: Tcanvas);
begin
  t.StretchDraw(
  RECT(c*imageWidth, f*imageHeight, c*imageWidth +imageWidth, f*imageHeight+imageHeight),
   Self.Bmp2);
end;

procedure Cesped.SetFilCol(f, c: word);
begin
  Self.f := f;
  Self.c := c;
end;

end.
