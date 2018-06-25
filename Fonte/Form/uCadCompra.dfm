inherited frmCadCompra: TfrmCadCompra
  Caption = 'frmCadCompra'
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelLeft: TPanel
    object SpeedButton1: TSpeedButton
      Left = 5
      Top = 229
      Width = 70
      Height = 25
      Caption = 'Carregar'
      OnClick = SpeedButton1Click
    end
  end
  object PanelCenter: TPanel [2]
    Left = 81
    Top = 35
    Width = 592
    Height = 331
    Align = alClient
    TabOrder = 2
    object Label2: TLabel
      Left = 2
      Top = 66
      Width = 83
      Height = 13
      Caption = 'Chave de Acesso'
    end
    object Label3: TLabel
      Left = 6
      Top = 14
      Width = 54
      Height = 13
      Caption = 'Documento'
    end
    object dbgItens: TJvDBGrid
      Left = 1
      Top = 176
      Width = 590
      Height = 154
      Align = alBottom
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = dbgItensDrawColumnCell
      OnMouseMove = dbgItensMouseMove
      OnTitleClick = dbgItensTitleClick
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <>
      RowsHeight = 17
      TitleRowHeight = 17
    end
    object dbeChaveAcesso: TDBEdit
      Left = 2
      Top = 85
      Width = 215
      Height = 21
      TabOrder = 1
    end
    object dbeNumero: TDBEdit
      Left = 2
      Top = 33
      Width = 63
      Height = 21
      TabOrder = 2
    end
  end
  inherited dsCadastro: TDataSource
    Left = 280
  end
  inherited JvEnterAsTab1: TJvEnterAsTab
    Left = 168
  end
end
