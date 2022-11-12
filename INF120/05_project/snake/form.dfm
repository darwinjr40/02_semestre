object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 618
  ClientWidth = 1090
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = OnKeyDown
  OnPaint = FormOnPaint
  PixelsPerInch = 96
  TextHeight = 13
  object dibujar: TTimer
    Interval = 50
    OnTimer = dibujarTimer
    Left = 24
    Top = 40
  end
  object TimerController: TTimer
    OnTimer = TimerControllerTimer
    Left = 24
    Top = 96
  end
end
