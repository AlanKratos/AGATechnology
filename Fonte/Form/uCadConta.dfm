inherited frmCadConta: TfrmCadConta
  Caption = 'Cadastro de Conta'
  ClientHeight = 283
  ClientWidth = 574
  OnClose = FormClose
  OnCreate = FormCreate
  OnPaint = nil
  OnShow = FormShow
  ExplicitWidth = 582
  ExplicitHeight = 310
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelTop: TPanel
    Width = 574
    ExplicitWidth = 967
  end
  inherited PanelLeft: TPanel
    Height = 248
    ExplicitHeight = 622
    inherited BitBtnExcluir: TSpeedButton
      OnClick = BitBtnExcluirClick
    end
  end
  object Panel2: TPanel [2]
    Left = 81
    Top = 35
    Width = 493
    Height = 248
    Align = alClient
    TabOrder = 2
    ExplicitWidth = 624
    ExplicitHeight = 374
    object Label2: TLabel
      Left = 6
      Top = 10
      Width = 93
      Height = 13
      Caption = 'Descri'#231#227'o da Conta'
    end
    object Label3: TLabel
      Left = 287
      Top = 10
      Width = 67
      Height = 13
      Caption = 'Tipo de Conta'
    end
    object Label4: TLabel
      Left = 6
      Top = 56
      Width = 29
      Height = 13
      Caption = 'Banco'
      FocusControl = dbedtDESCRICAO_BANCO
    end
    object Label5: TLabel
      Left = 6
      Top = 101
      Width = 38
      Height = 13
      Caption = 'Ag'#234'ncia'
      FocusControl = DBEdit1
    end
    object Label6: TLabel
      Left = 118
      Top = 101
      Width = 84
      Height = 13
      Caption = 'N'#250'mero da Conta'
      FocusControl = DBEdit2
    end
    object Label7: TLabel
      Left = 242
      Top = 101
      Width = 27
      Height = 13
      Caption = 'D'#237'gito'
      FocusControl = DBEdit3
    end
    object Label8: TLabel
      Left = 76
      Top = 101
      Width = 27
      Height = 13
      Caption = 'D'#237'gito'
      FocusControl = DBEdit4
    end
    object Label9: TLabel
      Left = 6
      Top = 144
      Width = 77
      Height = 13
      Caption = 'T'#237'tular da Conta'
      FocusControl = DBEdit5
    end
    object Label10: TLabel
      Left = 288
      Top = 144
      Width = 73
      Height = 13
      Caption = 'CNPJ do T'#237'tular'
      FocusControl = DBEdit6
    end
    object Label11: TLabel
      Left = 288
      Top = 187
      Width = 67
      Height = 13
      Caption = 'CPF do T'#237'tular'
      FocusControl = DBEdit7
    end
    object Label12: TLabel
      Left = 288
      Top = 101
      Width = 48
      Height = 13
      Caption = 'Slip Conta'
      FocusControl = DBEdit8
    end
    object Label13: TLabel
      Left = 344
      Top = 59
      Width = 67
      Height = 13
      Caption = 'Compensa'#231#227'o'
      FocusControl = DBEdit9
    end
    object dbedtDESCRICAO_CONTA: TDBEdit
      Left = 6
      Top = 29
      Width = 265
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DESCRICAO_CONTA'
      DataSource = dsCadastro
      TabOrder = 0
    end
    object jvdbcmbxCLASSIFICACAO_CONTA: TJvDBComboBox
      Left = 287
      Top = 29
      Width = 194
      Height = 21
      DataField = 'CLASSIFICACAO_CONTA'
      DataSource = dsCadastro
      Items.Strings = (
        'Conta Caixa'
        'Conta Corrente'
        'Conta Aplica'#231#227'o')
      TabOrder = 1
      Values.Strings = (
        '1'
        '2'
        '3')
      ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
      ListSettings.OutfilteredValueFont.Color = clRed
      ListSettings.OutfilteredValueFont.Height = -11
      ListSettings.OutfilteredValueFont.Name = 'Tahoma'
      ListSettings.OutfilteredValueFont.Style = []
    end
    object jvdbchckbxStatus: TJvDBCheckBox
      Left = 424
      Top = 76
      Width = 49
      Height = 17
      Caption = 'Ativo'
      DataField = 'STATUS_CONTA'
      DataSource = dsCadastro
      TabOrder = 2
      ValueChecked = '1'
      ValueUnchecked = '2'
    end
    object jvdbcmbdtBANCO_CONTA: TJvDBComboEdit
      Left = 6
      Top = 74
      Width = 65
      Height = 21
      DataField = 'BANCO_CONTA'
      DataSource = dsCadastro
      ImageKind = ikEllipsis
      TabOrder = 3
    end
    object dbedtDESCRICAO_BANCO: TDBEdit
      Left = 77
      Top = 74
      Width = 261
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      DataField = 'DESCRICAO_BANCO'
      DataSource = dsCadastro
      ReadOnly = True
      TabOrder = 4
    end
    object DBEdit1: TDBEdit
      Left = 6
      Top = 117
      Width = 70
      Height = 21
      DataField = 'AGENCIA_CONTA'
      DataSource = dsCadastro
      TabOrder = 5
    end
    object DBEdit2: TDBEdit
      Left = 118
      Top = 117
      Width = 124
      Height = 21
      DataField = 'NUMEROCONTA_CONTA'
      DataSource = dsCadastro
      TabOrder = 6
    end
    object DBEdit3: TDBEdit
      Left = 242
      Top = 117
      Width = 27
      Height = 21
      DataField = 'DIGITOCONTA_CONTA'
      DataSource = dsCadastro
      TabOrder = 7
    end
    object DBEdit4: TDBEdit
      Left = 76
      Top = 117
      Width = 27
      Height = 21
      DataField = 'DIGITOAGENCIA_CONTA'
      DataSource = dsCadastro
      TabOrder = 8
    end
    object DBEdit5: TDBEdit
      Left = 6
      Top = 163
      Width = 263
      Height = 21
      DataField = 'TITULAR_CONTA'
      DataSource = dsCadastro
      TabOrder = 9
    end
    object DBEdit6: TDBEdit
      Left = 288
      Top = 163
      Width = 186
      Height = 21
      DataField = 'CNPJ_CONTA'
      DataSource = dsCadastro
      TabOrder = 10
    end
    object DBEdit7: TDBEdit
      Left = 288
      Top = 203
      Width = 186
      Height = 21
      DataField = 'CPF_CONTA'
      DataSource = dsCadastro
      TabOrder = 11
    end
    object DBEdit8: TDBEdit
      Left = 288
      Top = 117
      Width = 186
      Height = 21
      DataField = 'SLIP_CONTA'
      DataSource = dsCadastro
      TabOrder = 12
    end
    object DBEdit9: TDBEdit
      Left = 344
      Top = 74
      Width = 67
      Height = 21
      TabStop = False
      DataField = 'CAMARACOMPENSACAO_BANCO'
      DataSource = dsCadastro
      ReadOnly = True
      TabOrder = 13
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmCadConta.FDQueryPrincipal
    Left = 256
  end
  inherited JvEnterAsTab1: TJvEnterAsTab
    Left = 160
  end
end
