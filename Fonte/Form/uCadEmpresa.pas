unit uCadEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvComponentBase,
  JvEnterTab, Vcl.StdCtrls, Vcl.Mask, JvExMask, JvToolEdit, JvBaseEdits,
  Vcl.Buttons, Vcl.ExtCtrls, udmCadEmpresa, Vcl.DBCtrls, Vcl.ComCtrls,
  JvExComCtrls, JvComCtrls, JvDBControls, JvDBImage, Vcl.ExtDlgs, JvExStdCtrls,
  JvCombobox, JvDBCombobox, JvExExtCtrls, JvRadioGroup, JvExtComponent,
  JvCaptionPanel, JvMaskEdit, JvDBCheckBox, unitValidaCnpjCpf;

type
  TfrmCadEmpresa = class(TfrmCadPai)
    Panel2: TPanel;
    JvPageControl1: TJvPageControl;
    tsPrincipal: TTabSheet;
    tsEmpresa: TTabSheet;
    dbeRazaoSocial: TDBEdit;
    dbeFantasia: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    dbeEndereco: TDBEdit;
    dbeNumero: TDBEdit;
    dbedtDESCRICAO_CIDADE: TDBEdit;
    dbedtDESCRICAO_UF: TDBEdit;
    dbeComplemento: TDBEdit;
    dbceCodCidade: TJvDBComboEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    dbiLogo: TJvDBImage;
    sbIncluir: TSpeedButton;
    sbExcluir: TSpeedButton;
    OpenPictureDialog1: TOpenPictureDialog;
    JvCaptionPanel1: TJvCaptionPanel;
    dbcbCsosn: TJvDBComboBox;
    Label13: TLabel;
    Label12: TLabel;
    dbcbCofins: TJvDBComboBox;
    dbcbPis: TJvDBComboBox;
    Label11: TLabel;
    Label10: TLabel;
    dbcbCrt: TJvDBComboBox;
    JvCaptionPanel2: TJvCaptionPanel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    JvCaptionPanel3: TJvCaptionPanel;
    Label21: TLabel;
    dbeAliqSimples: TDBEdit;
    dbeAliqPis: TDBEdit;
    dbeAliqCofins: TDBEdit;
    dbeAliqJurosBoleto: TDBEdit;
    pnlStatus: TPanel;
    jvdbchckbxStatus: TJvDBCheckBox;
    tsLogomarca: TTabSheet;
    lbl1: TLabel;
    dbedtBAIRRO_EMPRESA: TDBEdit;
    lbl2: TLabel;
    lbl3: TLabel;
    dbmeCNPJ: TJvDBMaskEdit;
    dbmeIE: TJvDBMaskEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtnIncluirClick(Sender: TObject);
    procedure BitBtnSalvarClick(Sender: TObject);
    procedure BitBtnExcluirClick(Sender: TObject);
    procedure sbIncluirClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadEmpresa: TfrmCadEmpresa;

implementation

{$R *.dfm}

procedure TfrmCadEmpresa.BitBtnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Tem certeza que deseja excluir o registro ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  Begin
    try
      with dmCadEmpresa do
      Begin
        FDQueryPrincipal.Delete;
        FDSchemaAdapterEmpresa.ApplyUpdates(0);
        JvCalcEditCodigo.Value := 0;
      End;
    Except on E: Exception do
      ShowMessage(E.Message);
    end;
  End
  else
  Abort;

  inherited;
end;

procedure TfrmCadEmpresa.BitBtnIncluirClick(Sender: TObject);
begin
  inherited;
  dbeRazaoSocial.SetFocus;
end;

procedure TfrmCadEmpresa.BitBtnSalvarClick(Sender: TObject);
begin
 if not ValidaCNPJ(dbmeCNPJ.Text) then
  begin
    ShowMessage('CNPJ Inválido!');
    abort;
  end;

  try
    dsCadastro.DataSet.Post;
    JvCalcEditCodigo.Text := dmCadEmpresa.FDQueryPrincipal.FieldByName('CODIGO_EMPRESA').AsString;

  Except on E: Exception do
    ShowMessage(E.Message);
  end;
  inherited;
end;

procedure TfrmCadEmpresa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := CaFree;
  frmCadEmpresa := nil;
end;

procedure TfrmCadEmpresa.FormCreate(Sender: TObject);
begin
  inherited;
  dmCadEmpresa := TdmCadEmpresa.Create(self); // Instanciar DM
  self.tabela := 'EMPRESA';
  self.campochave := 'CODIGO_EMPRESA';
  self.modalidade := 'CODIGO_EMPRESA > 0'; //usar quando nao precisar utilizar
  //modalidade no where
  self.fdmCadPai := dmCadEmpresa;

  with dmCadEmpresa do
  begin
    FDQueryPrincipal.Close;
    FDQueryPrincipal.Open;
  end;

end;

procedure TfrmCadEmpresa.FormShow(Sender: TObject);
begin
  inherited;
with dmCadEmpresa do
  Begin
    FDQueryPrincipal.FieldByName('CIDADE_EMPRESA').OnValidate := Validate_Cidade;
  End;
end;

procedure TfrmCadEmpresa.sbExcluirClick(Sender: TObject);
begin
  inherited;
  if (Application.MessageBox('Deseja realmente excluir a imagem?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES) then
  try
    Begin
      dmCadEmpresa.FDQueryPrincipal.Edit;
      dsCadastro.DataSet.Edit;
      dbiLogo.Picture:= nil;
    End;
  Except
    ShowMessage('Erro ao tentar excluir o arquivo');
    exit;
  end;
end;

procedure TfrmCadEmpresa.sbIncluirClick(Sender: TObject);
begin
  inherited;
  if OpenPictureDialog1.Execute then
  try
    Begin
      dmCadEmpresa.FDQueryPrincipal.Edit;
      dsCadastro.DataSet.Edit;
      dbiLogo.Picture.LoadFromFile(OpenPictureDialog1.FileName);
    End;
  except
    ShowMessage('Arquivo Inválido');
    exit;
  end;
end;

end.
