unit udmCadConta;

interface

uses
  System.SysUtils, System.Classes, udmCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Dialogs, udmConexao;

type
  TdmCadConta = class(TdmCadPai)
    QryValidaBanco: TFDQuery;
    QryCadastroCODIGO_CONTA: TIntegerField;
    QryCadastroDESCRICAO_CONTA: TStringField;
    QryCadastroCLASSIFICACAO_CONTA: TIntegerField;
    QryCadastroSTATUS_CONTA: TIntegerField;
    QryCadastroBANCO_CONTA: TIntegerField;
    FDQueryPrincipalAGENCIA_CONTA: TStringField;
    QryCadastroNUMEROCONTA_CONTA: TStringField;
    FDQueryPrincipalDIGITOCONTA_CONTA: TStringField;
    QryCadastroDIGITOAGENCIA_CONTA: TStringField;
    QryCadastroTITULAR_CONTA: TStringField;
    QryCadastroCNPJ_CONTA: TStringField;
    QryCadastroCPF_CONTA: TStringField;
    QryCadastroSLIP_CONTA: TLargeintField;
    QryCadastroDATAFECHAMENTO_CONTA: TSQLTimeStampField;
    FDSchemaAdapterConta: TFDSchemaAdapter;
    FDTableAdapter1: TFDTableAdapter;
    QryCadastroDESCRICAO_BANCO: TStringField;
    QryCadastroCAMARACOMPENSACAO_BANCO: TIntegerField;
    procedure Validate_Banco(Sender:TField);
    procedure QryPrincipalBeforePost(DataSet: TDataSet);
    procedure QryPrincipalNewRecord(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCadConta: TdmCadConta;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
procedure TdmCadConta.DataModuleCreate(Sender: TObject);
begin
  inherited;
  self.tabela := 'CONTA';
  self.campochave := 'CODIGO_CONTA';
  self.TipoCadastro := '1 = 1 ';
end;

procedure TdmCadConta.QryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_CONTA').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_CONTA').AsInteger :=
      dmConexao.ProximoCodigo('CONTA')
end;

procedure TdmCadConta.QryPrincipalNewRecord(DataSet: TDataSet);
begin
  inherited;
  QryCadastro.Edit;
end;

procedure TdmCadConta.Validate_Banco(Sender: TField);
begin
  QryValidaBanco.Close();
  QryValidaBanco.SQL.Text := 'select DESCRICAO_BANCO, CAMARACOMPENSACAO_BANCO from BANCO' +
  ' where BANCO.CODIGO_BANCO = '+ IntToStr(Sender.AsInteger);
  try
    QryValidaBanco.Open();
  Except
    On E:Exception do
    ShowMessage('Erro conta: ' + E.Message);
  end;
  if QryValidaBanco.IsEmpty then
  begin
    MessageDlg('Favor preencher o banco com um cadastro válido!', mtError, [mbOK],0);
    Abort;
  end
  else
  QryCadastro.FieldByName('DESCRICAO_BANCO').AsString := QryValidaBanco.FieldByName('DESCRICAO_BANCO').AsString;
  QryCadastro.FieldByName('CAMARACOMPENSACAO_BANCO').AsString := QryValidaBanco.FieldByName('CAMARACOMPENSACAO_BANCO').AsString;
end;

end.
