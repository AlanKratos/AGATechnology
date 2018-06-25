inherited dmDocSaida: TdmDocSaida
  Height = 224
  Width = 263
  inherited FDQueryPrincipal: TFDQuery
    BeforePost = FDQueryPrincipalBeforePost
    OnNewRecord = FDQueryPrincipalNewRecord
    CachedUpdates = True
    SchemaAdapter = FDSchemaAdapterDocSaida
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = True
    SQL.Strings = (
      'select '
      '    DOCUMENTO_SAIDA.CODIGO_DOC_SAIDA,'
      '    DOCUMENTO_SAIDA.CLIENTE_DOC_SAIDA,'
      '    DOCUMENTO_SAIDA.TABPRECO_DOC_SAIDA,'
      '    PESSOA.CODIGO_PESSOA,'
      '    PESSOA.NOME_PESSOA'
      'from DOCUMENTO_SAIDA'
      
        'left join PESSOA on (PESSOA.CODIGO_PESSOA = DOCUMENTO_SAIDA.CLIE' +
        'NTE_DOC_SAIDA)'
      'where DOCUMENTO_SAIDA.CODIGO_DOC_SAIDA = :CODIGO')
    Left = 48
    Top = 24
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQueryPrincipalCODIGO_DOC_SAIDA: TIntegerField
      FieldName = 'CODIGO_DOC_SAIDA'
      Origin = 'CODIGO_DOC_SAIDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryPrincipalCLIENTE_DOC_SAIDA: TIntegerField
      FieldName = 'CLIENTE_DOC_SAIDA'
      Origin = 'CLIENTE_DOC_SAIDA'
      Required = True
    end
    object FDQueryPrincipalTABPRECO_DOC_SAIDA: TIntegerField
      FieldName = 'TABPRECO_DOC_SAIDA'
      Origin = 'TABPRECO_DOC_SAIDA'
    end
    object FDQueryPrincipalCODIGO_PESSOA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO_PESSOA'
      Origin = 'CODIGO_PESSOA'
      ProviderFlags = []
    end
    object FDQueryPrincipalNOME_PESSOA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_PESSOA'
      Origin = 'NOME_PESSOA'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object FDQueryItens: TFDQuery
    BeforeInsert = FDQueryItensBeforeInsert
    BeforeEdit = FDQueryItensBeforeEdit
    BeforePost = FDQueryItensBeforePost
    OnNewRecord = FDQueryItensNewRecord
    CachedUpdates = True
    MasterSource = dsMaster
    MasterFields = 'CODIGO_DOC_SAIDA'
    Connection = dmConexao.FDConexao
    SchemaAdapter = FDSchemaAdapterDocSaida
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = True
    SQL.Strings = (
      'select '
      '    DOCUMENTO_SAIDA_ITEM.CODIGO_DOC_SAIDA_ITEM,'
      '    DOCUMENTO_SAIDA_ITEM.DOCUMENTO_DOC_SAIDA_ITEM,'
      '    DOCUMENTO_SAIDA_ITEM.ITEM_DOC_SAIDA_ITEM,'
      '    DOCUMENTO_SAIDA_ITEM.QTD_DOC_SAIDA_ITEM,'
      '    DOCUMENTO_SAIDA_ITEM.VALOR_DOC_SAIDA_ITEM'
      'from DOCUMENTO_SAIDA_ITEM'
      
        'where DOCUMENTO_SAIDA_ITEM.DOCUMENTO_DOC_SAIDA_ITEM = :CODIGO_DO' +
        'C_SAIDA')
    Left = 160
    Top = 24
    ParamData = <
      item
        Name = 'CODIGO_DOC_SAIDA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dsMaster: TDataSource
    DataSet = FDQueryPrincipal
    Left = 168
    Top = 112
  end
  object FDSchemaAdapterDocSaida: TFDSchemaAdapter
    Left = 48
    Top = 112
  end
end
