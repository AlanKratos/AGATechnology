inherited dmCadEmpresa: TdmCadEmpresa
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 203
  Width = 329
  inherited QryPrincipal: TFDQuery
    CachedUpdates = True
    SchemaAdapter = FDSchemaAdapterEmpresa
    SQL.Strings = (
      'select '
      '    EMPRESA.CODIGO_EMPRESA,'
      '    EMPRESA.RAZAOSOCIAL_EMPRESA,'
      '    EMPRESA.NOMEFANTASIA_EMPRESA,'
      '    EMPRESA.ALIQAPROVEITAMENTOICMS_EMPRESA,'
      '    EMPRESA.ALIQCOFINS_EMPRESA,'
      '    EMPRESA.ALIQCST_EMPRESA,'
      '    EMPRESA.ALIQIR_EMPRESA,'
      '    EMPRESA.ALIQISSQN_EMPRESA,'
      '    EMPRESA.ALIQJUROSBOLETA_EMPRESA,'
      '    EMPRESA.ALIQJUROSBORDERO_EMPRESA,'
      '    EMPRESA.ALIQJUROSCHEQUE_EMPRESA,'
      '    EMPRESA.ALIQPIS_EMPRESA,'
      '    EMPRESA.ALIQSIMPLES_EMPRESA,'
      '    EMPRESA.CONTACAIXA_EMPRESA,'
      '    EMPRESA.SUBSTITUICAO_EMPRESA,'
      '    EMPRESA.CRT_EMPRESA,'
      '    EMPRESA.CSOSN_EMPRESA,'
      '    EMPRESA.DATAINCLUSAO_EMPRESA,'
      '    EMPRESA.TIPOATIVIDADE_EMPRESA,'
      '    EMPRESA.DATAINICIOCONTINGENCIA_EMPRESA,'
      '    EMPRESA.MOTIVOCONTINGENCIA_EMPRESA,'
      '    EMPRESA.DATAFIMCONTINGENCIA_EMPRESA,'
      '    EMPRESA.LOGO_EMPRESA,'
      '    EMPRESA.EMPRESAMATRIZ_EMPRESA,'
      '    EMPRESA.NATUREZAPESSOAJURIDICA_EMPRESA,'
      '    EMPRESA.OBSERVACAO_EMPRESA,'
      '    EMPRESA.SLOGAN_EMPRESA,'
      '    EMPRESA.STATUS_EMPRESA,'
      '    EMPRESA.ENDERECO_EMPRESA,'
      '    EMPRESA.NUMERO_EMPRESA,'
      '    EMPRESA.COMPLEMENTO_EMPRESA,'
      '    EMPRESA.CIDADE_EMPRESA,'
      '    EMPRESA.CSTPIS_EMPRESA,'
      '    EMPRESA.CSTCOFINS_EMPRESA,'
      '    CIDADE.DESCRICAO_CIDADE,'
      '    UF.DESCRICAO_UF,'
      '    EMPRESA.BAIRRO_EMPRESA,'
      '    CIDADE.UF_CIDADE,'
      '    EMPRESA.CNPJ_EMPRESA,'
      '    EMPRESA.IE_EMPRESA'
      'from EMPRESA'
      
        'left join CIDADE on (CIDADE.CODIGO_CIDADE = EMPRESA.CIDADE_EMPRE' +
        'SA)'
      'left join UF on (UF.CODIGO_UF = CIDADE.UF_CIDADE)'
      'where EMPRESA.CODIGO_EMPRESA = :CODIGO')
    Left = 48
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQueryPrincipalCODIGO_EMPRESA: TIntegerField
      FieldName = 'CODIGO_EMPRESA'
      Origin = 'CODIGO_EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryPrincipalRAZAOSOCIAL_EMPRESA: TStringField
      FieldName = 'RAZAOSOCIAL_EMPRESA'
      Origin = 'RAZAOSOCIAL_EMPRESA'
      Size = 100
    end
    object FDQueryPrincipalNOMEFANTASIA_EMPRESA: TStringField
      FieldName = 'NOMEFANTASIA_EMPRESA'
      Origin = 'NOMEFANTASIA_EMPRESA'
      Required = True
      Size = 100
    end
    object FDQueryPrincipalALIQAPROVEITAMENTOICMS_EMPRESA: TCurrencyField
      FieldName = 'ALIQAPROVEITAMENTOICMS_EMPRESA'
      Origin = 'ALIQAPROVEITAMENTOICMS_EMPRESA'
    end
    object FDQueryPrincipalALIQCOFINS_EMPRESA: TCurrencyField
      FieldName = 'ALIQCOFINS_EMPRESA'
      Origin = 'ALIQCOFINS_EMPRESA'
    end
    object FDQueryPrincipalALIQCST_EMPRESA: TCurrencyField
      FieldName = 'ALIQCST_EMPRESA'
      Origin = 'ALIQCST_EMPRESA'
    end
    object FDQueryPrincipalALIQIR_EMPRESA: TCurrencyField
      FieldName = 'ALIQIR_EMPRESA'
      Origin = 'ALIQIR_EMPRESA'
    end
    object FDQueryPrincipalALIQISSQN_EMPRESA: TCurrencyField
      FieldName = 'ALIQISSQN_EMPRESA'
      Origin = 'ALIQISSQN_EMPRESA'
    end
    object FDQueryPrincipalALIQJUROSBOLETA_EMPRESA: TCurrencyField
      FieldName = 'ALIQJUROSBOLETA_EMPRESA'
      Origin = 'ALIQJUROSBOLETA_EMPRESA'
      currency = False
    end
    object FDQueryPrincipalALIQJUROSBORDERO_EMPRESA: TCurrencyField
      FieldName = 'ALIQJUROSBORDERO_EMPRESA'
      Origin = 'ALIQJUROSBORDERO_EMPRESA'
    end
    object FDQueryPrincipalALIQJUROSCHEQUE_EMPRESA: TCurrencyField
      FieldName = 'ALIQJUROSCHEQUE_EMPRESA'
      Origin = 'ALIQJUROSCHEQUE_EMPRESA'
    end
    object FDQueryPrincipalALIQPIS_EMPRESA: TCurrencyField
      FieldName = 'ALIQPIS_EMPRESA'
      Origin = 'ALIQPIS_EMPRESA'
    end
    object FDQueryPrincipalALIQSIMPLES_EMPRESA: TCurrencyField
      FieldName = 'ALIQSIMPLES_EMPRESA'
      Origin = 'ALIQSIMPLES_EMPRESA'
    end
    object FDQueryPrincipalCONTACAIXA_EMPRESA: TIntegerField
      FieldName = 'CONTACAIXA_EMPRESA'
      Origin = 'CONTACAIXA_EMPRESA'
    end
    object FDQueryPrincipalSUBSTITUICAO_EMPRESA: TStringField
      FieldName = 'SUBSTITUICAO_EMPRESA'
      Origin = 'SUBSTITUICAO_EMPRESA'
      Size = 1
    end
    object FDQueryPrincipalCRT_EMPRESA: TIntegerField
      FieldName = 'CRT_EMPRESA'
      Origin = 'CRT_EMPRESA'
    end
    object FDQueryPrincipalCSOSN_EMPRESA: TIntegerField
      FieldName = 'CSOSN_EMPRESA'
      Origin = 'CSOSN_EMPRESA'
    end
    object FDQueryPrincipalDATAINCLUSAO_EMPRESA: TSQLTimeStampField
      FieldName = 'DATAINCLUSAO_EMPRESA'
      Origin = 'DATAINCLUSAO_EMPRESA'
    end
    object FDQueryPrincipalTIPOATIVIDADE_EMPRESA: TIntegerField
      FieldName = 'TIPOATIVIDADE_EMPRESA'
      Origin = 'TIPOATIVIDADE_EMPRESA'
    end
    object FDQueryPrincipalDATAINICIOCONTINGENCIA_EMPRESA: TSQLTimeStampField
      FieldName = 'DATAINICIOCONTINGENCIA_EMPRESA'
      Origin = 'DATAINICIOCONTINGENCIA_EMPRESA'
    end
    object FDQueryPrincipalMOTIVOCONTINGENCIA_EMPRESA: TStringField
      FieldName = 'MOTIVOCONTINGENCIA_EMPRESA'
      Origin = 'MOTIVOCONTINGENCIA_EMPRESA'
      Size = 40
    end
    object FDQueryPrincipalDATAFIMCONTINGENCIA_EMPRESA: TSQLTimeStampField
      FieldName = 'DATAFIMCONTINGENCIA_EMPRESA'
      Origin = 'DATAFIMCONTINGENCIA_EMPRESA'
    end
    object FDQueryPrincipalLOGO_EMPRESA: TBlobField
      FieldName = 'LOGO_EMPRESA'
      Origin = 'LOGO_EMPRESA'
    end
    object FDQueryPrincipalEMPRESAMATRIZ_EMPRESA: TIntegerField
      FieldName = 'EMPRESAMATRIZ_EMPRESA'
      Origin = 'EMPRESAMATRIZ_EMPRESA'
    end
    object FDQueryPrincipalNATUREZAPESSOAJURIDICA_EMPRESA: TIntegerField
      FieldName = 'NATUREZAPESSOAJURIDICA_EMPRESA'
      Origin = 'NATUREZAPESSOAJURIDICA_EMPRESA'
    end
    object FDQueryPrincipalOBSERVACAO_EMPRESA: TStringField
      FieldName = 'OBSERVACAO_EMPRESA'
      Origin = 'OBSERVACAO_EMPRESA'
      Size = 500
    end
    object FDQueryPrincipalSLOGAN_EMPRESA: TStringField
      FieldName = 'SLOGAN_EMPRESA'
      Origin = 'SLOGAN_EMPRESA'
      Size = 40
    end
    object FDQueryPrincipalENDERECO_EMPRESA: TStringField
      FieldName = 'ENDERECO_EMPRESA'
      Origin = 'ENDERECO_EMPRESA'
      Required = True
      Size = 100
    end
    object FDQueryPrincipalNUMERO_EMPRESA: TStringField
      FieldName = 'NUMERO_EMPRESA'
      Origin = 'NUMERO_EMPRESA'
      Size = 8
    end
    object FDQueryPrincipalCOMPLEMENTO_EMPRESA: TStringField
      FieldName = 'COMPLEMENTO_EMPRESA'
      Origin = 'COMPLEMENTO_EMPRESA'
      Size = 100
    end
    object FDQueryPrincipalCIDADE_EMPRESA: TIntegerField
      FieldName = 'CIDADE_EMPRESA'
      Origin = 'CIDADE_EMPRESA'
      Required = True
    end
    object FDQueryPrincipalCSTCOFINS_EMPRESA: TIntegerField
      FieldName = 'CSTCOFINS_EMPRESA'
      Origin = 'CSTCOFINS_EMPRESA'
    end
    object FDQueryPrincipalCSTPIS_EMPRESA: TIntegerField
      FieldName = 'CSTPIS_EMPRESA'
      Origin = 'CSTPIS_EMPRESA'
    end
    object FDQueryPrincipalDESCRICAO_CIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_CIDADE'
      Origin = 'DESCRICAO_CIDADE'
      ProviderFlags = []
      Size = 40
    end
    object FDQueryPrincipalDESCRICAO_UF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_UF'
      Origin = 'DESCRICAO_UF'
      ProviderFlags = []
      Size = 40
    end
    object FDQueryPrincipalSTATUS_EMPRESA: TIntegerField
      FieldName = 'STATUS_EMPRESA'
      Origin = 'STATUS_EMPRESA'
      Required = True
    end
    object strngfldFDQueryPrincipalBAIRRO_EMPRESA: TStringField
      FieldName = 'BAIRRO_EMPRESA'
      Origin = 'BAIRRO_EMPRESA'
      Size = 40
    end
    object intgrfldFDQueryPrincipalUF_CIDADE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'UF_CIDADE'
      Origin = 'UF_CIDADE'
      ProviderFlags = []
      ReadOnly = True
    end
    object strngfldFDQueryPrincipalCNPJ_EMPRESA: TStringField
      FieldName = 'CNPJ_EMPRESA'
      Origin = 'CNPJ_EMPRESA'
      Size = 18
    end
    object strngfldFDQueryPrincipalIE_EMPRESA: TStringField
      FieldName = 'IE_EMPRESA'
      Origin = 'IE_EMPRESA'
      Size = 18
    end
  end
  object QryValidaCidade: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 168
    Top = 72
  end
  object QryValidaUf: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 168
    Top = 16
  end
  object FDSchemaAdapterEmpresa: TFDSchemaAdapter
    Left = 240
    Top = 136
  end
end
