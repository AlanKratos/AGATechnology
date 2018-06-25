inherited frmDocSaida: TfrmDocSaida
  Caption = 'frmDocSaida'
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 681
  ExplicitHeight = 393
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelLeft: TPanel
    inherited BitBtnSalvar: TSpeedButton
      OnClick = BitBtnSalvarClick
    end
    inherited BitBtnExcluir: TSpeedButton
      OnClick = BitBtnExcluirClick
    end
  end
  object Panel2: TPanel [2]
    Left = 81
    Top = 35
    Width = 592
    Height = 331
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 2
    ExplicitLeft = 192
    ExplicitTop = 168
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Label2: TLabel
      Left = 6
      Top = 10
      Width = 33
      Height = 13
      Caption = 'Cliente'
    end
    object pcDocSaida: TJvPageControl
      Left = 1
      Top = 112
      Width = 590
      Height = 218
      ActivePage = TabSheet1
      Align = alBottom
      TabOrder = 0
      ExplicitLeft = 2
      object TabSheet1: TTabSheet
        Caption = 'TabSheet1'
        ExplicitLeft = -12
        ExplicitTop = 27
        ExplicitWidth = 281
        ExplicitHeight = 165
        object JvDBGrid1: TJvDBGrid
          Left = 0
          Top = 0
          Width = 582
          Height = 190
          Align = alClient
          DataSource = dsItens
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
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              Title.Alignment = taCenter
              Title.Caption = 'Item'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              Title.Alignment = taCenter
              Title.Caption = 'Quantidade'
              Visible = True
            end
            item
              Expanded = False
              Title.Alignment = taCenter
              Title.Caption = 'Valor'
              Width = 100
              Visible = True
            end>
        end
      end
    end
    object dbeCliente: TDBEdit
      Left = 77
      Top = 29
      Width = 260
      Height = 21
      DataField = 'NOME_PESSOA'
      DataSource = dsCadastro
      TabOrder = 1
    end
    object dbceCodCliente: TJvDBComboEdit
      Left = 6
      Top = 29
      Width = 65
      Height = 21
      DataField = 'CODIGO_PESSOA'
      DataSource = dsCadastro
      TabOrder = 2
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmDocSaida.FDQueryPrincipal
    Left = 288
    Top = 0
  end
  inherited JvEnterAsTab1: TJvEnterAsTab
    Left = 208
    Top = 0
  end
  object dsItens: TDataSource
    DataSet = dmDocSaida.FDQueryItens
    Left = 560
  end
end
