unit udmCadCliente;

interface

uses
  System.SysUtils, System.Classes, udmCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, udmConexao, frxClass,
  frxDBSet,Vcl.Dialogs;

type
  TdmCadCliente = class(TdmCadPai)
    QryEmail: TFDQuery;
    QryEndereco: TFDQuery;
    QryTelefone: TFDQuery;
    dsMaster: TDataSource;
    QryValidaCidade: TFDQuery;
    FDSchemaAdapterCliente: TFDSchemaAdapter;
    QryEnderecoDESCRICAO_CIDADE: TStringField;
    QryEnderecoCODIGO_PESSOA_ENDERECO: TIntegerField;
    QryEnderecoCOD_PESSOA_ENDERECO: TIntegerField;
    QryEnderecoENDERECO_PESSOA_ENDERECO: TStringField;
    QryEnderecoNUMERO_PESSOA_ENDERECO: TStringField;
    QryEnderecoCOMPLEMENTO_PESSOA_ENDERECO: TStringField;
    QryEnderecoDESCRICAO_UF: TStringField;
    QryEnderecoCODIGO_UF: TIntegerField;
    QryEnderecoBAIRRO_PESSOA_ENDERECO: TStringField;
    QryEnderecoCIDADE_PESSOA_ENDERECO: TIntegerField;
    QryValidaUf: TFDQuery;
    QryEnderecoUF_CIDADE: TIntegerField;
    QryPrincipalCODIGO_PESSOA: TIntegerField;
    QryPrincipalNOME_PESSOA: TStringField;
    QryPrincipalFANTASIA_PESSOA: TStringField;
    QryPrincipalTIPO_PESSOA: TIntegerField;
    QryPrincipalOBSERVACAO_PESSOA: TStringField;
    QryPrincipalSTATUS_PESSOA: TIntegerField;
    QryPrincipalCLIENTE_PESSOA: TStringField;
    QryPrincipalCNPJ_PESSOA: TStringField;
    QryPrincipalIE_PESSOA: TStringField;
    QryPrincipalCPF_PESSOA: TStringField;
    QryPrincipalRG_PESSOA: TStringField;
    QryPrincipalFORNECEDOR_PESSOA: TStringField;
    QryPrincipalFUNCIONARIO_PESSOA: TStringField;
    QryValidaGrupo: TFDQuery;
    QryPrincipalGRUPO_PESSOA: TIntegerField;
    QryPrincipalDESCRICAO_GRUPO: TStringField;
    procedure QryPrincipalNewRecord(DataSet: TDataSet);
    procedure QryEnderecoNewRecord(DataSet: TDataSet);
    procedure QryEnderecoBeforeEdit(DataSet: TDataSet);
    procedure QryEnderecoBeforeInsert(DataSet: TDataSet);
    procedure QryEnderecoBeforePost(DataSet: TDataSet);
    procedure QryEmailNewRecord(DataSet: TDataSet);
    procedure QryTelefoneNewRecord(DataSet: TDataSet);
    procedure QryEmailBeforeEdit(DataSet: TDataSet);
    procedure QryTelefoneBeforeEdit(DataSet: TDataSet);
    procedure QryEmailBeforeInsert(DataSet: TDataSet);
    procedure QryTelefoneBeforeInsert(DataSet: TDataSet);
    procedure QryEmailBeforePost(DataSet: TDataSet);
    procedure QryTelefoneBeforePost(DataSet: TDataSet);
    procedure Validate_Cidade(Sender: TField);
    procedure Validate_Grupo(Sender: TField);
    procedure QryPrincipalBeforePost(DataSet: TDataSet);
    procedure QryEnderecoReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure QryPrincipalReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure QryPrincipalAfterInsert(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    qry: TFDQuery;
  end;

var
  dmCadCliente: TdmCadCliente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmCadCliente.DataModuleCreate(Sender: TObject);
begin
  inherited;
  self.tabela := 'PESSOA';
  self.campochave := 'CODIGO_PESSOA';
  self.TipoCadastro := 'CLIENTE_PESSOA = ' + QuotedStr('S');
end;

procedure TdmCadCliente.QryEmailBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  QryPrincipal.Edit;
end;

procedure TdmCadCliente.QryEmailBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if QryPrincipal.State = dsInsert then
    QryPrincipal.Post;
    QryPrincipal.Edit;
end;

procedure TdmCadCliente.QryEmailBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_PESSOA_EMAIL').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_PESSOA_EMAIL').AsInteger :=
      dmConexao.ProximoCodigo('PESSOA_EMAIL')
end;

procedure TdmCadCliente.QryEmailNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('COD_PESSOA_EMAIL').AsInteger :=
    QryPrincipal.FieldByName('CODIGO_PESSOA').AsInteger;
end;

procedure TdmCadCliente.QryEnderecoBeforeEdit(DataSet: TDataSet);
begin
  inherited;
    QryPrincipal.Edit;
