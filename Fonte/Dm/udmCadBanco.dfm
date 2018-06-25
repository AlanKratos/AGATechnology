inherited dmCadBanco: TdmCadBanco
  OldCreateOrder = True
  Height = 222
  Width = 330
  inherited FDQueryPrincipal: TFDQuery
    BeforePost = FDQueryPrincipalBeforePost
    OnNewRecord = FDQueryPrincipalNewRecord
    CachedUpdates = True
    SchemaAdapter = FDSchemaAdapterBanco
    SQL.Strings = (
      'select * from BANCO'
      'where BANCO.CODIGO_BANCO = :CODIGO')
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQueryPrincipalCODIGO_BANCO: TIntegerField
      FieldName = 'CODIGO_BANCO'
      Origin = 'CODIGO_BANCO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryPrincipalDESCRICAO_BANCO: TStringField
      FieldName = 'DESCRICAO_BANCO'
      Origin = 'DESCRICAO_BANCO'
      Required = True
      Size = 40
    end
    object FDQueryPrincipalCAMARACOMPENSACAO_BANCO: TIntegerField
      FieldName = 'CAMARACOMPENSACAO_BANCO'
      Origin = 'CAMARACOMPENSACAO_BANCO'
      Required = True
    end
    object FDQueryPrincipalLOGO_BANCO: TBlobField
      FieldName = 'LOGO_BANCO'
      Origin = 'LOGO_BANCO'
    end
    object FDQueryPrincipalSTATUS_BANCO: TIntegerField
      FieldName = 'STATUS_BANCO'
      Origin = 'STATUS_BANCO'
      Required = True
    end
    object FDQueryPrincipalINCLUSAO_BANCO: TSQLTimeStampField
      FieldName = 'INCLUSAO_BANCO'
      Origin = 'INCLUSAO_BANCO'
    end
    object FDQueryPrincipalALTERACAO_BANCO: TSQLTimeStampField
      FieldName = 'ALTERACAO_BANCO'
      Origin = 'ALTERACAO_BANCO'
    end
    object FDQueryPrincipalUSUARIOINCLUSAO_BANCO: TStringField
      FieldName = 'USUARIOINCLUSAO_BANCO'
      Origin = 'USUARIOINCLUSAO_BANCO'
    end
    object FDQueryPrincipalUSUARIOALTERACAO_BANCO: TStringField
      FieldName = 'USUARIOALTERACAO_BANCO'
      Origin = 'USUARIOALTERACAO_BANCO'
    end
  end
  object FDSchemaAdapterBanco: TFDSchemaAdapter
    Left = 208
    Top = 72
  end
end
