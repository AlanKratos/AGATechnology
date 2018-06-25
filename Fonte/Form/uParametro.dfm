object frmParametro: TfrmParametro
  Left = 0
  Top = 0
  Caption = 'Par'#226'metro de Funcionamento do Sistema'
  ClientHeight = 382
  ClientWidth = 580
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dbcbControlaCor: TJvDBCheckBox
    Left = 16
    Top = 16
    Width = 97
    Height = 17
    Caption = 'Controla Cor'
    DataField = 'CONTROLACOR_PARAMETRO'
    DataSource = dsParametro
    TabOrder = 0
  end
  object dbcbControlaGrade: TJvDBCheckBox
    Left = 16
    Top = 39
    Width = 97
    Height = 17
    Caption = 'Controla Grade'
    DataField = 'CONTROLAGRADE_PARAMETRO'
    DataSource = dsParametro
    TabOrder = 1
  end
  object dbcbPedidoGeraFinanceiro: TJvDBCheckBox
    Left = 16
    Top = 104
    Width = 97
    Height = 17
    Caption = 'Pedido de Venda Gera Financeiro'
    DataField = 'PEDIDOGERAFINANCEIRO'
    DataSource = dsParametro
    TabOrder = 2
  end
  object FDQueryParametro: TFDQuery
    Connection = dmConexao.FDConexao
    SQL.Strings = (
      'select '
      '    PARAMETRO.AUTOINC_PARAMETRO,'
      '    PARAMETRO.CONTROLACOR_PARAMETRO,'
      '    PARAMETRO.CONTROLAGRADE_PARAMETRO,'
      '    PARAMETRO.PEDIDOGERAFINANCEIRO'
      'from PARAMETRO')
    Left = 392
    Top = 24
  end
  object dsParametro: TJvDataSource
    DataSet = FDQueryParametro
    Left = 280
    Top = 24
  end
end
