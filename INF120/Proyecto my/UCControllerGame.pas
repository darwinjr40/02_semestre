unit UCControllerGame;

interface
 uses   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList, UCHelicoptero, UCEscenario;

type

  ControllerGame = class
    private
        objHelicoptero : Helicoptero;
        time, delay: Cardinal;
    public
    constructor crear(E : Escenario); overload;
    procedure accion();
  end;
implementation

{ ControllerGame }

procedure ControllerGame.accion;
begin
    objHelicoptero.teMOviste;
//    Application.ProcessMessages;
    if ((GetTickCount - time) mod delay = 0) then
//    if ((GetTickCount - time) = 3000) then
    begin
      objHelicoptero.setX(objHelicoptero.getX + 10);
    end;

end;


constructor ControllerGame.crear(E: Escenario);
begin
  objHelicoptero := e.getHelicoptero;
  time := GetTickCount;
  delay := 1000;
end;

end.
