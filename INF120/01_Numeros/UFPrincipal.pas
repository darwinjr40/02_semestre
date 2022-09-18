unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ButtonGroup,
  Vcl.ComCtrls,UCNumeros,UCCadenas,UCNatural;

type
  TForm1 = class(TForm)
    PControl: TPageControl;
    Cadenas: TTabSheet;
    Vectores: TTabSheet;
    Matrices: TTabSheet;
    Números: TTabSheet;
    ButtonGroup1: TButtonGroup;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Edit3: TEdit;
    Button1: TButton;
    ButtonGroup2: TButtonGroup;
    Label2: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    procedure ButtonGroup1Items0Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonGroup1Items2Click(Sender: TObject);
    procedure ButtonGroup1Items1Click(Sender: TObject);
    procedure ButtonGroup1Items3Click(Sender: TObject);
    procedure ButtonGroup1Items4Click(Sender: TObject);
    procedure ButtonGroup1Items5Click(Sender: TObject);
    procedure ButtonGroup1Items6Click(Sender: TObject);
    procedure ButtonGroup1Items7Click(Sender: TObject);
    procedure ButtonGroup1Items8Click(Sender: TObject);
    procedure ButtonGroup1Items9Click(Sender: TObject);
    procedure ButtonGroup1Items10Click(Sender: TObject);
    procedure ButtonGroup1Items11Click(Sender: TObject);
    procedure ButtonGroup2Items0Click(Sender: TObject);
    procedure ButtonGroup2Items1Click(Sender: TObject);
    procedure ButtonGroup1Items12Click(Sender: TObject);
    procedure ButtonGroup1Items13Click(Sender: TObject);
    procedure ButtonGroup1Items14Click(Sender: TObject);
    procedure ButtonGroup1Items15Click(Sender: TObject);
    procedure ButtonGroup1Items16Click(Sender: TObject);
    procedure ButtonGroup1Items18Click(Sender: TObject);

    //f
  private
    { Private declarations }
     N:numero;
     C:Cadena;
     v:Natural;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
//-----------------------------------------------------
procedure TForm1.FormCreate(Sender: TObject);  //create
begin
 N:=numero.Create;
 V:=Natural.Create;
 //c:=Cadena.Create;
end;

procedure TForm1.ButtonGroup1Items0Click(Sender: TObject);   //obtener valor
begin
    label1.caption:= IntToStr(n.ObtValor);
    label1.caption:=IntToStr(V.getValue);
end;

procedure TForm1.ButtonGroup1Items1Click(Sender: TObject);   //cambiar valor
begin
 n.CambValor(StrToInt(edit1.text));
 V.setValue(StrToInt(edit1.text));
 // N.setValor(StrToInt(Edit1.Text));
end;
//----------------------------------------------------------------------------
procedure TForm1.ButtonGroup1Items2Click(Sender: TObject);  //obt n`dígito
var x:word;
begin
   x:=StrToInt(InputBox('Posición','',''));
   label1.caption:='El digito es: '+ IntToStr(N.DigitoN(x));
end;


procedure TForm1.ButtonGroup1Items3Click(Sender: TObject);  //Cantidad de Dígitos
begin
   label1.caption:='Hay '+IntToStr(N.CantDigitos)+' Dígitos';
end;

procedure TForm1.ButtonGroup1Items4Click(Sender: TObject);     //Insertar Dígito
var x,y:word;
begin
   x:=StrToInt(InputBox('Posición','',''));
   y:=StrToInt(InputBox('Dígito','',''));
   N.InserDigito(x,y) ;
end;

procedure TForm1.ButtonGroup1Items5Click(Sender: TObject);    //Eliminar Dígito
var x:word;
begin
 x:=StrToInt(InputBox('Posición','',''));
   N.ElimDigito(x) ;
end;

procedure TForm1.ButtonGroup1Items6Click(Sender: TObject);    //Conversión a Binario
begin
    label1.caption:= N.ConvABinario;
end;

procedure TForm1.ButtonGroup1Items7Click(Sender: TObject);   //Conversión a Octal
begin
   label1.caption:= N.ConvAOctal ;
end;

procedure TForm1.ButtonGroup1Items8Click(Sender: TObject);   //Conversión a Hexadecimal
begin
   label1.caption:= N.ConvertirAHexadecimal;
end;

procedure TForm1.ButtonGroup1Items9Click(Sender: TObject);    //Conversión a Base N
var base:byte;
begin
    base:=StrToInt(InputBox('Base N','',''));
   label1.caption:= N.ConvertirABaseN(base);
end;

procedure TForm1.ButtonGroup1Items10Click(Sender: TObject);     //Conversión a Romanos
begin
    label1.caption:=N.ConvertirARomanos;
end;

procedure TForm1.ButtonGroup1Items11Click(Sender: TObject);      //Conversión a Literal
begin
    label1.caption:= N.ConvertirALiteral(StrToInt(edit1.text));
end;

procedure TForm1.ButtonGroup1Items13Click(Sender: TObject);
begin
   //N.invertir;
   label1.caption:=IntToStr(V.invertirN(123));
end;


//Falta mejorar --------------------------------------------------
procedure TForm1.ButtonGroup1Items12Click(Sender: TObject);
begin
   label1.caption:= IntToStr(N.BinarioMayor);
end;



procedure TForm1.ButtonGroup1Items14Click(Sender: TObject);
var d:byte;
begin
    d:=StrToInt(InputBox('Dígito','',''));
    N.DeleteDig(d);
end;


procedure TForm1.ButtonGroup1Items15Click(Sender: TObject);
var num:cardinal;
begin
  num:=StrToInt(InputBox('Número','',''));
  V.preg1NN(num) ;
end;

procedure TForm1.ButtonGroup1Items16Click(Sender: TObject);
begin
   label1.caption:=IntToStr(v.digitoPrimoMayor);
end;

procedure TForm1.ButtonGroup1Items18Click(Sender: TObject);
begin
    V.Eliminar0JuntoAUnPrimo;
end;

//N.intercalarPrimoYnoPrimo;
//---------------------------------------------------------------------------------------------
 // formulario cadenas

 procedure TForm1.ButtonGroup2Items0Click(Sender: TObject);
begin
   // label2.Caption:= c.ObtenerCadena;
end;

procedure TForm1.ButtonGroup2Items1Click(Sender: TObject);
begin
   // c.CambiarCadena(edit4.text);
end;

end.
