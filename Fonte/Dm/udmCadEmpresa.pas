unit udmCadEmpresa;

interface

uses
  System.SysUtils, System.Classes, udmCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, VCL.Dialogs, udmConexao;

type
  TdmCadEmpresa = class(TdmCadPai)
    QryValidaCidade: TFDQuery;
    QryValidaUf: TFDQuery;
    FDQueryPrincipalCODIGO_EMPRESA: TIntegerField;
    FDSchemaAdapterEmpresa: TFDSchemaAdapter;
    procedure Validate_Cidade(Sender: TField);
    procedure QryPrincipalBeforePost(DataSet: TDataSet);
    procedure QryPrincipalNewRecord(DataSet: TDataSet);
    procedure QryPrincipalAfterInsert(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCadEmpresa: TdmCadEmpresa;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmCadEmpresa }

procedure TdmCadEmpresa.DataModuleCreate(Sender: TObject);
begin
  inherited;
  self.tabela := 'EMPRESA';
  self.campochave := 'CODIGO_EMPRESA';
  self.TipoCadastro := '1 = 1'; //usar quando nao precisar utilizar
end;

procedure TdmCadEmpresa.QryPrincipalAfterInsert(DataSet: TDataSet);
begin
  inherited;
  with QryPrincipal do
  Begin
    FieldByName('STATUS_EMPRESA').Value := 1;
  End;
end;

procedure TdmCadEmpresa.QryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_EMPRESA').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_EMPRESA').AsInteger :=
      dmConexao.ProximoCodigo('EMPRESA')
end;

procedure TdmCadEmpresa.QryPrincipalNewRecord(DataSet: TDataSet);
begin
  inherited;
  QryPrincipal.Edit;
end;

procedure TdmCadEmpresa.Validate_Cidade(Sender: TField);
begin
  QryValidaCidade.Close();
  QryValidaCidade.SQL.Text := 'select DESCRICAO_CIDADE, UF_CIDADE from CIDADE' +
  ' where CIDADE.CODIGO_CIDADE = '+ IntToStr(Sender.AsInteger);
  try
    QryValidaCidade.Open();
  Except
    On E:Exception do
    ShowMessage('Erro cidade: ' + E.Message);
  end;
  if QryValidaCidade.IsEmpty then
  begin
    MessageDlg('Campo c�digo da cidade precisa ser preenchido!!', mtError, [mbOK],0);
    Abort;
  end
  else
  QryPrincipal.FieldByName('DESCRICAO_CIDADE').AsString := QryValidaCidade.FieldByName('DESCRICAO_CIDADE').AsString;

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
    MessageDlg('UF n�o preenchido no cadastro da cidade!', mtError, [mbOK],0);
    Abort;
  end
  else
  QryPrincipal.FieldByName('DESCRICAO_UF').AsString := QryValidaUf.FieldByName('DESCRICAO_UF').AsString
end;

end.
