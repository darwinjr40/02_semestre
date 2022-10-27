unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,JPEG,Vcl.Imaging.pngimage, Vcl.ExtCtrls,Math,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons, Vcl.MPlayer;

type
  TPrincipal = class(TForm)
    Label1: TLabel;
    Helicopteros: TImageList;
    TimerH: TTimer;
    Label2: TLabel;
    Explosion: TImageList;
    TExplosion: TTimer;
    Label3: TLabel;
    Label4: TLabel;
    misil: TImageList;
    Tmisil: TTimer;
    Label5: TLabel;
    Panel1: TPanel;
    Image1: TImage;
    PlayBoton: TSpeedButton;
    PlayAgain: TSpeedButton;
    MHelicoptero: TMediaPlayer;
    MExplosion: TMediaPlayer;
    MMisil: TMediaPlayer;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure HelicopterAnimacion;
    procedure TimerHTimer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TExplosionTimer(Sender: TObject);
    procedure TmisilTimer(Sender: TObject);
    procedure PlayBotonClick(Sender: TObject);
    procedure PlayAgainClick(Sender: TObject);
    function impacto:boolean;
    procedure FormActivate(Sender: TObject);
    private
    { Private declarations }

  public
    { Public declarations }
  end;

var
   Principal: TPrincipal;
   Fondo,sueloA,sueloB,tuboS,tuboI,ts1,ti1: TPNGImage;
   PosX,PosY:integer; //Posicion Helicoptero
   sueloAx,sueloBx:integer;
   distancia:integer;
   imgH:integer;
   imgExplosion,x,y:integer;
   LimInf:integer;
   tubosSec:boolean;
   tuboSx,tuboSy,tuboIx,tuboIy:integer;
   ts1x,ts1y,ti1x,ti1y:integer;
   Puntaje:integer;
   b1,b2:boolean; //Puntaje
   velocidad:integer;
   i:integer;
   misilX,misilY:integer;
   mb:boolean; //misil
   cm:integer;
    T:integer;
implementation

{$R *.dfm}

procedure TPrincipal.FormActivate(Sender: TObject);
begin
MHelicoptero.FileName:='Helicopter_Sound.mp3';
MHelicoptero.Open;
MExplosion.FileName:='Explosion.mp3';
MExplosion.Open;
Mmisil.FileName:='Lanzamiento misil.mp3';
Mmisil.Open;
end;

procedure TPrincipal.FormCreate(Sender: TObject);
begin
 principal.Width:=Screen.Width;
 Fondo:=TPNGImage.Create;
 Fondo.LoadFromFile('fondo.png');
 sueloA:=TPNGImage.Create;
 sueloA.LoadFromFile('suelo.png');
 sueloB:=TPNGImage.Create;
 sueloB.LoadFromFile('suelo.png');
 tuboS:=TPNGImage.Create;
 tuboS.LoadFromFile('tubosup.png');
 tuboI:=TPNGImage.Create;
 tuboI.LoadFromFile('tuboinf.png');
 ts1:=TPNGImage.Create;
 ts1.LoadFromFile('tubosup.png');
 ti1:=TPNGImage.Create;
 ti1.LoadFromFile('tuboinf.png');
 PosX:=30;
 PosY:=Principal.Height div 2;
 imgExplosion:=0;
 imgH:=0; LimInf:=155;
 sueloAx:=0; sueloBx:=sueloA.Width; distancia:=100;
//declaracion de posisiones de los tubos
 tuboSx:=Screen.Width; tuboSy:=RandomRange(-400,0);
 tuboIx:=Screen.Width; tuboIy:=tuboSy+tuboS.Height+120;
 ts1x:=Screen.Width;   ts1y:=RandomRange(-400,0);
 ti1x:=ts1x;           ti1y:=ts1y+ts1.Height+120;
 tubosSec:=false;
 Puntaje:=0; b1:=false; b2:=false;
 velocidad:=10; i:=10;
 mb:=false;
 cm:=0;
 misilX:=-150;
 Panel1.Left:=0; Panel1.Top:=0;
 PlayBoton.Left:=Screen.Width div 2-PlayBoton.Width div 2;
 PlayBoton.Top:=Screen.Height div 2 + 100;
 TimerH.Enabled:=false;
 PlayAgain.Left:=Screen.Width div 2-PlayAgain.Width div 2;
 PLayAgain.Top:=Screen.Height div 2-PlayAgain.Height div 2;
 PlayAgain.Enabled:=false ;PlayAgain.Visible:=false;
