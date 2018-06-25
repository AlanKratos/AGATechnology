inherited dmDocEntrada: TdmDocEntrada
  OldCreateOrder = True
  Height = 252
  Width = 399
  inherited QryPrincipal: TFDQuery
    SQL.Strings = (
      'select '
      '    DOCUMENTO_ENTRADA_ITEM.VALOR_DOC_ENT_ITEM,'
      '    DOCUMENTO_ENTRADA_ITEM.QTD_DOC_ENT_ITEM,'
      '    DOCUMENTO_ENTRADA_ITEM.ITEM_DOC_ENT_ITEM,'
      '    DOCUMENTO_ENTRADA_ITEM.CODITEM_DOC_ENT_ITEM,'
      '    DOCUMENTOS_ENTRADA.CHAVE_DOC_ENTRADA,'
      '    DOCUMENTOS_ENTRADA.NUMERONF_DOC_ENTRADA,'
      '    DOCUMENTOS_ENTRADA.CODIGO_DOC_ENTRADA'
      'from DOCUMENTOS_ENTRADA'
      
        '   left join DOCUMENTO_ENTRADA_ITEM on (DOCUMENTOS_ENTRADA.CODIG' +
        'O_DOC_ENTRADA = DOCUMENTO_ENTRADA_ITEM.CODOCUMENTO_DOC_ENT_ITEM)'
      'where DOCUMENTOS_ENTRADA.CODIGO_DOC_ENTRADA = :CODIGO')
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
