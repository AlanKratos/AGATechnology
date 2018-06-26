inherited dmCadConta: TdmCadConta
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 260
  Width = 415
  inherited QryPrincipal: TFDQuery
    BeforePost = FDQueryPrincipalBeforePost
    OnNewRecord = FDQueryPrincipalNewRecord
    CachedUpdates = True
    SchemaAdapter = FDSchemaAdapterConta
    SQL.Strings = (
      'select CONTA.codigo_conta,'
      '       conta.descricao_conta,'
      '       conta.classificacao_conta,'
      '       conta.status_conta,'
      '       conta.banco_conta,'
      '       conta.agencia_conta,'
      '       conta.numeroconta_conta,'
      '       conta.digitoconta_conta,'
      '       conta.digitoagencia_conta,'
      '       conta.titular_conta,'
      '       conta.cnpj_conta,'
      '       conta.cpf_conta,'
      '       conta.slip_conta,'
      '       conta.datafechamento_conta,'
      '       BANCO.descricao_banco,'
      '       banco.camaracompensacao_banco'
      'from conta'
      'left join banco on (conta.banco_conta = banco.codigo_banco)'
      'where conta.codigo_conta = :CODIGO')
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQueryPrincipalCODIGO_CONTA: TIntegerField
      FieldName = 'CODIGO_CONTA'
      Origin = 'CODIGO_CONTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryPrincipalDESCRICAO_CONTA: TStringField
      FieldName = 'DESCRICAO_CONTA'
      Origin = 'DESCRICAO_CONTA'
      Required = True
      Size = 40
    end
    object FDQueryPrincipalCLASSIFICACAO_CONTA: TIntegerField
      FieldName = 'CLASSIFICACAO_CONTA'
      Origin = 'CLASSIFICACAO_CONTA'
      Required = True
    end
    object FDQueryPrincipalSTATUS_CONTA: TIntegerField
      FieldName = 'STATUS_CONTA'
      Origin = 'STATUS_CONTA'
      Required = True
    end
    object FDQueryPrincipalBANCO_CONTA: TIntegerField
      FieldName = 'BANCO_CONTA'
      Origin = 'BANCO_CONTA'
      Required = True
    end
    object FDQueryPrincipalAGENCIA_CONTA: TStringField
      FieldName = 'AGENCIA_CONTA'
      Origin = 'AGENCIA_CONTA'
      Size = 8
    end
    object FDQueryPrincipalNUMEROCONTA_CONTA: TStringField
      FieldName = 'NUMEROCONTA_CONTA'
      Origin = 'NUMEROCONTA_CONTA'
    end
    object FDQueryPrincipalDIGITOCONTA_CONTA: TStringField
      FieldName = 'DIGITOCONTA_CONTA'
      Origin = 'DIGITOCONTA_CONTA'
      Size = 1
    end
    object FDQueryPrincipalDIGITOAGENCIA_CONTA: TStringField
      FieldName = 'DIGITOAGENCIA_CONTA'
      Origin = 'DIGITOAGENCIA_CONTA'
      Size = 1
    end
    object FDQueryPrincipalTITULAR_CONTA: TStringField
      FieldName = 'TITULAR_CONTA'
      Origin = 'TITULAR_CONTA'
      Size = 40
    end
    object FDQueryPrincipalCNPJ_CONTA: TStringField
      FieldName = 'CNPJ_CONTA'
      Origin = 'CNPJ_CONTA'
      Size = 18
    end
    object FDQueryPrincipalCPF_CONTA: TStringField
      FieldName = 'CPF_CONTA'
      Origin = 'CPF_CONTA'
      Size = 14
    end
    object FDQueryPrincipalSLIP_CONTA: TLargeintField
      FieldName = 'SLIP_CONTA'
      Origin = 'SLIP_CONTA'
    end
    object FDQueryPrincipalDATAFECHAMENTO_CONTA: TSQLTimeStampField
      FieldName = 'DATAFECHAMENTO_CONTA'
      Origin = 'DATAFECHAMENTO_CONTA'
    end
    object FDQueryPrincipalDESCRICAO_BANCO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_BANCO'
      Origin = 'DESCRICAO_BANCO'
      ProviderFlags = []
      Size = 40
    end
    object intgrfldFDQueryPrincipalCAMARACOMPENSACAO_BANCO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CAMARACOMPENSACAO_BANCO'
      Origin = 'CAMARACOMPENSACAO_BANCO'
      ProviderFlags = []
    end
  end
  object QryValidaBanco: TFDQuery
    Connection = dmConexao.FDConexao
    FetchOptions.AssignedValues = [evDetailCascade]
    Left = 56
    Top = 88
  end
  object FDSchemaAdapterConta: TFDSchemaAdapter
    Left = 184
    Top = 40
  end
  object FDTableAdapter1: TFDTableAdapter
    Left = 192
    Top = 136
  end
end
