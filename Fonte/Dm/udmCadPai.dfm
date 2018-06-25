object dmCadPai: TdmCadPai
  OldCreateOrder = False
  Height = 150
  Width = 215
  object FDQueryPrincipal: TFDQuery
    AfterPost = FDQueryPrincipalAfterPost
    Connection = dmConexao.FDConexao
    Left = 64
    Top = 24
  end
end
