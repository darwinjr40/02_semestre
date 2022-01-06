unit Form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.Menus, UCMatriz;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    MainMenu1: TMainMenu;
    Button1: TButton;
    amtriz1: TMenuItem;
    cargar1: TMenuItem;
    descargar1: TMenuItem;
    ElimColumna1: TMenuItem;
    Edit3: TEdit;
    cargarRND1: TMenuItem;
    StringGrid2: TStringGrid;
    insColumna1: TMenuItem;
    cargarCaracol1: TMenuItem;
    cargarTriangular1: TMenuItem;
    Entrada1: TMenuItem;
    riPrincipal1: TMenuItem;
    riSecundaria1: TMenuItem;
    riInfIzqui1: TMenuItem;
    riInfIzquierdaEspecial1: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure descargar(obj:Matriz; t : tStringGrid);
    procedure descargar1Click(Sender: TObject);
    procedure cargar1Click(Sender: TObject);
    procedure ElimColumna1Click(Sender: TObject);
    procedure cargarRND1Click(Sender: TObject);
    procedure insColumna1Click(Sender: TObject);
    procedure cargarCaracol1Click(Sender: TObject);
    procedure cargarTriangular1Click(Sender: TObject);
    procedure riPrincipal1Click(Sender: TObject);
    procedure riSecundaria1Click(Sender: TObject);
    procedure riInfIzqui1Click(Sender: TObject);
    procedure riInfIzquierdaEspecial1Click(Sender: TObject);
  private
    { Private declarations }
    m, m3,m4 : Matriz;
  public
    { Public declarations }

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
   m.SetFilas(StrToInt(Edit1.Text));
   m.SetColumnas(StrToInt(Edit2.Text));
   StringGrid1.RowCount := m.GetFilas;
   StringGrid1.ColCount := m.GetColumnas;
end;

procedure TForm1.cargar1Click(Sender: TObject);
var f, c : word;
begin
  f := StrToInt(inputbox('filas','',''));
  c := StrToInt(inputbox('columnas','',''));
  m.cargar(f, c);
end;

procedure TForm1.cargarCaracol1Click(Sender: TObject);
begin
  m.cargarCaracol();
end;

procedure TForm1.cargarRND1Click(Sender: TObject);
var f, c, a, b : word;
begin
  f := StrToInt(inputbox('filas','',''));
  c := StrToInt(inputbox('columnas','',''));
  a := StrToInt(inputbox('a','',''));
  b := StrToInt(inputbox('b','',''));
  m.cargar(f, c, a, b);
  m.Descargar(StringGrid1);
end;

procedure TForm1.cargarTriangular1Click(Sender: TObject);
begin
  m.triangular();
end;

procedure TForm1.descargar(obj:Matriz;  t : tStringGrid);
var i,j : word;
begin
   t.RowCount := obj.GetFilas;
   t.ColCount := obj.GetColumnas;
   for i := 1 to t.RowCount do  begin
    for j := 1 to t.ColCount do begin
        t.Cells[j, i] := FloatToStr(obj.ObtValor(i, j));
    end;
   end;
end;

procedure TForm1.descargar1Click(Sender: TObject);
begin
  m.Descargar(StringGrid2);
end;

procedure TForm1.ElimColumna1Click(Sender: TObject);
var col : word;
begin
  col := StrToInt(Edit3.Text);
  m.ElimColumna(col);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  m := Matriz.Create;
end;

procedure TForm1.insColumna1Click(Sender: TObject);
var col : word;
begin
  col := StrToInt(Edit3.Text);
  m.InsColumna(col);
end;

procedure TForm1.riInfIzqui1Click(Sender: TObject);
begin
  m.cargarTriInfIzqui1;
end;

procedure TForm1.riInfIzquierdaEspecial1Click(Sender: TObject);
begin
  m.cargarTriInfIzquiEspecial;
end;

procedure TForm1.riPrincipal1Click(Sender: TObject);
begin
  m.cargarTriPrincipal;
end;

procedure TForm1.riSecundaria1Click(Sender: TObject);
begin
  m.cargarTriSecundaria;
end;

end.
