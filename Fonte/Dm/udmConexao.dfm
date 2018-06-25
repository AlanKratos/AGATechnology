object dmConexao: TdmConexao
  OldCreateOrder = False
  Height = 339
  Width = 384
  object FDConexao: TFDConnection
    Params.Strings = (
      'Database=D:\Sistema\AGATechnology\Banco\SISTEMA.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=127.0.0.1'
      'Port=3054'
      'CharacterSet=iSO8859_1'
      'DriverID=FB')
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = True
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 24
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    Left = 128
    Top = 24
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 232
    Top = 24
  end
  object QryProximoCodigo: TFDQuery
    Connection = FDConexao
    Transaction = FDTransactionProximoCodigo
    UpdateTransaction = FDTransactionProximoCodigo
    Left = 64
    Top = 104
  end
  object FDTransactionProximoCodigo: TFDTransaction
    Connection = FDConexao
    Left = 72
    Top = 176
  end
end
