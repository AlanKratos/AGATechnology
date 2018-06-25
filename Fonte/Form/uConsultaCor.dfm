inherited frmConsultaCor: TfrmConsultaCor
  Caption = 'frmConsultaCor'
  OnCreate = FormCreate
  ExplicitWidth = 662
  ExplicitHeight = 386
  PixelsPerInch = 96
  TextHeight = 13
  inherited leConsulta: TLabeledEdit
    OnMouseEnter = leConsultaMouseEnter
  end
  inherited cbCampoConsulta: TJvDBComboBox
    Items.Strings = (
      'C'#243'digo'
      'Descri'#231#227'o')
  end
  inherited jvbtbtnConfirmar: TJvBitBtn
    OnClick = jvbtbtnConfirmarClick
  end
  inherited dbgConsulta: TJvDBGrid
    DataSource = dsConsulta
    OnDblClick = dbgConsultaDblClick
  end
  inherited dsConsulta: TDataSource
    DataSet = FDQueryConsulta
  end
  inherited FDQueryConsulta: TFDQuery
    Connection = dmConexao.FDConexao
  end
end
