object form_Main: Tform_Main
  Left = 0
  Top = 0
  Caption = 'form_Main'
  ClientHeight = 641
  ClientWidth = 938
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 533
    Top = 0
    Height = 641
    Align = alRight
    ExplicitLeft = 494
    ExplicitTop = 15
  end
  object pan_Client: TPanel
    Left = 0
    Top = 0
    Width = 533
    Height = 641
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = -3
    ExplicitTop = -3
    ExplicitWidth = 661
    object Splitter2: TSplitter
      Left = 0
      Top = 253
      Width = 533
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      ExplicitTop = 0
      ExplicitWidth = 384
    end
    object gb_Result: TGroupBox
      Left = 0
      Top = 256
      Width = 533
      Height = 385
      Align = alBottom
      Caption = 'Result'
      TabOrder = 0
      object ed_Result: TJvHLEditor
        Left = 2
        Top = 46
        Width = 529
        Height = 337
        Cursor = crIBeam
        GutterWidth = 0
        RightMarginColor = clSilver
        Completion.ItemHeight = 13
        Completion.Interval = 800
        Completion.ListBoxStyle = lbStandard
        Completion.CaretChar = '|'
        Completion.CRLF = '/n'
        Completion.Separator = '='
        TabStops = '3 5'
        BracketHighlighting.StringEscape = #39#39
        SelForeColor = clHighlightText
        SelBackColor = clHighlight
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabStop = True
        UseDockManager = False
        Colors.Comment.Style = [fsItalic]
        Colors.Comment.ForeColor = clOlive
        Colors.Comment.BackColor = clWindow
        Colors.Number.ForeColor = clNavy
        Colors.Number.BackColor = clWindow
        Colors.Strings.ForeColor = clPurple
        Colors.Strings.BackColor = clWindow
        Colors.Symbol.ForeColor = clBlue
        Colors.Symbol.BackColor = clWindow
        Colors.Reserved.Style = [fsBold]
        Colors.Reserved.ForeColor = clWindowText
        Colors.Reserved.BackColor = clWindow
        Colors.Identifier.ForeColor = clWindowText
        Colors.Identifier.BackColor = clWindow
        Colors.Preproc.ForeColor = clGreen
        Colors.Preproc.BackColor = clWindow
        Colors.FunctionCall.ForeColor = clWindowText
        Colors.FunctionCall.BackColor = clWindow
        Colors.Declaration.ForeColor = clWindowText
        Colors.Declaration.BackColor = clWindow
        Colors.Statement.Style = [fsBold]
        Colors.Statement.ForeColor = clWindowText
        Colors.Statement.BackColor = clWindow
        Colors.PlainText.ForeColor = clWindowText
        Colors.PlainText.BackColor = clWindow
        ExplicitLeft = 3
        ExplicitTop = 45
      end
      object EffectPNGToolBar2: TEffectPNGToolBar
        Left = 2
        Top = 15
        Width = 529
        Height = 31
        ButtonHeight = 28
        ButtonWidth = 28
        Caption = 'EffectPNGToolBar2'
        Indent = 5
        TabOrder = 1
        ImageEffectDefault.GammaValue = 1.000000000000000000
        ImageEffectDisabled.GammaValue = 1.000000000000000000
        ExplicitLeft = 3
        ExplicitTop = 9
        ExplicitWidth = 513
        object btn_SaveResult: TEffectPNGToolButton
          Left = 5
          Top = 0
          Hint = 'Save result'
          ParentShowHint = False
          ShowHint = True
          OnClick = btn_SaveResultClick
          Image.Data = {
            89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
            3B0000000467414D410000AFC837058AE90000001974455874536F6674776172
            650041646F626520496D616765526561647971C9653C000005094944415478DA
            8D546D4C9367143D6F5B4AC1A228DF956080A18B0E0D08D3455D5130A8306182
            4E0CC42906EA94982C0A31F1870667425834A2C64C05212A43513204F91A7E4F
            14177001B7CE598DA29502BA80D4B6B47DDBDDE79935383FE693DCBCE9D3F73D
            E7DE73EFB902DE3C4245C52F0EBDBE0F172E1C9C2893C98CFDFDFDE6B0B030C7
            E9D3A71DF4BF131F7084FF5EA8D56AD9C28579B665CBE6E1D4A98B90C9E4080C
            F4C59123F9C11289E4B9854E6767A7F892C0F9A1C04269E915878F8F372222FC
            D1D2F21BA4520946466C3018FAE1E1E18980005F1C38B0414524C30A8562E45D
            24AF01A7A7A74BA74E4DB7AF5811C77FD7D7DF447EFE17E8EB33A2ACEC023C3D
            15181C3442AF3740229122385885D2D2BC20B3D93C4C728DD0272EA99CAF0147
            4747BB25267E6B5DB52A1E67CFB6233B3B1EFEFECAD74AEAED1DC6FEFD4D1004
            01168B95487A316E9C37542A3FAA645D20DDB39E5846030B2525AD8EF0F020CA
            643C8E1E6DC2EEDD5FBFAD0DAF8E5E3F84E2E23A389D4EF8FA7AA3A3E30FF8F9
            F9A2AA6A53E0E8AF24050527C48C8CF9BC9A3367DAB06347FA7B3BCF00EF0FBC
            40D1B61F31716200162D9A81C2C213B87871E767AF80990CB3676BAC2B5726A0
            B1F126F2F296D03478FDEF58E5E61EC1A4492A2E4B5CDC3492A916D7AE9D4B72
            010BBB76D5D3348CC594292A1C3BD68CDD7BD6C14B297F2FA8CD66C7F2E5C598
            39F313CC99F33149578DCB9777AD1645F121073E78F0925B5797CEAA564751B7
            05D4D55DC1E4C961D8BA35897E4BDE09FCE8D120B66F3F493D09446A6A0C0A0A
            0EE3C99387993A5DE52D57C6B2CCCCBDB68484591CD84143F3ECD910EEDDD3D3
            F36F32CD4C6834EA3780B3B37F40484810AC563B162C88444949CD705B5BDDAA
            172F3ABA19B0B06D5B8D43A170878F8F17394DC24749141DBC396E6E6E78FC78
            003D3D064E121F3F0B1B36C4F16C359AFD888A9AC6418B8BAB4886EFB208AF87
            CCA965C092B4B46271EEDC289E457B7B374C2613352E0033667CC409583032BB
            5D447FFF209E3E1DE44E64A0EC3019D6AFFF1E5A6D4B9ACD764F6BB55AB9C6B2
            D4D4225B6C6C248C4613D9D69D5E9A4F3ADF4643C3359EF1F8F163C9CA13A050
            C861365B492A276F1C236232A4A47C8A7DFB7EC2F5EB3FA7180CCDB708D3206C
            DE5CC52A264039EEDFD723317116B2B262313C3CC201989D6B6B3B69846E71B3
            444646705051FC173C39398664384932ECCC72381C3D76BBFD4F7AF199101B9B
            E754ABE710B3483AEA71FCF82692C286A1210B91B9F1301A47E8FE3ABABAEE92
            144F29730555E0C777C79A35F3697ACA48868EAF06069A6E331908D824AC5D7B
            D8D9DBDB87D0D0109A8207A8AECE27AB3EE7DA592C361E26939DD66623A64F8F
            E0E5B7B6B6213C3C943B3423438DF2F25672EADE648BE54E375B276CC405A552
            E99F9D7DA84FA77B481FD9692A6424C5229A4D6F0265258BE8EE7E444BFF57C4
            C44CA3853306376EFCCE27262767098A8A2A71E952611635F7950C14226B9E07
            951644CF607A794C6E6E59838B442A9562F5EAC5A8A868C4BC79D1442A457373
            1B8DE504D2DF812D5BBEC4C68D7B89F85C1A65AB250C2683D9B53699B5DC2994
            1E1E1E0ACA50496EF32712CF9C9CD286BB775D9548B174E9E764F77A5A38AA97
            192FC69E3D35387FBE2CC966D331190C4C068CDA89C2CB60246C418C616472B9
            DC8B32F363956834E5BC1236098C843DD9B97AB522CB6E7FC032BDE3926134F0
            E8F356125611851FC9A3CCCD2D6FD06A75080A0A4065E5372974FF17739C4B06
            06F20F4D5164697E09071D0000000049454E44AE426082}
        end
      end
    end
    object gb_Source: TGroupBox
      Left = 0
      Top = 0
      Width = 533
      Height = 253
      Align = alClient
      Caption = 'Source'
      TabOrder = 1
      ExplicitLeft = -1
      ExplicitTop = -3
      object ed_Source: TJvHLEditor
        Left = 2
        Top = 46
        Width = 529
        Height = 205
        Cursor = crIBeam
        GutterWidth = 0
        RightMarginColor = clSilver
        Completion.ItemHeight = 13
        Completion.Interval = 800
        Completion.ListBoxStyle = lbStandard
        Completion.CaretChar = '|'
        Completion.CRLF = '/n'
        Completion.Separator = '='
        TabStops = '3 5'
        BracketHighlighting.StringEscape = #39#39
        SelForeColor = clHighlightText
        SelBackColor = clHighlight
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabStop = True
        UseDockManager = False
        Colors.Comment.Style = [fsItalic]
        Colors.Comment.ForeColor = clOlive
        Colors.Comment.BackColor = clWindow
        Colors.Number.ForeColor = clNavy
        Colors.Number.BackColor = clWindow
        Colors.Strings.ForeColor = clPurple
        Colors.Strings.BackColor = clWindow
        Colors.Symbol.ForeColor = clBlue
        Colors.Symbol.BackColor = clWindow
        Colors.Reserved.Style = [fsBold]
        Colors.Reserved.ForeColor = clWindowText
        Colors.Reserved.BackColor = clWindow
        Colors.Identifier.ForeColor = clWindowText
        Colors.Identifier.BackColor = clWindow
        Colors.Preproc.ForeColor = clGreen
        Colors.Preproc.BackColor = clWindow
        Colors.FunctionCall.ForeColor = clWindowText
        Colors.FunctionCall.BackColor = clWindow
        Colors.Declaration.ForeColor = clWindowText
        Colors.Declaration.BackColor = clWindow
        Colors.Statement.Style = [fsBold]
        Colors.Statement.ForeColor = clWindowText
        Colors.Statement.BackColor = clWindow
        Colors.PlainText.ForeColor = clWindowText
        Colors.PlainText.BackColor = clWindow
        ExplicitLeft = 3
        ExplicitTop = 45
        ExplicitHeight = 269
      end
      object EffectPNGToolBar1: TEffectPNGToolBar
        Left = 2
        Top = 15
        Width = 529
        Height = 31
        ButtonHeight = 28
        ButtonWidth = 28
        Caption = 'EffectPNGToolBar1'
        Indent = 5
        TabOrder = 1
        ImageEffectDefault.GammaValue = 1.000000000000000000
        ImageEffectDisabled.GammaValue = 1.000000000000000000
        object btn_LoadSource: TEffectPNGToolButton
          Left = 5
          Top = 0
          Hint = 'Open source file'
          ParentShowHint = False
          ShowHint = True
          OnClick = btn_LoadSourceClick
          Image.Data = {
            89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
            3B0000000467414D410000AFC837058AE90000001974455874536F6674776172
            650041646F626520496D616765526561647971C9653C0000045E4944415478DA
            B5955B6C145518C7FFD376E99DB6124AA4EDD2525A480029442E4ABDD62A57A5
            E5C5788990E0032104340A311ADB063528D6B4DA40042B90589007B12F8D3EA0
            8917A4C5920A145796DDDAEE767BD9D96D67BB97B9CFF19B19B204EB0B31DDE4
            E49C99C9F99DEFFCBFEFFF2DC718C34CFCB81903DFEB86038D3DA586C64E3A66
            A55445A34A59DB916AE17F830F36F5EC2F989DD1F0DCE6F27C872305CD6DBD9D
            C79A1FADBB672938CE3EF79DF72E57E9064ED63CE2AC7A68CD3CC4E31A4CF0D9
            F35EF4F68DD67DD9F658E7B4BDCE1D2EB6EDF1421806A0E880AA195034E09BEF
            0282D8B5A2A0E1706F6369717EC3D3350B9097EB80A631A8AA6ECD1919A978FB
            FD6E213225979D39F1E45D9270D56F0EB096C632C80493086C42651508DC1231
            74C98DEDB5257870E57D04A36F0AA0EB77C0E66D3DFE180EB55EEDBCD0CFBD86
            EB4F0C26C1EBDFF0B2D6A68549702201F87B02C8D1246CDF5A8EAC4C1306024D
            07EBA44F76B6039F7DD18F9FAE84EA7E3C579394845BF7BA87B51D2AB7C0637F
            8B08F40E626B6D294A9D99C96BFD17981754B47C3B0E0A9B9E0D5CF8D93F383C
            CE9DB634A577DCEA7D1E76EC031BECFE6D1C0F14A563D5F2FCBB12F16FB009AD
            3DE8C253D5F3B1B024C76299D147E37A54D5207CDAFC7B2EB76AAF871D3F6C83
            3D3E868EF67EAC5D5D044630DDD0AD0D54B73008A8DD5E77754FA07E8313B3E6
            E6E3CA102C707A0670B52F82E11F3C5E40B8CEADD8738BB57FB4C8021F690FA2
            30DD40EDD22C14CCCD42C26010157390F6224382AE2C49405A9A03B2230D9707
            EC447329407454445F975B976393F442DBC52DDBED66A73EAEB0C01B76F4C3DD
            B10CE1A08ABC390E1839001FB5C7D028E560020851518522C084A023C4CB4884
            6318BB118430121720717EE4461723C558CC2D79D5CDBE6AA9C0F717455CFC95
            C7D94627C629AABFDC532874CEC6CD6192888A688CD7C087748C87CC59434210
            210971024E82D1AD1035DC48A36C64C764789F59C955EEBAC9CEB456E2AD4F02
            A85F9387676B72E0A108DD7E8A8AD761B054F0130CA1B009551124789057C1FB
            26A1264823503D4FC924ABEC46BA988B74E938063636728B76BAD8E71F2EC18B
            FB6EC0D5B1147D216094C01371607840A566924AD986152D1FD630E893E0F725
            C02861669918247A129C152D267DD76368E31F5CD92B2EF67C5D11BCAE089AF6
            1423465A474558304160888415AA060E93931A4649A320AF20411C4396612444
            68B2029122E7C34AD8E78F44E1DB546619A4E4A53F59F1FC4C1CA89F876D6BEF
            98C2B4B02419961964CAAC39146A260A795E92ECB53DDBEBF3BF4470FA1C7F0A
            FECD3B2DF09CFA6B6C960318F97AF934539886B0413A1D60C2F5DB07D86B4952
            AD83CDEFFB8F06E0BD16AB43604BA7DD8FD75D62BB5F5880A37BEF9FD63615AB
            7E55EBAAD62CCA34546A9B0A2492421255CBCE321DFAF2BB3C95CFA6647FE7F0
            7037ABACC8417E762A2584592E82351B96EB74DAA8919F756AA7BAA6D29A1A10
            4569D0B3393372673CC12007592746B6249BFE8CFDE7FD03CEB9E93906FAE486
            0000000049454E44AE426082}
        end
      end
    end
  end
  object pan_right: TPanel
    Left = 536
    Top = 0
    Width = 402
    Height = 641
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    object gb_RegList: TGroupBox
      Left = 0
      Top = 0
      Width = 402
      Height = 641
      Align = alTop
      Caption = 'Expressions'
      TabOrder = 0
      ExplicitWidth = 447
      object lv_Expressions: TListView
        Left = 2
        Top = 44
        Width = 398
        Height = 595
        Align = alClient
        Checkboxes = True
        Columns = <
          item
            Caption = 'Aktiv'
            Width = 40
          end
          item
            Caption = 'Expression'
            Width = 200
          end
          item
            Caption = 'Replace by'
            Width = 150
          end>
        ReadOnly = True
        RowSelect = True
        SortType = stData
        TabOrder = 0
        ViewStyle = vsReport
        OnCompare = lv_ExpressionsCompare
        OnDblClick = lv_ExpressionsDblClick
        ExplicitWidth = 443
      end
      object EffectPNGToolBar3: TEffectPNGToolBar
        Left = 2
        Top = 15
        Width = 398
        Height = 29
        ButtonHeight = 28
        ButtonWidth = 28
        Caption = 'EffectPNGToolBar3'
        Indent = 5
        TabOrder = 1
        ImageEffectDefault.GammaValue = 1.000000000000000000
        ImageEffectDisabled.GammaValue = 1.000000000000000000
        ExplicitLeft = 3
        ExplicitTop = 9
        object btn_LoadExpression: TEffectPNGToolButton
          Left = 5
          Top = 0
          Hint = 'Load list of expressions ...'
          ParentShowHint = False
          ShowHint = True
          OnClick = btn_LoadExpressionClick
          Image.Data = {
            89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
            3B0000000467414D410000AFC837058AE90000001974455874536F6674776172
            650041646F626520496D616765526561647971C9653C0000045D4944415478DA
            B5955B6C145518C7FFD376E99DB62A25D27669292D2480142217A55E6B95ABD2
            F262BC4448F08110021A85188D6D831A146B5A6D208215482CC883D897461FD0
            C40BD26249058A2BCB6E6D77BBBDECECB6B3DDCBDCE7F8CD0C5982F585986E72
            72CECCE4FCCE77FEDFF7FF96638C61267EDC8C81EF76C3FEC69E524363271CB3
            52AAA251A5ACED70B5F0BFC1079A7AF615CCCE68786E5379BEC39182E6B6DECE
            A3CD8FD6DDB5141C679FFBCE7B97AA7403276A1E71563DB47A2EE2710D26F8CC
            392F7AFB46EBBE6C7BAC73DA5EE77617DBFA78210C03507440D50C281AF0CD77
            0141EC5A5ED070A8B7B1B438BFE1E99AF9C8CB7540D3185455B7E68C8C54BCFD
            7EB7109992CB4E1F7FF20E49B8EA3707584B63196482490436A1B20A046E8A18
            BAE8C6B6DA123CB8E21E82D13705D0F5DB60F3B61E7F0C075BAF749EEFE75EC3
            B5270693E0756F78596BD38224389100FC3D01E46812B66D294756A6090381A6
            8375D2273BDB81CFBEE8C74F9743753F9EAD494AC2AD7DDDC3DA0E965BE0B1BF
            45047A07B1A5B614A5CECCE4B5FE0BCC0B2A5ABE1D07854DCF06CEFFEC1F1C1E
            E74E599AD23B6ED55E0F3BFA810D76FF368E078AD2B17259FE1D89F837D884D6
            1E70E1A9EA7958509263B1CCE8A3713DAA6A103E6DFE3D975BB9C7C38E1DB2C1
            1E1F43477B3FD6AC2A0223986EE8D606AA5B1804D46EADBBBA2750BFDE895973
            F271790816383D03B8D217C1F00F1E2F205CE396EFBEC9DA3F5A68810FB70751
            986EA07649160AE664216130888A39487B912141579624202DCD01D991864B03
            76A2B914203A2AA2AFCBADCBB1497AA1EDE496EE72B3931F5758E0F5DBFBE1EE
            588A705045DEBD0E1839001FB5C7D028E560020851518522C084A023C4CB4884
            6318BB1E8430121720717EE4461721C558C42D7ED5CDBE6AA9C0F717445CF895
            C7994627C629AABFDC532874CEC68D6192888A688CD7C087748C87CC59434210
            210971024E82D1AD1035DC48A36C64C764789F59C155EEBCC14EB756E2AD4F02
            A85F9D87676B72E0A108DD7E8A8AD761B054F0130CA1B009551124789057C1FB
            26A1264823503D4FC924ABEC46BA988B74E918063634720B77B8D8E71F2EC68B
            7BAFC3D5B1047D216094C01371607840A566924AD986152D1FD630E893E0F725
            C02861669918247A129C152D267DD76168C31F5CD92B2EF67C5D11BCAE089A76
            1723465A474558304160888415AA060E93931A4649A320AF20411C4396612444
            68B2029122E7C34AD8E78F44E1DB586619A4E4A53F59F1BC4CECAF9F8BAD6B6E
            9BC2B4B02419961964CAAC39146A260A795E92ECB53DDBEB73BF4470EA2C7F12
            FE4D3B2CF07DF55799C3018C7CBD6C9A294C43D8209D0E30E1FAAD03ECB524A9
            D6C1E6F77D4702F05E8DD521B0B9D3EEC76B2FB25D2FCCC7913DF74F6B9B8A55
            BFAA75556B16651A2AB54D0512492189AA6567990E7DF95D9ECA6763B2BF7378
            B89B5556E4203F3B9512C22C17C19A0DCB753A6DD4C8CF3AB5535D53694D0D88
            A234CC67732677C6130C729075626473B2E9CFD87FDE3FCEC1E939A573FB9F00
            00000049454E44AE426082}
        end
        object btn_SaveExpressions: TEffectPNGToolButton
          Left = 33
          Top = 0
          Hint = 'Save list of expressions ...'
          ParentShowHint = False
          ShowHint = True
          OnClick = btn_SaveExpressionsClick
          Image.Data = {
            89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
            3B0000000467414D410000AFC837058AE90000001974455874536F6674776172
            650041646F626520496D616765526561647971C9653C000005094944415478DA
            8D547F4C5367143DAF2DB5605194DF856880A18B0E0D08D3055D5130F86BC204
            9D1808530CD42931591462E21F1A9D0961D1881AB3090851190A9A2908E21050
            A7880BB8805BE7AC46D14A015D40BAB6B47DEDEEF78D129C3FE697DCBCF4EB7B
            E7DC7BEE3D57C0EB47282FFFD9A1D7F7A2A9E968904C2633F6F5F5994343431D
            D5D5D50EFADF89F738C27F2FD46AB56CF1E25CDBAA550B70E64C336432390202
            7C505C9C172C91485E5AE8747474882304CEF705164A4AAE39BCBDBD101EEE87
            CB977F85542AC1F0B00D06431FDCDD3DE0EFEF83234736AB886448A1500CBF8D
            E415E0D4D454E98C19A9F6356BE2F8EFDADADBC8CBFB0CBDBD46949636C1C343
            81810123F47A032412298283552829C90D349BCD4324D7307DE292CAF90A7054
            54945B62E2D7D675EBE271E1421BB2B2E2E1E7A77CA5A49E9E211C3E7C098220
            C062B112490F264EF4824AE54B956C0CA07BD613CB5860A1A8A8D11116164899
            4CC2F1E397B07FFF976F6AC3E8D1EB0751585803A7D3091F1F2FB4B7FF0E5F5F
            1F54566E0D18FB95243FFF949896B6905773F6EC4DECDE9DFACECE33C087FD7F
            A360E70F080AF2C79225B3B167CF293437EFFD641498C9306F9EC6BA766D02EA
            EB6F233777194D83E7FF8E554E4E31A64E557159E2E266924CE771E3C6C5E52E
            6061DFBE5A9A8609983E5D8513271AB0FFC046782AE5EF04B5D9EC58BDBA1073
            E67C84D8D80F49BA2A5CBDBA2F5314C5C71CF8E8D116B7CE4E9D55AD8EA46E0B
            A8A9B98669D342B163C772FA2D792BF0932703D8B5EB34F52400C9C9D1C8CF3F
            8667CF1EA7EB7415775C19CBD2D30FDA1212E67260070DCD8B178378F0404FCF
            BFC83473A0D1A85F03CECAFA0E53A604C26AB563D1A20814159D1B6A6DAD5967
            34B677316061E7CE730E85621CBCBD3DC969123E4AA2E8E0CD717373C3D3A7FD
            E8EE367092F8F8B9D8BC398E67ABD11C4664E44C0E5A585849327C934178DD64
            4E2D0396A4A4148AF3E747F22CDADABA603299A871FE983DFB034EC08291D9ED
            22FAFA06F0FCF9007722036587C9B069D3B7D06A2FA7D86C0FB456AB956B2C4B
            4E2EB0C5C444C06834916DC7D14B0B49E7BBA8ABBBC1339E346902597932140A
            39CC662B49E5E48D63444C86A4A48F71E8D08F686DFD29C96068B843980661DB
            B64A563101CAF1F0A11E89897391911183A1A1610EC0EC7CFE7C078DD01D6E96
            8888700E2A8AFF82AF58114D329C2619F666381C8E6EBBDDFE07BDF8428889C9
            75AAD5B1C42C928E7A9C3CB995A4B06170D042646E3C8CC661BA6F4567E77D92
            E23965AEA00A7CF9EE58BF7E214D4F29C9D0FE457FFFA5BB4C060236091B361C
            73F6F4F42224640A4DC1235455E591555F72ED2C161B0F93C94E6BB31EB36685
            F3F21B1B6F222C2C843B342D4D8DB2B24672EAC11516CBBD2EB64ED8880B4AA5
            D22F2BEBFB5E9DEE317D64A7A99091144B6836BD0894952CA2ABEB092DFD5F10
            1D3D9316CE78DCBAF51B9F98ECEC652828A8404BCB9E0C6AEEA80C14226B9E3B
            951648CF607A797C4E4E699D8B442A9522337329CACBEBB1604114914AD1D070
            93C67232E9EFC0F6ED9F63CB9683447C3185B2D5120693C1EC5A9BCC5AE32894
            EEEEEE0ACA50496EF323128FECEC92BAFBF75D9548B172E5A764F75A5A38AA91
            8C97E2C08173B872A574B9CDA6633218980C18B313859160246C418C676472B9
            DC9332F36595683465BC1236098C843DD9B97EBD3CC36E7FC432BDE792612CF0
            D8F346125611852FC9A3CCC929ABD36A75080CF44745C5574974FF27739C4B06
            06F20F4D596469D83832280000000049454E44AE426082}
        end
        object ToolButton3: TToolButton
          Left = 61
          Top = 0
          Width = 8
          Caption = 'ToolButton3'
          ImageIndex = 0
          Style = tbsSeparator
        end
        object btn_NewExpression: TEffectPNGToolButton
          Left = 69
          Top = 0
          Hint = 'Add expression'
          ParentShowHint = False
          ShowHint = True
          OnClick = btn_NewExpressionClick
          Image.Data = {
            89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
            3B000000097048597300000B1000000B1001AD23BD750000000467414D410000
            B18E7CFB51930000018C4944415478DA630C0FC8FFCF402458B17E0223B16A19
            FF0301310A23020B4833F8D5AB4F44199C9B564B9AC16FDE7C26CAE0EC941AD2
            0C7EF7EE0B51066726559366B072AE2CD1917767D223E20D9EF770125106B7F6
            74936670E005A3FF7FFFFD63F8F3F72FC3EFBFFF80F80FC3EFDF7F197EFDF903
            66FFFA0312FFCBF06F373B6906FB9D33FC0F32E00FD400888140FA37840663A0
            1CF37E2ED20CF63AAD073618A4F937D0D05FC88602C5FE400D673FC44B9AC1AE
            C7B5FEC30CF905B600EA7DA80F400683828AEB083F8AC13FA6CAFDE7C8C66D11
            A3C311F5FFBFA0AE85B918E6833F4003FF02E9BFC0CCC97B4C106E30C4505120
            FD9A0197E14427B72BEA101A6410C4604FA0C1DBE17C981CDC6062CA0AA046A0
            A6BF0C3F2E3133301C060AD8020DD1AB06F25B91F840F9A9CC70C3892E842086
            3B0059FA40AC05C46240FC0A88AF01F145A0FC01D25D0C02A0D26D81CB3AA8EB
            D603458C81F82CD0D5816057A387F5C01B4C7250105383805C4A4EE411E36006
            E424456C7223CA60744B086610720C46188E3B4B030046D75EE4B707980E0000
            000049454E44AE426082}
        end
        object btn_RemoveExpression: TEffectPNGToolButton
          Left = 97
          Top = 0
          Hint = 'Remove expression'
          ParentShowHint = False
          ShowHint = True
          OnClick = btn_RemoveExpressionClick
          Image.Data = {
            89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
            3B000000097048597300000B1000000B1001AD23BD750000000467414D410000
            B18E7CFB5193000000E14944415478DA630C0FC8FFCF402458B17E0223B16A19
            FF0301310A23020B4833F8D5AB4F44199C9B564B9AC16FDE7C26CAE0EC941AD2
            0C7EF7EE0B51066726559366F0665E06A223CFE7D37F1222EFC882FF0CBFFF40
            787F803488FDFB2F84FE0363FF66D8925F4FA2C1CD8EFF197EFC84F0BEFD6060
            F8FE130BFEC1B0E5D24F120DAE30FF0FD60C023083BE01F18F1F501A887FFD61
            D872EB3F8906E7E8A1198CE6EA3F7FC1525B6E931AC6092A982E06E11FBF1818
            FEFD832B24DDE010694C837FFD666040CB90241B4CBBE446ABB262D460DA1B4C
            CB1A8458B52481A1673000A0D6D2D5068B004E0000000049454E44AE426082}
        end
        object btn_EditExpression: TEffectPNGToolButton
          Left = 125
          Top = 0
          Hint = 'Edit expression'
          ParentShowHint = False
          ShowHint = True
          OnClick = btn_EditExpressionClick
          Image.Data = {
            89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
            3B0000000467414D410000AFC837058AE90000001974455874536F6674776172
            650041646F626520496D616765526561647971C9653C0000036C4944415478DA
            A5955D48536118C7FFE76CF3CCE9CABA08954C4AA38290AC20A848BA30A88B88
            BAE983A00F0ABAE88BD2E8E3A2E8830A5D96E667D68C2E32A98B02132C322947
            85549B4994E94C1A65B631756D3B1F3B3DEF191ECB96307BE181F39CF7DDEFFD
            BFFFF33CEFB8F6B79F549EE7106B88920C5194A0C811F80703C8716E0452F2D0
            F7AAC3FDBEB9FDD4AE5ED58E7F0CEEB5AB5B5D307FE65F13115545282C432628
            8BFE47A5C8CA3A02A3791D30E52806DE38D05C5850B2D9291E8C1B2C490A2482
            2A326DF2280FD3725E006D34A95A80816C34DDFB605FFD3CB83D2E301BB21255
            2B763D81E05F858430BDECA1E837C1E334A2F1797025D9D13221B042116A5A8F
            49390F00070F0455A0D38A8E702E7AD65CC0DAD54BB80981E51F3DE0DECF4682
            85A01F29BE1930DC69C4756127A4EC45DABAC3FBB772718199CF81FBDB90BCB0
            1E786D04C2A4F69D056DCE24984E3443A5F9868606149D3F1E1F5809FA20B5A4
            43C834935AFAADD700F1A3098EB403B0AED8A06D5C7FBB3E7E70A8ED248459D5
            C0074A8622407732DE3A824838F9022AA54CB1BDEE667C60A6466CCC84305720
            A00204C8DFBE24B4FAF391B6E950F44491086A6BEDF18145971DC6944BE07E50
            E293004F32BADB87C1EF69049F68D5D4B28AA9A8ACD1C11C37D5CCF65355AF14
            13CCD4CAAD4B619A43EB3EFDA45DE8A37926E3992B15D907CBA86994E83A525C
            5A5609DB455B32A5491406F69AC2AB83194CF7D67517666B1538912AC11FA265
            16B85BDCC0E63B484CCD202075A52C61686818E5E535A828AB481F7B601D1C0C
            4BFA5BDE5588846C3FF0D9474B48DD400A3A3A9290B6A3086151C4A07F10E190
            A8ADADAAB981CAAB9563C1A31EB30B47B7C2594CCABCC0601F759A004F6B2FBE
            65ED83655E2EB5B8A279CB3C6656D45CAB8B05566282C59757609DBD9C1EBA20
            7EEDC3D3EA266414D8755F47C02A593246313B46803E5E2826F87B7331A62F5E
            09D1F71D8FCF9D45C6A16A18A9126281ABAFD999C75358A5135019D78AFAD3FB
            C0A7A46246E00BD2B61C8F9E4D51FF00F33C0FB3D98C8AAA5A145F38F1EF3AFE
            1D7CFBD86E2446142CDA7B46AB80DFC1068301822068C1E66C2565E337C8CFD0
            6855B81FDEC3D465F93A941D59A44BDF6249046FE0B5BF2AAD41487DC9E5F2F1
            C1EC8AD4AB6244658401A2398B916745514099B64191AD3436D8D9E956EBEA6E
            E17F462CF02F5454458A07139F180000000049454E44AE426082}
        end
        object btn_MoveUp: TEffectPNGToolButton
          Left = 153
          Top = 0
          Hint = 'Move expression up'
          ParentShowHint = False
          ShowHint = True
          OnClick = btn_MoveUpClick
          Image.Data = {
            89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
            3B000000097048597300000B1300000B1301009A9C180000000467414D410000
            B18E7CFB51930000034A4944415478DA95954B4C53511086FF56904A0BB61A85
            46A5055F0920D254E32398C0424CD085409085C8638DAE4CAC899AE88EB2C0B0
            26B12089C6D4A02484881079C4858AD7121536400AE5511E815BB14081429D73
            6F4B5F6061929393DEDBF9CECC9C7FE64AB08D19CE209BB6325A6CD786BC1EA1
            D545ABC1F84BD8C34CB20590414C0CA84F02D292E4506B3450A935408C02FC20
            07FBF824FAC75DE06C820B0357D00123DB82097A9341D3D45016E56542967517
            48CE01A262800D37AD75C043CBE500AC5DE07BEAD0D23D887E3B1C5EF8FB30B0
            17FAAEE8A202FAF267407A3181D680BF7660691E585B12A1D2683A682FAD7DE4
            4DEE9606702DAF61E6DC0C93EF834B02D2B71054A9BF57475152599D33049D14
            A35B59D8FA22A47B80BD71C0782FB8373504DF6091EB58597CE04E4A3FFBCEE3
            2AE06C093037042CCE88CE9E0D20F620A0B94291CF02031490DB157C40742CD0
            D788C6A62FAC2C5D04CE91786FBFD3509A0955D92B11C85B450756D33835702A
            CF0F714E013F4CE170BA03BEA306C656E1B98E814D74FBE5458F6A81A44BC0D8
            57FF9F55C9C0E9EBE1256025E25E00CB73C1CFADDD30B75A985AEA19D85A9A25
            D7A61A3E00F3436244CC123282230DB5B565E07335F0C71670E01406BA5BF1F2
            1BD598C01EC3ED54A80A9F03FD6F29C515208524A62B4744634AF9F414707825
            BCBE0A9E6B86B19D54C1C055F7AF02C77381E10E209122BD561D19EAB3D545A0
            ED01653B2CFE1E6AC3C3661FB8F202A59E4E35E381C206929062E76001EE04EA
            B2C4323AA7FD60C3AD14A84EE8444D16987607F5D91352AE340ABCD3BD590A6B
            E965993635B758B855545A00997277504B3DD05441DD28C3C0986BF3F244B995
            14527DDAB7EFB248C65A1C1E987B5D9B72CB066B9082449A6034CE26BE8BDDB6
            1B9348014502F89969183F0ABEBAE096CE3F476D4BA2778CEE1CCEA0F147854C
            1B7B1CFE96F682B5AC5245FA28A55E77529C6A0E9BA0CB88E9EF3F22340BF77B
            02660B828790172E8E4D12873E43230E1E362ED9EC608D10686CE8C80FD37F0E
            0819723F47199459F0D80C810B83FEC67915D5FC1849502E0E231F3C264EDCA9
            3178FB185A7AF9FF0FFA00382B4BC0A74901F5213954F132E13DBFE0827D7611
            FD36E7CE3F4D210730B544FA98D612B06F2BFF7F23CC62E6DD85AA8F00000000
            49454E44AE426082}
        end
        object btn_MoveDown: TEffectPNGToolButton
          Left = 181
          Top = 0
          Hint = 'Move expression down'
          ParentShowHint = False
          ShowHint = True
          OnClick = btn_MoveDownClick
          Image.Data = {
            89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
            3B000000097048597300000B1300000B1301009A9C180000000467414D410000
            B18E7CFB51930000033A4944415478DA95954B4C53411486FFD602951668358A
            F541EB7301A834D52886052C24D1982812C407F270E3424D4C5CD44416BAA31B
            0C71270B40128DA9E19110A242E4B102B129518B51D0F2AEA0701B2858A1B49E
            B9B72DA52DA59E64727B737BBE99F9E79C7F445827F487914D8F121AECA909FA
            3C4CA393469DE113FF0C0951182083D430A02E05484B9141A55643A952037172
            708326D8C627611977C234CAA73070194D30BC2E98A01718344D0545C1D90C48
            B36E037B7300491CE076D158013C349C76C0DA09AEBB1A2D5D83B0D860F7C29B
            42C05E6863C1493974A58F80F442022D03F336607116585E14A0E2189A2896C6
            66CAA674731D4C2D2F6034B91826CF0717056CDF4C5085EE4E35AD9264754C13
            745258DDDFB9F00721DE04C42600E37D30BDAC24B89BAD5CCB64F1813B68FBD9
            D7CB2B80A345C0CC10B0302D247BDCC2AADD2EAC1B31F1407F3DEA1B7A982C9D
            04CE11794FBF435F9C0165C97301C8598504A6A9E327B0B2840D8326E6DA2B61
            6875B2372D03D7D0E997163CA802523281B1DED53FB34996E63786FAC2DA0563
            AB99554B2D035B8BB3649A54FD6B609624906D07D459545A89D1037F7F037A9F
            50FE0F0C74B5E2D97BD298C01EFDB55428F31F039657C0F9A7D10303C35C0B7C
            6902676A86A18DAA82812BEE9D06F6E702DFDB812B048F95FF3FF8DD4392B107
            187A83FBCD3EF0AD1340723A303D001C3A0364DE252912A2877E6D01DACB8583
            764CAD82F597F6417940CB6F057149C04EFA7D99562E55442741F34DA172C412
            700E975F0A6BF129A92635B790EF227FA832801B1D91E10CDA50B6FA2E916260
            CCE93F3CA1DC8AF2499FB6B55D16091E02A5168707C63EA7BFDCB2C11AE4E20E
            7230B2B3890F42B7458207434562409E0C6E7A0A86B77CAE766D4BE71D23C399
            01EC23A1F0AB8D8042131E9AB89BDF697DB77DB5A5BD600D5B47814EA2D0690F
            0AAE661FDDB895D9F6937691F3FD81E9F3048C66AC35212F5CB04D2A08DD1132
            F5F8AD825DB2B666961918CC745887C66FE17768FA38C2A02CD6DA66109C37FA
            73C795A4F91E6A169960463EB8AFBE9716C0D9C6D0D2C74536FA00389325E06A
            9243B54D0665A294FFCECD3961FBB500CBA823FAAB296802562D1B5DA65504EC
            0F97FF0F780662E6BB5F4D310000000049454E44AE426082}
        end
      end
    end
    object gb_Exec: TGroupBox
      Left = 0
      Top = 464
      Width = 402
      Height = 177
      Align = alBottom
      Caption = 'Run'
      TabOrder = 1
      object cb_RunPerLine: TCheckBox
        Left = 16
        Top = 16
        Width = 145
        Height = 17
        Caption = 'Run each line separate'
        TabOrder = 0
        OnClick = cb_RunPerLineClick
      end
      object btn_Run: TButton
        AlignWithMargins = True
        Left = 320
        Top = 15
        Width = 69
        Height = 25
        Caption = 'Run'
        TabOrder = 1
        OnClick = btn_RunClick
      end
      object cb_ModifierI: TCheckBox
        Left = 16
        Top = 63
        Width = 97
        Height = 17
        Caption = 'casesensitive'
        TabOrder = 2
      end
      object cb_ModifierS: TCheckBox
        Left = 16
        Top = 86
        Width = 113
        Height = 17
        Caption = '. matches any char'
        TabOrder = 3
      end
      object cb_ModifierG: TCheckBox
        Left = 16
        Top = 109
        Width = 153
        Height = 17
        Caption = 'all operators are greedy'
        TabOrder = 4
      end
      object pan_Progress: TPanel
        Left = 2
        Top = 134
        Width = 398
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 5
        ExplicitLeft = 112
        ExplicitTop = 64
        ExplicitWidth = 185
        object pb_All: TProgressBar
          AlignWithMargins = True
          Left = 3
          Top = 22
          Width = 392
          Height = 16
          Align = alBottom
          TabOrder = 0
          ExplicitLeft = 120
          ExplicitTop = 8
          ExplicitWidth = 150
        end
        object pb_Expression: TProgressBar
          AlignWithMargins = True
          Left = 3
          Top = 0
          Width = 392
          Height = 16
          Align = alBottom
          TabOrder = 1
          ExplicitLeft = 128
          ExplicitTop = 16
          ExplicitWidth = 150
        end
      end
      object cb_RemoveEmptyLines: TCheckBox
        Left = 32
        Top = 39
        Width = 121
        Height = 17
        Caption = 'remove empty lines'
        Enabled = False
        TabOrder = 6
      end
    end
  end
  object dlg_LoadSource: TOpenDialog
    Filter = 'All files|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Open source file ...'
    Left = 8
    Top = 56
  end
  object dlg_SaveResult: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Title = 'Save file ...'
    Left = 8
    Top = 320
  end
  object dlg_LoadExpressions: TOpenDialog
    Filter = 'Expression lists|*.elst'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 544
    Top = 96
  end
  object dlg_SaveExpressions: TSaveDialog
    DefaultExt = '.elst'
    Filter = 'Expressions lists|*.elst'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Left = 576
    Top = 96
  end
end
