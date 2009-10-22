object FormResEdSLEditor: TFormResEdSLEditor
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'ResEd Stringlist Editor'
  ClientHeight = 424
  ClientWidth = 426
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object vlEditor: TValueListEditor
    AlignWithMargins = True
    Left = 3
    Top = 38
    Width = 420
    Height = 342
    Align = alClient
    KeyOptions = [keyEdit, keyAdd, keyDelete, keyUnique]
    TabOrder = 0
    TitleCaptions.Strings = (
      'ID'
      'Value'
      '')
    OnValidate = vlEditorValidate
    ColWidths = (
      104
      310)
  end
  object ToolBar1: TToolBar
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 420
    Height = 29
    BorderWidth = 1
    Caption = 'ToolBar1'
    Images = ImageList1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    object tbAddRow: TToolButton
      Left = 0
      Top = 0
      Hint = 'Insert Row'
      Caption = 'Add Row'
      ImageIndex = 1
      OnClick = tbAddRowClick
    end
    object tbDelRow: TToolButton
      Left = 23
      Top = 0
      Hint = 'Delete Row'
      Caption = 'Delete Row'
      ImageIndex = 0
      OnClick = tbDelRowClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 383
    Width = 426
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object btnSave: TButton
      Left = 344
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Save'
      TabOrder = 0
      OnClick = btnSaveClick
    end
  end
  object ImageList1: TImageList
    Left = 232
    Top = 192
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CB660100CB660100CB660100CB66
      0100CB660100CB660100CB660100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CB670300CB670300CB670300CB67
      0300CB670300CB670300CB670300CB670300CB67030000000000000000000000
      000000000000000000000000000000000000FEFAF500FEF9F200FEF4E800FEEE
      DC00FEEAD300FEE7D300CB660100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFCF900FEFBF800FEF8F000FEF4
      E800FEF1E100FEEDDA00FEEAD300FDE7CD00CB67030000000000000000000000
      000000000000000000000000000000000000FEFAF500FEFAF500FEF6EC00FEF2
      E300FEECD800FEE7D300CB660100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFCF900FEFCF900FEF9F300FEF6
      ED00FEF2E400FEEEDC00FEEBD400FDE7CD00CB67030000000000000000000000
      000000000000000000000000000000000000FEFAF500FEFAF500FEF8F100FEF4
      E800FEEEDC00FEEAD300CB660100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFCF900FEFCF900FEFAF600FEF7
      EE00FEF3E600FEF0DF00FEECD700FDE9D100CB67030000000000000000000000
      0000000000000000000000000000000000009835000098350000983500009835
      00009835000098350000CB660100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009A3400009A3400009A3400009A34
      00009A3400009A3400009A3400009A3400009A3400009A3400009A340000CB67
      0300000000000362030000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000364000000000000CB6601009835
      0000983500009835000098350000983500000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFCF900FEFCF900FEFAF600FEF8
      F000FEF5EA00FEF2E400FEF0DF00FEECD800FEEAD300FDE7CD00FCE6CB00CB67
      0300000000000362030003620300000000000000000000000000000000000000
      0000000000000000000000000000036400000364000000000000CB660100FEF9
      F200FEF4E800FEEEDC00FEEAD300FEE7D3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFCF900FEFCF900FEFAF600FEF9
      F300FEF6ED00FEF3E600FEF1E100FEEDDA00FEEBD400FDE8CF00FCE6CB00CB67
      030000000000036203009A9A9A00036203000000000000000000000000000000
      0000000000000000000003640000A28B73000364000000000000CB660100FEFA
      F500FEF6EC00FEF2E300FEECD800FEE7D3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFCF900FEFCF900FEFBF800FEF9
      F300FEF7EE00FEF4E800FEF1E100FEEEDC00FEEBD400FDE9D100FDE7CD00CB67
      0300000000000362030003620300000000000000000000000000000000000000
      0000000000000000000000000000036400000364000000000000CB660100FEFA
      F500FEF8F100FEF4E800FEEEDC00FEEAD3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009A3400009A3400009A3400009A34
      00009A3400009A3400009A3400009A3400009A3400009A3400009A340000CB67
      0300000000000362030000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000364000000000000CB6601009835
      0000983500009835000098350000983500000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFCF900FEFCF900FEFAF600FEF7
      EE00FEF2E400FEEEDC00FEEBD400FDE7CD00CB67030000000000000000000000
      0000000000000000000000000000000000009835000098350000983500009835
      00009835000098350000CB660100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFCF900FEFCF900FEFBF800FEF8
      F000FEF4E800FEF0DF00FEECD700FDE8CF00CB67030000000000000000000000
      000000000000000000000000000000000000FEFAF500FEF9F200FEF4E800FEEE
      DC00FEEAD300FEE7D300CB660100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFCF900FEFCF900FEFCF900FEFA
      F600FEF6ED00FEF2E400FEEDDA00FEEBD400CB67030000000000000000000000
      000000000000000000000000000000000000FEFAF500FEFAF500FEF6EC00FEF2
      E300FEECD800FEE7D300CB660100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CB670300CB670300CB670300CB67
      0300CB670300CB670300CB670300CB670300CB67030000000000000000000000
      000000000000000000000000000000000000FEFAF500FEFAF500FEF8F100FEF4
      E800FEEEDC00FEEAD300CB660100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CB660100CB660100CB660100CB66
      0100CB660100CB660100CB660100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FFFF01FF00000000
      007F01FF00000000007F01FF00000000007F01FF00000000007F01FF00000000
      000BFF40000000000009FE40000000000008FC40000000000009FE4000000000
      000BFF4000000000007F01FF00000000007F01FF00000000007F01FF00000000
      007F01FF00000000FFFF01FF0000000000000000000000000000000000000000
      000000000000}
  end
end