unit udmDocSaida;

interface

uses
  System.SysUtils, System.Classes, udmCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, udmConexao;

type
  TdmDocSaida = class(TdmCadPai)
    FDQueryItens: TFDQuery;
    dsMaster: TDataSource;
    FDSchemaAdapterDocSaida: TFDSchemaAdapter;
    FDQueryPrincipalCODIGO_DOC_SAIDA: TIntegerField;
    FDQueryPrincipalCLIENTE_DOC_SAIDA: TIntegerField;
    FDQueryPrincipalTABPRECO_DOC_SAIDA: TIntegerField;
    FDQueryPrincipalCODIGO_PESSOA: TIntegerField;
    FDQueryPrincipalNOME_PESSOA: TStringField;
    procedure FDQueryPrincipalBeforePost(DataSet: TDataSet);
    procedure FDQueryPrincipalNewRecord(DataSet: TDataSet);
    procedure FDQueryItensBeforeInsert(DataSet: TDataSet);
    procedure FDQueryItensBeforeEdit(DataSet: TDataSet);
    procedure FDQueryItensBeforePost(DataSet: TDataSet);
    procedure FDQueryItensNewRecord(DataSet: TDataSet);
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

procedure TdmDocSaida.FDQueryItensBeforeEdit(DataSet: TDataSet);
begin
  inherited;
//  with FDQueryPrincipal do
//  Begin
//    Edit;
//    FieldByName('ENDERECO_PESSOA').AsInteger := 0;
//  End;
end;

procedure TdmDocSaida.FDQueryItensBeforeInsert(DataSet: TDataSet);
begin
  inherited;
    if FDQueryPrincipal.State = dsInsert then
    FDQueryPrincipal.Post;
    FDQueryPrincipal.Edit;
end;

procedure TdmDocSaida.FDQueryItensBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_DOC_SAIDA_ITEM').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_DOC_SAIDA_ITEM').AsInteger :=
      dmConexao.ProximoCodigo('DOCUMENTO_SAIDA_ITEM');
end;

procedure TdmDocSaida.FDQueryItensNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('DOCUMENTO_DOC_SAIDA_ITEM').AsInteger :=
    FDQueryPrincipal.FieldByName('DOCUMENTO_SAIDA').AsInteger;
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
  FDQueryPrincipal.Edit;
end;

end.
