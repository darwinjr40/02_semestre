unit UCController;

interface

uses UCEscenario, URecord, UCSnake, UCCesped;

type
    Controller = class
      private
        objEscenario : Escenario;
      public
        constructor crear(x : Escenario);
        procedure moverse(k : Word);
        procedure accion();

    end;
implementation

{ Controller }

constructor Controller.crear(x: Escenario);
begin
  Self.objEscenario := x;
end;
// ctrl + /
procedure Controller.accion;
var  f, c : byte;
     d: Direction;
     dat : dato;
begin

//dat-> lo que hay en la matriz
  dat := self.objEscenario.getMatriz.ObtValor(
    self.objEscenario.getCola.GetFil,
    self.objEscenario.getCola.GetCOl
  );
  //modificamos la direccion de la cola
  self.objEscenario.getCola.SetDirection(dat.direccion);
   //modificar matriz, limiando el dato de la cola
  self.objEscenario.getMatriz.ModValor(
    self.objEscenario.getCola.GetFil,
    self.objEscenario.getCola.GetCOl,
    Cesped.value,
    Direction.null
  );

  //la cola avanza
   self.objEscenario.getCola.SetNextPos(
    self.objEscenario.getMatriz.GetFilas,
    self.objEscenario.getMatriz.GetColumnas
  );



  //cabeza
  f := self.objEscenario.getCabeza.GetFil;
  c := self.objEscenario.getCabeza.GetCOl;
  d := self.objEscenario.getCabeza.GetDirection;
  //modificar matriz, dejando datos de la cabeza
  self.objEscenario.getMatriz.ModValor(f,c,Snake.value,d);
  //avanza cabeza
  self.objEscenario.getCabeza.SetNextPos(
    self.objEscenario.getMatriz.GetFilas,
    self.objEscenario.getMatriz.GetColumnas
  );
  //avanza cola





end;

procedure Controller.moverse(k: Word);
begin
  self.objEscenario.getCabeza.Moverse(k);
end;

end.
