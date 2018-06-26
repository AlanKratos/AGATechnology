unit uCadConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvComponentBase,
  JvEnterTab, Vcl.StdCtrls, Vcl.Mask, JvExMask, JvToolEdit, JvBaseEdits,
  Vcl.Buttons, Vcl.ExtCtrls, udmCadConta, JvExStdCtrls, JvCombobox,
  JvDBCombobox, Vcl.DBCtrls, JvDBCheckBox, JvDBControls;

type
  TfrmCadConta = class(TfrmCadPai)
    Panel2: TPanel;
    dbedtDESCRICAO_CONTA: TDBEdit;
    jvdbcmbxCLASSIFICACAO_CONTA: TJvDBComboBox;
    Label2: TLabel;
    Label3: TLabel;
    jvdbchckbxStatus: TJvDBCheckBox;
    jvdbcmbdtBANCO_CONTA: TJvDBComboEdit;
    Label4: TLabel;
    dbedtDESCRICAO_BANCO: TDBEdit;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    Label10: TLabel;
    DBEdit6: TDBEdit;
    Label11: TLabel;
    DBEdit7: TDBEdit;
    Label12: TLabel;
    DBEdit8: TDBEdit;
    Label13: TLabel;
    DBEdit9: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtnIncluirClick(Sender: TObject);
    procedure BitBtnSalvarClick(Sender: TObject);
    procedure BitBtnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadConta: TfrmCadConta;

implementation

{$R *.dfm}

procedure TfrmCadConta.BitBtnExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Tem certeza que deseja excluir o registro ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  Begin
    try
      with dmCadConta do
      Begin
        QryPrincipal.Delete;
        FDSchemaAdapterConta.ApplyUpdates(0);
        JvCalcEditCodigo.Value := 0;

      End;
    Except on E: Exception do
      ShowMessage(E.Message);
    end;
  End
  else
  Abort;

end;

procedure TfrmCadConta.BitBtnIncluirClick(Sender: TObject);
begin
  inherited;
  dbedtDESCRICAO_CONTA.SetFocus;
  //jvdbcmbxCLASSIFICACAO_CONTA := 'CONTA CAIXA';
  //jvdbchckbxStatus.ValueChecked;

end;

procedure TfrmCadConta.BitBtnSalvarClick(Sender: TObject);
begin
  try
    dsCadastro.DataSet.Post;
    JvCalcEditCodigo.Text := dmCadConta.QryPrincipal.FieldByName('CODIGO_CONTA').AsString;

  Except on E: Exception do
    ShowMessage(E.Message);
  end;
  inherited;
end;

procedure TfrmCadConta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := CaFree;
  frmCadConta := nil;
end;

procedure TfrmCadConta.FormCreate(Sender: TObject);
begin
  inherited;
  dmCadConta := TdmCadConta.Create(self); // Instanciar DM
  self.fdmCadPai := dmCadConta;

  with dmCadConta do
  begin
    QryPrincipal.Close;
    QryPrincipal.Open;
  end;
end;

procedure TfrmCadConta.FormShow(Sender: TObject);
begin
  inherited;
with dmCadConta do
  Begin
    QryPrincipal.FieldByName('BANCO_CONTA').OnValidate := Validate_Banco;
  End;

end;

end.
