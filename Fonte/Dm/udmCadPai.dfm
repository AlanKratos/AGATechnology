object dmCadPai: TdmCadPai
  OldCreateOrder = False
  Height = 329
  Width = 383
  object QryCadastro: TFDQuery
    AfterPost = QryCadastroAfterPost
    Connection = dmConexao.FDConexao
    Left = 64
    Top = 24
  end
  object QryNavegar: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 200
    Top = 201
  end
end
