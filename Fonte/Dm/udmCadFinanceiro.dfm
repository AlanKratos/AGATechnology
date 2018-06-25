inherited dmCadFinanceiro: TdmCadFinanceiro
  OldCreateOrder = True
  Height = 210
  Width = 288
  inherited QryPrincipal: TFDQuery
    BeforePost = FDQueryPrincipalBeforePost
    SQL.Strings = (
      'select '
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
      '    DUPLICATA.BOLETO_DUPLICATA,'
      '    DUPLICATA.DIGITOBOLETO_DUPLICATA,'
      '    DUPLICATA.CONTA_DUPLICATA,'
      '    DUPLICATA.VALORABERTO_DUPLICATA'
      'from DUPLICATA')
    Left = 48
  end
end
