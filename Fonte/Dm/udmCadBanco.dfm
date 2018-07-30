inherited dmCadBanco: TdmCadBanco
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 222
  Width = 330
  inherited QryCadastro: TFDQuery
    AfterPost = nil
    SQL.Strings = (
      'select * from banco')
  end
  inherited QryNavegar: TFDQuery
    Left = 56
    Top = 113
  end
  object FDSchemaAdapterBanco: TFDSchemaAdapter
    Left = 208
    Top = 72
  end
end
