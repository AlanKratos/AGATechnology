inherited dmCadVenda: TdmCadVenda
  OldCreateOrder = True
  Height = 404
  Width = 357
  inherited FDQueryPrincipal: TFDQuery
    BeforePost = FDQueryPrincipalBeforePost
    AfterPost = nil
    OnNewRecord = FDQueryPrincipalNewRecord
    CachedUpdates = True
    SchemaAdapter = FDSchemaAdapterVenda
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = False
    SQL.Strings = (
      'select '
      '    PESSOA.CODIGO_PESSOA,'
      '    PESSOA.NOME_PESSOA,'
      '    TABELA.DESCRICAO_TABELA,'
      '    DOCUMENTO.CODIGO_DOCUMENTO,'
      '    DOCUMENTO.CLIENTE_DOCUMENTO,'
      '    DOCUMENTO.TABELA_DOCUMENTO,'
      '    DOCUMENTO.MODALIDADE_DOCUMENTO,'
      '    DOCUMENTO.EMPRESA_DOCUMENTO'
      'from DOCUMENTO'
      
        '   left join PESSOA on (DOCUMENTO.CLIENTE_DOCUMENTO = PESSOA.COD' +
        'IGO_PESSOA)'
      
        '   left join TABELA on (DOCUMENTO.TABELA_DOCUMENTO = TABELA.CODI' +
        'GO_TABELA)'
      'where DOCUMENTO.CODIGO_DOCUMENTO = :CODIGO')
    Left = 40
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQueryPrincipalCODIGO_PESSOA: TIntegerField
      FieldName = 'CODIGO_PESSOA'
      Origin = 'CODIGO_PESSOA'
    end
    object FDQueryPrincipalNOME_PESSOA: TStringField
      FieldName = 'NOME_PESSOA'
      Origin = 'NOME_PESSOA'
      ProviderFlags = [pfInWhere]
      Size = 100
    end
    object FDQueryPrincipalDESCRICAO_TABELA: TStringField
      FieldName = 'DESCRICAO_TABELA'
      Origin = 'DESCRICAO_TABELA'
      Size = 40
    end
    object FDQueryPrincipalCODIGO_DOCUMENTO: TIntegerField
      FieldName = 'CODIGO_DOCUMENTO'
      Origin = 'CODIGO_DOCUMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryPrincipalCLIENTE_DOCUMENTO: TIntegerField
      FieldName = 'CLIENTE_DOCUMENTO'
      Origin = 'CLIENTE_DOCUMENTO'
      Required = True
    end
    object FDQueryPrincipalTABELA_DOCUMENTO: TIntegerField
      FieldName = 'TABELA_DOCUMENTO'
      Origin = 'TABELA_DOCUMENTO'
    end
    object FDQueryPrincipalMODALIDADE_DOCUMENTO: TStringField
      FieldName = 'MODALIDADE_DOCUMENTO'
      Origin = 'MODALIDADE_DOCUMENTO'
      Size = 1
    end
    object FDQueryPrincipalEMPRESA_DOCUMENTO: TIntegerField
      FieldName = 'EMPRESA_DOCUMENTO'
      Origin = 'EMPRESA_DOCUMENTO'
      Required = True
    end
  end
  object FDSchemaAdapterVenda: TFDSchemaAdapter
    Left = 152
    Top = 24
  end
  object FDQueryVendaItem: TFDQuery
    BeforeInsert = FDQueryVendaItemBeforeInsert
    BeforeEdit = FDQueryVendaItemBeforeEdit
    BeforePost = FDQueryVendaItemBeforePost
    AfterDelete = FDQueryVendaItemAfterDelete
    OnNewRecord = FDQueryVendaItemNewRecord
    CachedUpdates = True
    IndexFieldNames = 'DOCUMENTO_DOC_ITEM'
    MasterSource = dsMaster
    MasterFields = 'CODIGO_DOCUMENTO'
    DetailFields = 'DOCUMENTO_DOC_ITEM'
    Connection = dmConexao.FDConexao
    SchemaAdapter = FDSchemaAdapterVenda
    SQL.Strings = (
      'select '
      '    DOCUMENTO_ITEM.CODIGO_DOC_ITEM,'
      '    DOCUMENTO_ITEM.DOCUMENTO_DOC_ITEM,'
      '    DOCUMENTO_ITEM.ITEM_DOC_ITEM,'
      '    DOCUMENTO_ITEM.QTD_DOC_ITEM,'
      '    DOCUMENTO_ITEM.VALOR_DOC_ITEM,'
      '    DOCUMENTO_ITEM.COR_DOC_ITEM,'
      '    DOCUMENTO_ITEM.GRADE_DOC_ITEM,'
      '    ITEM.DESCRICAO_ITEM,'
      '    COR.DESCRICAO_COR,'
      '    GRADE.DESCRICAO_GRADE'
      'from DOCUMENTO_ITEM'
      
        'left join ITEM on (ITEM.CODIGO_ITEM = DOCUMENTO_ITEM.ITEM_DOC_IT' +
        'EM)'
      'left join COR on (COR.CODIGO_COR = DOCUMENTO_ITEM.COR_DOC_ITEM)'
      
        'left join GRADE on (GRADE.CODIGO_GRADE = DOCUMENTO_ITEM.GRADE_DO' +
        'C_ITEM)'
      'where DOCUMENTO_ITEM.DOCUMENTO_DOC_ITEM = :CODIGO_DOCUMENTO')
    Left = 48
    Top = 88
    ParamData = <
      item
        Name = 'CODIGO_DOCUMENTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQueryVendaItemCODIGO_DOC_ITEM: TIntegerField
      FieldName = 'CODIGO_DOC_ITEM'
      Origin = 'CODIGO_DOC_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryVendaItemDOCUMENTO_DOC_ITEM: TIntegerField
      FieldName = 'DOCUMENTO_DOC_ITEM'
      Origin = 'DOCUMENTO_DOC_ITEM'
      Required = True
    end
    object FDQueryVendaItemITEM_DOC_ITEM: TIntegerField
      FieldName = 'ITEM_DOC_ITEM'
      Origin = 'ITEM_DOC_ITEM'
      Required = True
    end
    object FDQueryVendaItemQTD_DOC_ITEM: TIntegerField
      FieldName = 'QTD_DOC_ITEM'
      Origin = 'QTD_DOC_ITEM'
      Required = True
    end
    object FDQueryVendaItemVALOR_DOC_ITEM: TBCDField
      FieldName = 'VALOR_DOC_ITEM'
      Origin = 'VALOR_DOC_ITEM'
      Required = True
      currency = True
      Precision = 18
      Size = 2
    end
    object FDQueryVendaItemDESCRICAO_ITEM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_ITEM'
      Origin = 'DESCRICAO_ITEM'
      ProviderFlags = []
      Size = 100
    end
    object FDQueryVendaItemCOR_DOC_ITEM: TIntegerField
      FieldName = 'COR_DOC_ITEM'
      Origin = 'COR_DOC_ITEM'
    end
    object FDQueryVendaItemGRADE_DOC_ITEM: TIntegerField
      FieldName = 'GRADE_DOC_ITEM'
      Origin = 'GRADE_DOC_ITEM'
    end
    object FDQueryVendaItemDESCRICAO_COR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_COR'
      Origin = 'DESCRICAO_COR'
      ProviderFlags = []
      Size = 40
    end
    object FDQueryVendaItemDESCRICAO_GRADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_GRADE'
      Origin = 'DESCRICAO_GRADE'
      ProviderFlags = []
      Size = 40
    end
  end
  object dsMaster: TDataSource
    DataSet = FDQueryPrincipal
    Left = 152
    Top = 88
  end
  object FDQueryValidaCliente: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 152
    Top = 200
  end
  object FDQueryValidaItem: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 160
    Top = 144
  end
  object FDQueryValidaPreco: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 168
    Top = 328
  end
  object FDQueryTabelaPreco: TFDQuery
    Connection = dmConexao.FDConexao
    SQL.Strings = (
      'select '
      '    TABELA.DESCRICAO_TABELA,'
      '    TABELA.CODIGO_TABELA,'
      '    TABELA.PRECOCOR_TABELA,'
      '    TABELA.PRECOGRADE_TABELA'
      'from TABELA')
    Left = 40
    Top = 208
  end
  object FDQueryValidaCor: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 40
    Top = 272
  end
  object FDQueryValidaGrade: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 40
    Top = 328
  end
  object FDQueryPrazo: TFDQuery
    BeforeInsert = FDQueryPrazoBeforeInsert
    BeforeEdit = FDQueryPrazoBeforeEdit
    BeforePost = FDQueryPrazoBeforePost
    OnNewRecord = FDQueryPrazoNewRecord
    CachedUpdates = True
    IndexFieldNames = 'DOCUMENTO_DOC_PRAZO'
    MasterSource = dsMaster
    MasterFields = 'CODIGO_DOCUMENTO'
    DetailFields = 'DOCUMENTO_DOC_PRAZO'
    Connection = dmConexao.FDConexao
    SQL.Strings = (
      'select '
      '    DOCUMENTO_PRAZO.AUTOINC_DOC_PRAZO,'
      '    DOCUMENTO_PRAZO.DOCUMENTO_DOC_PRAZO,'
      '    DOCUMENTO_PRAZO.PRAZO_DOC_PRAZO,'
      '    DOCUMENTO_PRAZO.VENCIMENTO_DOC_PRAZO'
      'from DOCUMENTO_PRAZO'
      'where DOCUMENTO_PRAZO.DOCUMENTO_DOC_PRAZO = :CODIGO_DOCUMENTO')
    Left = 40
    Top = 152
    ParamData = <
      item
        Name = 'CODIGO_DOCUMENTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
