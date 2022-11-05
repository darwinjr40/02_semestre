unit URecord;

interface

type

Direcciones = Record
    izquierda : Boolean;
    derecha : Boolean;
    superior : Boolean;
    inferior : Boolean;
 End;

 Direction = (izquierda,derecha, superior, inferior, null);

 dato = Record
    valor : byte;
    direccion : Direction;
 End;
implementation

end.
