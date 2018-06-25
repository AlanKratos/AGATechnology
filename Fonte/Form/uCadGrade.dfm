inherited frmCadGrade: TfrmCadGrade
  Caption = 'Cadastro de Grade'
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 681
  ExplicitHeight = 393
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelLeft: TPanel
    inherited BitBtnExcluir: TSpeedButton
      OnClick = BitBtnExcluirClick
    end
  end
  object Panel2: TPanel [2]
    Left = 83
    Top = 36
    Width = 590
    Height = 330
    TabOrder = 2
    object Label2: TLabel
      Left = 12
      Top = 13
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object dbeDescGrade: TDBEdit
      Left = 12
      Top = 32
      Width = 61
      Height = 21
      DataField = 'DESCRICAO_GRADE'
      DataSource = dsCadastro
      TabOrder = 0
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmCadGrade.FDQueryPrincipal
  end
end
