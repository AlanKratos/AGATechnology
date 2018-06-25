inherited dmCadProduto: TdmCadProduto
  OldCreateOrder = True
  Height = 443
  Width = 454
  inherited FDQueryPrincipal: TFDQuery
    AfterInsert = FDQueryPrincipalAfterInsert
    BeforePost = FDQueryPrincipalBeforePost
    OnNewRecord = FDQueryPrincipalNewRecord
    CachedUpdates = True
    SchemaAdapter = FDSchemaAdapterProduto
    SQL.Strings = (
      'select '
      '    ITEM.CODIGO_ITEM,'
      '    ITEM.TIPO_ITEM,'
      '    ITEM.DESCRICAO_ITEM,'
      '    ITEM.CODIGOBARRAS_ITEM,'
      '    ITEM.COLECAO_ITEM,'
      '    ITEM.VARIACOR_ITEM,'
      '    ITEM.VALIDADE_ITEM,'
      '    ITEM.VARIATECIDO_ITEM,'
      '    ITEM.VARIAGRADE_ITEM,'
      '    ITEM.VARIAACABAMENTO_ITEM,'
      '    ITEM.GRUPO_ITEM,'
      '    ITEM.SUBGRUPO_ITEM,'
      '    ITEM.NCM_ITEM,'
      '    ITEM.PESOBRUTO_ITEM,'
      '    ITEM.PESOLIQUIDO_ITEM,'
      '    ITEM.STATUS_ITEM,'
      '    ITEM.UNIDADE_ITEM,'
      '    ITEM.PRODUTO_ITEM,'
      '    ITEM.OBSERVACAO_ITEM,'
      '    ITEM.TRIBUTACAO_ITEM,'
      '    GRUPO.DESCRICAO_GRUPO,'
      '    SUBGRUPO.DESCRICAO_SUBGRUPO,'
      '    NCM.COD_NCM'
      'from ITEM'
      
        '   left join SUBGRUPO on (SUBGRUPO.CODIGO_SUBGRUPO = ITEM.SUBGRU' +
        'PO_ITEM)'
      '   left join GRUPO on (ITEM.GRUPO_ITEM = GRUPO.CODIGO_GRUPO)'
      '   left join NCM on (ITEM.NCM_ITEM = NCM.CODIGO_NCM)'
      'where ITEM.CODIGO_ITEM = :CODIGO')
    Left = 40
    Top = 8
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQueryPrincipalCODIGO_ITEM: TIntegerField
      FieldName = 'CODIGO_ITEM'
      Origin = 'CODIGO_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryPrincipalTIPO_ITEM: TIntegerField
      FieldName = 'TIPO_ITEM'
      Origin = 'TIPO_ITEM'
    end
    object FDQueryPrincipalDESCRICAO_ITEM: TStringField
      FieldName = 'DESCRICAO_ITEM'
      Origin = 'DESCRICAO_ITEM'
      Required = True
      Size = 100
    end
    object FDQueryPrincipalCODIGOBARRAS_ITEM: TStringField
      FieldName = 'CODIGOBARRAS_ITEM'
      Origin = 'CODIGOBARRAS_ITEM'
    end
    object FDQueryPrincipalCOLECAO_ITEM: TIntegerField
      FieldName = 'COLECAO_ITEM'
      Origin = 'COLECAO_ITEM'
    end
    object FDQueryPrincipalVARIACOR_ITEM: TBooleanField
      FieldName = 'VARIACOR_ITEM'
      Origin = 'VARIACOR_ITEM'
      Required = True
    end
    object FDQueryPrincipalVALIDADE_ITEM: TIntegerField
      FieldName = 'VALIDADE_ITEM'
      Origin = 'VALIDADE_ITEM'
    end
    object FDQueryPrincipalVARIATECIDO_ITEM: TStringField
      FieldName = 'VARIATECIDO_ITEM'
      Origin = 'VARIATECIDO_ITEM'
      Size = 1
    end
    object FDQueryPrincipalVARIAGRADE_ITEM: TBooleanField
      FieldName = 'VARIAGRADE_ITEM'
      Origin = 'VARIAGRADE_ITEM'
      Required = True
    end
    object FDQueryPrincipalVARIAACABAMENTO_ITEM: TStringField
      FieldName = 'VARIAACABAMENTO_ITEM'
      Origin = 'VARIAACABAMENTO_ITEM'
      Size = 1
    end
    object FDQueryPrincipalGRUPO_ITEM: TIntegerField
      FieldName = 'GRUPO_ITEM'
      Origin = 'GRUPO_ITEM'
    end
    object FDQueryPrincipalSUBGRUPO_ITEM: TIntegerField
      FieldName = 'SUBGRUPO_ITEM'
      Origin = 'SUBGRUPO_ITEM'
    end
    object FDQueryPrincipalNCM_ITEM: TIntegerField
      FieldName = 'NCM_ITEM'
      Origin = 'NCM_ITEM'
    end
    object FDQueryPrincipalPESOBRUTO_ITEM: TBCDField
      FieldName = 'PESOBRUTO_ITEM'
      Origin = 'PESOBRUTO_ITEM'
      Precision = 18
      Size = 3
    end
    object FDQueryPrincipalPESOLIQUIDO_ITEM: TBCDField
      FieldName = 'PESOLIQUIDO_ITEM'
      Origin = 'PESOLIQUIDO_ITEM'
      Precision = 18
      Size = 3
    end
    object FDQueryPrincipalSTATUS_ITEM: TIntegerField
      FieldName = 'STATUS_ITEM'
      Origin = 'STATUS_ITEM'
      Required = True
    end
    object FDQueryPrincipalUNIDADE_ITEM: TIntegerField
      FieldName = 'UNIDADE_ITEM'
      Origin = 'UNIDADE_ITEM'
      Required = True
    end
    object FDQueryPrincipalPRODUTO_ITEM: TIntegerField
      FieldName = 'PRODUTO_ITEM'
      Origin = 'PRODUTO_ITEM'
      Required = True
    end
    object FDQueryPrincipalDESCRICAO_GRUPO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_GRUPO'
      Origin = 'DESCRICAO_GRUPO'
      ProviderFlags = []
      Size = 40
    end
    object FDQueryPrincipalDESCRICAO_SUBGRUPO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_SUBGRUPO'
      Origin = 'DESCRICAO_SUBGRUPO'
      ProviderFlags = []
      Size = 40
    end
    object FDQueryPrincipalOBSERVACAO_ITEM: TMemoField
      FieldName = 'OBSERVACAO_ITEM'
      Origin = 'OBSERVACAO_ITEM'
      BlobType = ftMemo
    end
    object FDQueryPrincipalTRIBUTACAO_ITEM: TIntegerField
      FieldName = 'TRIBUTACAO_ITEM'
      Origin = 'TRIBUTACAO_ITEM'
      Required = True
    end
    object FDQueryPrincipalCOD_NCM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COD_NCM'
      Origin = 'COD_NCM'
      ProviderFlags = []
      Size = 11
    end
  end
  object FDQueryItemDetalhe: TFDQuery
    BeforeInsert = FDQueryItemDetalheBeforeInsert
    BeforeEdit = FDQueryItemDetalheBeforeEdit
    BeforePost = FDQueryItemDetalheBeforePost
    OnNewRecord = FDQueryItemDetalheNewRecord
    CachedUpdates = True
    IndexFieldNames = 'COD_ITEM_DETALHE'
    MasterSource = dsMaster
    MasterFields = 'CODIGO_ITEM'
    DetailFields = 'COD_ITEM_DETALHE'
    Connection = dmConexao.FDConexao
    SchemaAdapter = FDSchemaAdapterProduto
    SQL.Strings = (
      'select '
      '    ITEM_DETALHE.CODIGO_ITEM_DETALHE,'
      '    ITEM_DETALHE.COR_ITEM_DETALHE,'
      '    ITEM_DETALHE.GRADE_ITEM_DETALHE,'
      '    ITEM_DETALHE.TECIDO_ITEM_DETALHE,'
      '    ITEM_DETALHE.STATUS_ITEM_DETALHE,'
      '    ITEM_DETALHE.CODIGOBARRAS_ITEM_DETALHE,'
      '    ITEM_DETALHE.COD_ITEM_DETALHE,'
      '    COR.DESCRICAO_COR,'
      '    GRADE.DESCRICAO_GRADE'
      'from ITEM_DETALHE'
      
        'left join COR on (COR.CODIGO_COR = ITEM_DETALHE.COR_ITEM_DETALHE' +
        ')'
      
        'left join GRADE on (GRADE.CODIGO_GRADE = ITEM_DETALHE.GRADE_ITEM' +
        '_DETALHE)'
      'where ITEM_DETALHE.COD_ITEM_DETALHE = :CODIGO_ITEM')
    Left = 40
    Top = 72
    ParamData = <
      item
        Name = 'CODIGO_ITEM'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQueryItemDetalheCODIGO_ITEM_DETALHE: TIntegerField
      FieldName = 'CODIGO_ITEM_DETALHE'
      Origin = 'CODIGO_ITEM_DETALHE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryItemDetalheCOR_ITEM_DETALHE: TIntegerField
      FieldName = 'COR_ITEM_DETALHE'
      Origin = 'COR_ITEM_DETALHE'
      Required = True
    end
    object FDQueryItemDetalheGRADE_ITEM_DETALHE: TIntegerField
      FieldName = 'GRADE_ITEM_DETALHE'
      Origin = 'GRADE_ITEM_DETALHE'
      Required = True
    end
    object FDQueryItemDetalheTECIDO_ITEM_DETALHE: TIntegerField
      FieldName = 'TECIDO_ITEM_DETALHE'
      Origin = 'TECIDO_ITEM_DETALHE'
    end
    object FDQueryItemDetalheSTATUS_ITEM_DETALHE: TIntegerField
      FieldName = 'STATUS_ITEM_DETALHE'
      Origin = 'STATUS_ITEM_DETALHE'
      Required = True
    end
    object FDQueryItemDetalheCODIGOBARRAS_ITEM_DETALHE: TStringField
      FieldName = 'CODIGOBARRAS_ITEM_DETALHE'
      Origin = 'CODIGOBARRAS_ITEM_DETALHE'
      Size = 13
    end
    object FDQueryItemDetalheCOD_ITEM_DETALHE: TIntegerField
      FieldName = 'COD_ITEM_DETALHE'
      Origin = 'COD_ITEM_DETALHE'
      Required = True
    end
    object FDQueryItemDetalheDESCRICAO_COR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_COR'
      Origin = 'DESCRICAO_COR'
      ProviderFlags = []
      Size = 40
    end
    object FDQueryItemDetalheDESCRICAO_GRADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_GRADE'
      Origin = 'DESCRICAO_GRADE'
      ProviderFlags = []
      Size = 40
    end
  end
  object FDSchemaAdapterProduto: TFDSchemaAdapter
    Left = 184
    Top = 72
  end
  object dsMaster: TDataSource
    DataSet = FDQueryPrincipal
    Left = 184
    Top = 8
  end
  object FDQueryUnidade: TFDQuery
    CachedUpdates = True
    Connection = dmConexao.FDConexao
    SQL.Strings = (
      'select '
      '    UNIDADE.CODIGO_UNIDADE,'
      '    UNIDADE.DESCRICAO_UNIDADE'
      'from UNIDADE')
    Left = 40
    Top = 136
  end
  object FDQueryValidaGrupo: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 168
    Top = 160
  end
  object FDQueryValidaSubGrupo: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 168
    Top = 216
  end
  object FDQueryValida_Ncm: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 168
    Top = 280
  end
  object FDQueryItemCor: TFDQuery
    BeforeInsert = FDQueryItemCorBeforeInsert
    BeforeEdit = FDQueryItemCorBeforeEdit
    BeforePost = FDQueryItemCorBeforePost
    CachedUpdates = True
    IndexFieldNames = 'ITEM_ITEM_COR'
    MasterSource = dsMaster
    MasterFields = 'CODIGO_ITEM'
    Connection = dmConexao.FDConexao
    SchemaAdapter = FDSchemaAdapterProduto
    Left = 40
    Top = 328
  end
  object FDQueryItemGrade: TFDQuery
    BeforeInsert = FDQueryItemGradeBeforeInsert
    BeforeEdit = FDQueryItemGradeBeforeEdit
    BeforePost = FDQueryItemGradeBeforePost
    CachedUpdates = True
    IndexFieldNames = 'ITEM_ITEM_GRADE'
    MasterSource = dsMaster
    MasterFields = 'CODIGO_ITEM'
    Connection = dmConexao.FDConexao
    SchemaAdapter = FDSchemaAdapterProduto
    SQL.Strings = (
      '')
    Left = 40
    Top = 384
  end
  object FDQueryCor: TFDQuery
    CachedUpdates = True
    Connection = dmConexao.FDConexao
    Left = 40
    Top = 200
  end
  object FDQueryGrade: TFDQuery
    CachedUpdates = True
    Connection = dmConexao.FDConexao
    Left = 40
    Top = 264
  end
  object dsDetalhe: TDataSource
    DataSet = FDQueryItemDetalhe
    Left = 296
    Top = 24
  end
  object FDQueryValidaCor: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 288
    Top = 224
  end
  object FDQueryValidaGrade: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 288
    Top = 288
  end
end