end;

procedure TdmCadCliente.QryEnderecoBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if QryPrincipal.State = dsInsert then
    QryPrincipal.Post;
    QryPrincipal.Edit;
end;

procedure TdmCadCliente.QryEnderecoBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_PESSOA_ENDERECO').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_PESSOA_ENDERECO').AsInteger :=
      dmConexao.ProximoCodigo('PESSOA_ENDERECO');
end;

procedure TdmCadCliente.QryEnderecoNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('COD_PESSOA_ENDERECO').AsInteger :=
    QryPrincipal.FieldByName('CODIGO_PESSOA').AsInteger;
end;

procedure TdmCadCliente.QryEnderecoReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
  inherited;
//  ShowMessage(e.Message);
end;

procedure TdmCadCliente.QryPrincipalAfterInsert(DataSet: TDataSet);
begin
  inherited;
  with QryPrincipal do
  Begin
    FieldByName('STATUS_PESSOA').Value := 1;
  End;
end;

procedure TdmCadCliente.QryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_PESSOA').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_PESSOA').AsInteger :=
      dmConexao.ProximoCodigo('PESSOA')
end;

procedure TdmCadCliente.QryPrincipalNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('CLIENTE_PESSOA').AsString :='S';
  DataSet.FieldByName('FORNECEDOR_PESSOA').AsString :='N';
  DataSet.FieldByName('FUNCIONARIO_PESSOA').AsString :='N';
  QryPrincipal.Edit;
end;

procedure TdmCadCliente.QryPrincipalReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
  inherited;
  Action := raAbort;
  DataSet.Edit;
  ShowMessage(e.Message);
end;

procedure TdmCadCliente.QryTelefoneBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  QryPrincipal.Edit;
end;

procedure TdmCadCliente.QryTelefoneBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if QryPrincipal.State = dsInsert then
    QryPrincipal.Post;
    QryPrincipal.Edit;
end;

procedure TdmCadCliente.QryTelefoneBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_PESSOA_TELEFONE').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_PESSOA_TELEFONE').AsInteger :=
      dmConexao.ProximoCodigo('PESSOA_TELEFONE');
end;

procedure TdmCadCliente.QryTelefoneNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('COD_PESSOA_TELEFONE').AsInteger :=
    QryPrincipal.FieldByName('CODIGO_PESSOA').AsInteger;
end;

procedure TdmCadCliente.Validate_Cidade(Sender: TField);
begin
  QryValidaCidade.Close();
  QryValidaCidade.SQL.Text := 'select DESCRICAO_CIDADE, UF_CIDADE from CIDADE' +
  ' where CIDADE.CODIGO_CIDADE = '+ IntToStr(Sender.AsInteger);
  try
    QryValidaCidade.Open();
  Except
    On E:Exception do
    ShowMessage('Erro Cidade: ' + E.Message);
  end;
  if QryValidaCidade.IsEmpty then
  begin
    MessageDlg('Campo código da cidade precisa ser preenchido!', mtError, [mbOK],0);
    Abort;
  end
  else
  QryEndereco.FieldByName('DESCRICAO_CIDADE').AsString := QryValidaCidade.FieldByName('DESCRICAO_CIDADE').AsString;

  QryValidaUf.Close();
  QryValidaUf.SQL.Text := 'select DESCRICAO_UF from UF' +
  ' where UF.CODIGO_UF = '+ QryValidaCidade.FieldByName('UF_CIDADE').AsString;
  try
    QryValidaUf.Open();
  Except
    On E:Exception do
    ShowMessage('Erro UF: ' + E.Message);
  end;
  if QryValidaCidade.IsEmpty then
  begin
    MessageDlg('UF não preenchido no cadastro da cidade!', mtError, [mbOK],0);
    Abort;
  end
  else
  QryEndereco.FieldByName('DESCRICAO_UF').AsString := QryValidaUf.FieldByName('DESCRICAO_UF').AsString
end;

procedure TdmCadCliente.Validate_Grupo(Sender: TField);
begin
  QryValidaGrupo.Close();
  QryValidaGrupo.SQL.Text := 'select DESCRICAO_GRUPO from GRUPO' +
  ' where GRUPO.CODIGO_GRUPO = '+ IntToStr(Sender.AsInteger);
  try
    QryValidaGrupo.Open();
  Except
    On E:Exception do
    ShowMessage('Erro Grupo: ' + E.Message);
  end;
  if QryValidaGrupo.IsEmpty then
  begin
    MessageDlg('Campo código do grupo precisa ser preenchido!', mtError, [mbOK],0);
    Abort;
  end
  else
  QryPrincipal.FieldByName('DESCRICAO_GRUPO').AsString := QryValidaGrupo.FieldByName('DESCRICAO_GRUPO').AsString;
end;

end.
