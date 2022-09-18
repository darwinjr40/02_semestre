object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 331
  ClientWidth = 687
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PControl: TPageControl
    Left = 0
    Top = 0
    Width = 687
    Height = 331
    ActivePage = Números
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Números: TTabSheet
      Caption = 'N'#250'meros'
      object Label1: TLabel
        Left = 208
        Top = 24
        Width = 6
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ButtonGroup1: TButtonGroup
        Left = 0
        Top = 0
        Width = 185
        Height = 293
        Align = alLeft
        ButtonHeight = 50
        ButtonWidth = 50
        ButtonOptions = [gboAllowReorder, gboFullSize, gboShowCaptions]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Items = <
          item
            Caption = 'Obtener Valor'
            OnClick = ButtonGroup1Items0Click
          end
          item
            Caption = 'Cambiar Valor'
            OnClick = ButtonGroup1Items1Click
          end
          item
            Caption = 'Obtener n'#39' d'#237'gito'
            OnClick = ButtonGroup1Items2Click
          end
          item
            Caption = 'Cantidad de D'#237'gitos'
            OnClick = ButtonGroup1Items3Click
          end
          item
            Caption = 'Insertar D'#237'gito'
            OnClick = ButtonGroup1Items4Click
          end
          item
            Caption = 'Eliminar D'#237'gito'
            OnClick = ButtonGroup1Items5Click
          end
          item
            Caption = 'Convertir A Binario'
            OnClick = ButtonGroup1Items6Click
          end
          item
            Caption = 'Convertir A Octal'
            OnClick = ButtonGroup1Items7Click
          end
          item
            Caption = 'Convertir a Hexadecimal'
            OnClick = ButtonGroup1Items8Click
          end
          item
            Caption = 'Convertir a Base N'
            OnClick = ButtonGroup1Items9Click
          end
          item
            Caption = 'Convertir a Romano'
            OnClick = ButtonGroup1Items10Click
          end
          item
            Caption = 'Convertir a Literal'
            OnClick = ButtonGroup1Items11Click
          end
          item
            Caption = 'Invertir N'#250'mero'
            OnClick = ButtonGroup1Items13Click
          end
          item
            Caption = 'Eliminar Digito D'
            OnClick = ButtonGroup1Items13Click
          end
          item
            OnClick = ButtonGroup1Items13Click
          end
          item
            Caption = 'Elimina Dig N-1 veces '
            OnClick = ButtonGroup1Items15Click
          end
          item
            Caption = 'Digito Primo Mayor'
            OnClick = ButtonGroup1Items16Click
          end
          item
          end
          item
            Caption = 'Eliminar 0'
            OnClick = ButtonGroup1Items18Click
          end>
        TabOrder = 0
      end
      object Edit1: TEdit
        Left = 208
        Top = 99
        Width = 313
        Height = 31
        TabOrder = 1
      end
      object Edit2: TEdit
        Left = 208
        Top = 152
        Width = 193
        Height = 31
        TabOrder = 2
        Text = 'posici'#243'n'
      end
      object Edit3: TEdit
        Left = 208
        Top = 205
        Width = 169
        Height = 31
        TabOrder = 3
        Text = 'D'#237'gito a A'#241'adir'
      end
    end
    object Cadenas: TTabSheet
      Caption = 'Cadenas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ImageIndex = 1
      ParentFont = False
      object Label2: TLabel
        Left = 285
        Top = 24
        Width = 7
        Height = 29
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ButtonGroup2: TButtonGroup
        Left = 0
        Top = 0
        Width = 177
        Height = 293
        Align = alLeft
        ButtonOptions = [gboFullSize, gboShowCaptions]
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = []
        Items = <
          item
            Caption = 'Obtener Cadena'
            OnClick = ButtonGroup2Items0Click
          end
          item
            Caption = 'Cambiar Cadena'
            OnClick = ButtonGroup2Items1Click
          end
          item
          end
          item
          end>
        TabOrder = 0
      end
      object Edit4: TEdit
        Left = 256
        Top = 104
        Width = 121
        Height = 27
        TabOrder = 1
        Text = 'Texto'
      end
      object Edit5: TEdit
        Left = 480
        Top = 104
        Width = 121
        Height = 27
        TabOrder = 2
      end
    end
    object Vectores: TTabSheet
      Caption = 'Vectores'
      ImageIndex = 2
    end
    object Matrices: TTabSheet
      Caption = 'Matrices'
      ImageIndex = 3
    end
  end
  object Button1: TButton
    Left = 576
    Top = 245
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
  end
end
