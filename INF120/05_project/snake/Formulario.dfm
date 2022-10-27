object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 556
  ClientWidth = 831
  Color = clBtnShadow
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnPaint = FormOnPaint
  PixelsPerInch = 96
  TextHeight = 13
  object TimerDibujar: TTimer
    Interval = 50
    OnTimer = TimerDibujarTimer
    Left = 32
    Top = 32
  end
  object TimerController: TTimer
    Interval = 50
    OnTimer = TimerControllerTimer
    Left = 32
    Top = 96
  end
end
