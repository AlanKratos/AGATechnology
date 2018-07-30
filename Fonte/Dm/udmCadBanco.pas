unit udmCadBanco;

interface

uses
  System.SysUtils, System.Classes, udmCadPai, udmConexao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmCadBanco = class(TdmCadPai)
    QryCadastroCODIGO_BANCO: TIntegerField;
    QryCadastroDESCRICAO_BANCO: TStringField;
    QryCadastroCAMARACOMPENSACAO_BANCO: TIntegerField;
    QryCadastroLOGO_BANCO: TBlobField;
    QryCadastroSTATUS_BANCO: TIntegerField;
    QryCadastroINCLUSAO_BANCO: TSQLTimeStampField;
    QryCadastroALTERACAO_BANCO: TSQLTimeStampField;
    QryCadastroUSUARIOINCLUSAO_BANCO: TStringField;
    QryCadastroUSUARIOALTERACAO_BANCO: TStringField;
    FDSchemaAdapterBanco: TFDSchemaAdapter;
    procedure QryPrincipalBeforePost(DataSet: TDataSet);
    procedure QryPrincipalNewRecord(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure QryCadastroAfterPost(DataSet: TDataSet);
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

procedure TdmCadBanco.DataModuleCreate(Sender: TObject);
begin
  inherited;
  self.tabela := 'BANCO';
  self.campochave := 'CODIGO_BANCO';
  self.TipoCadastro := '1 = 1'; //usar quando nao precisar utilizar
end;

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
  QryCadastro.Edit;
end;

end.
