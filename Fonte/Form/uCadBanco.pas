unit uCadBanco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvComponentBase,
  JvEnterTab, Vcl.StdCtrls, Vcl.Mask, JvExMask, JvToolEdit, JvBaseEdits,
  Vcl.Buttons, Vcl.ExtCtrls, udmCadBanco, Vcl.DBCtrls, JvDBCheckBox, JvDBImage, Vcl.ExtDlgs;

type
  TfrmCadBanco = class(TfrmCadPai)
    pnl1: TPanel;
    lbl1: TLabel;
    dbedtDESCRICAO_BANCO: TDBEdit;
    lbl2: TLabel;
    dbedtCAMARACOMPENSACAO_BANCO: TDBEdit;
    lbl3: TLabel;
    jvdbchckbxStatus: TJvDBCheckBox;
    JvDBImageLogo: TJvDBImage;
    spbtnIncluir: TSpeedButton;
    spbtnExcluir: TSpeedButton;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure BitBtnExcluirClick(Sender: TObject);
    procedure BitBtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtnIncluirClick(Sender: TObject);
    procedure spbtnIncluirClick(Sender: TObject);
    procedure spbtnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadBanco: TfrmCadBanco;

implementation

{$R *.dfm}

procedure TfrmCadBanco.BitBtnExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Tem certeza que deseja excluir o registro ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  Begin
    try
      with dmCadBanco do
      Begin
        QryPrincipal.Delete;
        FDSchemaAdapterBanco.ApplyUpdates(0);
        JvCalcEditCodigo.Value := 0;
      End;
    Except on E: Exception do
      ShowMessage(E.Message);
    end;
  End
  else
  Abort;

end;

procedure TfrmCadBanco.BitBtnIncluirClick(Sender: TObject);
begin
  inherited;
  dbedtDESCRICAO_BANCO.SetFocus;
end;

procedure TfrmCadBanco.BitBtnSalvarClick(Sender: TObject);
begin
  try
    dsCadastro.DataSet.Post;
    JvCalcEditCodigo.Text := dmCadBanco.QryPrincipal.FieldByName('CODIGO_BANCO').AsString;
  Except on E: Exception do
    ShowMessage(E.Message);
  end;
  inherited;

end;
procedure TfrmCadBanco.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := CaFree;
  frmCadBanco := nil;
end;

procedure TfrmCadBanco.FormCreate(Sender: TObject);
begin
  inherited;
  dmCadBanco := TdmCadBanco.Create(self); // Instanciar DM
  self.fdmCadPai := dmCadBanco;

  with dmCadBanco do
  begin
    QryPrincipal.Close;
    QryPrincipal.Open;
  end;

end;

procedure TfrmCadBanco.spbtnExcluirClick(Sender: TObject);
begin
  inherited;
  if (Application.MessageBox('Deseja realmente excluir a imagem?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES) then
  try
    Begin
      dmCadBanco.QryPrincipal.Edit;
      dsCadastro.DataSet.Edit;
      JvDBImageLogo.Picture:= nil;
    End;
  Except
    ShowMessage('Erro ao tentar excluir o arquivo');
    exit;
  end;

end;

procedure TfrmCadBanco.spbtnIncluirClick(Sender: TObject);
begin
  inherited;
  if OpenPictureDialog1.Execute then
  try
    Begin
      dmCadBanco.QryPrincipal.Edit;
      dsCadastro.DataSet.Edit;
      JvDBImageLogo.Picture.LoadFromFile(OpenPictureDialog1.FileName);
    End;
  except
    ShowMessage('Arquivo Inválido');
    exit;
  end;
end;
end.
