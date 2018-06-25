inherited dmCadCor: TdmCadCor
  OldCreateOrder = True
  inherited QryPrincipal: TFDQuery
    AfterInsert = FDQueryPrincipalAfterInsert
    BeforePost = FDQueryPrincipalBeforePost
    OnNewRecord = FDQueryPrincipalNewRecord
    CachedUpdates = True
    SQL.Strings = (
      'select COR.CODIGO_COR,'
      '       COR.DESCRICAO_COR,'
      '       COR.ABREVIACAO_COR,'
      '       COR.STATUS_COR'
      'from COR'
      'where COR.CODIGO_COR = :CODIGO')
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
