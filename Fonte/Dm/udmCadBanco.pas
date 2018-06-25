unit udmCadBanco;

interface

uses
  System.SysUtils, System.Classes, udmCadPai, udmConexao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmCadBanco = class(TdmCadPai)
    QryPrincipalCODIGO_BANCO: TIntegerField;
    QryPrincipalDESCRICAO_BANCO: TStringField;
    QryPrincipalCAMARACOMPENSACAO_BANCO: TIntegerField;
    QryPrincipalLOGO_BANCO: TBlobField;
    QryPrincipalSTATUS_BANCO: TIntegerField;
    QryPrincipalINCLUSAO_BANCO: TSQLTimeStampField;
    QryPrincipalALTERACAO_BANCO: TSQLTimeStampField;
    QryPrincipalUSUARIOINCLUSAO_BANCO: TStringField;
    QryPrincipalUSUARIOALTERACAO_BANCO: TStringField;
    FDSchemaAdapterBanco: TFDSchemaAdapter;
    procedure QryPrincipalBeforePost(DataSet: TDataSet);
    procedure QryPrincipalNewRecord(DataSet: TDataSet);
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

procedure TdmCadBanco.QryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_BANCO').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_BANCO').AsInteger :=
      dmConexao.ProximoCodigo('BANCO')

end;

procedure TdmCadBanco.QryPrincipalNewRecord(DataSet: TDataSet);
begin
  inherited;
  QryPrincipal.Edit;
end;

end.
