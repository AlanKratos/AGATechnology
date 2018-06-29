inherited dmCadGrade: TdmCadGrade
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 240
  inherited QryCadastro: TFDQuery
    AfterInsert = QryCadastroAfterInsert
    BeforePost = QryCadastroBeforePost
    OnNewRecord = QryCadastroNewRecord
    CachedUpdates = True
    SQL.Strings = (
      'select '
      '    GRADE.CODIGO_GRADE,'
      '    GRADE.DESCRICAO_GRADE,'
      '    GRADE.STATUS_GRADE'
      'from GRADE'
      'where GRADE.CODIGO_GRADE = :CODIGO')
    Left = 40
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  inherited QryNavegar: TFDQuery
    Left = 136
    Top = 56
  end
  object QryGradeDetalhe: TFDQuery
    SQL.Strings = (
      'select '
      '    GRADE_DETALHE.COD_GRADE_DETALHE,'
      '    GRADE_DETALHE.GRADE_DETALHE_GRADE'
      'from GRADE_DETALHE'
      'left join GRADE ON ()'
      'where GRADE_DETALHE.COD_GRADE_DETAHE = :CODIGO_GRADE')
    Left = 48
    Top = 104
    ParamData = <
      item
        Name = 'CODIGO_GRADE'
        ParamType = ptInput
        Value = Null
      end>
  end
end
