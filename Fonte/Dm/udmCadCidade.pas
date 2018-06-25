unit udmCadCidade;

interface

uses
  System.SysUtils, System.Classes, udmCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, udmConexao, Vcl.Dialogs;

type
  TdmCadCidade = class(TdmCadPai)
    FDQueryValidaUF: TFDQuery;
    FDQueryPrincipalCODIGO_CIDADE: TIntegerField;
    FDQueryPrincipalDESCRICAO_CIDADE: TStringField;
    FDQueryPrincipalCODMUNICIPIO_CIDADE: TIntegerField;
    FDQueryPrincipalUF_CIDADE: TIntegerField;
    FDQueryPrincipalSIGLA_UF: TStringField;
    FDSchemaAdapterCidade: TFDSchemaAdapter;
    FDQueryPrincipalCODIGO_UF: TIntegerField;
    procedure FDQueryPrincipalBeforePost(DataSet: TDataSet);
    procedure FDQueryPrincipalNewRecord(DataSet: TDataSet);
    procedure Validate_UF(Sender:TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCadCidade: TdmCadCidade;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmCadCidade.FDQueryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_CIDADE').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_CIDADE').AsInteger :=
      dmConexao.ProximoCodigo('CIDADE')
end;

procedure TdmCadCidade.FDQueryPrincipalNewRecord(DataSet: TDataSet);
begin
  inherited;
  FDQueryPrincipal.Edit;
end;


procedure TdmCadCidade.Validate_Uf(Sender: TField);
begin
  FDQueryValidaUF.Close();
  FDQueryValidaUF.SQL.Text := 'select SIGLA_UF, DESCRICAO_UF from UF' +
  ' where UF.CODIGO_UF = '+ IntToStr(Sender.AsInteger);
  try
    FDQueryValidaUf.Open();
  Except
    On E:Exception do
    ShowMessage('Erro UF: ' + E.Message);
  end;
  if FDQueryValidaUF.IsEmpty then
  begin
    MessageDlg('UF não preenchido no cadastro da cidade!', mtError, [mbOK],0);
    Abort;
  end
  else
  FDQueryPrincipal.FieldByName('DESCRICAO_UF').AsString := FDQueryValidaUF.FieldByName('DESCRICAO_UF').AsString;
  FDQueryPrincipal.FieldByName('SIGLA_UF').AsString := FDQueryValidaUF.FieldByName('SIGLA_UF').AsString;
  end;

end.
