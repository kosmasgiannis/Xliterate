object Form1: TForm1
  Left = 190
  Top = 107
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Xliterate'
  ClientHeight = 341
  ClientWidth = 769
  Color = clSkyBlue
  Font.Charset = ANSI_CHARSET
  Font.Color = clDefault
  Font.Height = -11
  Font.Name = 'Arial Unicode MS'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    00000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00F99
    99999999999999999999999999F00F9BBBBBBBBBBBBBBBBBBBBBBBBBB9F00F9B
    333333333333333333333333B9F00F9B311111111111111111111113B9F00F9B
    31CCCCCCCCCCCCCCCCCCCC13B9F00F9B31CDDDDDDDDDDDDDDDDDDC13B9F00F9B
    31CD5555555555555555DC13B9F00F9B31CD5DDDDDDDDDDDDDD5DC13B9F00F9B
    31CD5DCCCCCCCCCCCCD5DC13B9F00F9B31CD5DCEEEEEEEEEECD5DC13B9F00F9B
    31CD5DCEAAAAAAAAECD5DC13B9F00F9B31CD5DCEA666666AECD5DC13B9F00F9B
    31CD5DCEA699996AECD5DC13B9F00F9B31CD5DCEA699996AECD5DC13B9F00F9B
    31CD5DCEA699996AECD5DC13B9F00F9B31CD5DCEA699996AECD5DC13B9F00F9B
    31CD5DCEA666666AECD5DC13B9F00F9B31CD5DCEAAAAAAAAECD5DC13B9F00F9B
    31CD5DCEEEEEEEEEECD5DC13B9F00F9B31CD5DCCCCCCCCCCCCD5DC13B9F00F9B
    31CD5DDDDDDDDDDDDDD5DC13B9F00F9B31CD5555555555555555DC13B9F00F9B
    31CDDDDDDDDDDDDDDDDDDC13B9F00F9B31CCCCCCCCCCCCCCCCCCCC13B9F00F9B
    311111111111111111111113B9F00F9B333333333333333333333333B9F00F9B
    BBBBBBBBBBBBBBBBBBBBBBBBB9F00F9999999999999999999999999999F00FFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  Menu = TntMainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object TntLabel1: TLabel
    Left = 0
    Top = 22
    Width = 26
    Height = 11
    Caption = 'Greek'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Arial Unicode MS'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TntLabel2: TLabel
    Left = 0
    Top = 52
    Width = 23
    Height = 11
    Caption = 'Latin'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Arial Unicode MS'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TntLabel3: TLabel
    Left = 0
    Top = 0
    Width = 309
    Height = 11
    Caption = 
      'Type the text in the field below and press Ctrl-G to get it roma' +
      'nized.'
    Color = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Arial Unicode MS'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object TntEdit1: TEdit
    Left = 45
    Top = 22
    Width = 718
    Height = 23
    Font.Charset = GREEK_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnDblClick = TntEdit1DblClick
  end
  object TntEdit2: TEdit
    Left = 45
    Top = 52
    Width = 718
    Height = 22
    TabStop = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    OnDblClick = TntEdit2DblClick
  end
  object TntMemo1: TMemo
    Left = 45
    Top = 82
    Width = 718
    Height = 255
    Font.Charset = GREEK_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Arial Unicode MS'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object ComboBox1: TComboBox
    Left = 616
    Top = 0
    Width = 145
    Height = 22
    AutoComplete = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clDefault
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ItemHeight = 14
    ParentFont = False
    TabOrder = 3
    TabStop = False
    OnClick = ComboBox1Click
  end
  object TntMainMenu1: TMainMenu
    Left = 536
    object File1: TMenuItem
      Caption = 'File'
      object transliterate1: TMenuItem
        Caption = 'Romanize'
        ShortCut = 16455
        OnClick = transliterate1Click
      end
      object Clear1: TMenuItem
        Caption = 'Clear'
        ShortCut = 16473
        OnClick = Clear1Click
      end
      object Debug1: TMenuItem
        Caption = 'Debug'
        Visible = False
        OnClick = Debug1Click
      end
      object RomanizationasinModernGreek1: TMenuItem
        Caption = 'Romanization in Modern Greek'
        Checked = True
        OnClick = RomanizationasinModernGreek1Click
      end
      object UseCompoundCharacters1: TMenuItem
        Caption = 'Use Compound Characters'
        Checked = True
        OnClick = UseCompoundCharacters1Click
      end
      object RoughBreathingGuessing1: TMenuItem
        Caption = 'Rough Breathing Guessing'
        OnClick = RoughBreathingGuessing1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object AlwaysOnTop1: TMenuItem
        Caption = 'Always On Top'
        OnClick = AlwaysOnTop1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'E&xit'
        ShortCut = 16465
        OnClick = Exit1Click
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
      object About1: TMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
end