end;

procedure TPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case key of
   27:  Principal.Close;

   38:    if PosY>0 then
            begin
            PosY:=Posy-17 ;
            if (cm>0)and(mb=false) then
              begin
              misilY:=PosY;
              misilx:=PosX;
              end;
            end;

   37:    if PosX>0 then
            begin
            PosX:=PosX-17;
            if (cm>0)and(mb=false) then
             begin
             misilX:=PosX;
             misily:=PosY;
             end;
            end;


   39:    if PosX<Principal.Width div 2 then
            begin
            PosX:=PosX+17;
            if (cm>0)and(mb=false) then
             begin
             misilX:=PosX;
             misily:=PosY;
             end;
            end;

   32:    if (cm>0)and (mb=false) then
            begin
            mb:=true;
            Tmisil.Enabled:=true;
            Mmisil.Play;
             cm:=cm-1;
            end;

   40:    if PosY<Principal.Height-LimInf-12 then
            begin
            PosY:=PosY+17;
            if (cm>0)and(mb=false)then
             begin
             misilX:=PosX;
             misily:=PosY;
             end;
            end;
 end;
end;

procedure TPrincipal.FormPaint(Sender: TObject);
begin
  Canvas.StretchDraw(RECT(0,0,Principal.Width,Principal.Height),Fondo);
  Helicopteros.Draw(Canvas,PosX,PosY,imgH);
  misil.Draw(Canvas,misilX,misilY,0);
  canvas.Draw(tuboIx,tuboIy,tuboI);
  canvas.Draw(tuboSx,tuboSy,tuboS);
  canvas.Draw(ts1x,ts1y,ts1); //tubo superior Auxiliar 1
  canvas.Draw(ti1x,ti1y,ti1); //tubo inferior auxiliar 1
  canvas.Draw(sueloAx,principal.Height-105,sueloA);
  canvas.Draw(sueloBx,principal.Height-105,sueloB);
end;

procedure TPrincipal.HelicopterAnimacion;
begin
  Repaint;
  inc(imgH);
  if imgH>2 then
     imgH:=0;
end;

function TPrincipal.impacto: boolean;
begin
 if    ((PosY>TuboIy-64)and(Posx>TuboIx-50)and(PosX<TuboIx+TuboI.Width))   //Tubo inferior 1
        or ((PosY>ti1y-64)  and(PosX>ti1x-50)  and(PosX<ti1x+ti1.Width))       //Tubo inferior 2
        or ((PosY<TuboSy+TuboS.Height-5)and(PosX>TuboSx-50)and(PosX<TuboSx+TuboS.Width)) //Tubo superior 1
        or ((PosY<ts1y+ts1.Height-5)    and (PosX>ts1x-50) and (PosX<ts1x+ts1.Width)) then    //Tubo superior 2
      begin
      result:=true;
      end
      else
      result:=false;

end;

procedure TPrincipal.PlayAgainClick(Sender: TObject);
begin
 PosX:=30;
 PosY:=Principal.Height div 2;
 sueloAx:=0; sueloBx:=sueloA.Width; distancia:=100;
 tuboSx:=Screen.Width; tuboSy:=RandomRange(-400,0);
 tuboIx:=Screen.Width;  tuboIy:=tuboSy+tuboS.Height+120;
 ts1x:=Screen.Width; ts1y:=RandomRange(-400,0);
 ti1x:=ts1x;  ti1y:=ts1y+ts1.Height+120;
 tubosSec:=false;
 Puntaje:=0; b1:=false; b2:=false;
 velocidad:=10; i:=10;
 mb:=false;

 cm:=0;
 misilX:=-150;
 TimerH.Enabled:=true;
 TExplosion.Enabled:=false; imgExplosion:=0;
 PlayAgain.Enabled:=false ;PlayAgain.Visible:=false;
 MHelicoptero.Play; MExplosion.Rewind;
end;

procedure TPrincipal.PlayBotonClick(Sender: TObject);
begin
 Panel1.Enabled:=false;
 Panel1.Visible:=false;
 TimerH.Enabled:=true;
 MHelicoptero.Play;
end;

procedure TPrincipal.TExplosionTimer(Sender: TObject);
begin
 Repaint;
 Explosion.Draw(Canvas,X,Y,imgExplosion);
 inc(ImgExplosion);
