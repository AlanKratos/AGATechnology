inherited frmMovReceber: TfrmMovReceber
  Caption = 'frmMovReceber'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    inherited sbGravar: TSpeedButton
      OnClick = sbGravarClick
    end
    inherited deVencInicial: TJvDateEdit
      Left = 13
      ExplicitLeft = 13
    end
    inherited dbgFinanceiro: TJvDBGrid
      DataSource = dsGrade
      Columns = <
        item
          Expanded = False
          FieldName = 'DOCUMENTO_DUPLICATA'
          Title.Caption = 'Documento'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMISSAO_DUPLICATA'
          Title.Caption = 'Emiss'#227'o'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VENCIMENTO_DUPLICATA'
          Title.Caption = 'Vencimento'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALORABERTO_DUPLICATA'
          Title.Caption = 'Valor Aberto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATAPAGAMENTO_DUPLICATA'
          Title.Caption = 'Data de Pagamento'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALORPAGO_DUPLICATA'
          Title.Caption = 'Valor Pago'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALORDUPLICATA_DUPLICATA'
          Title.Caption = 'Valor Total'
          Visible = True
        end>
    end
  end
  inherited FDQueryDuplicata: TFDQuery
    SQL.Strings = (
      'select '
      '    DUPLICATA.CODIGO_DUPLICATA,'
      '    DUPLICATA.TIPO_DUPLICATA,'
      '    DUPLICATA.EMPRESA_DUPLICATA,'
      '    DUPLICATA.PESSOA_DUPLICATA,'
      '    DUPLICATA.EMISSAO_DUPLICATA,'
      '    DUPLICATA.DOCUMENTO_DUPLICATA,'
      '    DUPLICATA.VENCIMENTO_DUPLICATA,'
      '    DUPLICATA.VALORDUPLICATA_DUPLICATA,'
      '    DUPLICATA.VALORPAGO_DUPLICATA,'
      '    DUPLICATA.DATAPAGAMENTO_DUPLICATA,'
      '    DUPLICATA.BOLETO_DUPLICATA,'
      '    DUPLICATA.DIGITOBOLETO_DUPLICATA,'
      '    DUPLICATA.CONTA_DUPLICATA,'
      '    DUPLICATA.VALORABERTO_DUPLICATA'
      'from DUPLICATA')
  end
end
