unit udmCadBanco;

interface

uses
  System.SysUtils, System.Classes, udmCadPai, udmConexao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmCadBanco = class(TdmCadPai)
    FDSchemaAdapterBanco: TFDSchemaAdapter;
    procedure QryCadastroBeforePost(DataSet: TDataSet);
    procedure QryCadastroNewRecord(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
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

procedure TdmCadBanco.QryCadastroBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_BANCO').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_BANCO').AsInteger :=
      dmConexao.ProximoCodigo('BANCO')

end;

procedure TdmCadBanco.QryCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;
  QryCadastro.Edit;
end;

end.
