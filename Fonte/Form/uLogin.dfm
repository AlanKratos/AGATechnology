object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  Caption = 'Login'
  ClientHeight = 213
  ClientWidth = 455
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btLogin: TButton
    Left = 248
    Top = 160
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 2
    OnClick = btLoginClick
  end
  object btSalvar: TButton
    Left = 112
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 3
    OnClick = btSalvarClick
  end
  object meSenha: TMaskEdit
    Left = 176
    Top = 96
    Width = 121
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
    Text = 'SENHA'
  end
  object eUsuario: TEdit
    Left = 176
    Top = 56
    Width = 121
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
    Text = 'TESTE'
  end
  object JvVigenereCipher1: TJvVigenereCipher
    Left = 56
    Top = 16
  end
  object FDQueryLogin: TFDQuery
    BeforePost = FDQueryLoginBeforePost
    CachedUpdates = True
    Connection = dmConexao.FDConexao
    Transaction = FDTransactionLogin
    SQL.Strings = (
      'select '
      '    USUARIO.CODIGO_USUARIO,'
      '    USUARIO.DESCRICAO_USUARIO,'
      '    USUARIO.SENHA_USUARIO,'
      '    USUARIO.STATUS_USUARIO'
      'from USUARIO'
      '')
    Left = 336
    Top = 24
  end
  object FDTransactionLogin: TFDTransaction
    Connection = dmConexao.FDConexao
    Left = 336
    Top = 88
  end
  object JvEnterAsTab1: TJvEnterAsTab
    Left = 48
    Top = 104
  end
end
