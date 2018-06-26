unit udmCadCidade;

interface

uses
  System.SysUtils, System.Classes, udmCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, udmConexao, Vcl.Dialogs;

type
  TdmCadCidade = class(TdmCadPai)
    QryValidaUf: TFDQuery;
    FDQueryPrincipalCODIGO_CIDADE: TIntegerField;
    FDQueryPrincipalDESCRICAO_CIDADE: TStringField;
    FDQueryPrincipalCODMUNICIPIO_CIDADE: TIntegerField;
    FDQueryPrincipalUF_CIDADE: TIntegerField;
    FDQueryPrincipalSIGLA_UF: TStringField;
    FDSchemaAdapterCidade: TFDSchemaAdapter;
    FDQueryPrincipalCODIGO_UF: TIntegerField;
    procedure QryPrincipalBeforePost(DataSet: TDataSet);
    procedure QryPrincipalNewRecord(DataSet: TDataSet);
    procedure Validate_UF(Sender:TField);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCadCidade: TdmCadCidade;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmCadCidade.DataModuleCreate(Sender: TObject);
begin
  inherited;
  self.tabela := 'CIDADE';
  self.campochave := 'CODIGO_CIDADE';
  self.TipoCadastro := '1 = 1'; //usar quando nao precisar utilizar
end;

procedure TdmCadCidade.QryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_CIDADE').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_CIDADE').AsInteger :=
      dmConexao.ProximoCodigo('CIDADE')
end;

procedure TdmCadCidade.QryPrincipalNewRecord(DataSet: TDataSet);
begin
  inherited;
  QryPrincipal.Edit;
end;


procedure TdmCadCidade.Validate_Uf(Sender: TField);
begin
  QryValidaUF.Close();
  QryValidaUF.SQL.Text := 'select SIGLA_UF, DESCRICAO_UF from UF' +
  ' where UF.CODIGO_UF = '+ IntToStr(Sender.AsInteger);
  try
    QryValidaUf.Open();
  Except
    On E:Exception do
    ShowMessage('Erro UF: ' + E.Message);
  end;
  if QryValidaUF.IsEmpty then
  begin
    MessageDlg('UF não preenchido no cadastro da cidade!', mtError, [mbOK],0);
    Abort;
  end
  else
  QryPrincipal.FieldByName('DESCRICAO_UF').AsString := QryValidaUF.FieldByName('DESCRICAO_UF').AsString;
  QryPrincipal.FieldByName('SIGLA_UF').AsString := QryValidaUF.FieldByName('SIGLA_UF').AsString;
  end;

end.
