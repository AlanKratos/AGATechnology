inherited dmCadBanco: TdmCadBanco
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 222
  Width = 330
  inherited QryCadastro: TFDQuery
    SQL.Strings = (
      'select * from banco')
  end
  object FDSchemaAdapterBanco: TFDSchemaAdapter
    Left = 208
    Top = 72
  end
end
