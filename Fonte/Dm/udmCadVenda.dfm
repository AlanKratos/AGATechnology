inherited dmCadVenda: TdmCadVenda
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 404
  Width = 357
  inherited QryCadastro: TFDQuery
    BeforePost = QryCadastroBeforePost
    AfterPost = nil
    OnNewRecord = QryCadastroNewRecord
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
  inherited QryNavegar: TFDQuery
    Left = 280
  end
  object FDSchemaAdapterVenda: TFDSchemaAdapter
    Left = 152
    Top = 24
  end
  object QryVendaItem: TFDQuery
    BeforeInsert = QryVendaItemBeforeInsert
    BeforeEdit = QryVendaItemBeforeEdit
    BeforePost = QryVendaItemBeforePost
    AfterDelete = QryVendaItemAfterDelete
    OnNewRecord = QryVendaItemNewRecord
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
    object QryVendaItemCODIGO_DOC_ITEM: TIntegerField
      FieldName = 'CODIGO_DOC_ITEM'
      Origin = 'CODIGO_DOC_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryVendaItemDOCUMENTO_DOC_ITEM: TIntegerField
      FieldName = 'DOCUMENTO_DOC_ITEM'
      Origin = 'DOCUMENTO_DOC_ITEM'
      Required = True
    end
    object QryVendaItemITEM_DOC_ITEM: TIntegerField
      FieldName = 'ITEM_DOC_ITEM'
      Origin = 'ITEM_DOC_ITEM'
      Required = True
    end
    object QryVendaItemQTD_DOC_ITEM: TIntegerField
      FieldName = 'QTD_DOC_ITEM'
      Origin = 'QTD_DOC_ITEM'
      Required = True
    end
    object QryVendaItemVALOR_DOC_ITEM: TBCDField
      FieldName = 'VALOR_DOC_ITEM'
      Origin = 'VALOR_DOC_ITEM'
      Required = True
      currency = True
      Precision = 18
      Size = 2
    end
    object QryVendaItemDESCRICAO_ITEM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_ITEM'
      Origin = 'DESCRICAO_ITEM'
      ProviderFlags = []
      Size = 100
    end
    object QryVendaItemCOR_DOC_ITEM: TIntegerField
      FieldName = 'COR_DOC_ITEM'
      Origin = 'COR_DOC_ITEM'
    end
    object QryVendaItemGRADE_DOC_ITEM: TIntegerField
      FieldName = 'GRADE_DOC_ITEM'
      Origin = 'GRADE_DOC_ITEM'
    end
    object QryVendaItemDESCRICAO_COR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_COR'
      Origin = 'DESCRICAO_COR'
      ProviderFlags = []
      Size = 40
    end
    object QryVendaItemDESCRICAO_GRADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_GRADE'
      Origin = 'DESCRICAO_GRADE'
      ProviderFlags = []
      Size = 40
    end
  end
  object dsMaster: TDataSource
    Left = 152
    Top = 88
  end
  object QryValidaCliente: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 152
    Top = 200
  end
  object QryValidaItem: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 160
    Top = 144
  end
  object QryValidaPreco: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 168
    Top = 328
  end
  object QryTabelaPreco: TFDQuery
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
  object QryValidaCor: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 40
    Top = 272
  end
  object QryValidaGrade: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 40
    Top = 328
  end
  object QryPrazo: TFDQuery
    BeforeInsert = QryPrazoBeforeInsert
    BeforeEdit = QryPrazoBeforeEdit
    BeforePost = QryPrazoBeforePost
    OnNewRecord = QryPrazoNewRecord
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
