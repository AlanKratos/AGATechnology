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
    procedure Navegar(Botao:Integer);
  private
    { Private declarations }
    varTabela: string; //tabela chamada
    varCampochave: string; //chave primaria
    varTipoCadastro: string; //Cliente,Fornecedor...
    VarCodigo: Integer;
  public
    { Public declarations }
    property tabela:string read varTabela write varTabela;
    property TipoCadastro:string read varTipoCadastro write varTipoCadastro;
    property campochave:string read varCampochave write varCampochave;
    property codigo:integer read varCodigo write varCodigo;
  end;

var
  dmCadPai: TdmCadPai;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmCadPai.Navegar(Botao: Integer);
begin
  QryPrincipal.Open();
  QryNavegar.Close;
  case Botao of
    0: QryNavegar.SQL.Text := 'select first 1 '+tabela+'.'+campochave+
     ' CODIGO' + ' from '+tabela+' where '+TipoCadastro+
     ' order by '+tabela+'.'+campochave;

    1: QryNavegar.SQL.Text := 'select first 1 '+tabela+'.'+campochave+' CODIGO' +
    ' from '+tabela+' where '+TipoCadastro +' order by '+tabela+'.'+campochave+' desc';

    2: QryNavegar.SQL.Text := 'select first 1 '+tabela+'.'+campochave+' CODIGO' +
    ' from '+tabela+' where (('+tabela+'.'+campochave+' < '+IntToStr(Codigo) + ')' +
    'and '+TipoCadastro+
    '  or ('+tabela+'.'+campochave+' = '+ '(select first 1 '+tabela+'.'+campochave+' CODIGO' +
    ' from '+tabela+' where '+TipoCadastro+' order by '+tabela+'.'+campochave+' )))'+
    ' order by '+tabela+'.'+campochave+' desc';

    3: QryNavegar.SQL.Text := 'select first 1 '+tabela+'.'+campochave+' CODIGO' +
    ' from '+tabela+' where (('+tabela+'.'+campochave+' > '+IntToStr(Codigo) + ')' +
    'and '+TipoCadastro+
    '  or ('+tabela+'.'+campochave+' = '+ '(select first 1 '+tabela+'.'+campochave+' CODIGO' +
    ' from '+tabela+' where '+TipoCadastro+' order by '+tabela+'.'+campochave+' desc'+' )))'+
    ' order by '+tabela+'.'+campochave;
  End;

  QryNavegar.Open();
  Codigo := QryNavegar.FieldByName('CODIGO').AsInteger;
  QryNavegar.Close;
end;

procedure TdmCadPai.QryPrincipalAfterPost(DataSet: TDataSet);
begin
  QryPrincipal.ApplyUpdates(0);
end;

end.
