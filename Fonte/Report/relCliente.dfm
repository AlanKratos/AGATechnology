object frmRelCliente: TfrmRelCliente
  Left = 0
  Top = 0
  Caption = 'frmRelCliente'
  ClientHeight = 336
  ClientWidth = 639
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btImprimir: TButton
    Left = 488
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Imprimir'
    TabOrder = 0
    OnClick = btImprimirClick
  end
  object frxRelCliente: TfrxDBDataset
    UserName = 'frxRel'
    CloseDataSource = False
    DataSet = FDQueryCliente
    BCDToCurrency = False
    Left = 352
    Top = 160
  end
  object FDQueryCliente: TFDQuery
    Active = True
    Connection = dmConexao.FDConexao
    SQL.Strings = (
      'select '
      '    PESSOA_TELEFONE.NUMERO_PESSOA_TELEFONE,'
      '    PESSOA_TELEFONE.CELULAR_PESSOA_TELEFONE,'
      '    PESSOA_ENDERECO.ENDERECO_PESSOA_ENDERECO,'
      '    PESSOA_ENDERECO.NUMERO_PESSOA_ENDERECO,'
      '    PESSOA_ENDERECO.BAIRRO_PESSOA_ENDERECO,'
      '    PESSOA_ENDERECO.COMPLEMENTO_PESSOA_ENDERECO,'
      '    PESSOA_ENDERECO.UF_PESSOA_ENDERECO,'
      '    PESSOA_ENDERECO.CEP_PESSOA_ENDERECO,'
      '    PESSOA_EMAIL.EMAIL_PESSOA_EMAIL,'
      '    PESSOA.CODIGO_PESSOA,'
      '    PESSOA.NOME_PESSOA,'
      '    PESSOA.OBSERVACAO_PESSOA,'
      '    PESSOA.CPF_PESSOA,'
      '    PESSOA.CNPJ_PESSOA,'
      '    PESSOA.RG_PESSOA,'
      '    PESSOA.IE_PESSOA,'
      '    CIDADE.DESCRICAO_CIDADE,'
      '    UF.SIGLA_UF,'
      '    PESSOA.FANTASIA_PESSOA'
      'from PESSOA'
      
        '   left join PESSOA_EMAIL on (PESSOA.CODIGO_PESSOA = PESSOA_EMAI' +
        'L.COD_PESSOA_EMAIL)'
      
        '   left join PESSOA_ENDERECO on (PESSOA.CODIGO_PESSOA = PESSOA_E' +
        'NDERECO.COD_PESSOA_ENDERECO)'
      
        '   left join CIDADE on (PESSOA_ENDERECO.CIDADE_PESSOA_ENDERECO =' +
        ' CIDADE.CODIGO_CIDADE)'
      '   left join UF on (CIDADE.UF_CIDADE = UF.CODIGO_UF)'
      
        '   left join PESSOA_TELEFONE on (PESSOA.CODIGO_PESSOA = PESSOA_T' +
        'ELEFONE.COD_PESSOA_TELEFONE)'
      'where PESSOA.CLIENTE_PESSOA = '#39'S'#39
      'order by PESSOA.CODIGO_PESSOA')
    Left = 352
    Top = 232
  end
  object frxPDFExport: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    Left = 264
    Top = 160
  end
  object frxReport: TfrxReport
    Version = '5.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42530.546617245400000000
    ReportOptions.LastChange = 42531.607084756900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 352
    Top = 96
    Datasets = <
      item
        DataSet = frxRelCliente
        DataSetName = 'frxRel'
      end>
    Variables = <
      item
        Name = ' Cabe'#231'alho'
        Value = Null
      end
      item
        Name = 'EMPRESA'
        Value = #39#39
      end
      item
        Name = 'USUARIO'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo8: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de Clientes')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 211.653680000000000000
        Width = 718.110700000000000000
        DataSet = frxRelCliente
        DataSetName = 'frxRel'
        RowCount = 0
        Stretched = True
        object frxRelCODIGO_PESSOA: TfrxMemoView
          Align = baLeft
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'CODIGO_PESSOA'
          DataSet = frxRelCliente
          DataSetName = 'frxRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxRel."CODIGO_PESSOA"]')
          ParentFont = False
        end
        object frxRelNOME_PESSOA: TfrxMemoView
          Align = baWidth
          Left = 41.574830000000000000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'NOME_PESSOA'
          DataSet = frxRelCliente
          DataSetName = 'frxRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxRel."NOME_PESSOA"]')
          ParentFont = False
        end
        object frxRelFANTASIA_PESSOA: TfrxMemoView
          Align = baRight
          Left = 283.464750000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'FANTASIA_PESSOA'
          DataSet = frxRelCliente
          DataSetName = 'frxRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxRel."FANTASIA_PESSOA"]')
          ParentFont = False
        end
        object frxRelDESCRICAO_CIDADE: TfrxMemoView
          Align = baRight
          Left = 563.149970000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'DESCRICAO_CIDADE'
          DataSet = frxRelCliente
          DataSetName = 'frxRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxRel."DESCRICAO_CIDADE"]')
          ParentFont = False
        end
        object frxRelCPF_PESSOA: TfrxMemoView
          Align = baRight
          Left = 461.102660000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxRelCliente
          DataSetName = 'frxRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxRel."CPF_PESSOA"][frxRel."CNPJ_PESSOA"]')
          ParentFont = False
        end
        object frxRelSIGLA_UF: TfrxMemoView
          Align = baRight
          Left = 691.653990000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'SIGLA_UF'
          DataSet = frxRelCliente
          DataSetName = 'frxRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxRel."SIGLA_UF"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 340.157700000000000000
        Width = 718.110700000000000000
        object Memo10: TfrxMemoView
          Align = baRight
          Left = 536.693260000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#] / [TotalPages#]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Align = baLeft
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[USUARIO]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 45.354360000000000000
        Top = 64.252010000000000000
        Width = 718.110700000000000000
        object Memo9: TfrxMemoView
          Align = baRight
          Left = 540.472790000000000000
          Top = 22.000000000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Emiss'#227'o: [Date]      [Time]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Empresa: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[EMPRESA]')
          ParentFont = False
        end
        object Shape1: TfrxShapeView
          Align = baWidth
          Top = 41.574830000000010000
          Width = 718.110700000000000000
          Height = 3.779530000000000000
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 132.283550000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Align = baLeft
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Align = baWidth
          Left = 41.574830000000000000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Raz'#227'o Social/Nome')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Align = baRight
          Left = 283.464750000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome Fantasia')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Align = baRight
          Left = 461.102660000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'CPF/CNPJ')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Align = baRight
          Left = 563.149970000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cidade')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Align = baRight
          Left = 691.653990000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'UF')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 291.023810000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Top = 6.000000000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total de Registros: [COUNT(MasterData1,2)]')
          ParentFont = False
        end
      end
    end
  end
end
