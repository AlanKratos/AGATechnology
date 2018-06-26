inherited frmCadCliente: TfrmCadCliente
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cadastro de Clientes'
  ClientHeight = 473
  ClientWidth = 692
  OnClose = FormClose
  OnCreate = FormCreate
  OnPaint = nil
  OnShow = FormShow
  ExplicitWidth = 700
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 87
    Top = 45
    Width = 91
    Height = 13
    Caption = 'Nome/Raz'#227'o Social'
  end
  object Label3: TLabel [1]
    Left = 424
    Top = 45
    Width = 41
    Height = 13
    Caption = 'Fantasia'
  end
  inherited PanelTop: TPanel
    Width = 692
    ExplicitWidth = 692
    inherited JvCalcEditCodigo: TJvCalcEdit
      Top = 8
      OnButtonClick = JvCalcEditCodigoButtonClick
      ExplicitTop = 8
    end
  end
  inherited PanelLeft: TPanel
    Height = 438
    ExplicitHeight = 438
    inherited BitBtnRelatorio: TSpeedButton
      OnClick = BitBtnRelatorioClick
      ExplicitLeft = 8
    end
    inherited BitBtnExcluir: TSpeedButton
      OnClick = BitBtnExcluirClick
    end
    inherited BitBtnPesquisar: TSpeedButton
      OnClick = BitBtnPesquisarClick
    end
  end
  object dbeRazao: TDBEdit [4]
    Left = 87
    Top = 64
    Width = 249
    Height = 21
    CharCase = ecUpperCase
    DataField = 'NOME_PESSOA'
    DataSource = dsCadastro
    TabOrder = 2
  end
  object dbeFantasia: TDBEdit [5]
    Left = 424
    Top = 64
    Width = 241
    Height = 21
    CharCase = ecUpperCase
    DataField = 'FANTASIA_PESSOA'
    DataSource = dsCadastro
    TabOrder = 3
  end
  object pcCliente: TJvPageControl [6]
    Left = 87
    Top = 91
    Width = 605
    Height = 382
    ActivePage = tsPrincipal
    TabOrder = 4
    object tsPrincipal: TTabSheet
      Caption = 'Principal'
      object lCNPJ: TLabel
        Left = 99
        Top = 1
        Width = 25
        Height = 13
        Caption = 'CNPJ'
      end
      object lIE: TLabel
        Left = 267
        Top = 1
        Width = 87
        Height = 13
        Caption = 'Inscri'#231#227'o Estadual'
      end
      object Label15: TLabel
        Left = 470
        Top = 1
        Width = 33
        Height = 13
        Caption = 'Outros'
      end
      object lCPF: TLabel
        Left = 99
        Top = 1
        Width = 19
        Height = 13
        Caption = 'CPF'
      end
      object lRG: TLabel
        Left = 267
        Top = 1
        Width = 14
        Height = 13
        Caption = 'RG'
      end
      object Label4: TLabel
        Left = 3
        Top = 237
        Width = 58
        Height = 13
        Caption = 'Observa'#231#227'o'
      end
      object lblGrupo: TLabel
        Left = 100
        Top = 53
        Width = 29
        Height = 13
        Caption = 'Grupo'
      end
      object dbrpTipoPessoa: TJvDBRadioPanel
        Left = 11
        Top = 7
        Width = 83
        Height = 118
        DataField = 'TIPO_PESSOA'
        DataSource = dsCadastro
        Items.Strings = (
          'Fisica'
          'Juridica')
        TabOrder = 0
        Values.Strings = (
          '1'
          '2')
        OnClick = dbrpTipoPessoaClick
      end
      object dbmObservacao: TDBMemo
        Left = 3
        Top = 256
        Width = 591
        Height = 95
        DataField = 'OBSERVACAO_PESSOA'
        DataSource = dsCadastro
        TabOrder = 7
        OnKeyPress = dbmObservacaoKeyPress
      end
      object Panel2: TPanel
        Left = 470
        Top = 19
        Width = 105
        Height = 60
        TabOrder = 5
        object dbcbStatus: TJvDBCheckBox
          Left = 8
          Top = 6
          Width = 89
          Height = 17
          Caption = 'Ativo'
          DataField = 'STATUS_PESSOA'
          DataSource = dsCadastro
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '2'
        end
        object JvDBCheckBox2: TJvDBCheckBox
          Left = 8
          Top = 37
          Width = 89
          Height = 17
          Caption = 'Outro'
          TabOrder = 1
        end
      end
      object dbmeCpf: TJvDBMaskEdit
        Left = 99
        Top = 16
        Width = 142
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CPF_PESSOA'
        DataSource = dsCadastro
        MaxLength = 14
        TabOrder = 1
        EditMask = '###.###.###-##;1;_'
      end
      object dbmeRg: TJvDBMaskEdit
        Left = 267
        Top = 16
        Width = 145
        Height = 21
        CharCase = ecUpperCase
        DataField = 'RG_PESSOA'
        DataSource = dsCadastro
        TabOrder = 3
        EditMask = ''
      end
      object dbmeCnpj: TJvDBMaskEdit
        Left = 99
        Top = 16
        Width = 139
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CNPJ_PESSOA'
        DataSource = dsCadastro
        MaxLength = 18
        TabOrder = 2
        EditMask = '##.###.###/####-##;1;_'
      end
      object dbmeIe: TJvDBMaskEdit
        Left = 267
        Top = 16
        Width = 145
        Height = 21
        CharCase = ecUpperCase
        DataField = 'IE_PESSOA'
        DataSource = dsCadastro
        TabOrder = 4
        EditMask = ''
      end
      object jvdbcmbdtGRUPO_PESSOA: TJvDBComboEdit
        Left = 100
        Top = 72
        Width = 61
        Height = 21
        DataField = 'GRUPO_PESSOA'
        DataSource = dsCadastro
        ImageKind = ikEllipsis
        TabOrder = 6
      end
      object dbedtDESCGRUPO: TDBEdit
        Left = 167
        Top = 72
        Width = 151
        Height = 21
        TabStop = False
        DataField = 'DESCRICAO_GRUPO'
        DataSource = dsCadastro
        ReadOnly = True
        TabOrder = 8
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Endere'#231'o'
      ImageIndex = 1
      object Label9: TLabel
        Left = 3
        Top = 2
        Width = 45
        Height = 13
        Caption = 'Endere'#231'o'
      end
      object Label10: TLabel
        Left = 3
        Top = 44
        Width = 65
        Height = 13
        Caption = 'Complemento'
      end
      object Label11: TLabel
        Left = 4
        Top = 87
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object Label12: TLabel
        Left = 314
        Top = 87
        Width = 13
        Height = 13
        Caption = 'UF'
      end
      object Label13: TLabel
        Left = 312
        Top = 2
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object Label14: TLabel
        Left = 378
        Top = 2
        Width = 28
        Height = 13
        Caption = 'Bairro'
      end
      object dbeBairro: TDBEdit
        Left = 378
        Top = 17
        Width = 216
        Height = 21
        CharCase = ecUpperCase
        DataField = 'BAIRRO_PESSOA_ENDERECO'
        DataSource = dsEndereco
        TabOrder = 0
      end
      object dbeNumero: TDBEdit
        Left = 312
        Top = 17
        Width = 58
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NUMERO_PESSOA_ENDERECO'
        DataSource = dsEndereco
        TabOrder = 1
      end
      object dbeEndereco: TDBEdit
        Left = 3
        Top = 17
        Width = 299
        Height = 21
        CharCase = ecUpperCase
        DataField = 'ENDERECO_PESSOA_ENDERECO'
        DataSource = dsEndereco
        TabOrder = 2
      end
      object dbeComplemento: TDBEdit
        Left = 3
        Top = 63
        Width = 299
        Height = 21
        CharCase = ecUpperCase
        DataField = 'COMPLEMENTO_PESSOA_ENDERECO'
        DataSource = dsEndereco
        TabOrder = 3
      end
      object dbceCodCidade: TJvDBComboEdit
        Left = 3
        Top = 104
        Width = 68
        Height = 21
        DataField = 'CIDADE_PESSOA_ENDERECO'
        DataSource = dsEndereco
        ImageKind = ikEllipsis
        TabOrder = 4
      end
      object dbeCidade: TDBEdit
        Left = 77
        Top = 104
        Width = 229
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        DataField = 'DESCRICAO_CIDADE'
        DataSource = dsEndereco
        ReadOnly = True
        TabOrder = 5
      end
      object dbeUf: TDBEdit
        Left = 312
        Top = 104
        Width = 213
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        DataField = 'DESCRICAO_UF'
        DataSource = dsEndereco
        ReadOnly = True
        TabOrder = 6
      end
      object JvDBGrid1: TJvDBGrid
        Left = 3
        Top = 144
        Width = 591
        Height = 207
        DataSource = dsEndereco
        TabOrder = 7
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'ENDERECO_PESSOA_ENDERECO'
            Title.Caption = 'Endere'#231'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUMERO_PESSOA_ENDERECO'
            Title.Caption = 'N'#250'mero'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BAIRRO_PESSOA_ENDERECO'
            Title.Caption = 'Bairro'
            Width = 165
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMPLEMENTO_PESSOA_ENDERECO'
            Title.Caption = 'Complemento'
            Width = 294
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CIDADE_PESSOA_ENDERECO'
            Title.Caption = 'Cidade'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO_CIDADE'
            ReadOnly = True
            Title.Caption = 'Descri'#231#227'o Cidade'
            Width = 204
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO_UF'
            Title.Caption = 'Descri'#231#227'o Uf'
            Width = 212
            Visible = True
          end>
      end
    end
    object tsEmails: TTabSheet
      Caption = 'E-mails'
      ImageIndex = 2
      object jvdbgrdEmails: TJvDBGrid
        Left = 3
        Top = 3
        Width = 591
        Height = 259
        DataSource = dsEmail
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'EMAIL_PESSOA_EMAIL'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRINCIPAL_PESSOA_EMAIL'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DOCUMENTOSFISCAIS_PESSOA_EMAIL'
            Visible = True
          end>
      end
    end
    object tsTelefones: TTabSheet
      Caption = 'Telefones'
      ImageIndex = 3
      object jvdbgrdTelefones: TJvDBGrid
        Left = 3
        Top = 3
        Width = 591
        Height = 254
        DataSource = dsTelefone
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'NUMERO_PESSOA_TELEFONE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_PESSOA_TELEFONE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PADRAO_PESSOA_TELEFONE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBSERVACAO_PESSOA_TELEFONE'
            Visible = True
          end>
      end
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmCadCliente.QryPrincipal
    Left = 352
  end
  inherited JvEnterAsTab1: TJvEnterAsTab
    Left = 160
  end
  inherited QryNavegar: TFDQuery
    Left = 224
  end
  object dsTelefone: TDataSource
    DataSet = dmCadCliente.QryTelefone
    Left = 552
  end
  object dsEndereco: TDataSource
    DataSet = dmCadCliente.QryEndereco
    Left = 616
  end
  object dsEmail: TDataSource
    DataSet = dmCadCliente.QryEmail
    Left = 288
  end
end
