inherited frmCadTabelaPreco: TfrmCadTabelaPreco
  Caption = 'Tabela de Pre'#231'o'
  ClientHeight = 419
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 681
  ExplicitHeight = 446
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelLeft: TPanel
    Height = 384
    ExplicitHeight = 384
    inherited BitBtnExcluir: TSpeedButton
      OnClick = BitBtnExcluirClick
    end
  end
  object Panel2: TPanel [2]
    Left = 81
    Top = 35
    Width = 592
    Height = 384
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 2
    object pcTabelaPreco: TJvPageControl
      Left = 1
      Top = 1
      Width = 590
      Height = 382
      ActivePage = tsItem
      Align = alClient
      TabOrder = 0
      object tsPrincipal: TTabSheet
        Caption = 'Principal'
        object Label2: TLabel
          Left = 0
          Top = 3
          Width = 96
          Height = 13
          Caption = 'Descri'#231#227'o da Tabela'
        end
        object dbeDescricaoTabela: TDBEdit
          Left = 0
          Top = 22
          Width = 235
          Height = 21
          DataField = 'DESCRICAO_TABELA'
          DataSource = dsCadastro
          TabOrder = 0
        end
        object dbcbPrecoCor: TJvDBCheckBox
          Left = 3
          Top = 58
          Width = 97
          Height = 17
          Caption = 'Pre'#231'o Por Cor'
          DataField = 'PRECOCOR_TABELA'
          DataSource = dsCadastro
          TabOrder = 1
          ValueChecked = 'S'
          ValueUnchecked = 'N'
          OnChange = dbcbPrecoCorChange
        end
        object dbcbPrecoGrade: TJvDBCheckBox
          Left = 3
          Top = 81
          Width = 97
          Height = 17
          Caption = 'Pre'#231'o Por Grade'
          DataField = 'PRECOGRADE_TABELA'
          DataSource = dsCadastro
          TabOrder = 2
          ValueChecked = 'S'
          ValueUnchecked = 'N'
          OnChange = dbcbPrecoGradeChange
        end
      end
      object tsItem: TTabSheet
        Caption = 'Itens'
        ImageIndex = 1
        object dbgItens: TJvDBGrid
          Left = 0
          Top = 84
          Width = 582
          Height = 270
          Align = alBottom
          DataSource = dsItens
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = dbgItensDrawColumnCell
          OnEditButtonClick = dbgItensEditButtonClick
          OnKeyPress = dbgItensKeyPress
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 17
          TitleRowHeight = 17
          OnCanEditCell = dbgItensCanEditCell
        end
      end
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmCadTabelaPreco.FDQueryPrincipal
    Left = 256
  end
  inherited JvEnterAsTab1: TJvEnterAsTab
    Left = 176
  end
  object dsItens: TDataSource
    DataSet = dmCadTabelaPreco.FDQueryTabela_Detalhe
    Left = 560
  end
end
