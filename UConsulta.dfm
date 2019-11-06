object fConsulta: TfConsulta
  Left = 84
  Top = 22
  Width = 1238
  Height = 706
  Caption = 
    'Consulta Lan'#231'amentos para Gerar o Arquivo Banrisul  -  12/07/201' +
    '8'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 1222
    Height = 144
    Align = alTop
    Color = clSilver
    TabOrder = 0
    object Label2: TLabel
      Left = 676
      Top = 11
      Width = 74
      Height = 13
      Caption = 'Registros Total:'
    end
    object Label6: TLabel
      Left = 52
      Top = 11
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'Empresa:'
    end
    object Label1: TLabel
      Left = 19
      Top = 32
      Width = 77
      Height = 13
      Alignment = taRightJustify
      Caption = 'M'#234's/Ano Inicial:'
    end
    object Label3: TLabel
      Left = 17
      Top = 52
      Width = 81
      Height = 13
      Alignment = taRightJustify
      Caption = 'Diret'#243'rio Destino:'
    end
    object Label4: TLabel
      Left = 2
      Top = 73
      Width = 96
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo de Pagamento:'
    end
    object Label5: TLabel
      Left = 857
      Top = 9
      Width = 84
      Height = 13
      Caption = 'C'#243'digo Conv'#234'nio:'
    end
    object Label7: TLabel
      Left = 862
      Top = 30
      Width = 80
      Height = 13
      Caption = 'C'#243'digo Empresa:'
    end
    object Label8: TLabel
      Left = 682
      Top = 55
      Width = 54
      Height = 13
      Caption = 'Cabe'#231'alho:'
    end
    object Label9: TLabel
      Left = 695
      Top = 77
      Width = 41
      Height = 13
      Caption = 'Rodap'#233':'
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 756
      Top = 3
      Width = 89
      Height = 21
      AutoSize = False
      Color = clSilver
      DecimalPlaces = 0
      DisplayFormat = '0'
      ReadOnly = True
      TabOrder = 8
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 100
      Top = 3
      Width = 337
      Height = 21
      DropDownCount = 8
      LookupField = 'cd_empresa'
      LookupDisplay = 'razao'
      LookupSource = DMLancamentos_EBS.dsEmpresa
      TabOrder = 0
    end
    object cbxMesIni: TComboBox
      Left = 100
      Top = 24
      Width = 81
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnExit = cbxMesIniExit
      Items.Strings = (
        'Janeiro'
        'Fevereiro'
        'Mar'#231'o'
        'Abril'
        'Maio'
        'Junho'
        'Julho'
        'Agosto'
        'Setembro'
        'Outubro'
        'Novembro'
        'Dezembro')
    end
    object ceAnoIni: TCurrencyEdit
      Left = 181
      Top = 24
      Width = 54
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      MaxLength = 4
      TabOrder = 2
    end
    object btnConsultar: TNxButton
      Left = 6
      Top = 89
      Width = 156
      Height = 30
      Caption = 'Efetuar Pesquisa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      Glyph.Data = {
        AE060000424DAE06000000000000360000002800000017000000170000000100
        1800000000007806000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF7F2F0F5F2F0FCFDFDFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6B778D2D52869876
        72B0A3A1FCFDFE000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7780
        0055B812A5FA5E90BDBBA29FFAF5F4000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF5C6377004EAD29BEFFA9ECFFA3F7FF3A89BFF6F5F6000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF75737F0051AC17B1FFA4E7FDD5FFFF12A6E45E90B5FFFCFC00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFD6C6C7D0057BB25BAFFA5E7FEC7FFFF099DDF6A8A
        A8FFFFFDFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF54657D0057B120B5FFA1E5FECFFFFF
        109CDD4D7EA5FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFCFEFEDADDDDDAD9D9CFCFCFEDEFEFFFFFFFFFFFFFFFFFFF00024A21BCFFA5
        EAFFCAFFFF11A7E86587A9FFFFFCFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFDDE0E0958E8D7A63657D60628467678065658D77799C9393D3D1D1ADAA
        A749343776B3E0B4FFFF19A4DF5A84A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFD2D8D84C3334846269967570A39388A99E9AAB9E99AE9890
        B69DA4A28E8F867070E7D0CC806B6E005499467EA7FFFFFAFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FFFFFFC2C2C2533638A27B799D80649A9A7C94988895
        97979498949198849E9478C4AFA8C8B5B7AFA1A1B6B3B1FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FBFBFB816D6E8A66679C6F4A987D
        5A978F7499978499998D99998C989783948769987854C9B1A9C1B4B6DED8D8FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000E0DCDB74575C
        98634797653998765499876899927799977F99967F99907799826295704B9B64
        3AD4CFD8A39C9BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000887F83865B54984D1A945C319969439A77559A7F5F998365998364997F5F
        99735095673F81400DC9A391B2ACB0ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000BDAFB38C57459140079352258D562D875732885D3A8D
        6744946E4B92694587532D91572CBB753CCA906BADAAB0CECDCDFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C6B7BB8F56428528008B3D08A766
        34CA9765D0A272BC8D5F9E6940A06B3ECB9867EFB984FFCB8ACD8A5FBBB8C0DD
        DBDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000B8AEB1906152
        AD5529ECB177FFD29AFED7A5FCDEAEFEE7B6FFEABBFFE8B8FDDCABF7D09CFCCB
        90CF9675AEAAB2CBCBCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        00009B96988F6B68EAA769FFD19BF4CD9BF4D8AAF4E0B4F4E4BBF4E5BDF4E4BB
        F4DDB1F6DBABF8C98AC6A399A8A6A9F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000D2D0D07E6B73B47F67FED295F6DBADF4E4BAF5E5C2F5
        E7C8F5E9CAF4E7C8F5E8C3F9E9B9D29E73DDDEE8A6A2A1FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FCFEFE9B8F91B6A0A5CD9972FDE8
        B2F6EDC7F5E9CCF4EDD4F5EED9F5EED6F9EFCDE4C299F3E4DD867F80D7D8D8FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFD4D6D6
        574849C3AEB2CDA88FF0D9B4F6ECD0F6F3E3F6F1E5F4E8D3E2C2ABE1D0CF9E95
        96C6C7C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFD3D5D59F969797888CC0A6A1D1B6ACD5BEB2D7C0B7D5BDB8
        C1B4B8ADA7AAC0BFBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFCFDFDD2D0D0A3A0A2CEC5C7E1
        D7D8DCD3D4A09C9EE7E5E5F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
      GlyphSpacing = 5
      ParentFont = False
      TabOrder = 5
      Transparent = True
      OnClick = btnConsultarClick
    end
    object btnImprimir: TNxButton
      Left = 162
      Top = 89
      Width = 155
      Height = 30
      Caption = 'Gera Aquivo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      GlyphSpacing = 5
      ParentFont = False
      TabOrder = 6
      Transparent = True
      OnClick = btnImprimirClick
    end
    object NxButton1: TNxButton
      Left = 318
      Top = 89
      Width = 155
      Height = 30
      Caption = 'Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      GlyphSpacing = 5
      ParentFont = False
      TabOrder = 7
      Transparent = True
      OnClick = NxButton1Click
    end
    object ProgressBar1: TProgressBar
      Left = 8
      Top = 123
      Width = 1089
      Height = 17
      TabOrder = 9
      Visible = False
    end
    object DirectoryEdit1: TDirectoryEdit
      Left = 100
      Top = 45
      Width = 337
      Height = 21
      InitialDir = 'C:\TEMP'
      NumGlyphs = 1
      TabOrder = 3
    end
    object ComboBox1: TComboBox
      Left = 100
      Top = 66
      Width = 337
      Height = 21
      ItemHeight = 13
      TabOrder = 4
      Items.Strings = (
        'Contra Cheque'
        'Folha Complementar'
        '13'#186' Sal'#225'rio'
        'Abonos'
        'Outras Folhas')
    end
    object CheckListBox1: TCheckListBox
      Left = 448
      Top = 3
      Width = 222
      Height = 73
      OnClickCheck = CheckListBox1ClickCheck
      BevelInner = bvNone
      BiDiMode = bdRightToLeftNoAlign
      Color = cl3DLight
      Columns = 2
      ItemHeight = 13
      Items.Strings = (
        'Registro 00'
        'Registro 05'
        'Registro 10'
        'Registro 20'
        'Registro 30'
        'Registro 40'
        'Registro 50'
        'Registro 90'
        'Registro 99')
      ParentBiDiMode = False
      TabOrder = 10
    end
    object Edit1: TEdit
      Left = 947
      Top = 1
      Width = 150
      Height = 21
      MaxLength = 3
      TabOrder = 11
    end
    object Edit2: TEdit
      Left = 947
      Top = 23
      Width = 150
      Height = 21
      MaxLength = 6
      TabOrder = 12
    end
    object Edit3: TEdit
      Left = 739
      Top = 47
      Width = 359
      Height = 21
      MaxLength = 70
      TabOrder = 13
    end
    object Edit4: TEdit
      Left = 739
      Top = 69
      Width = 359
      Height = 21
      MaxLength = 48
      TabOrder = 14
    end
  end
  object SMDBGrid2: TSMDBGrid
    Left = 0
    Top = 144
    Width = 1222
    Height = 523
    Align = alClient
    Ctl3D = False
    DataSource = DMLancamentos_EBS.dsmAuxiliar
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentCtl3D = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnTitleClick = SMDBGrid2TitleClick
    Flat = True
    BandsFont.Charset = DEFAULT_CHARSET
    BandsFont.Color = clWindowText
    BandsFont.Height = -11
    BandsFont.Name = 'MS Sans Serif'
    BandsFont.Style = []
    Groupings = <
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Color = clBtnFace
      end>
    GridStyle.Style = gsCustom
    GridStyle.OddColor = clWindow
    GridStyle.EvenColor = clWindow
    TitleHeight.PixelCount = 24
    FooterColor = clBtnFace
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
    OnGetCellParams = SMDBGrid2GetCellParams
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 13
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 6
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cd_Funcionario'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Funcion'#225'rio'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeFuncionario'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Funcion'#225'rio'
        Width = 385
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeFuncao'
        Title.Alignment = taCenter
        Title.Caption = 'Fun'#231#227'o'
        Width = 206
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Agencia'
        Title.Alignment = taCenter
        Title.Caption = 'Ag'#234'ncia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ContaCorrente'
        Title.Alignment = taCenter
        Title.Caption = 'Conta Corrente'
        Width = 216
        Visible = True
      end>
  end
end
