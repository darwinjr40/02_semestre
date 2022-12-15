unit Formulario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.Grids, UCVector;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    MainMenu1: TMainMenu;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Numero1: TMenuItem;
    Button3: TButton;
    busquedaBinaria1: TMenuItem;
    ordQsort1: TMenuItem;
    ordMergeSort1: TMenuItem;
    EJECICIOS1: TMenuItem;
    SegmentarPriNoPrimo1: TMenuItem;
    EliminarTodosRepetidos1: TMenuItem;
    ejer1: TMenuItem;
    mcd1: TMenuItem;
    OrdMsortReango1: TMenuItem;
    segmentarcerosynoceros1: TMenuItem;
    intercalarcerosynoceros1: TMenuItem;
    N20222cargarCadenaNume1: TMenuItem;
    prueba1: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure busquedaBinaria1Click(Sender: TObject);
    procedure ordQsort1Click(Sender: TObject);
    procedure ordMergeSort1Click(Sender: TObject);
    procedure SegmentarPriNoPrimo1Click(Sender: TObject);
    procedure EliminarTodosRepetidos1Click(Sender: TObject);
    procedure ejer1Click(Sender: TObject);
    procedure mcd1Click(Sender: TObject);
    procedure OrdMsortReango1Click(Sender: TObject);
    procedure segmentarcerosynoceros1Click(Sender: TObject);
    procedure intercalarcerosynoceros1Click(Sender: TObject);
    procedure N20222cargarCadenaNume1Click(Sender: TObject);
    procedure prueba1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     procedure descargar(obj : vector; v : TStringGrid);
  end;

var
  Form1: TForm1;
  vec : vector;
implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.busquedaBinaria1Click(Sender: TObject);
var x : real;
begin
  x := StrToFloat(Edit1.Text);
  ShowMessage(IntToStr(vec.BusquedaBinaria(x)));

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  vec.cargar();
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  descargar(vec, StringGrid1);
end;

procedure TForm1.Button3Click(Sender: TObject);
var a,b,dim :word;
begin
  dim := StrToInt(InputBox('','dimension',''));
  a := StrToInt(InputBox('','a',''));
  b := StrToInt(InputBox('','b',''));
  vec.cargarRandom(a, b, dim);
end;

procedure TForm1.descargar(obj: vector; v: TStringGrid);
var i : word;
begin
  v.Cells[0, 0] := '';
  v.Cells[0, 1] := '';
  v.ColCount := obj.getDimension();
  v.RowCount := 2;
  for i := 1 to obj.getDimension do begin
    v.Cells[i-1, 0] := FloatToStr(obj.getElemento(i));
    v.Cells[i-1, 1] := IntToStr(i);
  end;
end;

procedure TForm1.ejer1Click(Sender: TObject);
var b : Boolean;
begin
  b := true;
  edit1.Text := BoolToStr(b, true);
end;

procedure TForm1.EliminarTodosRepetidos1Click(Sender: TObject);
begin
  vec.elimitarAllRepetidos();
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  vec := vector.Create;
end;

procedure TForm1.intercalarcerosynoceros1Click(Sender: TObject);
begin
   vec.IntercalarCerosNoCeros();
end;

procedure TForm1.mcd1Click(Sender: TObject);
begin
  ShowMessage(IntToStr(vec.mcd));
end;

procedure TForm1.N20222cargarCadenaNume1Click(Sender: TObject);
begin
  vec.CargarAsc(Edit2.Text);
end;

procedure TForm1.ordMergeSort1Click(Sender: TObject);
begin
  vec.OrdMsort;
end;

procedure TForm1.OrdMsortReango1Click(Sender: TObject);
var a, b :word;
begin
  a := StrToInt(InputBox('','a',''));
  b := StrToInt(InputBox('','b',''));
  vec.MSort(a, b);
end;

procedure TForm1.ordQsort1Click(Sender: TObject);
begin
  vec.Quicksort();
end;

procedure TForm1.prueba1Click(Sender: TObject);
begin

end;

procedure TForm1.segmentarcerosynoceros1Click(Sender: TObject);
var a, b :word;
begin
  a := StrToInt(InputBox('','a',''));
  b := StrToInt(InputBox('','b',''));
  vec.sefmentarCerosNoCeros(a, b);
end;

procedure TForm1.SegmentarPriNoPrimo1Click(Sender: TObject);
var a, b :word;
begin
  a := StrToInt(InputBox('','a',''));
  b := StrToInt(InputBox('','b',''));
  vec.SegmentarPrimoNoPrimo(a, b);
end;

end.
