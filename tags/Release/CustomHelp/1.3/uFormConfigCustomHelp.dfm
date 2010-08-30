object form_Config: Tform_Config
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Configure Custom Help'
  ClientHeight = 591
  ClientWidth = 742
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Tabs: TPageControl
    Left = 0
    Top = 0
    Width = 664
    Height = 591
    ActivePage = TabSheet7
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'General'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label1: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 534
        Width = 626
        Height = 26
        Cursor = crHandPoint
        Align = alBottom
        Caption = 
          'go to the discussion thread at www.delphipraxis.net to receive h' +
          'elp or post provider URLs (German and English spoken)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        WordWrap = True
        OnClick = Label1Click
      end
      object rgDisplayLocation: TRadioGroup
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 650
        Height = 182
        Align = alTop
        Caption = 'Where to display help?'
        TabOrder = 0
      end
      object GroupBox2: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 191
        Width = 650
        Height = 337
        Align = alClient
        Caption = 'Result order'
        TabOrder = 1
        object lbOrder: TListBox
          AlignWithMargins = True
          Left = 5
          Top = 18
          Width = 640
          Height = 314
          Hint = 'Use drag and drop to rearrange items'
          Align = alClient
          DragMode = dmAutomatic
          ExtendedSelect = False
          ItemHeight = 13
          TabOrder = 0
          OnDragDrop = lbOrderDragDrop
          OnDragOver = lbOrderDragOver
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Microsoft Help 2.x'
      ImageIndex = 1
      object lvNamespaces: TListView
        AlignWithMargins = True
        Left = 3
        Top = 31
        Width = 650
        Height = 486
        Align = alClient
        Checkboxes = True
        Columns = <
          item
            Caption = 'Help namespace'
            Width = 200
          end
          item
            AutoSize = True
            Caption = 'Description'
          end
          item
          end>
        TabOrder = 0
        ViewStyle = vsReport
      end
      object Panel4: TPanel
        Left = 0
        Top = 520
        Width = 656
        Height = 43
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object Label4: TLabel
          Left = 6
          Top = 22
          Width = 176
          Height = 13
          Caption = 'Trim namespaces until result is found'
        end
        object cbFullTextSearch: TCheckBox
          Left = 6
          Top = 3
          Width = 579
          Height = 17
          Caption = 
            'Perform fulltext search ... this may be slow (if unchecked only ' +
            'index searches are performed)'
          TabOrder = 0
        end
        object cbTrimNamespacesHX: TComboBox
          Left = 192
          Top = 19
          Width = 145
          Height = 21
          Hint = 
            'Example:'#13#10'Full Keyword is  Classes.TStringList.Create'#13#10'Trim Firs' +
            't searches for TStringList.Create'#13#10'Trim Full searches for Create'
          Style = csDropDownList
          ItemHeight = 0
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
      end
      inline fccMSHelp: TFrameConfigColor
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 650
        Height = 22
        Align = alTop
        AutoSize = True
        TabOrder = 2
        TabStop = True
        ExplicitLeft = 3
        ExplicitTop = 3
        ExplicitWidth = 650
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Static Web based providers'
      ImageIndex = 2
      inline FrameConfigWebBasedProviders: TFrameConfigProviders
        Left = 0
        Top = 28
        Width = 656
        Height = 535
        Align = alClient
        TabOrder = 0
        TabStop = True
        ExplicitTop = 28
        ExplicitWidth = 656
        ExplicitHeight = 535
        inherited pnlOHSItem: TPanel
          Top = 441
          Width = 656
          ExplicitTop = 441
          ExplicitWidth = 656
          DesignSize = (
            656
            94)
          inherited BtnBrowseForFile: TSpeedButton
            Left = 626
            ExplicitLeft = 626
          end
          inherited edName: TEdit
            Width = 558
            Height = 21
            ExplicitWidth = 558
            ExplicitHeight = 21
          end
          inherited edDesc: TEdit
            Width = 558
            Height = 21
            ExplicitWidth = 558
            ExplicitHeight = 21
          end
          inherited edURL: TEdit
            Width = 531
            Height = 21
            ExplicitWidth = 531
            ExplicitHeight = 21
          end
          inherited cbTrimNamespacesOHS: TComboBox
            ItemHeight = 0
          end
        end
        inherited ListView1: TListView
          Width = 650
          Height = 435
          ExplicitWidth = 650
          ExplicitHeight = 435
        end
      end
      inline fccWebProvider: TFrameConfigColor
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 650
        Height = 22
        Align = alTop
        AutoSize = True
        TabOrder = 1
        TabStop = True
        ExplicitLeft = 3
        ExplicitTop = 3
        ExplicitWidth = 650
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'File based providers'
      ImageIndex = 3
      inline FrameConfigFileBasedProviders: TFrameConfigProviders
        Left = 0
        Top = 80
        Width = 656
        Height = 483
        Align = alClient
        TabOrder = 0
        TabStop = True
        ExplicitTop = 80
        ExplicitWidth = 656
        ExplicitHeight = 483
        inherited pnlOHSItem: TPanel
          Top = 389
          Width = 656
          ExplicitTop = 389
          ExplicitWidth = 656
          inherited BtnBrowseForFile: TSpeedButton
            Left = 626
            ExplicitLeft = 626
          end
          inherited edName: TEdit
            Width = 558
            Height = 21
            ExplicitWidth = 558
            ExplicitHeight = 21
          end
          inherited edDesc: TEdit
            Width = 558
            Height = 21
            ExplicitWidth = 558
            ExplicitHeight = 21
          end
          inherited edURL: TEdit
            Width = 531
            Height = 21
            ExplicitWidth = 531
            ExplicitHeight = 21
          end
          inherited cbTrimNamespacesOHS: TComboBox
            ItemHeight = 0
          end
        end
        inherited ListView1: TListView
          Width = 650
          Height = 383
          ExplicitWidth = 650
          ExplicitHeight = 383
        end
      end
      object GroupBox1: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 31
        Width = 650
        Height = 46
        Align = alTop
        Caption = 'Filetype specific options'
        TabOrder = 1
        object cbCheckGID: TCheckBox
          AlignWithMargins = True
          Left = 5
          Top = 18
          Width = 640
          Height = 16
          Align = alTop
          Caption = 
            'check winhelp sources (*.hlp files) if keyword is valid (help re' +
            'quest may be a bit slower)'
          TabOrder = 0
        end
      end
      inline fccFileProvider: TFrameConfigColor
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 650
        Height = 22
        Align = alTop
        AutoSize = True
        TabOrder = 2
        TabStop = True
        ExplicitLeft = 3
        ExplicitTop = 3
        ExplicitWidth = 650
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Dynamic Web based providers (RSS)'
      ImageIndex = 4
      inline FrameConfigRSSProviders: TFrameConfigProviders
        Left = 0
        Top = 28
        Width = 656
        Height = 535
        Align = alClient
        TabOrder = 0
        TabStop = True
        ExplicitTop = 28
        ExplicitWidth = 656
        ExplicitHeight = 535
        inherited pnlOHSItem: TPanel
          Top = 441
          Width = 656
          ExplicitTop = 441
          ExplicitWidth = 656
          inherited BtnBrowseForFile: TSpeedButton
            Left = 628
            ExplicitLeft = 628
          end
          inherited edName: TEdit
            Width = 560
            Height = 21
            ExplicitWidth = 560
            ExplicitHeight = 21
          end
          inherited edDesc: TEdit
            Width = 560
            Height = 21
            ExplicitWidth = 560
            ExplicitHeight = 21
          end
          inherited edURL: TEdit
            Width = 533
            Height = 21
            ExplicitWidth = 533
            ExplicitHeight = 21
          end
          inherited cbTrimNamespacesOHS: TComboBox
            ItemHeight = 0
          end
        end
        inherited ListView1: TListView
          Width = 650
          Height = 435
          ExplicitWidth = 650
          ExplicitHeight = 435
        end
        inherited OpenDialog1: TOpenDialog
          Left = 600
          Top = 24
        end
      end
      inline fccRSSProvider: TFrameConfigColor
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 650
        Height = 22
        Align = alTop
        AutoSize = True
        TabOrder = 1
        TabStop = True
        ExplicitLeft = 3
        ExplicitTop = 3
        ExplicitWidth = 650
      end
    end
    object TabSheet6: TTabSheet
      Caption = '3rd party providers'
      ImageIndex = 5
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 656
        Height = 563
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        object FlowPanel1: TFlowPanel
          Left = 0
          Top = 0
          Width = 656
          Height = 41
          Align = alTop
          AutoSize = True
          BevelOuter = bvNone
          TabOrder = 0
        end
      end
    end
    object TabSheet7: TTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Windows Search'
      ImageIndex = 6
      object ScrollBox2: TScrollBox
        Left = 0
        Top = 79
        Width = 656
        Height = 484
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        object FlowPanel2: TFlowPanel
          Left = 0
          Top = 0
          Width = 656
          Height = 22
          Align = alTop
          AutoSize = True
          BevelOuter = bvNone
          TabOrder = 0
        end
      end
      object ToolBar1: TToolBar
        Left = 0
        Top = 28
        Width = 656
        Height = 51
        ButtonHeight = 44
        ButtonWidth = 31
        Caption = 'ToolBar1'
        Images = ImageList1
        ShowCaptions = True
        TabOrder = 1
        object ToolButton1: TToolButton
          Left = 0
          Top = 0
          Caption = 'Add'
          ImageIndex = 0
          OnClick = ToolButton1Click
        end
      end
      inline fccWinSearch: TFrameConfigColor
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 650
        Height = 22
        Align = alTop
        AutoSize = True
        TabOrder = 2
        TabStop = True
        ExplicitLeft = 3
        ExplicitTop = 3
        ExplicitWidth = 650
      end
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 667
    Top = 3
    Width = 72
    Height = 585
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    object Button1: TButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 66
      Height = 26
      Align = alTop
      Caption = '&OK'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      AlignWithMargins = True
      Left = 3
      Top = 35
      Width = 66
      Height = 26
      Align = alTop
      Cancel = True
      Caption = '&Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object ImageList1: TImageList
    Height = 24
    Width = 24
    Left = 480
    Top = 392
    Bitmap = {
      494C0101010030004C0018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000001800000001002000000000000024
      000000000000000000000000000000000000000000000000000000000000AD7B
      7B00B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B584840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AD73
      8400EFDEC600F7E7C600F7DEBD00F7DEB500F7D6B500F7D6AD00F7D6A500EFCE
      9C00EFCE9C00EFCE9400EFCE9400EFCE9400EFCE9400EFCE9400EFCE9400EFCE
      9400EFCE9400B584840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AD73
      8400EFDEC600F7E7C600F7DEC600F7DEBD00F7D6B500F7D6AD00F7D6AD00EFCE
      A500EFCE9C00EFCE9C00EFCE9400EFCE9400EFCE9400EFCE9400EFCE9400EFCE
      9400EFCE9400B584840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AD73
      8400F7DECE00F7E7CE00F7DEC600F7DEC600F7DEBD00F7D6B500F7D6AD00F7D6
      AD00EFCEA500EFCE9C00EFCE9C00EFCE9400EFCE9400EFCE9400EFCE9400EFCE
      9400EFCE9400B584840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AD73
      8400F7E7CE00F7E7D600F7E7CE00F7DEC600F7DEBD00F7DEBD00F7D6B500F7D6
      AD00F7D6AD00EFCEA500EFCE9C00EFCE9C00EFCE9400EFCE9400EFCE9400EFCE
      9400EFCE9400B584840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AD73
      8400F7E7D600F7EFDE00F7E7D600F7E7CE00F7DEC600F7DEC600F7DEBD00F7D6
      B500F7D6AD00F7D6AD00EFCEA500EFCE9C00EFCE9C00EFCE9400EFCE9400EFCE
      9400EFCE9400B584840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AD7B
      8400F7E7DE00F7EFDE00F7E7D600F7E7CE00F7E7CE00F7DEC600F7DEC600F7DE
      BD00F7D6B500F7D6AD00F7D6AD00EFCEA500EFCE9C00EFCE9C00EFCE9400EFCE
      9400EFCE9400B584840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B57B
      8400F7EFE700F7EFE700F7EFDE00F7E7D600F7E7CE00F7E7CE00F7DEC600F7DE
      BD00F7DEBD00F7D6B500F7D6AD00F7D6AD00EFCEA500EFCE9C00EFCE9C00EFCE
      9400EFCE9400B584840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B584
      8400F7EFE700FFF7EF00F7EFE700F7EFDE00F7E7D600F7E7D600F7E7CE00F7DE
      C600F7DEBD00F7DEBD00F7D6B500F7D6AD00F7D6AD00EFCEA500EFCE9C00EFCE
      9C00EFCE9400B584840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD84
      8400F7EFEF00FFF7EF00F7EFE700F7EFE700F7EFDE00F7E7D600F7E7CE00F7E7
      CE00F7DEC600F7DEBD00F7DEBD00F7D6B500F7D6AD00F7D6AD00EFCEA500EFCE
      9C00EFCE9400B584840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD84
      8C00FFF7F700FFFFF700FFF7EF00F7EFE700F7EFE700F7EFDE00F7E7D600F7E7
      CE00F7E7CE00F7DEC600F7DEC600F7DEBD00F7D6B500F7D6AD00F7D6AD00EFCE
      A500EFCE9C00B584840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C68C
      8C00FFF7F700FFFFFF00FFF7F700FFF7EF00F7EFE700F7EFE700F7EFDE00F7E7
      D600F7E7CE00F7E7CE00F7DEC600F7DEBD00F7DEBD00F7D6B500F7D6AD00F7D6
      AD00EFCEA500B584840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C68C
      8C00FFF7F700FFFFFF00FFFFFF00FFF7F700FFF7EF00F7EFE700F7EFE700F7EF
      DE00F7E7D600F7E7CE00F7E7CE00F7DEC600F7DEBD00F7DEBD00F7D6B500F7D6
      AD00EFCEA500B584840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C68C
      8C00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7EF00F7EFE700F7EF
      E700F7EFDE00F7E7D600F7E7CE00F7E7CE00F7DEC600F7DEBD00F7DEBD00F7D6
      B500F7D6AD00B584840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE94
      8C00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7EF00F7EF
      E700F7EFE700F7EFDE00F7E7D600F7E7CE00F7E7CE00F7DEC600F7DEBD00F7DE
      BD00DEC6A500A57B840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE94
      8C00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7
      EF00F7EFE700F7EFE700F7EFDE00F7E7D600F7E7CE00F7E7CE00EFD6BD00CEBD
      AD00B5AD94009C7B840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D69C
      9400FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7
      F700FFF7EF00F7EFE700F7EFDE00F7EFDE00F7EFDE00E7DECE00CEBDAD00BDB5
      A500B5AD9C009C7B840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D69C
      9400FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFF7F700FFF7EF00FFF7E700EFDED600B5847300AD847300AD7B7300AD7B
      7300AD7B7300AD7B730000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DEA5
      9400FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7F700FFF7EF00E7CEC600B5847300E7B58400E7AD6B00EFA5
      5200EFA53900B584840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DEA5
      9400FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700E7CEC600B5847300EFC68C00F7BD6B00FFB5
      5200B58484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DEA5
      9400FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00B5847300EFC68C00F7BD6B00B584
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DEA5
      9400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E7D6D600B5847300EFC68C00B58484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DEA5
      8C00E7CEBD00EFD6BD00EFD6BD00EFCEC600E7CEBD00E7CEBD00E7CEBD00E7CE
      BD00DEC6BD00DEC6BD00DEC6BD00CEADA500B5847300B5848400000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000180000000100010000000000200100000000000000000000
      000000000000000000000000FFFFFF00E00003000000000000000000E0000300
      0000000000000000E00003000000000000000000E00003000000000000000000
      E00003000000000000000000E00003000000000000000000E000030000000000
      00000000E00003000000000000000000E00003000000000000000000E0000300
      0000000000000000E00003000000000000000000E00003000000000000000000
      E00003000000000000000000E00003000000000000000000E000030000000000
      00000000E00003000000000000000000E00003000000000000000000E0000300
      0000000000000000E00003000000000000000000E00007000000000000000000
      E0000F000000000000000000E0001F000000000000000000E0003F0000000000
      00000000FFFFFF00000000000000000000000000000000000000000000000000
      000000000000}
  end
end
