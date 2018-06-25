inherited dmMovReceber: TdmMovReceber
  OldCreateOrder = True
  Height = 204
  Width = 275
  inherited QryPrincipal: TFDQuery
    BeforePost = FDQueryPrincipalBeforePost
    OnNewRecord = FDQueryPrincipalNewRecord
    SQL.Strings = (
      'select '
      '    PESSOA.NOME_PESSOA,'
      '    DUPLICATA.CODIGO_DUPLICATA,'
      '    DUPLICATA.TIPO_DUPLICATA,'
      '    DUPLICATA.EMPRESA_DUPLICATA,'
      '    DUPLICATA.PESSOA_DUPLICATA,'
      '    DUPLICATA.EMISSAO_DUPLICATA,'
      '    DUPLICATA.DOCUMENTO_DUPLICATA,'
      '    DUPLICATA.VENCIMENTO_DUPLICATA,'
      '    DUPLICATA.VALORDUPLICATA_DUPLICATA,'
      '    DUPLICATA.VALORPAGO_DUPLICATA,'
      '    DUPLICATA.DATAPAGAMENTO_DUPLICATA,'
      '    DUPLICATA.VALORABERTO_DUPLICATA'
      'from PESSOA,'
      'DUPLICATA'
      'where DUPLICATA.PESSOA_DUPLICATA = :CODIGO')
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQueryPrincipalNOME_PESSOA: TStringField
      FieldName = 'NOME_PESSOA'
      Origin = 'NOME_PESSOA'
      Size = 100
    end
    object FDQueryPrincipalCODIGO_DUPLICATA: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO_DUPLICATA'
      Origin = 'CODIGO_DUPLICATA'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryPrincipalTIPO_DUPLICATA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO_DUPLICATA'
      Origin = 'TIPO_DUPLICATA'
      ProviderFlags = []
    end
    object FDQueryPrincipalEMPRESA_DUPLICATA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'EMPRESA_DUPLICATA'
      Origin = 'EMPRESA_DUPLICATA'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryPrincipalPESSOA_DUPLICATA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'PESSOA_DUPLICATA'
      Origin = 'PESSOA_DUPLICATA'
      ProviderFlags = []
    end
    object FDQueryPrincipalEMISSAO_DUPLICATA: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'EMISSAO_DUPLICATA'
      Origin = 'EMISSAO_DUPLICATA'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryPrincipalDOCUMENTO_DUPLICATA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DOCUMENTO_DUPLICATA'
      Origin = 'DOCUMENTO_DUPLICATA'
      ProviderFlags = []
    end
    object FDQueryPrincipalVENCIMENTO_DUPLICATA: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'VENCIMENTO_DUPLICATA'
      Origin = 'VENCIMENTO_DUPLICATA'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryPrincipalVALORDUPLICATA_DUPLICATA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALORDUPLICATA_DUPLICATA'
      Origin = 'VALORDUPLICATA_DUPLICATA'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object FDQueryPrincipalVALORPAGO_DUPLICATA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALORPAGO_DUPLICATA'
      Origin = 'VALORPAGO_DUPLICATA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object FDQueryPrincipalDATAPAGAMENTO_DUPLICATA: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'DATAPAGAMENTO_DUPLICATA'
      Origin = 'DATAPAGAMENTO_DUPLICATA'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQueryPrincipalVALORABERTO_DUPLICATA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALORABERTO_DUPLICATA'
      Origin = 'VALORABERTO_DUPLICATA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
end
