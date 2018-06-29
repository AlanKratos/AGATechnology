inherited dmCadTabelaPreco: TdmCadTabelaPreco
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Width = 269
  inherited QryCadastro: TFDQuery
    BeforePost = QryCadastroBeforePost
    OnNewRecord = QryCadastroNewRecord
    CachedUpdates = True
    OnReconcileError = QryCadastroReconcileError
    SchemaAdapter = FDSchemaAdapterTabelaPreco
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = False
    SQL.Strings = (
      'select '
      '    TABELA.CODIGO_TABELA,'
      '    TABELA.DESCRICAO_TABELA,'
      '    TABELA.PADRAO_TABELA,'
      '    TABELA.REFERENCIA_TABELA,'
      '    TABELA.PRECOCOR_TABELA,'
      '    TABELA.PRECOGRADE_TABELA'
      'from TABELA'
      'where TABELA.CODIGO_TABELA = :CODIGO')
    Left = 40
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQueryPrincipalCODIGO_TABELA: TIntegerField
      FieldName = 'CODIGO_TABELA'
      Origin = 'CODIGO_TABELA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryPrincipalDESCRICAO_TABELA: TStringField
      FieldName = 'DESCRICAO_TABELA'
      Origin = 'DESCRICAO_TABELA'
      Required = True
      Size = 40
    end
    object FDQueryPrincipalPADRAO_TABELA: TStringField
      FieldName = 'PADRAO_TABELA'
      Origin = 'PADRAO_TABELA'
      Size = 1
    end
    object FDQueryPrincipalREFERENCIA_TABELA: TIntegerField
      FieldName = 'REFERENCIA_TABELA'
      Origin = 'REFERENCIA_TABELA'
    end
    object FDQueryPrincipalPRECOCOR_TABELA: TStringField
      FieldName = 'PRECOCOR_TABELA'
      Origin = 'PRECOCOR_TABELA'
      Required = True
      Size = 1
    end
    object FDQueryPrincipalPRECOGRADE_TABELA: TStringField
      FieldName = 'PRECOGRADE_TABELA'
      Origin = 'PRECOGRADE_TABELA'
      Required = True
      Size = 1
    end
  end
  object QryTabela_Detalhe: TFDQuery
    BeforeInsert = QryTabela_DetalheBeforeInsert
    BeforeEdit = QryTabela_DetalheBeforeEdit
    BeforePost = QryTabela_DetalheBeforePost
    BeforeDelete = QryTabela_DetalheBeforeDelete
    OnNewRecord = QryTabela_DetalheNewRecord
    CachedUpdates = True
    IndexFieldNames = 'TABELA_TAB_DET'
    MasterSource = dsMaster
    MasterFields = 'CODIGO_TABELA'
    DetailFields = 'TABELA_TAB_DET'
    OnReconcileError = QryTabela_DetalheReconcileError
    Connection = dmConexao.FDConexao
    SchemaAdapter = FDSchemaAdapterTabelaPreco
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = True
    SQL.Strings = (
      'select '
      '    TABELA_DETALHE.CODIGO_TAB_DET,'
      '    TABELA_DETALHE.TABELA_TAB_DET,'
      '    TABELA_DETALHE.ITEM_TAB_DET,'
      '    TABELA_DETALHE.COR_TAB_DET,'
      '    TABELA_DETALHE.GRADE_TAB_DET,'
      '    TABELA_DETALHE.VALOR_TAB_DET,'
      '    ITEM.DESCRICAO_ITEM,'
      '    COR.DESCRICAO_COR,'
      '    GRADE.DESCRICAO_GRADE'
      'from TABELA_DETALHE'
      
        'inner join TABELA ON (TABELA.CODIGO_TABELA = TABELA_DETALHE.TABE' +
        'LA_TAB_DET)'
      
        'left join ITEM ON (ITEM.CODIGO_ITEM = TABELA_DETALHE.ITEM_TAB_DE' +
        'T)'
      'left join COR ON (COR.CODIGO_COR = TABELA_DETALHE.COR_TAB_DET)'
      
        'left join GRADE ON (GRADE.CODIGO_GRADE = TABELA_DETALHE.GRADE_TA' +
        'B_DET)'
      'where TABELA_DETALHE.TABELA_TAB_DET = :CODIGO_TABELA')
    Left = 40
    Top = 88
    ParamData = <
      item
        Name = 'CODIGO_TABELA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QryTabela_DetalheCODIGO_TAB_DET: TIntegerField
      FieldName = 'CODIGO_TAB_DET'
      Origin = 'CODIGO_TAB_DET'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryTabela_DetalheTABELA_TAB_DET: TIntegerField
      FieldName = 'TABELA_TAB_DET'
      Origin = 'TABELA_TAB_DET'
      Required = True
    end
    object QryTabela_DetalheITEM_TAB_DET: TIntegerField
      FieldName = 'ITEM_TAB_DET'
      Origin = 'ITEM_TAB_DET'
      Required = True
    end
    object QryTabela_DetalheCOR_TAB_DET: TIntegerField
      FieldName = 'COR_TAB_DET'
      Origin = 'COR_TAB_DET'
      Required = True
    end
    object QryTabela_DetalheGRADE_TAB_DET: TIntegerField
      FieldName = 'GRADE_TAB_DET'
      Origin = 'GRADE_TAB_DET'
      Required = True
    end
    object QryTabela_DetalheVALOR_TAB_DET: TBCDField
      FieldName = 'VALOR_TAB_DET'
      Origin = 'VALOR_TAB_DET'
      Required = True
      Precision = 18
      Size = 2
    end
    object QryTabela_DetalheDESCRICAO_ITEM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_ITEM'
      Origin = 'DESCRICAO_ITEM'
      ProviderFlags = []
      Size = 100
    end
    object QryTabela_DetalheDESCRICAO_COR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_COR'
      Origin = 'DESCRICAO_COR'
      ProviderFlags = []
      Size = 40
    end
    object QryTabela_DetalheDESCRICAO_GRADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_GRADE'
      Origin = 'DESCRICAO_GRADE'
      ProviderFlags = []
      Size = 40
    end
  end
  object dsMaster: TDataSource
    Left = 128
    Top = 24
  end
  object FDSchemaAdapterTabelaPreco: TFDSchemaAdapter
    Left = 168
    Top = 112
  end
  object QryValidaItem: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 40
    Top = 160
  end
  object QryValidaCor: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 40
    Top = 216
  end
  object QryValidaGrade: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 40
    Top = 272
  end
end
