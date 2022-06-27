object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 606
  ClientWidth = 1058
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
  object StringGrid1: TStringGrid
    Left = 8
    Top = 168
    Width = 257
    Height = 233
    DefaultColWidth = 30
    DefaultRowHeight = 25
    DrawingStyle = gdsClassic
    FixedCols = 0
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 17
    Top = 87
    Width = 121
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 17
    Top = 120
    Width = 121
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object Button1: TButton
    Left = 144
    Top = 90
    Width = 75
    Height = 25
    Caption = 'cargar'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Edit3: TEdit
    Left = 376
    Top = 8
    Width = 121
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object StringGrid2: TStringGrid
    Left = 320
    Top = 168
    Width = 265
    Height = 233
    DefaultColWidth = 30
    DefaultRowHeight = 25
    DrawingStyle = gdsClassic
    FixedCols = 0
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object MainMenu1: TMainMenu
    Left = 8
    Top = 8
    object amtriz1: TMenuItem
      Caption = 'matriz'
      object cargar1: TMenuItem
        Caption = 'cargar'
        OnClick = cargar1Click
      end
      object cargarRND1: TMenuItem
        Caption = 'cargarRND'
        OnClick = cargarRND1Click
      end
      object descargar1: TMenuItem
        Caption = 'descargar'
        OnClick = descargar1Click
      end
      object ElimColumna1: TMenuItem
        Caption = 'ElimColumna'
        OnClick = ElimColumna1Click
      end
      object insColumna1: TMenuItem
        Caption = 'insColumna'
        OnClick = insColumna1Click
      end
      object cargarCaracol1: TMenuItem
        Caption = 'cargarCaracol'
        OnClick = cargarCaracol1Click
      end
      object cargarTriangular1: TMenuItem
        Caption = 'cargarTriangular'
        OnClick = cargarTriangular1Click
      end
    end
    object Entrada1: TMenuItem
      Caption = 'Entrada'
      object riPrincipal1: TMenuItem
        Caption = 'TriPrincipal'
        OnClick = riPrincipal1Click
      end
      object riSecundaria1: TMenuItem
        Caption = 'TriSecundaria'
        OnClick = riSecundaria1Click
      end
      object riInfIzqui1: TMenuItem
        Caption = 'TriInfIzqui'
        OnClick = riInfIzqui1Click
      end
      object riInfIzquierdaEspecial1: TMenuItem
        Caption = 'TriInfIzquierdaEspecial'
        OnClick = riInfIzquierdaEspecial1Click
      end
    end
  end
end
