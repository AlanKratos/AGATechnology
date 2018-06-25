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
    FDQueryEmail: TFDQuery;
    FDQueryEndereco: TFDQuery;
    FDQueryTelefone: TFDQuery;
    dsMaster: TDataSource;
    FDQueryValidaCidade: TFDQuery;
    FDSchemaAdapterCliente: TFDSchemaAdapter;
    FDQueryEnderecoDESCRICAO_CIDADE: TStringField;
    FDQueryEnderecoCODIGO_PESSOA_ENDERECO: TIntegerField;
    FDQueryEnderecoCOD_PESSOA_ENDERECO: TIntegerField;
    FDQueryEnderecoENDERECO_PESSOA_ENDERECO: TStringField;
    FDQueryEnderecoNUMERO_PESSOA_ENDERECO: TStringField;
    FDQueryEnderecoCOMPLEMENTO_PESSOA_ENDERECO: TStringField;
    FDQueryEnderecoDESCRICAO_UF: TStringField;
    FDQueryEnderecoCODIGO_UF: TIntegerField;
    FDQueryEnderecoBAIRRO_PESSOA_ENDERECO: TStringField;
    FDQueryEnderecoCIDADE_PESSOA_ENDERECO: TIntegerField;
    FDQueryValidaUf: TFDQuery;
    FDQueryEnderecoUF_CIDADE: TIntegerField;
    FDQueryPrincipalCODIGO_PESSOA: TIntegerField;
    FDQueryPrincipalNOME_PESSOA: TStringField;
    FDQueryPrincipalFANTASIA_PESSOA: TStringField;
    FDQueryPrincipalTIPO_PESSOA: TIntegerField;
    FDQueryPrincipalOBSERVACAO_PESSOA: TStringField;
    FDQueryPrincipalSTATUS_PESSOA: TIntegerField;
    FDQueryPrincipalCLIENTE_PESSOA: TStringField;
    FDQueryPrincipalCNPJ_PESSOA: TStringField;
    FDQueryPrincipalIE_PESSOA: TStringField;
    FDQueryPrincipalCPF_PESSOA: TStringField;
    FDQueryPrincipalRG_PESSOA: TStringField;
    FDQueryPrincipalFORNECEDOR_PESSOA: TStringField;
    FDQueryPrincipalFUNCIONARIO_PESSOA: TStringField;
    FDQueryValidaGrupo: TFDQuery;
    FDQueryPrincipalGRUPO_PESSOA: TIntegerField;
    FDQueryPrincipalDESCRICAO_GRUPO: TStringField;
    procedure FDQueryPrincipalNewRecord(DataSet: TDataSet);
    procedure FDQueryEnderecoNewRecord(DataSet: TDataSet);
    procedure FDQueryEnderecoBeforeEdit(DataSet: TDataSet);
    procedure FDQueryEnderecoBeforeInsert(DataSet: TDataSet);
    procedure FDQueryEnderecoBeforePost(DataSet: TDataSet);
    procedure FDQueryEmailNewRecord(DataSet: TDataSet);
    procedure FDQueryTelefoneNewRecord(DataSet: TDataSet);
    procedure FDQueryEmailBeforeEdit(DataSet: TDataSet);
    procedure FDQueryTelefoneBeforeEdit(DataSet: TDataSet);
    procedure FDQueryEmailBeforeInsert(DataSet: TDataSet);
    procedure FDQueryTelefoneBeforeInsert(DataSet: TDataSet);
    procedure FDQueryEmailBeforePost(DataSet: TDataSet);
    procedure FDQueryTelefoneBeforePost(DataSet: TDataSet);
    procedure Validate_Cidade(Sender: TField);
    procedure Validate_Grupo(Sender: TField);
    procedure FDQueryPrincipalBeforePost(DataSet: TDataSet);
    procedure FDQueryEnderecoReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure FDQueryPrincipalReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure FDQueryPrincipalAfterInsert(DataSet: TDataSet);

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

procedure TdmCadCliente.FDQueryEmailBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  FDQueryPrincipal.Edit;
end;

procedure TdmCadCliente.FDQueryEmailBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if FDQueryPrincipal.State = dsInsert then
    FDQueryPrincipal.Post;
    FDQueryPrincipal.Edit;
end;

procedure TdmCadCliente.FDQueryEmailBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_PESSOA_EMAIL').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_PESSOA_EMAIL').AsInteger :=
      dmConexao.ProximoCodigo('PESSOA_EMAIL')
end;

procedure TdmCadCliente.FDQueryEmailNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('COD_PESSOA_EMAIL').AsInteger :=
    FDQueryPrincipal.FieldByName('CODIGO_PESSOA').AsInteger;
end;

procedure TdmCadCliente.FDQueryEnderecoBeforeEdit(DataSet: TDataSet);
begin
  inherited;
    FDQueryPrincipal.Edit;
end;

procedure TdmCadCliente.FDQueryEnderecoBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if FDQueryPrincipal.State = dsInsert then
    FDQueryPrincipal.Post;
    FDQueryPrincipal.Edit;
