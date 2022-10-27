unit UCExplosion;

interface
uses   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList, UCHelicoptero ;

  type

 Explosion = class(Helicoptero)
    protected
       timeIni, duration : integer;
    public
    constructor crear(Helicoptero: TImageList; x, y, velocidad, timeini, duracion : integer); overload;
    procedure dibujar(t:TCanvas);  //override;
    procedure init(duration, timeEscena : integer);  //override;
 end;

implementation


{ Explosion }



constructor Explosion.crear(Helicoptero: TImageList; x, y, velocidad, timeIni, duracion: integer);
begin
  self.crear(Helicoptero, x, y, velocidad);
  self.timeIni := timeIni;
  self.duration := duracion;
end;

procedure Explosion.dibujar(t: TCanvas);
begin
  inherited ;
  if (visible) then
   begin
    if (GetTickCount - self.timeIni) <= self.duration then
    begin
       helicopteroTIL.Draw(t, v1.x+x, v1.y+y,TImageListCant); //0.1.2
       TImageListCant := (TImageListCant+1) mod helicopteroTIL.Count;
    end
    else
    begin
      visible := false;
    end;
    
   end;
end;


procedure Explosion.init(duration, timeEscena: integer);
begin
  visible := true;
  self.timeIni := GetTickCount;
  self.duration := duration;
//  self. := timeEscena;
end;

end.
