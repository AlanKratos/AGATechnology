inherited dmCadProduto: TdmCadProduto
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 443
  Width = 454
  inherited QryCadastro: TFDQuery
    AfterInsert = QryCadastroAfterInsert
    BeforePost = QryCadastroBeforePost
    OnNewRecord = QryCadastroNewRecord
    CachedUpdates = True
    SchemaAdapter = FDSchemaAdapterProduto
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = False
    SQL.Strings = (
      'select '
      '    ITEM.CODIGO_ITEM,'
      '    ITEM.TIPO_ITEM,'
      '    ITEM.DESCRICAO_ITEM,'
      '    ITEM.CODIGOBARRAS_ITEM,'
      '    ITEM.COLECAO_ITEM,'
      '    ITEM.VALIDADE_ITEM,'
      '    ITEM.VARIACOR_ITEM,'
      '    ITEM.VARIATECIDO_ITEM,'
      '    ITEM.VARIAGRADE_ITEM,'
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
    object QryPrincipalCODIGO_ITEM: TIntegerField
      FieldName = 'CODIGO_ITEM'
      Origin = 'CODIGO_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryPrincipalTIPO_ITEM: TIntegerField
      FieldName = 'TIPO_ITEM'
      Origin = 'TIPO_ITEM'
    end
    object QryPrincipalDESCRICAO_ITEM: TStringField
      FieldName = 'DESCRICAO_ITEM'
      Origin = 'DESCRICAO_ITEM'
      Required = True
      Size = 100
    end
    object QryPrincipalCODIGOBARRAS_ITEM: TStringField
      FieldName = 'CODIGOBARRAS_ITEM'
      Origin = 'CODIGOBARRAS_ITEM'
    end
    object QryPrincipalCOLECAO_ITEM: TIntegerField
      FieldName = 'COLECAO_ITEM'
      Origin = 'COLECAO_ITEM'
    end
    object QryPrincipalVALIDADE_ITEM: TIntegerField
      FieldName = 'VALIDADE_ITEM'
      Origin = 'VALIDADE_ITEM'
    end
    object QryPrincipalVARIACOR_ITEM: TStringField
      FieldName = 'VARIACOR_ITEM'
      Origin = 'VARIACOR_ITEM'
      Size = 1
    end
    object QryPrincipalVARIATECIDO_ITEM: TStringField
      FieldName = 'VARIATECIDO_ITEM'
      Origin = 'VARIATECIDO_ITEM'
      Size = 1
    end
    object QryPrincipalVARIAGRADE_ITEM: TStringField
      FieldName = 'VARIAGRADE_ITEM'
      Origin = 'VARIAGRADE_ITEM'
      Size = 1
    end
    object QryPrincipalGRUPO_ITEM: TIntegerField
      FieldName = 'GRUPO_ITEM'
      Origin = 'GRUPO_ITEM'
    end
    object QryPrincipalSUBGRUPO_ITEM: TIntegerField
      FieldName = 'SUBGRUPO_ITEM'
      Origin = 'SUBGRUPO_ITEM'
    end
    object QryPrincipalNCM_ITEM: TIntegerField
      FieldName = 'NCM_ITEM'
      Origin = 'NCM_ITEM'
    end
    object QryPrincipalPESOBRUTO_ITEM: TBCDField
      FieldName = 'PESOBRUTO_ITEM'
      Origin = 'PESOBRUTO_ITEM'
      Precision = 18
      Size = 3
    end
    object QryPrincipalPESOLIQUIDO_ITEM: TBCDField
      FieldName = 'PESOLIQUIDO_ITEM'
      Origin = 'PESOLIQUIDO_ITEM'
      Precision = 18
      Size = 3
    end
    object QryPrincipalSTATUS_ITEM: TIntegerField
      FieldName = 'STATUS_ITEM'
      Origin = 'STATUS_ITEM'
      Required = True
    end
    object QryPrincipalUNIDADE_ITEM: TIntegerField
      FieldName = 'UNIDADE_ITEM'
      Origin = 'UNIDADE_ITEM'
      Required = True
    end
    object QryPrincipalPRODUTO_ITEM: TIntegerField
      FieldName = 'PRODUTO_ITEM'
      Origin = 'PRODUTO_ITEM'
      Required = True
    end
    object QryPrincipalOBSERVACAO_ITEM: TMemoField
      FieldName = 'OBSERVACAO_ITEM'
      Origin = 'OBSERVACAO_ITEM'
      BlobType = ftMemo
    end
    object QryPrincipalTRIBUTACAO_ITEM: TIntegerField
      FieldName = 'TRIBUTACAO_ITEM'
      Origin = 'TRIBUTACAO_ITEM'
      Required = True
    end
    object QryPrincipalDESCRICAO_GRUPO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_GRUPO'
      Origin = 'DESCRICAO_GRUPO'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object QryPrincipalDESCRICAO_SUBGRUPO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_SUBGRUPO'
      Origin = 'DESCRICAO_SUBGRUPO'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object QryPrincipalCOD_NCM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COD_NCM'
      Origin = 'COD_NCM'
      ProviderFlags = []
      ReadOnly = True
      Size = 11
    end
  end
  inherited QryNavegar: TFDQuery
    Left = 176
    Top = 368
  end
  object QryItemDetalhe: TFDQuery
    BeforeInsert = QryItemDetalheBeforeInsert
    BeforeEdit = QryItemDetalheBeforeEdit
    BeforePost = QryItemDetalheBeforePost
    OnNewRecord = QryItemDetalheNewRecord
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
    object QryItemDetalheCODIGO_ITEM_DETALHE: TIntegerField
      FieldName = 'CODIGO_ITEM_DETALHE'
      Origin = 'CODIGO_ITEM_DETALHE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryItemDetalheCOR_ITEM_DETALHE: TIntegerField
      FieldName = 'COR_ITEM_DETALHE'
      Origin = 'COR_ITEM_DETALHE'
      Required = True
    end
    object QryItemDetalheGRADE_ITEM_DETALHE: TIntegerField
      FieldName = 'GRADE_ITEM_DETALHE'
      Origin = 'GRADE_ITEM_DETALHE'
      Required = True
    end
    object QryItemDetalheTECIDO_ITEM_DETALHE: TIntegerField
      FieldName = 'TECIDO_ITEM_DETALHE'
      Origin = 'TECIDO_ITEM_DETALHE'
    end
    object QryItemDetalheSTATUS_ITEM_DETALHE: TIntegerField
      FieldName = 'STATUS_ITEM_DETALHE'
      Origin = 'STATUS_ITEM_DETALHE'
      Required = True
    end
    object QryItemDetalheCODIGOBARRAS_ITEM_DETALHE: TStringField
      FieldName = 'CODIGOBARRAS_ITEM_DETALHE'
      Origin = 'CODIGOBARRAS_ITEM_DETALHE'
      Size = 13
    end
    object QryItemDetalheCOD_ITEM_DETALHE: TIntegerField
      FieldName = 'COD_ITEM_DETALHE'
      Origin = 'COD_ITEM_DETALHE'
      Required = True
    end
    object QryItemDetalheDESCRICAO_COR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_COR'
      Origin = 'DESCRICAO_COR'
      ProviderFlags = []
      Size = 40
    end
    object QryItemDetalheDESCRICAO_GRADE: TStringField
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
    Left = 184
    Top = 8
  end
  object QryUnidade: TFDQuery
    CachedUpdates = True
    Connection = dmConexao.FDConexao
    SQL.Strings = (
      'select '
      '    UNIDADE.CODIGO_UNIDADE,'
      '    UNIDADE.DESCRICAO_UNIDADE'
      'from UNIDADE'
      'order by UNIDADE.CODIGO_UNIDADE')
    Left = 40
    Top = 136
  end
  object QryValidaGrupo: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 168
    Top = 160
  end
  object QryValidaSubGrupo: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 168
    Top = 216
  end
  object QryValida_Ncm: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 168
    Top = 280
  end
  object QryItemCor: TFDQuery
    BeforeInsert = QryItemCorBeforeInsert
    BeforeEdit = QryItemCorBeforeEdit
    BeforePost = QryItemCorBeforePost
    CachedUpdates = True
    IndexFieldNames = 'ITEM_ITEM_COR'
    MasterSource = dsMaster
    MasterFields = 'CODIGO_ITEM'
    Connection = dmConexao.FDConexao
    SchemaAdapter = FDSchemaAdapterProduto
    Left = 40
    Top = 328
  end
  object QryItemGrade: TFDQuery
    BeforeInsert = QryItemGradeBeforeInsert
    BeforeEdit = QryItemGradeBeforeEdit
    BeforePost = QryItemGradeBeforePost
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
  object QryCor: TFDQuery
    CachedUpdates = True
    Connection = dmConexao.FDConexao
    Left = 40
    Top = 200
  end
  object QryGrade: TFDQuery
    CachedUpdates = True
    Connection = dmConexao.FDConexao
    Left = 40
    Top = 264
  end
  object dsDetalhe: TDataSource
    DataSet = QryItemDetalhe
    Left = 296
    Top = 8
  end
  object QryValidaCor: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 288
    Top = 224
  end
  object QryValidaGrade: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 288
    Top = 288
  end
end
