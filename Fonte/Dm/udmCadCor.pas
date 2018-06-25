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
    procedure FDQueryPrincipalBeforePost(DataSet: TDataSet);
    procedure FDQueryPrincipalNewRecord(DataSet: TDataSet);
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

procedure TdmCadCor.FDQueryPrincipalAfterInsert(DataSet: TDataSet);
begin
  inherited;
  with FDQueryPrincipal do
  Begin
    FieldByName('STATUS_COR').Value := 1;
  End;
end;

procedure TdmCadCor.FDQueryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_COR').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_COR').AsInteger :=
      dmConexao.ProximoCodigo('COR')
end;

procedure TdmCadCor.FDQueryPrincipalNewRecord(DataSet: TDataSet);
begin
  inherited;
  FDQueryPrincipal.Edit;
end;

end.
