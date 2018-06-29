inherited frmCadEmpresa: TfrmCadEmpresa
  Caption = 'Cadastro de Empresa'
  OnClose = FormClose
  OnCreate = FormCreate
  OnPaint = nil
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelLeft: TPanel
    inherited BitBtnExcluir: TSpeedButton
      OnClick = BitBtnExcluirClick
    end
  end
  object Panel2: TPanel [2]
    Left = 81
    Top = 35
    Width = 592
    Height = 331
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 2
    object Label2: TLabel
      Left = 6
      Top = 6
      Width = 91
      Height = 13
      Caption = 'Nome/Raz'#227'o Social'
    end
    object Label3: TLabel
      Left = 319
      Top = 6
      Width = 41
      Height = 13
      Caption = 'Fantasia'
    end
    object JvPageControl1: TJvPageControl
      Left = 1
      Top = 52
      Width = 590
      Height = 278
      ActivePage = tsLogomarca
      Align = alBottom
      TabOrder = 0
      object tsPrincipal: TTabSheet
        Caption = 'Principal'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label4: TLabel
          Left = 1
          Top = 1
          Width = 45
          Height = 13
          Caption = 'Endere'#231'o'
        end
        object Label5: TLabel
          Left = 279
          Top = 1
          Width = 37
          Height = 13
          Caption = 'N'#250'mero'
        end
        object Label6: TLabel
          Left = 351
          Top = 47
          Width = 65
          Height = 13
          Caption = 'Complemento'
        end
        object Label7: TLabel
          Left = 1
          Top = 98
          Width = 33
          Height = 13
          Caption = 'Cidade'
        end
        object Label8: TLabel
          Left = 351
          Top = 98
          Width = 13
          Height = 13
          Caption = 'UF'
        end
        object lbl1: TLabel
          Left = 1
          Top = 51
          Width = 28
          Height = 13
          Caption = 'Bairro'
          FocusControl = dbedtBAIRRO_EMPRESA
        end
        object lbl2: TLabel
          Left = 3
          Top = 152
          Width = 25
          Height = 13
          Caption = 'CNPJ'
        end
        object lbl3: TLabel
          Left = 204
          Top = 152
          Width = 87
          Height = 13
          Caption = 'Inscri'#231#227'o Estadual'
        end
        object dbeEndereco: TDBEdit
          Left = 1
          Top = 20
          Width = 275
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ENDERECO_EMPRESA'
          DataSource = dsCadastro
          TabOrder = 0
        end
        object dbeNumero: TDBEdit
          Left = 279
          Top = 20
          Width = 66
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NUMERO_EMPRESA'
          DataSource = dsCadastro
          TabOrder = 1
        end
        object dbedtDESCRICAO_CIDADE: TDBEdit
          Left = 76
          Top = 117
          Width = 269
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          DataField = 'DESCRICAO_CIDADE'
          DataSource = dsCadastro
          ReadOnly = True
          TabOrder = 5
        end
        object dbedtDESCRICAO_UF: TDBEdit
          Left = 351
          Top = 117
          Width = 228
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          DataField = 'DESCRICAO_UF'
          DataSource = dsCadastro
          ReadOnly = True
          TabOrder = 6
        end
        object dbeComplemento: TDBEdit
          Left = 351
          Top = 66
          Width = 228
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COMPLEMENTO_EMPRESA'
          DataSource = dsCadastro
          TabOrder = 3
        end
        object dbceCodCidade: TJvDBComboEdit
          Left = 1
          Top = 117
          Width = 72
          Height = 21
          DataField = 'CIDADE_EMPRESA'
          DataSource = dsCadastro
          TabOrder = 4
        end
        object pnlStatus: TPanel
          Left = 489
          Top = 3
          Width = 90
          Height = 41
          TabOrder = 9
          object jvdbchckbxStatus: TJvDBCheckBox
            Left = 12
            Top = 14
            Width = 68
            Height = 17
            Caption = 'Ativo'
            DataField = 'STATUS_EMPRESA'
            DataSource = dsCadastro
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '2'
          end
        end
        object dbedtBAIRRO_EMPRESA: TDBEdit
          Left = 1
          Top = 66
          Width = 344
          Height = 21
          DataField = 'BAIRRO_EMPRESA'
          DataSource = dsCadastro
          TabOrder = 2
        end
        object dbmeIE: TJvDBMaskEdit
          Left = 204
          Top = 171
          Width = 120
          Height = 21
          DataField = 'IE_EMPRESA'
          DataSource = dsCadastro
          TabOrder = 8
          EditMask = ''
        end
        object dbmeCNPJ: TJvDBMaskEdit
          Left = 3
          Top = 171
          Width = 190
          Height = 21
          DataField = 'CNPJ_EMPRESA'
          DataSource = dsCadastro
          MaxLength = 18
          TabOrder = 7
          EditMask = '##.###.###/####-##;1;_'
        end
      end
      object tsEmpresa: TTabSheet
        Caption = 'Empresa'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object JvCaptionPanel1: TJvCaptionPanel
          Left = 0
          Top = 1
          Width = 254
          Height = 144
          Buttons = []
          Caption = 'Tributa'#231#227'o'
          CaptionColor = clGrayText
          CaptionPosition = dpTop
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clBlack
          CaptionFont.Height = -13
          CaptionFont.Name = 'Tahoma'
          CaptionFont.Style = [fsBold]
          OutlookLook = False
          TabOrder = 0
          object Label13: TLabel
            Left = 3
            Top = 118
            Width = 34
            Height = 13
            Caption = 'CSOSN'
          end
          object Label12: TLabel
            Left = 3
            Top = 90
            Width = 45
            Height = 13
            Caption = 'CONFINS'
          end
          object Label11: TLabel
            Left = 3
            Top = 63
            Width = 16
            Height = 13
            Caption = 'PIS'
          end
          object Label10: TLabel
            Left = 3
            Top = 36
            Width = 20
            Height = 13
            Caption = 'CRT'
          end
          object dbcbCsosn: TJvDBComboBox
            Left = 56
            Top = 110
            Width = 185
            Height = 21
            DataField = 'CSOSN_EMPRESA'
            DataSource = dsCadastro
            TabOrder = 3
            ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
            ListSettings.OutfilteredValueFont.Color = clRed
            ListSettings.OutfilteredValueFont.Height = -11
            ListSettings.OutfilteredValueFont.Name = 'Tahoma'
            ListSettings.OutfilteredValueFont.Style = []
          end
          object dbcbCofins: TJvDBComboBox
            Left = 56
            Top = 82
            Width = 185
            Height = 21
            TabOrder = 2
            ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
            ListSettings.OutfilteredValueFont.Color = clRed
            ListSettings.OutfilteredValueFont.Height = -11
            ListSettings.OutfilteredValueFont.Name = 'Tahoma'
            ListSettings.OutfilteredValueFont.Style = []
          end
          object dbcbPis: TJvDBComboBox
            Left = 56
            Top = 55
            Width = 185
            Height = 21
            DataSource = dsCadastro
            TabOrder = 1
            ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
            ListSettings.OutfilteredValueFont.Color = clRed
            ListSettings.OutfilteredValueFont.Height = -11
            ListSettings.OutfilteredValueFont.Name = 'Tahoma'
            ListSettings.OutfilteredValueFont.Style = []
          end
          object dbcbCrt: TJvDBComboBox
            Left = 56
            Top = 28
            Width = 185
            Height = 21
            DataField = 'CRT_EMPRESA'
            DataSource = dsCadastro
            Items.Strings = (
              'Simples Nacional'
              'Simples Nacional - excesso de sublimite de receita bruta'
              'Regime Normal')
            TabOrder = 0
            Values.Strings = (
              '1'
              '2'
              '3')
            ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
            ListSettings.OutfilteredValueFont.Color = clRed
            ListSettings.OutfilteredValueFont.Height = -11
            ListSettings.OutfilteredValueFont.Name = 'Tahoma'
            ListSettings.OutfilteredValueFont.Style = []
          end
        end
        object JvCaptionPanel2: TJvCaptionPanel
          Left = 275
          Top = 3
          Width = 254
          Height = 118
          Buttons = []
          Caption = 'Al'#237'quotas da Empresa'
          CaptionColor = clGrayText
          CaptionPosition = dpTop
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clBlack
          CaptionFont.Height = -13
          CaptionFont.Name = 'Tahoma'
          CaptionFont.Style = [fsBold]
          OutlookLook = False
          TabOrder = 1
          object Label14: TLabel
            Left = 3
            Top = 118
            Width = 34
            Height = 13
            Caption = 'CSOSN'
          end
          object Label15: TLabel
            Left = 3
            Top = 90
            Width = 59
            Height = 13
            Caption = 'CONFINS %'
          end
          object Label16: TLabel
            Left = 3
            Top = 63
            Width = 30
            Height = 13
            Caption = 'PIS %'
          end
          object Label17: TLabel
            Left = 3
            Top = 35
            Width = 49
            Height = 13
            Caption = 'Simples %'
          end
          object dbeAliqSimples: TDBEdit
            Left = 84
            Top = 27
            Width = 121
            Height = 21
            DataField = 'ALIQSIMPLES_EMPRESA'
            DataSource = dsCadastro
            TabOrder = 0
          end
          object dbeAliqPis: TDBEdit
            Left = 84
            Top = 55
            Width = 121
            Height = 21
            DataField = 'ALIQPIS_EMPRESA'
            DataSource = dsCadastro
            TabOrder = 1
          end
          object dbeAliqCofins: TDBEdit
            Left = 84
            Top = 82
            Width = 121
            Height = 21
            DataField = 'ALIQCOFINS_EMPRESA'
            DataSource = dsCadastro
            TabOrder = 2
          end
        end
        object JvCaptionPanel3: TJvCaptionPanel
          Left = 275
          Top = 127
          Width = 254
          Height = 66
          Buttons = []
          Caption = 'Al'#237'quotas Banc'#225'rias'
          CaptionColor = clGrayText
          CaptionPosition = dpTop
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clBlack
          CaptionFont.Height = -13
          CaptionFont.Name = 'Tahoma'
          CaptionFont.Style = [fsBold]
          OutlookLook = False
          TabOrder = 2
          object Label21: TLabel
            Left = 3
            Top = 35
            Width = 40
            Height = 13
            Caption = 'Juros %'
          end
          object dbeAliqJurosBoleto: TDBEdit
            Left = 88
            Top = 27
            Width = 121
            Height = 21
            DataField = 'ALIQJUROSBOLETA_EMPRESA'
            DataSource = dsCadastro
            TabOrder = 0
          end
        end
      end
      object tsLogomarca: TTabSheet
        Caption = 'Logomarca'
        ImageIndex = 2
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object sbExcluir: TSpeedButton
          Left = 3
          Top = 39
          Width = 57
          Height = 22
          Caption = 'Excluir'
          OnClick = sbExcluirClick
        end
        object sbIncluir: TSpeedButton
          Left = 3
          Top = 11
          Width = 57
          Height = 22
          Caption = 'Incluir'
          OnClick = sbIncluirClick
        end
        object dbiLogo: TJvDBImage
          Left = 114
          Top = 11
          Width = 377
          Height = 222
          DataField = 'LOGO_EMPRESA'
          DataSource = dsCadastro
          Proportional = True
          TabOrder = 0
        end
      end
    end
    object dbeRazaoSocial: TDBEdit
      Left = 2
      Top = 25
      Width = 279
      Height = 21
      CharCase = ecUpperCase
      DataField = 'RAZAOSOCIAL_EMPRESA'
      DataSource = dsCadastro
      TabOrder = 1
    end
    object dbeFantasia: TDBEdit
      Left = 319
      Top = 25
      Width = 266
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NOMEFANTASIA_EMPRESA'
      DataSource = dsCadastro
      TabOrder = 2
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = 
      'All (*.gif;*.cur;*.pcx;*.ani;*.png_old;*.gif;*.png;*.jpg;*.jpeg;' +
      '*.bmp;*.tif;*.tiff;*.ico;*.emf;*.wmf)|*.gif;*.cur;*.pcx;*.ani;*.' +
      'png_old;*.gif;*.png;*.jpg;*.jpeg;*.bmp;*.tif;*.tiff;*.ico;*.emf;' +
      '*.wmf|CompuServe GIF Image (*.gif)|*.gif|Portable Network Graphi' +
      'cs (*.png_old)|*.png_old|GIF Image (*.gif)|*.gif|Portable Networ' +
      'k Graphics (*.png)|*.png|JPEG Image File (*.jpg)|*.jpg|JPEG Imag' +
      'e File (*.jpeg)|*.jpeg|Bitmaps (*.bmp)|*.bmp|TIFF Images (*.tiff' +
      ')|*.tiff|Icons (*.ico)|*.ico|Metafiles (*.wmf)|*.wmf'
    Left = 560
  end
end
