inherited dmCadCliente: TdmCadCliente
  OldCreateOrder = True
  Height = 355
  Width = 330
  inherited FDQueryPrincipal: TFDQuery
    AfterInsert = FDQueryPrincipalAfterInsert
    BeforePost = FDQueryPrincipalBeforePost
    AfterPost = nil
    OnNewRecord = FDQueryPrincipalNewRecord
    CachedUpdates = True
    ConstraintsEnabled = True
    OnReconcileError = FDQueryPrincipalReconcileError
    SchemaAdapter = FDSchemaAdapterCliente
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = False
    SQL.Strings = (
      'select '
      '    PESSOA.CODIGO_PESSOA,'
      '    PESSOA.NOME_PESSOA,'
      '    PESSOA.FANTASIA_PESSOA,'
      '    PESSOA.TIPO_PESSOA,'
      '    PESSOA.OBSERVACAO_PESSOA,'
      '    PESSOA.STATUS_PESSOA,'
      '    PESSOA.CLIENTE_PESSOA,'
      '    PESSOA.CNPJ_PESSOA,'
      '    PESSOA.IE_PESSOA,'
      '    PESSOA.CPF_PESSOA,'
      '    PESSOA.RG_PESSOA,'
      '    PESSOA.FORNECEDOR_PESSOA,'
      '    PESSOA.FUNCIONARIO_PESSOA,'
      '    PESSOA.GRUPO_PESSOA,'
      '    GRUPO.DESCRICAO_GRUPO'
      'from PESSOA'
      'left join GRUPO on (GRUPO.CODIGO_GRUPO = PESSOA.GRUPO_PESSOA)'
      'where PESSOA.CODIGO_PESSOA = :CODIGO')
    Left = 32
    Top = 16
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
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryPrincipalNOME_PESSOA: TStringField
      FieldName = 'NOME_PESSOA'
      Origin = 'NOME_PESSOA'
      Size = 100
    end
    object FDQueryPrincipalFANTASIA_PESSOA: TStringField
      FieldName = 'FANTASIA_PESSOA'
      Origin = 'FANTASIA_PESSOA'
      Size = 100
    end
    object FDQueryPrincipalTIPO_PESSOA: TIntegerField
      FieldName = 'TIPO_PESSOA'
      Origin = 'TIPO_PESSOA'
      Required = True
    end
    object FDQueryPrincipalOBSERVACAO_PESSOA: TStringField
      FieldName = 'OBSERVACAO_PESSOA'
      Origin = 'OBSERVACAO_PESSOA'
      Size = 500
    end
    object FDQueryPrincipalSTATUS_PESSOA: TIntegerField
      FieldName = 'STATUS_PESSOA'
      Origin = 'STATUS_PESSOA'
      Required = True
    end
    object FDQueryPrincipalCLIENTE_PESSOA: TStringField
      FieldName = 'CLIENTE_PESSOA'
      Origin = 'CLIENTE_PESSOA'
      Required = True
      Size = 1
    end
    object FDQueryPrincipalCNPJ_PESSOA: TStringField
      FieldName = 'CNPJ_PESSOA'
      Origin = 'CNPJ_PESSOA'
      Size = 18
    end
    object FDQueryPrincipalIE_PESSOA: TStringField
      FieldName = 'IE_PESSOA'
      Origin = 'IE_PESSOA'
      Size = 18
    end
    object FDQueryPrincipalCPF_PESSOA: TStringField
      FieldName = 'CPF_PESSOA'
      Origin = 'CPF_PESSOA'
      Size = 14
    end
    object FDQueryPrincipalRG_PESSOA: TStringField
      FieldName = 'RG_PESSOA'
      Origin = 'RG_PESSOA'
    end
    object FDQueryPrincipalFORNECEDOR_PESSOA: TStringField
      FieldName = 'FORNECEDOR_PESSOA'
      Origin = 'FORNECEDOR_PESSOA'
      Required = True
      Size = 1
    end
    object FDQueryPrincipalFUNCIONARIO_PESSOA: TStringField
      FieldName = 'FUNCIONARIO_PESSOA'
      Origin = 'FUNCIONARIO_PESSOA'
      Required = True
      Size = 1
    end
    object FDQueryPrincipalGRUPO_PESSOA: TIntegerField
      FieldName = 'GRUPO_PESSOA'
      Origin = 'GRUPO_PESSOA'
    end
    object FDQueryPrincipalDESCRICAO_GRUPO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_GRUPO'
      Origin = 'DESCRICAO_GRUPO'
      ProviderFlags = []
      Size = 40
    end
  end
  object FDQueryEmail: TFDQuery
    BeforeInsert = FDQueryEmailBeforeInsert
    BeforeEdit = FDQueryEmailBeforeEdit
    BeforePost = FDQueryEmailBeforePost
    OnNewRecord = FDQueryEmailNewRecord
    CachedUpdates = True
    IndexFieldNames = 'COD_PESSOA_EMAIL'
    MasterSource = dsMaster
    MasterFields = 'CODIGO_PESSOA'
    DetailFields = 'COD_PESSOA_EMAIL'
    Connection = dmConexao.FDConexao
    SchemaAdapter = FDSchemaAdapterCliente
    FetchOptions.AssignedValues = [evCache, evDetailCascade]
    FetchOptions.DetailCascade = True
    SQL.Strings = (
      'select * from PESSOA_EMAIL'
      'where PESSOA_EMAIL.COD_PESSOA_EMAIL = :CODIGO_PESSOA')
    Left = 32
    Top = 144
    ParamData = <
      item
        Name = 'CODIGO_PESSOA'
        DataType = ftInteger
        ParamType = ptInput
        Size = 4
        Value = Null
      end>
  end
  object FDQueryEndereco: TFDQuery
    BeforeInsert = FDQueryEnderecoBeforeInsert
    BeforeEdit = FDQueryEnderecoBeforeEdit
    BeforePost = FDQueryEnderecoBeforePost
    OnNewRecord = FDQueryEnderecoNewRecord
    CachedUpdates = True
    IndexFieldNames = 'COD_PESSOA_ENDERECO'
    MasterSource = dsMaster
    MasterFields = 'CODIGO_PESSOA'
    DetailFields = 'COD_PESSOA_ENDERECO'
    OnReconcileError = FDQueryEnderecoReconcileError
    Connection = dmConexao.FDConexao
    SchemaAdapter = FDSchemaAdapterCliente
    FetchOptions.AssignedValues = [evCache, evDetailCascade]
    FetchOptions.DetailCascade = True
    SQL.Strings = (
      'select '
      '    PESSOA_ENDERECO.CODIGO_PESSOA_ENDERECO,'
      '    pessoa_endereco.cod_pessoa_endereco,'
      '    pessoa_endereco.endereco_pessoa_endereco,'
      '    pessoa_endereco.numero_pessoa_endereco,'
      '    pessoa_endereco.complemento_pessoa_endereco,'
      '    cidade.descricao_cidade,'
      '    CIDADE.UF_CIDADE,'
      '    uf.descricao_uf,'
      '    uf.codigo_uf,'
      '    pessoa_endereco.bairro_pessoa_endereco,'
      '    PESSOA_ENDERECO.CIDADE_PESSOA_ENDERECO'
      'from pessoa_endereco'
      
        '   left join cidade on (pessoa_endereco.cidade_pessoa_endereco =' +
        ' cidade.codigo_cidade)'
      '   left join uf on (cidade.uf_cidade = uf.codigo_uf)'
      'where PESSOA_ENDERECO.COD_PESSOA_ENDERECO = :CODIGO_PESSOA')
    Left = 32
    Top = 80
    ParamData = <
      item
        Name = 'CODIGO_PESSOA'
        DataType = ftInteger
        ParamType = ptInput
        Size = 4
        Value = Null
      end>
    object FDQueryEnderecoDESCRICAO_CIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_CIDADE'
      Origin = 'DESCRICAO_CIDADE'
      ProviderFlags = []
      Size = 40
    end
    object FDQueryEnderecoCODIGO_PESSOA_ENDERECO: TIntegerField
      FieldName = 'CODIGO_PESSOA_ENDERECO'
      Origin = 'CODIGO_PESSOA_ENDERECO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryEnderecoCOD_PESSOA_ENDERECO: TIntegerField
      FieldName = 'COD_PESSOA_ENDERECO'
      Origin = 'COD_PESSOA_ENDERECO'
      Required = True
    end
    object FDQueryEnderecoENDERECO_PESSOA_ENDERECO: TStringField
      FieldName = 'ENDERECO_PESSOA_ENDERECO'
      Origin = 'ENDERECO_PESSOA_ENDERECO'
      Required = True
      Size = 100
    end
    object FDQueryEnderecoNUMERO_PESSOA_ENDERECO: TStringField
      FieldName = 'NUMERO_PESSOA_ENDERECO'
      Origin = 'NUMERO_PESSOA_ENDERECO'
      Size = 8
    end
    object FDQueryEnderecoCOMPLEMENTO_PESSOA_ENDERECO: TStringField
      FieldName = 'COMPLEMENTO_PESSOA_ENDERECO'
      Origin = 'COMPLEMENTO_PESSOA_ENDERECO'
      Size = 40
    end
    object FDQueryEnderecoCODIGO_UF: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO_UF'
      Origin = 'CODIGO_UF'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryEnderecoDESCRICAO_UF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_UF'
      Origin = 'DESCRICAO_UF'
      ProviderFlags = []
      Size = 40
    end
    object FDQueryEnderecoBAIRRO_PESSOA_ENDERECO: TStringField
      FieldName = 'BAIRRO_PESSOA_ENDERECO'
      Origin = 'BAIRRO_PESSOA_ENDERECO'
      Size = 40
    end
    object FDQueryEnderecoCIDADE_PESSOA_ENDERECO: TIntegerField
      FieldName = 'CIDADE_PESSOA_ENDERECO'
      Origin = 'CIDADE_PESSOA_ENDERECO'
      Required = True
    end
    object FDQueryEnderecoUF_CIDADE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'UF_CIDADE'
      Origin = 'UF_CIDADE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object FDQueryTelefone: TFDQuery
    BeforeInsert = FDQueryTelefoneBeforeInsert
    BeforeEdit = FDQueryTelefoneBeforeEdit
    BeforePost = FDQueryTelefoneBeforePost
    OnNewRecord = FDQueryTelefoneNewRecord
    CachedUpdates = True
    IndexFieldNames = 'COD_PESSOA_TELEFONE'
    MasterSource = dsMaster
    MasterFields = 'CODIGO_PESSOA'
    DetailFields = 'COD_PESSOA_TELEFONE'
    Connection = dmConexao.FDConexao
    SchemaAdapter = FDSchemaAdapterCliente
    FetchOptions.AssignedValues = [evCache, evDetailCascade]
    FetchOptions.DetailCascade = True
    SQL.Strings = (
      'select * from PESSOA_TELEFONE'
      'where PESSOA_TELEFONE.COD_PESSOA_TELEFONE = :CODIGO_PESSOA')
    Left = 32
    Top = 216
    ParamData = <
      item
        Name = 'CODIGO_PESSOA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dsMaster: TDataSource
    DataSet = FDQueryPrincipal
    Left = 152
    Top = 16
  end
  object FDQueryValidaCidade: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 208
    Top = 160
  end
  object FDSchemaAdapterCliente: TFDSchemaAdapter
    Left = 152
    Top = 80
  end
  object FDQueryValidaUf: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 200
    Top = 216
  end
  object FDQueryValidaGrupo: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 40
    Top = 272
  end
end
