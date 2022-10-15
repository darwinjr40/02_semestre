object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 522
  ClientWidth = 979
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 272
    Width = 5
    Height = 19
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 59
    Top = 264
    Width = 102
    Height = 41
    Caption = 'Label2'
  end
  object StringGrid1: TStringGrid
    Left = 32
    Top = 168
    Width = 897
    Height = 73
    ColCount = 1
    DefaultColWidth = 28
    DrawingStyle = gdsClassic
    FixedCols = 0
    RowCount = 2
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 128
    Top = 8
    Width = 713
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 128
    Top = 45
    Width = 721
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object Button1: TButton
    Left = 16
    Top = 59
    Width = 106
    Height = 25
    Caption = 'cargar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 23
    Top = 90
    Width = 99
    Height = 25
    Caption = 'Descargar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = Button2Click
  end
  object Edit3: TEdit
    Left = 128
    Top = 90
    Width = 721
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object Button3: TButton
    Left = 8
    Top = 121
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 6
    OnClick = Button3Click
  end
  object MainMenu1: TMainMenu
    Left = 24
    Top = 8
    object CADENA11: TMenuItem
      Caption = 'CADENA1'
      object AdicionarPalabra1: TMenuItem
        Caption = 'Cargar Cadena'
        OnClick = AdicionarPalabra1Click
      end
      object descargar1: TMenuItem
        Caption = 'descargar Cadena'
        OnClick = descargar1Click
      end
      object SetLongitud1: TMenuItem
        Caption = 'SetLongitud'
        OnClick = SetLongitud1Click
      end
      object GetLongitud1: TMenuItem
        Caption = 'GetLongitud'
        OnClick = GetLongitud1Click
      end
      object InvertirPalabras1: TMenuItem
        Caption = 'Invertir Palabras'
        OnClick = InvertirPalabras1Click
      end
      object Delete1: TMenuItem
        Caption = 'Delete'
        OnClick = Delete1Click
      end
      object EliminarTodalapalabra1: TMenuItem
        Caption = 'Eliminar Toda la palabra'
        OnClick = EliminarTodalapalabra1Click
      end
      object BuscarPalabra1: TMenuItem
        Caption = 'BuscarSubCadena'
        OnClick = BuscarPalabra1Click
      end
      object BuscarPalabra2: TMenuItem
        Caption = 'BuscarPalabra'
        OnClick = BuscarPalabra2Click
      end
      object BuscarCaracter1: TMenuItem
        Caption = 'BuscarCaracter'
        OnClick = BuscarCaracter1Click
      end
      object remplazarpalabra1: TMenuItem
        Caption = 'remplazar palabra'
        OnClick = remplazarpalabra1Click
      end
      object moverposab1: TMenuItem
        Caption = 'mover(pos, a, b)'
        OnClick = moverposab1Click
      end
      object mostrarNumeros1: TMenuItem
        Caption = 'mostrarNumeros'
        OnClick = mostrarNumeros1Click
      end
      object EsRepectidoabchar1: TMenuItem
        Caption = 'EsRepectido(a,b,char)'
        OnClick = EsRepectidoabchar1Click
      end
      object InvertircadaPalabra220221: TMenuItem
        Caption = 'Invertir cada Palabra  2-2022'
        OnClick = InvertircadaPalabra220221Click
      end
    end
    object Examenes1: TMenuItem
      Caption = 'Examenes'
      object DelSubCadena1: TMenuItem
        Caption = 'DelSubCadena'
        OnClick = DelSubCadena1Click
      end
      object prueba1: TMenuItem
        Caption = 'prueba'
        OnClick = prueba1Click
      end
      object N20212DelPalabraConsonanteRepetida1: TMenuItem
        Caption = '2021_2 DelPalabraConsonanteRepetida'
        OnClick = N20212DelPalabraConsonanteRepetida1Click
      end
      object N202211: TMenuItem
        Caption = '2022_1 numero con mayor decimal'
        OnClick = N202211Click
      end
    end
  end
end
