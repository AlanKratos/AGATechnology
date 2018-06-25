inherited frmConsultaCliente: TfrmConsultaCliente
  Caption = 'frmConsultaCliente'
  ClientHeight = 376
  ClientWidth = 657
  OnCreate = FormCreate
  ExplicitWidth = 665
  ExplicitHeight = 403
  PixelsPerInch = 96
  TextHeight = 13
  inherited leConsulta: TLabeledEdit
    Top = 98
    Width = 163
    EditLabel.ExplicitTop = 82
    ExplicitTop = 98
    ExplicitWidth = 163
  end
  inherited cbCampoConsulta: TJvDBComboBox
    Left = 21
    Items.Strings = (
      'C'#243'digo'
      'Nome'
      'CNPJ'
      'CPF')
    ReadOnly = True
    TabOrder = 3
    ExplicitLeft = 21
  end
  inherited cbCriterioConsulta: TJvDBComboBox
    ReadOnly = True
    TabOrder = 4
  end
  inherited jvbtbtnPesquisar: TJvBitBtn
    Top = 98
    ExplicitTop = 98
  end
  inherited jvbtbtnConfirmar: TJvBitBtn
    Left = 312
    Top = 98
    TabOrder = 2
    OnClick = jvbtbtnConfirmarClick
    ExplicitLeft = 312
    ExplicitTop = 98
  end
  inherited dbgConsulta: TJvDBGrid
    Top = 125
    DataSource = dsConsulta
    OnDblClick = dbgConsultaDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CLIENTE_PESSOA'
        Title.Caption = 'Cod. Cliente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_PESSOA'
        Title.Caption = 'Nome'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEFONE_PESSOA'
        Title.Caption = 'Telefone'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMAIL_PESSOA'
        Title.Caption = 'E-mail'
        Width = 150
        Visible = True
      end>
  end
  inherited dsConsulta: TDataSource
    DataSet = FDQueryConsulta
    Left = 368
    Top = 8
  end
  inherited FDQueryConsulta: TFDQuery
    Connection = dmConexao.FDConexao
    Left = 432
    Top = 8
  end
end
