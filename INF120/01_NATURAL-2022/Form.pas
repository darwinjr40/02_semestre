unit Form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, UCNatural;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    MainMenu2: TMainMenu;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
//    objeto11: TMenuItem;
    invertir1: TMenuItem;
    unidad1: TMenuItem;
    toBase1: TMenuItem;
    oRomano1: TMenuItem;
    Edit3: TEdit;
    Edit4: TEdit;
    ElimDigPrimoTieneVecinoDigPrimo1: TMenuItem;
    segmentarfrecuenciaDesc1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Button1SetValor(Sender: TObject);
    procedure Button2GetValor(Sender: TObject);
    procedure invertir1Click(Sender: TObject);
    procedure unidad1Click(Sender: TObject);
    procedure toBase1Click(Sender: TObject);
    procedure oRomano1Click(Sender: TObject);
    procedure ElimDigPrimoTieneVecinoDigPrimo1Click(Sender: TObject);
    procedure segmentarfrecuenciaDesc1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  objeto : Natural;
implementation

{$R *.dfm}

procedure TForm1.Button1SetValor(Sender: TObject);
var entrada : string;
    n : cardinal;
begin
  entrada := Edit1.Text;  //'123' : string
  n :=  StrToInt(entrada); //'123' => 123
  objeto.SetValor(n);
end;

procedure TForm1.Button2GetValor(Sender: TObject);
  var resultado : string;
begin
  resultado := IntToStr(objeto.GetValor);//123 => '123'
  edit4.Text := resultado;
end;

procedure TForm1.ElimDigPrimoTieneVecinoDigPrimo1Click(Sender: TObject);
begin
objeto.ElimDigPrimoTieneVecinoDigPrimo;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  objeto := Natural.crear(0);
end;

procedure TForm1.invertir1Click(Sender: TObject);
var aux : cardinal;
begin

//  aux := Natural.pot(Strtoint(Edit1.Text), Strtoint(Edit2.Text));
//  aux := StrToInt(Edit2.Text);
  Button1SetValor(Sender);
  objeto.ElimPrimerNumero(Strtoint(Edit2.Text));
//  objeto.ElimPosDigito(Strtoint(Edit2.Text));
//  Edit3.Text := BoolToStr(objeto.VerficarPrimo, true);
//  Edit3.Text := IntToStr(objeto.GetCantDig());
  Button2GetValor(Sender);
//  Edit3.Text := IntToStr(aux);
end;

procedure TForm1.oRomano1Click(Sender: TObject);
begin
  Edit2.Text := objeto.ToRomano;
end;

procedure TForm1.segmentarfrecuenciaDesc1Click(Sender: TObject);
begin
 objeto.SegFrcDesc;
end;

procedure TForm1.toBase1Click(Sender: TObject);
begin
  Edit2.Text := objeto.toBase(StrToInt(Edit1.Text));
end;

procedure TForm1.unidad1Click(Sender: TObject);
var n : cardinal;
begin
  Edit2.Text :=  objeto.unidad(objeto.GetValor);
end;

end.
