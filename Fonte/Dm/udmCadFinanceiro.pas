unit udmCadFinanceiro;

interface

uses
  System.SysUtils, System.Classes, udmCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, udmConexao;

type
  TdmCadFinanceiro = class(TdmCadPai)
    procedure FDQueryPrincipalBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCadFinanceiro: TdmCadFinanceiro;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmCadFinanceiro.FDQueryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
    if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_DUPLICATA').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_DUPLICATA').AsInteger :=
      dmConexao.ProximoCodigo('DUPLICATA')
end;

end.
