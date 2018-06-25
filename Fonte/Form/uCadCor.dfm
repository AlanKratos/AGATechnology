inherited frmCadCor: TfrmCadCor
  Caption = 'frmCadCor'
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 320
  ExplicitHeight = 240
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
      Left = 4
      Top = 13
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object dbeDescCor: TDBEdit
      Left = 4
      Top = 32
      Width = 261
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DESCRICAO_COR'
      DataSource = dsCadastro
      TabOrder = 0
    end
  end
end