end;

procedure TdmCadCliente.FDQueryEnderecoBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_PESSOA_ENDERECO').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_PESSOA_ENDERECO').AsInteger :=
      dmConexao.ProximoCodigo('PESSOA_ENDERECO');
end;

procedure TdmCadCliente.FDQueryEnderecoNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('COD_PESSOA_ENDERECO').AsInteger :=
    FDQueryPrincipal.FieldByName('CODIGO_PESSOA').AsInteger;
end;

procedure TdmCadCliente.FDQueryEnderecoReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
  inherited;
//  ShowMessage(e.Message);
end;

procedure TdmCadCliente.FDQueryPrincipalAfterInsert(DataSet: TDataSet);
begin
  inherited;
  with FDQueryPrincipal do
  Begin
    FieldByName('STATUS_PESSOA').Value := 1;
  End;
end;

procedure TdmCadCliente.FDQueryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_PESSOA').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_PESSOA').AsInteger :=
      dmConexao.ProximoCodigo('PESSOA')
end;

procedure TdmCadCliente.FDQueryPrincipalNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('CLIENTE_PESSOA').AsString :='S';
  DataSet.FieldByName('FORNECEDOR_PESSOA').AsString :='N';
  DataSet.FieldByName('FUNCIONARIO_PESSOA').AsString :='N';
  FDQueryPrincipal.Edit;
end;

procedure TdmCadCliente.FDQueryPrincipalReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
  inherited;
  Action := raAbort;
  DataSet.Edit;
  ShowMessage(e.Message);
end;

procedure TdmCadCliente.FDQueryTelefoneBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  FDQueryPrincipal.Edit;
end;

procedure TdmCadCliente.FDQueryTelefoneBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if FDQueryPrincipal.State = dsInsert then
    FDQueryPrincipal.Post;
    FDQueryPrincipal.Edit;
end;

procedure TdmCadCliente.FDQueryTelefoneBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_PESSOA_TELEFONE').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_PESSOA_TELEFONE').AsInteger :=
      dmConexao.ProximoCodigo('PESSOA_TELEFONE');
end;

procedure TdmCadCliente.FDQueryTelefoneNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('COD_PESSOA_TELEFONE').AsInteger :=
    FDQueryPrincipal.FieldByName('CODIGO_PESSOA').AsInteger;
end;

procedure TdmCadCliente.Validate_Cidade(Sender: TField);
begin
  FDQueryValidaCidade.Close();
  FDQueryValidaCidade.SQL.Text := 'select DESCRICAO_CIDADE, UF_CIDADE from CIDADE' +
  ' where CIDADE.CODIGO_CIDADE = '+ IntToStr(Sender.AsInteger);
  try
    FDQueryValidaCidade.Open();
  Except
    On E:Exception do
    ShowMessage('Erro Cidade: ' + E.Message);
  end;
  if FDQueryValidaCidade.IsEmpty then
  begin
    MessageDlg('Campo código da cidade precisa ser preenchido!', mtError, [mbOK],0);
    Abort;
  end
  else
  FDQueryEndereco.FieldByName('DESCRICAO_CIDADE').AsString := FDQueryValidaCidade.FieldByName('DESCRICAO_CIDADE').AsString;

  FDQueryValidaUf.Close();
  FDQueryValidaUf.SQL.Text := 'select DESCRICAO_UF from UF' +
  ' where UF.CODIGO_UF = '+ FDQueryValidaCidade.FieldByName('UF_CIDADE').AsString;
  try
    FDQueryValidaUf.Open();
  Except
    On E:Exception do
    ShowMessage('Erro UF: ' + E.Message);
  end;
  if FDQueryValidaCidade.IsEmpty then
  begin
    MessageDlg('UF não preenchido no cadastro da cidade!', mtError, [mbOK],0);
    Abort;
  end
  else
  FDQueryEndereco.FieldByName('DESCRICAO_UF').AsString := FDQueryValidaUf.FieldByName('DESCRICAO_UF').AsString
end;

procedure TdmCadCliente.Validate_Grupo(Sender: TField);
begin
  FDQueryValidaGrupo.Close();
  FDQueryValidaGrupo.SQL.Text := 'select DESCRICAO_GRUPO from GRUPO' +
  ' where GRUPO.CODIGO_GRUPO = '+ IntToStr(Sender.AsInteger);
  try
    FDQueryValidaGrupo.Open();
  Except
    On E:Exception do
    ShowMessage('Erro Grupo: ' + E.Message);
  end;
  if FDQueryValidaGrupo.IsEmpty then
  begin
    MessageDlg('Campo código do grupo precisa ser preenchido!', mtError, [mbOK],0);
    Abort;
  end
  else
  FDQueryPrincipal.FieldByName('DESCRICAO_GRUPO').AsString := FDQueryValidaGrupo.FieldByName('DESCRICAO_GRUPO').AsString;
end;

end.
