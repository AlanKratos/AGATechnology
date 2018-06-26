inherited frmCadCidade: TfrmCadCidade
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cadastro de Cidades'
  ClientHeight = 238
  ClientWidth = 547
  OnClose = FormClose
  OnCreate = FormCreate
  OnPaint = nil
  OnShow = FormShow
  ExplicitWidth = 563
  ExplicitHeight = 277
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelTop: TPanel
    Width = 547
    ExplicitWidth = 592
  end
  inherited PanelLeft: TPanel
    Height = 203
    ExplicitHeight = 288
    inherited BitBtnExcluir: TSpeedButton
      OnClick = BitBtnExcluirClick
    end
  end
  object Panel2: TPanel [2]
    Left = 81
    Top = 35
    Width = 466
    Height = 203
    Align = alClient
    TabOrder = 2
    ExplicitWidth = 511
    ExplicitHeight = 288
    object Label2: TLabel
      Left = 6
      Top = 14
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object Label3: TLabel
      Left = 6
      Top = 64
      Width = 13
      Height = 13
      Caption = 'UF'
    end
    object Label4: TLabel
      Left = 6
      Top = 118
      Width = 94
      Height = 13
      Caption = 'C'#243'digo do Munic'#237'pio'
    end
    object dbeDescCidade: TDBEdit
      Left = 6
      Top = 33
      Width = 449
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DESCRICAO_CIDADE'
      DataSource = dsCadastro
      TabOrder = 0
    end
    object dbedtDESCRICAO_UF: TDBEdit
      Left = 141
      Top = 83
      Width = 314
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      DataField = 'DESCRICAO_UF'
      DataSource = dsCadastro
      ReadOnly = True
      TabOrder = 4
    end
    object jvdbcmbdtUF_CIDADE: TJvDBComboEdit
      Left = 6
      Top = 83
      Width = 67
      Height = 21
      DataField = 'UF_CIDADE'
      DataSource = dsCadastro
      ImageKind = ikEllipsis
      ButtonWidth = 16
      TabOrder = 1
    end
    object dbeCodMunicipio: TDBEdit
      Left = 6
      Top = 137
      Width = 121
      Height = 21
      DataField = 'CODMUNICIPIO_CIDADE'
      DataSource = dsCadastro
      TabOrder = 2
    end
    object dbeSiglaUf: TDBEdit
      Left = 80
      Top = 83
      Width = 55
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      DataField = 'SIGLA_UF'
      DataSource = dsCadastro
      ReadOnly = True
      TabOrder = 3
    end
  end
  inherited dsCadastro: TDataSource
    Left = 152
  end
  inherited JvEnterAsTab1: TJvEnterAsTab
    Left = 248
  end
end
