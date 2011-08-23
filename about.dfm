object Form2: TForm2
  Left = 430
  Top = 246
  BorderStyle = bsNone
  Caption = 'About'
  ClientHeight = 250
  ClientWidth = 340
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object TntRichEdit1: TRichEdit
    Left = 0
    Top = 0
    Width = 340
    Height = 250
    TabStop = False
    Align = alClient
    Color = clMenuBar
    Lines.Strings = (
      'Xliterate 1.0'
      ''
      
        'Xliterate is a small utility to assist the romanization of greek' +
        ' text.'
      ''
      'Currently only the ALA-LC 1997 romanization scheme is supported.'
      'This scheme can be found at '
      'http://www.loc.gov/catdir/cpso/romanization/greek.pdf'
      ''
      
        'You may control if the input text is in Modern Greek by the rele' +
        'vant '
      'menu option.'
      ''
      'Please note that daseia is not handled yet.'
      ''
      'This utility is licensed under the MIT License. '
      '---'
      ''
      'Feel welcome to report bugs, send comments or suggestions to:'
      'Giannis Kosmas <kosmasgiannis@gmail.com>')
    ReadOnly = True
    TabOrder = 0
    OnMouseDown = TntRichEdit1MouseDown
  end
end