end;

Procedure TPrincipal.TimerHTimer(Sender: TObject);
begin
 label4.Caption:=inttostr(Puntaje);
 label5.Caption:=inttostr(cm);
 HelicopterAnimacion;
//Movimiento del suelo
  sueloAx:=sueloAx-3;
  sueloBx:=sueloBx-3;
  if (sueloAx+sueloA.Width)<=0 then
     sueloAx:=SueloBx+SueloB.Width;
  if (sueloBx+sueloB.Width)<=0 then
     sueloBx:=SueloAx+SueloA.Width;
//Movimiento tubos principales
  tuboSx:=tuboSx-velocidad;
  tuboIx:=tuboIx-velocidad;
  if tuboSx<=principal.Width div 2 then
     tubosSec:=true;
  if tuboSx<=0 then
    begin
     tuboSx:=principal.Width;
     tuboSy:=RandomRange(-400,0);
     tuboIx:=Principal.Width;
     tuboIy:=tuboSy+tuboS.Height+120;
     b2:=false;
    end;
 //Movimiento tubos secundarios
  if tubosSec=true then
    begin
     ts1x:=ts1x-velocidad;
     ti1x:=ti1x-velocidad;
    end;
  if ts1x<=0 then
    begin
     ts1x:=principal.Width;
     ts1y:=RandomRange(-400,0);
     ti1x:=Principal.Width;
     ti1y:=ts1y+ts1.Height+120;
     b1:=false;
    end;
//PUNTAJE
  if (PosX>TuboSx)and(b1=false) then
    begin
     inc(Puntaje,2);
     b1:=true;
    end;
  if (PosX>ts1x)and(b2=false) then
    begin
     inc(Puntaje,2);
     b2:=true;
    end;
   if puntaje=i then
    begin
     velocidad:=velocidad+3;
     i:=i+10;
     if cm=0 then
        cm:=cm+1;
     if (cm>0)and(mb=false) then
       begin
        misilX:=PosX;
        misilY:=PosY;
       end;
    end;

   if impacto then
       begin
       TimerH.Enabled:=false;
       x:=PosX; y:=PosY;
        TExplosion.Enabled:=True;
        Posy:=Screen.Height+70;
        Tmisil.Enabled:=false;
        misilX:=-100;
        PlayAgain.Enabled:=true;
        PlayAgain.Visible:=true;
        MExplosion.Play;
        MHelicoptero.Stop;
       end;
  //IMPACTO MISIL
   if ((misilY>TuboIy-50)and(misilX>tuboIx-10)and(misilX<TuboIx+TuboI.Width)) then
     begin
      Tmisil.Enabled:=false;
      mb:=false;
      TuboIy:=Screen.Height+20;
      if cm>0 then
        begin
         misilX:=PosX; misilY:=PosY; mb:=false;
        end
      else
        begin
         misilX:=-100;
        end;
     end;

   if((misilY>ti1y-50)and(misilX>ti1x-10)and(misilX<ti1x+ti1.Width)) then
     begin
      Tmisil.Enabled:=false;
      mb:=false;
      ti1y:=Screen.Height+20;
      if cm>0 then
        begin
         misilX:=PosX; misilY:=PosY;  mb:=false;
        end
      else
        begin
         misilX:=-100;
        end;
     end;
   if((misilY<TuboSy+TuboS.Height-40)and(misilX>TuboSx-10)and(misilX<TuboSx+TuboS.Width)) then
     begin
      Tmisil.Enabled:=false;
      mb:=false;
      TuboSy:=-TuboS.Height;
      if cm>0 then
        begin
         misilX:=PosX; misilY:=PosY;  mb:=false;
        end
        else
        begin
         misilX:=-100;
        end;
     end;
   if ((misilY<Ts1y+ts1.Height-40)and(misilX>ts1x-10)and(misilX<ts1x+ts1.Width)) then
     begin
      Tmisil.Enabled:=false;
      mb:=false;
      ts1y:=-ts1.Height;
      if cm>0 then
        begin
         misilX:=PosX; misilY:=PosY; mb:=false;
        end
      else
        begin
         misilX:=-100;
        end;
     end;
end;

procedure TPrincipal.TmisilTimer(Sender: TObject);
begin
misilX:=misilX+20;
end;

end.
