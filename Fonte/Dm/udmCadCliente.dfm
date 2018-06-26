inherited dmCadCliente: TdmCadCliente
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 355
  Width = 330
  inherited QryCadastro: TFDQuery
    AfterInsert = QryPrincipalAfterInsert
    BeforePost = QryPrincipalBeforePost
    AfterPost = nil
    OnNewRecord = QryPrincipalNewRecord
    CachedUpdates = True
    ConstraintsEnabled = True
    OnReconcileError = QryPrincipalReconcileError
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
    object QryCadastroCODIGO_PESSOA: TIntegerField
      FieldName = 'CODIGO_PESSOA'
      Origin = 'CODIGO_PESSOA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryCadastroNOME_PESSOA: TStringField
      FieldName = 'NOME_PESSOA'
      Origin = 'NOME_PESSOA'
      Size = 100
    end
    object QryCadastroFANTASIA_PESSOA: TStringField
      FieldName = 'FANTASIA_PESSOA'
      Origin = 'FANTASIA_PESSOA'
      Size = 100
    end
    object QryCadastroTIPO_PESSOA: TIntegerField
      FieldName = 'TIPO_PESSOA'
      Origin = 'TIPO_PESSOA'
      Required = True
    end
    object QryCadastroOBSERVACAO_PESSOA: TStringField
      FieldName = 'OBSERVACAO_PESSOA'
      Origin = 'OBSERVACAO_PESSOA'
      Size = 500
    end
    object QryCadastroSTATUS_PESSOA: TIntegerField
      FieldName = 'STATUS_PESSOA'
      Origin = 'STATUS_PESSOA'
      Required = True
    end
    object QryCadastroCLIENTE_PESSOA: TStringField
      FieldName = 'CLIENTE_PESSOA'
      Origin = 'CLIENTE_PESSOA'
      Required = True
      Size = 1
    end
    object QryCadastroCNPJ_PESSOA: TStringField
      FieldName = 'CNPJ_PESSOA'
      Origin = 'CNPJ_PESSOA'
      Size = 18
    end
    object QryCadastroIE_PESSOA: TStringField
      FieldName = 'IE_PESSOA'
      Origin = 'IE_PESSOA'
      Size = 18
    end
    object QryCadastroCPF_PESSOA: TStringField
      FieldName = 'CPF_PESSOA'
      Origin = 'CPF_PESSOA'
      Size = 14
    end
    object QryCadastroRG_PESSOA: TStringField
      FieldName = 'RG_PESSOA'
      Origin = 'RG_PESSOA'
    end
    object QryCadastroFORNECEDOR_PESSOA: TStringField
      FieldName = 'FORNECEDOR_PESSOA'
      Origin = 'FORNECEDOR_PESSOA'
      Required = True
      Size = 1
    end
    object QryCadastroFUNCIONARIO_PESSOA: TStringField
      FieldName = 'FUNCIONARIO_PESSOA'
      Origin = 'FUNCIONARIO_PESSOA'
      Required = True
      Size = 1
    end
    object QryCadastroGRUPO_PESSOA: TIntegerField
      FieldName = 'GRUPO_PESSOA'
      Origin = 'GRUPO_PESSOA'
    end
    object QryCadastroDESCRICAO_GRUPO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_GRUPO'
      Origin = 'DESCRICAO_GRUPO'
      ProviderFlags = []
      Size = 40
    end
  end
  inherited QryNavegar: TFDQuery
    Left = 112
    Top = 192
  end
  object QryEmail: TFDQuery
    BeforeInsert = QryEmailBeforeInsert
    BeforeEdit = QryEmailBeforeEdit
    BeforePost = QryEmailBeforePost
    OnNewRecord = QryEmailNewRecord
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
  object QryEndereco: TFDQuery
    BeforeInsert = QryEnderecoBeforeInsert
    BeforeEdit = QryEnderecoBeforeEdit
    BeforePost = QryEnderecoBeforePost
    OnNewRecord = QryEnderecoNewRecord
    CachedUpdates = True
    IndexFieldNames = 'COD_PESSOA_ENDERECO'
    MasterSource = dsMaster
    MasterFields = 'CODIGO_PESSOA'
    DetailFields = 'COD_PESSOA_ENDERECO'
    OnReconcileError = QryEnderecoReconcileError
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
    object QryEnderecoDESCRICAO_CIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_CIDADE'
      Origin = 'DESCRICAO_CIDADE'
      ProviderFlags = []
      Size = 40
    end
    object QryEnderecoCODIGO_PESSOA_ENDERECO: TIntegerField
      FieldName = 'CODIGO_PESSOA_ENDERECO'
      Origin = 'CODIGO_PESSOA_ENDERECO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryEnderecoCOD_PESSOA_ENDERECO: TIntegerField
      FieldName = 'COD_PESSOA_ENDERECO'
      Origin = 'COD_PESSOA_ENDERECO'
      Required = True
    end
    object QryEnderecoENDERECO_PESSOA_ENDERECO: TStringField
      FieldName = 'ENDERECO_PESSOA_ENDERECO'
      Origin = 'ENDERECO_PESSOA_ENDERECO'
      Required = True
      Size = 100
    end
    object QryEnderecoNUMERO_PESSOA_ENDERECO: TStringField
      FieldName = 'NUMERO_PESSOA_ENDERECO'
      Origin = 'NUMERO_PESSOA_ENDERECO'
      Size = 8
    end
    object QryEnderecoCOMPLEMENTO_PESSOA_ENDERECO: TStringField
      FieldName = 'COMPLEMENTO_PESSOA_ENDERECO'
      Origin = 'COMPLEMENTO_PESSOA_ENDERECO'
      Size = 40
    end
    object QryEnderecoCODIGO_UF: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO_UF'
      Origin = 'CODIGO_UF'
      ProviderFlags = []
      ReadOnly = True
    end
    object QryEnderecoDESCRICAO_UF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_UF'
      Origin = 'DESCRICAO_UF'
      ProviderFlags = []
      Size = 40
    end
    object QryEnderecoBAIRRO_PESSOA_ENDERECO: TStringField
      FieldName = 'BAIRRO_PESSOA_ENDERECO'
      Origin = 'BAIRRO_PESSOA_ENDERECO'
      Size = 40
    end
    object QryEnderecoCIDADE_PESSOA_ENDERECO: TIntegerField
      FieldName = 'CIDADE_PESSOA_ENDERECO'
      Origin = 'CIDADE_PESSOA_ENDERECO'
      Required = True
    end
    object QryEnderecoUF_CIDADE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'UF_CIDADE'
      Origin = 'UF_CIDADE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object QryTelefone: TFDQuery
    BeforeInsert = QryTelefoneBeforeInsert
    BeforeEdit = QryTelefoneBeforeEdit
    BeforePost = QryTelefoneBeforePost
    OnNewRecord = QryTelefoneNewRecord
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
    DataSet = QryCadastro
    Left = 152
    Top = 16
  end
  object QryValidaCidade: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 208
    Top = 160
  end
  object FDSchemaAdapterCliente: TFDSchemaAdapter
    Left = 152
    Top = 80
  end
  object QryValidaUf: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 208
    Top = 224
  end
  object QryValidaGrupo: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 40
    Top = 272
  end
end
