unit udmCadBanco;

interface

uses
  System.SysUtils, System.Classes, udmCadPai, udmConexao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmCadBanco = class(TdmCadPai)
    FDQueryPrincipalCODIGO_BANCO: TIntegerField;
    FDQueryPrincipalDESCRICAO_BANCO: TStringField;
    FDQueryPrincipalCAMARACOMPENSACAO_BANCO: TIntegerField;
    FDQueryPrincipalLOGO_BANCO: TBlobField;
    FDQueryPrincipalSTATUS_BANCO: TIntegerField;
    FDQueryPrincipalINCLUSAO_BANCO: TSQLTimeStampField;
    FDQueryPrincipalALTERACAO_BANCO: TSQLTimeStampField;
    FDQueryPrincipalUSUARIOINCLUSAO_BANCO: TStringField;
    FDQueryPrincipalUSUARIOALTERACAO_BANCO: TStringField;
    FDSchemaAdapterBanco: TFDSchemaAdapter;
    procedure FDQueryPrincipalBeforePost(DataSet: TDataSet);
    procedure FDQueryPrincipalNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCadBanco: TdmCadBanco;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmCadBanco.FDQueryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_BANCO').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_BANCO').AsInteger :=
      dmConexao.ProximoCodigo('BANCO')

end;

procedure TdmCadBanco.FDQueryPrincipalNewRecord(DataSet: TDataSet);
begin
  inherited;
  FDQueryPrincipal.Edit;
end;

end.
