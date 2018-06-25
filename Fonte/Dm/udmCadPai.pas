unit udmCadPai;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, udmConexao;

type
  TdmCadPai = class(TDataModule)
    FDQueryPrincipal: TFDQuery;
    procedure FDQueryPrincipalAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCadPai: TdmCadPai;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmCadPai.FDQueryPrincipalAfterPost(DataSet: TDataSet);
begin
  FDQueryPrincipal.ApplyUpdates(0);
end;

end.
