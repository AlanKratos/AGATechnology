unit udmCadCor;

interface

uses
  System.SysUtils, System.Classes, udmCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, udmConexao;

type
  TdmCadCor = class(TdmCadPai)
    procedure FDQueryPrincipalAfterInsert(DataSet: TDataSet);
    procedure QryPrincipalBeforePost(DataSet: TDataSet);
    procedure QryPrincipalNewRecord(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCadCor: TdmCadCor;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmCadCor.DataModuleCreate(Sender: TObject);
begin
  inherited;
  self.tabela := 'COR';
  self.campochave := 'CODIGO_COR';
  self.TipoCadastro := '1 = ';
end;

procedure TdmCadCor.FDQueryPrincipalAfterInsert(DataSet: TDataSet);
begin
  inherited;
  with QryPrincipal do
  Begin
    FieldByName('STATUS_COR').Value := 1;
  End;
end;

procedure TdmCadCor.QryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_COR').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_COR').AsInteger :=
      dmConexao.ProximoCodigo('COR')
end;

procedure TdmCadCor.QryPrincipalNewRecord(DataSet: TDataSet);
begin
  inherited;
  QryPrincipal.Edit;
end;

end.
