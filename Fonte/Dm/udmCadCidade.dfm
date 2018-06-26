inherited dmCadCidade: TdmCadCidade
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 275
  Width = 454
  inherited QryPrincipal: TFDQuery
    CachedUpdates = True
    SchemaAdapter = FDSchemaAdapterCidade
    SQL.Strings = (
      'select '
      '    CIDADE.CODIGO_CIDADE,'
      '    CIDADE.DESCRICAO_CIDADE,'
      '    CIDADE.CODMUNICIPIO_CIDADE,'
      '    CIDADE.UF_CIDADE,'
      '    UF.CODIGO_UF,'
      '    UF.DESCRICAO_UF,'
      '    UF.SIGLA_UF'
      'from CIDADE'
      '   left join UF on (CIDADE.UF_CIDADE = UF.CODIGO_UF)'
      'where CIDADE.CODIGO_CIDADE = :CODIGO')
    Left = 32
    Top = 16
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQueryPrincipalCODIGO_CIDADE: TIntegerField
      FieldName = 'CODIGO_CIDADE'
      Origin = 'CODIGO_CIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryPrincipalDESCRICAO_CIDADE: TStringField
      FieldName = 'DESCRICAO_CIDADE'
      Origin = 'DESCRICAO_CIDADE'
      Required = True
      Size = 40
    end
    object FDQueryPrincipalCODMUNICIPIO_CIDADE: TIntegerField
      FieldName = 'CODMUNICIPIO_CIDADE'
      Origin = 'CODMUNICIPIO_CIDADE'
      Required = True
    end
    object FDQueryPrincipalUF_CIDADE: TIntegerField
      FieldName = 'UF_CIDADE'
      Origin = 'UF_CIDADE'
      Required = True
    end
    object FDQueryPrincipalDESCRICAO_UF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_UF'
      Origin = 'DESCRICAO_UF'
      ProviderFlags = []
      Size = 40
    end
    object FDQueryPrincipalSIGLA_UF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'SIGLA_UF'
      Origin = 'SIGLA_UF'
      ProviderFlags = []
      Size = 3
    end
    object FDQueryPrincipalCODIGO_UF: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO_UF'
      Origin = 'CODIGO_UF'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object QryValidaUf: TFDQuery
    Connection = dmConexao.FDConexao
    FetchOptions.AssignedValues = [evDetailCascade]
    Left = 64
    Top = 160
  end
  object FDSchemaAdapterCidade: TFDSchemaAdapter
    Left = 208
    Top = 48
  end
  object QryValidaSIGLAUF: TFDQuery
    Connection = dmConexao.FDConexao
    FetchOptions.AssignedValues = [evDetailCascade]
    Left = 208
    Top = 120
  end
end
