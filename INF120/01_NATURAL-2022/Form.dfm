object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 669
  ClientWidth = 982
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
  object Edit1: TEdit
    Left = 200
    Top = 42
    Width = 345
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 200
    Top = 79
    Width = 345
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object Button1: TButton
    Left = 96
    Top = 40
    Width = 75
    Height = 25
    Caption = 'cargar'
    TabOrder = 2
    OnClick = Button1SetValor
  end
  object Button2: TButton
    Left = 96
    Top = 71
    Width = 75
    Height = 25
    Caption = 'descargar'
    TabOrder = 3
    OnClick = Button2GetValor
  end
  object Edit3: TEdit
    Left = 200
    Top = 132
    Width = 345
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object Edit4: TEdit
    Left = 200
    Top = 169
    Width = 345
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object MainMenu1: TMainMenu
    object objeto11: TMenuItem
      Caption = 'Numero'
      object invertir1: TMenuItem
        Caption = 'invertir'
        OnClick = invertir1Click
      end
      object unidad1: TMenuItem
        Caption = 'unidad'
        OnClick = unidad1Click
      end
      object toBase1: TMenuItem
        Caption = 'toBase'
        OnClick = toBase1Click
      end
      object oRomano1: TMenuItem
        Caption = 'ToRomano'
        OnClick = oRomano1Click
      end
      object ElimDigPrimoTieneVecinoDigPrimo1: TMenuItem
        Caption = 'ElimDigPrimoTieneVecinoDigPrimo'
        OnClick = ElimDigPrimoTieneVecinoDigPrimo1Click
      end
      object segmentarfrecuenciaDesc1: TMenuItem
        Caption = 'segmentar frecuencia Desc'
        OnClick = segmentarfrecuenciaDesc1Click
      end
      object verificarcapicua1: TMenuItem
        Caption = 'verificar capicua'
        OnClick = verificarcapicua1Click
      end
    end
  end
  object MainMenu2: TMainMenu
    Left = 24
    Top = 592
  end
end
