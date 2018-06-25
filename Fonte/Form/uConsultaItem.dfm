inherited frmConsultaItem: TfrmConsultaItem
  Caption = 'Consulta do Item'
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
      'Nome')
  end
  inherited jvbtbtnConfirmar: TJvBitBtn
    OnClick = jvbtbtnConfirmarClick
  end
  inherited dbgConsulta: TJvDBGrid
    DataSource = dsConsulta
    OnDblClick = dbgConsultaDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO_ITEM'
        Title.Caption = 'Cod. Item'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO_ITEM'
        Title.Caption = 'Item'
        Width = 300
        Visible = True
      end>
  end
  inherited dsConsulta: TDataSource
    DataSet = FDQueryConsulta
  end
  inherited FDQueryConsulta: TFDQuery
    Connection = dmConexao.FDConexao
  end
end
