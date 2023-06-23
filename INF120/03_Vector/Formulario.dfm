object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 666
  ClientWidth = 1253
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
    Left = 48
    Top = 192
    Width = 1153
    Height = 209
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 184
    Top = 92
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 184
    Top = 138
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object Button1: TButton
    Left = 32
    Top = 74
    Width = 75
    Height = 25
    Caption = 'cargar'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 32
    Top = 136
    Width = 75
    Height = 25
    Caption = 'descargar'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 32
    Top = 105
    Width = 75
    Height = 25
    Caption = 'cargarRnd'
    TabOrder = 5
    OnClick = Button3Click
  end
  object MainMenu1: TMainMenu
    Left = 8
    object Numero1: TMenuItem
      Caption = 'Numero'
      object busquedaBinaria1: TMenuItem
        Caption = 'busquedaBinaria'
        OnClick = busquedaBinaria1Click
      end
      object ordQsort1: TMenuItem
        Caption = 'ordQsort'
        OnClick = ordQsort1Click
      end
      object ordMergeSort1: TMenuItem
        Caption = 'ord_MergeSort'
        OnClick = ordMergeSort1Click
      end
      object OrdMsortReango1: TMenuItem
        Caption = 'Ord-MsortRango'
        OnClick = OrdMsortReango1Click
      end
      object N20222cargarCadenaNume1: TMenuItem
        Caption = '2022-2-cargarCadenaNume'
        OnClick = N20222cargarCadenaNume1Click
      end
      object segfrec1: TMenuItem
        Caption = 'seg-frec'
        OnClick = segfrec1Click
      end
    end
    object EJECICIOS1: TMenuItem
      Caption = 'EJECICIOS'
      object SegmentarPriNoPrimo1: TMenuItem
        Caption = 'SegmentarPriNoPrimo'
        OnClick = SegmentarPriNoPrimo1Click
      end
      object EliminarTodosRepetidos1: TMenuItem
        Caption = 'EliminarTodosRepetidos'
        OnClick = EliminarTodosRepetidos1Click
      end
      object ejer1: TMenuItem
        Caption = 'ejer'
        OnClick = ejer1Click
      end
      object mcd1: TMenuItem
        Caption = 'mcd'
        OnClick = mcd1Click
      end
      object segmentarcerosynoceros1: TMenuItem
        Caption = 'segmentar ceros y no ceros'
        OnClick = segmentarcerosynoceros1Click
      end
      object intercalarcerosynoceros1: TMenuItem
        Caption = 'intercalar ceros y no ceros'
        OnClick = intercalarcerosynoceros1Click
      end
    end
  end
end
