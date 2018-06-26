unit udmCadPai;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, udmConexao;

type
  TdmCadPai = class(TDataModule)
    QryPrincipal: TFDQuery;
    QryNavegar: TFDQuery;
    procedure QryPrincipalAfterPost(DataSet: TDataSet);
    procedure Navegar(Codigo:Integer);
  private
    { Private declarations }
    varTabela: string; //tabela chamada
    varCampochave: string; //chave primaria
    varModalidade: string; //Cliente,Fornecedor...
    VarCodigo: Integer;
  public
    { Public declarations }
    property tabela:string read varTabela write varTabela;
    property modalidade:string read varModalidade write varModalidade;
    property campochave:string read varCampochave write varCampochave;
    property codigo:integer read varCodigo write varCodigo;
  end;

var
  dmCadPai: TdmCadPai;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmCadPai.Navegar(Codigo: Integer);
begin
  QryPrincipal.Open();
  QryNavegar.Close;
  if codigo = 1 then
    QryNavegar.SQL.Text := 'select first 1 '+tabela+'.'+campochave+ ' CODIGO' +
    ' from '+tabela+' where '+tabela+'.'+modalidade+ ' order by '+tabela+'.'+campochave

  else if codigo = 2 then
    QryNavegar.SQL.Text := 'select first 1 '+tabela+'.'+campochave+' CODIGO' +
    ' from '+tabela+' where (('+tabela+'.'+campochave+' < '+QryPrincipal.FieldByName('CODIGO').AsString + ')' +
    'and '+tabela+'.'+modalidade+
    '  or ('+tabela+'.'+campochave+' = '+ '(select first 1 '+tabela+'.'+campochave+' CODIGO' +
    ' from '+tabela+' where '+tabela+'.'+modalidade+'order by '+tabela+'.'+campochave+' )))'+
    ' order by '+tabela+'.'+campochave+' desc'

  else if codigo = 3 then
    QryNavegar.SQL.Text := 'select first 1 '+tabela+'.'+campochave+' CODIGO' +
    ' from '+tabela+' where (('+tabela+'.'+campochave+' > '+QryPrincipal.FieldByName('CODIGO').AsString + ')' +
    'and '+tabela+'.'+modalidade+
    '  or ('+tabela+'.'+campochave+' = '+ '(select first 1 '+tabela+'.'+campochave+' CODIGO' +
    ' from '+tabela+' where '+tabela+'.'+modalidade+'order by '+tabela+'.'+campochave+' desc'+' )))'+
    ' order by '+tabela+'.'+campochave

  else if codigo = 4 then
    QryNavegar.SQL.Text := 'select first 1 '+tabela+'.'+campochave+' CODIGO' +
    ' from '+tabela+' where '+tabela+'.'+modalidade +' order by '+tabela+'.'+campochave+' desc';

  QryNavegar.Open();
  Codigo := QryNavegar.FieldByName('CODIGO').AsInteger;
  QryNavegar.Close;
end;

procedure TdmCadPai.QryPrincipalAfterPost(DataSet: TDataSet);
begin
  QryPrincipal.ApplyUpdates(0);
end;

end.
