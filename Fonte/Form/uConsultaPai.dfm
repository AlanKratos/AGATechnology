object frmConsultaPai: TfrmConsultaPai
  Left = 0
  Top = 0
  Caption = 'frmConsultaPai'
  ClientHeight = 359
  ClientWidth = 654
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object leConsulta: TLabeledEdit
    Left = 2
    Top = 69
    Width = 161
    Height = 21
    CharCase = ecUpperCase
    EditLabel.Width = 42
    EditLabel.Height = 13
    EditLabel.Caption = 'Consulta'
    TabOrder = 0
  end
  object cbCampoConsulta: TJvDBComboBox
    Left = 2
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 2
    ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
    ListSettings.OutfilteredValueFont.Color = clRed
    ListSettings.OutfilteredValueFont.Height = -11
    ListSettings.OutfilteredValueFont.Name = 'Tahoma'
    ListSettings.OutfilteredValueFont.Style = []
  end
  object cbCriterioConsulta: TJvDBComboBox
    Left = 200
    Top = 16
    Width = 145
    Height = 21
    Items.Strings = (
      'Maior que'
      'Menor que'
      'Maior ou igual a'
      'Menor ou igual a'
      'Come'#231'a com'
      'Termina com'
      'Cont'#233'm')
    TabOrder = 3
    ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
    ListSettings.OutfilteredValueFont.Color = clRed
    ListSettings.OutfilteredValueFont.Height = -11
    ListSettings.OutfilteredValueFont.Name = 'Tahoma'
    ListSettings.OutfilteredValueFont.Style = []
  end
  object jvbtbtnPesquisar: TJvBitBtn
    Left = 200
    Top = 69
    Width = 98
    Height = 21
    Caption = 'Pesquisar'
    TabOrder = 1
    OnClick = jvbtbtnPesquisarClick
  end
  object jvbtbtnConfirmar: TJvBitBtn
    Left = 304
    Top = 69
    Width = 105
    Height = 21
    Caption = 'Confirmar'
    TabOrder = 4
  end
  object dbgConsulta: TJvDBGrid
    Left = 0
    Top = 112
    Width = 657
    Height = 249
    TabOrder = 5
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
  end
  object dsConsulta: TDataSource
    Left = 376
    Top = 16
  end
  object FDQueryConsulta: TFDQuery
    Left = 448
    Top = 16
  end
end
