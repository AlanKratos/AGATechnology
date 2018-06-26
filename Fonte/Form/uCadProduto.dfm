inherited frmCadProduto: TfrmCadProduto
  Caption = 'frmCadProduto'
  ClientHeight = 434
  ClientWidth = 754
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 762
  ExplicitHeight = 461
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelTop: TPanel
    Width = 754
    ExplicitWidth = 754
  end
  inherited PanelLeft: TPanel
    Height = 399
    ExplicitHeight = 399
    inherited BitBtnExcluir: TSpeedButton
      OnClick = BitBtnExcluirClick
    end
  end
  object Panel2: TPanel [2]
    Left = 81
    Top = 35
    Width = 673
    Height = 399
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 2
    object Label2: TLabel
      Left = 6
      Top = 8
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object pcItem: TJvPageControl
      Left = 1
      Top = 72
      Width = 671
      Height = 326
      ActivePage = tsPrincipal
      Align = alBottom
      TabOrder = 0
      object tsPrincipal: TTabSheet
        Caption = 'Principal'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 224
          Height = 298
          Align = alLeft
          TabOrder = 0
          object Label3: TLabel
            Left = 42
            Top = 3
            Width = 67
            Height = 13
            Caption = 'Detalhamento'
          end
          object Label4: TLabel
            Left = 8
            Top = 145
            Width = 29
            Height = 13
            Caption = 'Grupo'
          end
          object Label5: TLabel
            Left = 8
            Top = 191
            Width = 47
            Height = 13
            Caption = 'SubGrupo'
          end
          object Label6: TLabel
            Left = 8
            Top = 77
            Width = 39
            Height = 13
            Caption = 'Unidade'
          end
          object dbcbCor: TJvDBCheckBox
            Left = 8
            Top = 22
            Width = 72
            Height = 17
            Caption = 'Cor'
            DataField = 'VARIACOR_ITEM'
            DataSource = dsCadastro
            TabOrder = 0
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object dbcbGrade: TJvDBCheckBox
            Left = 8
            Top = 45
            Width = 72
            Height = 17
            Caption = 'Grade'
            DataField = 'VARIAGRADE_ITEM'
            DataSource = dsCadastro
            TabOrder = 1
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object dbeGrupo: TDBEdit
            Left = 86
            Top = 164
            Width = 133
            Height = 21
            CharCase = ecUpperCase
            DataField = 'DESCRICAO_GRUPO'
            DataSource = dsCadastro
            ReadOnly = True
            TabOrder = 2
          end
          object dbeSubGrupo: TDBEdit
            Left = 86
            Top = 210
            Width = 133
            Height = 21
            CharCase = ecUpperCase
            DataField = 'DESCRICAO_SUBGRUPO'
            DataSource = dsCadastro
            ReadOnly = True
            TabOrder = 3
          end
          object dblucbUnidade: TJvDBLookupCombo
            Left = 8
            Top = 96
            Width = 145
            Height = 21
            DataField = 'UNIDADE_ITEM'
            DataSource = dsCadastro
            LookupField = 'CODIGO_UNIDADE'
            LookupDisplay = 'DESCRICAO_UNIDADE'
            LookupSource = dsUnidade
            TabOrder = 4
          end
          object jvdbceGrupo: TJvDBComboEdit
            Left = 9
            Top = 164
            Width = 75
            Height = 21
            DataField = 'GRUPO_ITEM'
            DataSource = dsCadastro
            TabOrder = 5
          end
          object jvdbceSubGrupo: TJvDBComboEdit
            Left = 9
            Top = 210
            Width = 75
            Height = 21
            DataField = 'SUBGRUPO_ITEM'
            DataSource = dsCadastro
            TabOrder = 6
          end
          object dbcbTecido: TJvDBCheckBox
            Left = 86
            Top = 22
            Width = 97
            Height = 17
            Caption = 'Tecido'
            DataField = 'VARIATECIDO_ITEM'
            DataSource = dsCadastro
            TabOrder = 7
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
        object Panel4: TPanel
          Left = 306
          Top = 0
          Width = 357
          Height = 298
          Align = alRight
          TabOrder = 1
          object Label7: TLabel
            Left = 136
            Top = 3
            Width = 51
            Height = 13
            Caption = 'Tributa'#231#227'o'
          end
          object Label8: TLabel
            Left = 5
            Top = 135
            Width = 58
            Height = 13
            Caption = 'Observa'#231#227'o'
          end
          object Label9: TLabel
            Left = 5
            Top = 23
            Width = 22
            Height = 13
            Caption = 'NCM'
          end
          object Label10: TLabel
            Left = 5
            Top = 69
            Width = 89
            Height = 13
            Caption = 'Tipo de Tributa'#231#227'o'
          end
          object dbmObservacao: TDBMemo
            Left = 1
            Top = 154
            Width = 355
            Height = 143
            Align = alBottom
            DataField = 'OBSERVACAO_ITEM'
            DataSource = dsCadastro
            TabOrder = 0
            OnKeyPress = dbmObservacaoKeyPress
          end
          object jvdbceCodNcm: TJvDBComboEdit
            Left = 5
            Top = 42
            Width = 84
            Height = 21
            DataField = 'NCM_ITEM'
            DataSource = dsCadastro
            TabOrder = 1
          end
          object dbeNcm: TDBEdit
            Left = 92
            Top = 42
            Width = 141
            Height = 21
            DataField = 'COD_NCM'
            DataSource = dsCadastro
            ReadOnly = True
            TabOrder = 2
          end
          object jvdbcbTipoTributacao: TJvDBComboBox
            Left = 5
            Top = 88
            Width = 145
            Height = 21
            DataField = 'TRIBUTACAO_ITEM'
            DataSource = dsCadastro
            Items.Strings = (
              'Tributado'
              'N'#227'o Tributado'
              'Substitui'#231#227'o Tribut'#225'ria'
              'Isento')
            TabOrder = 3
            Values.Strings = (
              '1'
              '2'
              '3'
              '4')
            ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
            ListSettings.OutfilteredValueFont.Color = clRed
            ListSettings.OutfilteredValueFont.Height = -11
            ListSettings.OutfilteredValueFont.Name = 'Tahoma'
            ListSettings.OutfilteredValueFont.Style = []
          end
        end
      end
      object tsDiferenciacao: TTabSheet
        Caption = 'Diferencia'#231#227'o'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label11: TLabel
          Left = 3
          Top = 14
          Width = 70
          Height = 13
          Caption = 'Diferencia'#231#245'es'
        end
        object sbGerarCombinacao: TSpeedButton
          Left = 236
          Top = 3
          Width = 99
          Height = 22
          Caption = 'Gerar Combina'#231#245'es'
          OnClick = sbGerarCombinacaoClick
        end
        object dbgDiferenciacao: TJvDBGrid
          Left = 1
          Top = 41
          Width = 659
          Height = 254
          DataSource = dsItemDetalhe
          ReadOnly = True
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
              FieldName = 'COR_ITEM_DETALHE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO_COR'
              Width = 174
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GRADE_ITEM_DETALHE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO_GRADE'
              Width = 207
              Visible = True
            end>
        end
      end
    end
    object dbeDescricao: TDBEdit
      Left = 6
      Top = 27
      Width = 307
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DESCRICAO_ITEM'
      DataSource = dsCadastro
      TabOrder = 1
    end
  end
  object dsItemDetalhe: TDataSource
    Left = 568
  end
  object dsUnidade: TDataSource
    DataSet = dmCadProduto.QryUnidade
    Left = 208
  end
end
