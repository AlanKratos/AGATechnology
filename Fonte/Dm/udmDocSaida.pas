unit udmDocSaida;

interface

uses
  System.SysUtils, System.Classes, udmCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, udmConexao;

type
  TdmDocSaida = class(TdmCadPai)
    QryItens: TFDQuery;
    dsMaster: TDataSource;
    FDSchemaAdapterDocSaida: TFDSchemaAdapter;
    FDQueryPrincipalCODIGO_DOC_SAIDA: TIntegerField;
    FDQueryPrincipalCLIENTE_DOC_SAIDA: TIntegerField;
    FDQueryPrincipalTABPRECO_DOC_SAIDA: TIntegerField;
    FDQueryPrincipalCODIGO_PESSOA: TIntegerField;
    FDQueryPrincipalNOME_PESSOA: TStringField;
    procedure FDQueryPrincipalBeforePost(DataSet: TDataSet);
    procedure FDQueryPrincipalNewRecord(DataSet: TDataSet);
    procedure QryItensBeforeInsert(DataSet: TDataSet);
    procedure QryItensBeforeEdit(DataSet: TDataSet);
    procedure QryItensBeforePost(DataSet: TDataSet);
    procedure QryItensNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDocSaida: TdmDocSaida;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmDocSaida.QryItensBeforeEdit(DataSet: TDataSet);
begin
  inherited;
//  with FDQueryPrincipal do
//  Begin
//    Edit;
//    FieldByName('ENDERECO_PESSOA').AsInteger := 0;
//  End;
end;

procedure TdmDocSaida.QryItensBeforeInsert(DataSet: TDataSet);
begin
  inherited;
    if QryPrincipal.State = dsInsert then
    QryPrincipal.Post;
    QryPrincipal.Edit;
end;

procedure TdmDocSaida.QryItensBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_DOC_SAIDA_ITEM').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_DOC_SAIDA_ITEM').AsInteger :=
      dmConexao.ProximoCodigo('DOCUMENTO_SAIDA_ITEM');
end;

procedure TdmDocSaida.QryItensNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('DOCUMENTO_DOC_SAIDA_ITEM').AsInteger :=
    QryPrincipal.FieldByName('DOCUMENTO_SAIDA').AsInteger;
end;

procedure TdmDocSaida.FDQueryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_DOC_SAIDA').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_DOC_SAIDA').AsInteger :=
      dmConexao.ProximoCodigo('DOCUMENTO_SAIDA')
end;

procedure TdmDocSaida.FDQueryPrincipalNewRecord(DataSet: TDataSet);
begin
  inherited;
  QryPrincipal.Edit;
end;

end.
