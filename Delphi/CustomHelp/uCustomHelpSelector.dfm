object FormHelpSelector: TFormHelpSelector
  Left = 0
  Top = 0
  ActiveControl = ListBox1
  Caption = 'Select Help Topic...'
  ClientHeight = 292
  ClientWidth = 769
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ListBox1: TListView
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 763
    Height = 253
    Align = alClient
    Columns = <
      item
        Caption = 'Titel'
        Width = 250
      end
      item
        AutoSize = True
        Caption = 'Ziel'
      end>
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnDblClick = ListBox1DblClick
    OnKeyPress = ListBox1KeyPress
  end
  object Panel1: TPanel
    Left = 0
    Top = 259
    Width = 769
    Height = 33
    Align = alBottom
    Anchors = [akBottom]
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      769
      33)
    object btnOk: TButton
      Left = 685
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Ok'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
  end
end