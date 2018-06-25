object frmDetalhamento: TfrmDetalhamento
  Left = 0
  Top = 0
  Caption = 'frmDetalhamento'
  ClientHeight = 427
  ClientWidth = 701
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lCores: TLabel
    Left = 8
    Top = 13
    Width = 28
    Height = 13
    Caption = 'Cores'
  end
  object lCoresSelecionadas: TLabel
    Left = 168
    Top = 13
    Width = 93
    Height = 13
    Caption = 'Cores Selecionadas'
  end
  object lGrades: TLabel
    Left = 400
    Top = 13
    Width = 34
    Height = 13
    Caption = 'Grades'
  end
  object lGradesSelecionadas: TLabel
    Left = 560
    Top = 13
    Width = 99
    Height = 13
    Caption = 'Grades Selecionadas'
  end
  object sbConfirmar: TSpeedButton
    Left = 311
    Top = 184
    Width = 75
    Height = 22
    Caption = 'Confirmar'
    OnClick = sbConfirmarClick
  end
  object dbgCor: TJvDBGrid
    Left = 8
    Top = 32
    Width = 129
    Height = 193
    DataSource = dsCor
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbgCorDblClick
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'NomeCor'
        Visible = True
      end>
  end
  object dbgItemCor: TJvDBGrid
    Left = 168
    Top = 32
    Width = 129
    Height = 193
    DataSource = dsItemCor
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbgItemCorDblClick
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'NomeItemCor'
        Visible = True
      end>
  end
  object dbgGrade: TJvDBGrid
    Left = 400
    Top = 32
    Width = 129
    Height = 193
    DataSource = dsGrade
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbgGradeDblClick
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'NomeGrade'
        Visible = True
      end>
  end
  object dbgItemGrade: TJvDBGrid
    Left = 560
    Top = 32
    Width = 129
    Height = 193
    DataSource = dsItemGrade
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbgItemGradeDblClick
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'NomeItemGrade'
        Visible = True
      end>
  end
  object JvDBGrid5: TJvDBGrid
    Left = 8
    Top = 256
    Width = 681
    Height = 169
    DataSource = dsCombinacao
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'CodCorComb'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeCorComb'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CodGradeComb'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeGradeComb'
        Visible = True
      end>
  end
  object sbGerar: TButton
    Left = 311
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Gerar'
    TabOrder = 5
    OnClick = sbGerarClick
  end
  object dsCor: TJvDataSource
    Left = 48
    Top = 88
  end
  object dsItemCor: TJvDataSource
    Left = 216
    Top = 104
  end
  object dsGrade: TJvDataSource
    Left = 440
    Top = 112
  end
  object dsItemGrade: TJvDataSource
    Left = 608
    Top = 112
  end
  object dsCombinacao: TJvDataSource
    Left = 336
    Top = 304
  end
  object cdsCor: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 48
    Top = 152
  end
  object cdsItemCor: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 208
    Top = 168
  end
  object cdsGrade: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 440
    Top = 168
  end
  object cdsItemGrade: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 608
    Top = 168
  end
  object cdsCombinacao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 208
    Top = 304
  end
end
