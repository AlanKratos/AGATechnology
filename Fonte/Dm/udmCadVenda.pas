unit udmCadVenda;

interface

uses
  System.SysUtils, System.Classes, udmCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, udmConexao, Vcl.Dialogs,
  uParametro;

type
  TdmCadVenda = class(TdmCadPai)
    FDSchemaAdapterVenda: TFDSchemaAdapter;
    FDQueryVendaItem: TFDQuery;
    dsMaster: TDataSource;
    FDQueryValidaCliente: TFDQuery;
    FDQueryPrincipalCODIGO_PESSOA: TIntegerField;
    FDQueryPrincipalNOME_PESSOA: TStringField;
    FDQueryPrincipalDESCRICAO_TABELA: TStringField;
    FDQueryPrincipalCODIGO_DOCUMENTO: TIntegerField;
    FDQueryPrincipalCLIENTE_DOCUMENTO: TIntegerField;
    FDQueryPrincipalTABELA_DOCUMENTO: TIntegerField;
    FDQueryPrincipalMODALIDADE_DOCUMENTO: TStringField;
    FDQueryPrincipalEMPRESA_DOCUMENTO: TIntegerField;
    FDQueryValidaItem: TFDQuery;
    FDQueryVendaItemCODIGO_DOC_ITEM: TIntegerField;
    FDQueryVendaItemDOCUMENTO_DOC_ITEM: TIntegerField;
    FDQueryVendaItemITEM_DOC_ITEM: TIntegerField;
    FDQueryVendaItemQTD_DOC_ITEM: TIntegerField;
    FDQueryVendaItemVALOR_DOC_ITEM: TBCDField;
    FDQueryVendaItemDESCRICAO_ITEM: TStringField;
    FDQueryValidaPreco: TFDQuery;
    FDQueryTabelaPreco: TFDQuery;
    FDQueryVendaItemCOR_DOC_ITEM: TIntegerField;
    FDQueryVendaItemGRADE_DOC_ITEM: TIntegerField;
    FDQueryVendaItemDESCRICAO_COR: TStringField;
    FDQueryVendaItemDESCRICAO_GRADE: TStringField;
    FDQueryValidaCor: TFDQuery;
    FDQueryValidaGrade: TFDQuery;
    FDQueryPrazo: TFDQuery;
    procedure FDQueryPrincipalBeforePost(DataSet: TDataSet);
    procedure FDQueryVendaItemBeforePost(DataSet: TDataSet);
    procedure FDQueryPrincipalNewRecord(DataSet: TDataSet);
    procedure FDQueryVendaItemBeforeInsert(DataSet: TDataSet);
    procedure FDQueryVendaItemNewRecord(DataSet: TDataSet);
    procedure Validate_Cliente(Sender: TField);
    procedure Validate_Item(Sender: TField);
    procedure Validate_Cor(Sender: TField);
    procedure Validate_Grade(Sender: TField);
    procedure FDQueryVendaItemBeforeEdit(DataSet: TDataSet);
    procedure FDQueryVendaItemAfterDelete(DataSet: TDataSet);
    procedure Validate_Preco(Item, Cor, Grade: Integer);
    procedure FDQueryPrazoBeforeEdit(DataSet: TDataSet);
    procedure FDQueryPrazoBeforeInsert(DataSet: TDataSet);
    procedure FDQueryPrazoBeforePost(DataSet: TDataSet);
    procedure FDQueryPrazoNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCadVenda: TdmCadVenda;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmCadVenda.FDQueryPrazoBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  with FDQueryPrincipal do
  Begin
    Edit;
  End;
end;

procedure TdmCadVenda.FDQueryPrazoBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if FDQueryPrincipal.State = dsInsert then
    FDQueryPrincipal.Post;
    FDQueryPrincipal.Edit;
end;

procedure TdmCadVenda.FDQueryPrazoBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('AUTOINC_DOC_PRAZO').AsInteger = 0) then
    DataSet.FieldByName('AUTOINC_DOC_PRAZO').AsInteger :=
      dmConexao.ProximoCodigo('DOCUMENTO_PRAZO')
end;

procedure TdmCadVenda.FDQueryPrazoNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('DOCUMENTO_DOC_PRAZO').AsInteger :=
    FDQueryPrincipal.FieldByName('CODIGO_DOCUMENTO').AsInteger;
end;

procedure TdmCadVenda.FDQueryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_DOCUMENTO').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_DOCUMENTO').AsInteger :=
      dmConexao.ProximoCodigo('DOCUMENTO');

  // Gerar Financeiro
//  if frmParametro.FDQueryParametro.FieldByName('PEDIDOGERAFINANCEIRO').AsString = 'S' then
//  Begin

//  End;

end;

procedure TdmCadVenda.FDQueryPrincipalNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('MODALIDADE_DOCUMENTO').AsString :='S';
  FDQueryPrincipal.Edit;
end;

procedure TdmCadVenda.FDQueryVendaItemAfterDelete(DataSet: TDataSet);
begin
  inherited;
  FDQueryPrincipal.Edit;
end;

procedure TdmCadVenda.FDQueryVendaItemBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  with FDQueryPrincipal do
  Begin
    Edit;
  End;
end;

procedure TdmCadVenda.FDQueryVendaItemBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if FDQueryPrincipal.State = dsInsert then
    FDQueryPrincipal.Post;
    FDQueryPrincipal.Edit;
end;

procedure TdmCadVenda.FDQueryVendaItemBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_DOC_ITEM').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_DOC_ITEM').AsInteger :=
      dmConexao.ProximoCodigo('DOCUMENTO_ITEM')
end;

procedure TdmCadVenda.FDQueryVendaItemNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('DOCUMENTO_DOC_ITEM').AsInteger :=
    FDQueryPrincipal.FieldByName('CODIGO_DOCUMENTO').AsInteger;
end;

procedure TdmCadVenda.Validate_Cliente(Sender: TField);
begin
//preencher o campo descrição cliente
  FDQueryValidaCliente.Close();
  FDQueryValidaCliente.SQL.Text := 'select PESSOA.NOME_PESSOA from pessoa ' +
                  'where PESSOA.CODIGO_PESSOA = ' + IntToStr(Sender.AsInteger);
  try
    FDQueryValidaCliente.Open();
  Except
    On E:Exception do
    ShowMessage('Erro Cliente: ' + E.Message);
  end;
  if FDQueryValidaCliente.IsEmpty then
  begin
    MessageDlg('Código do cliente precisa ser preenchido!', mtError, [mbOK],0);
    Abort;
  end
  else
  FDQueryPrincipal.FieldByName('NOME_PESSOA').AsString := FDQueryValidaCliente.FieldByName('NOME_PESSOA').AsString;
end;

procedure TdmCadVenda.Validate_Cor(Sender: TField);
begin
  FDQueryValidaCor.Close();
  FDQueryValidaCor.SQL.Text := 'select COR.DESCRICAO_COR from COR ' +
                  'where COR.CODIGO_COR = ' + IntToStr(Sender.AsInteger);
  try
    FDQueryValidaCor.Open();
  Except
    On E:Exception do
    ShowMessage('Erro Cor: ' + E.Message);
  end;
  if FDQueryValidaCor.IsEmpty then
  begin
    MessageDlg('Código da cor está incorreto!', mtError, [mbOK],0);
    Abort;
  end
  else
  FDQueryVendaItem.FieldByName('DESCRICAO_COR').AsString := FDQueryValidaCor.FieldByName('DESCRICAO_COR').AsString;

  if (FDQueryTabelaPreco.FieldByName('PRECOCOR_TABELA').AsString = 'S') and
         (FDQueryTabelaPreco.FieldByName('PRECOGRADE_TABELA').AsString = 'N') then
  Begin
    Validate_Preco(FDQueryVendaItem.FieldByName('ITEM_DOC_ITEM').AsInteger,
        FDQueryVendaItem.FieldByName('COR_DOC_ITEM').AsInteger,0);
  End;
  if (FDQueryTabelaPreco.FieldByName('PRECOCOR_TABELA').AsString = 'S') and
          (FDQueryTabelaPreco.FieldByName('PRECOGRADE_TABELA').AsString = 'S') and
          (FDQueryVendaItem.FieldByName('GRADE_DOC_ITEM').AsInteger > 0)then
  Begin
    Validate_Preco(FDQueryVendaItem.FieldByName('ITEM_DOC_ITEM').AsInteger,
        FDQueryVendaItem.FieldByName('COR_DOC_ITEM').AsInteger,
        FDQueryVendaItem.FieldByName('GRADE_DOC_ITEM').AsInteger);
  End;
end;

procedure TdmCadVenda.Validate_Grade(Sender: TField);
begin
  FDQueryValidaGrade.Close();
  FDQueryValidaGrade.SQL.Text := 'select GRADE.DESCRICAO_GRADE from GRADE ' +
                  'where GRADE.CODIGO_GRADE = ' + IntToStr(Sender.AsInteger);
  try
    FDQueryValidaGrade.Open();
  Except
    On E:Exception do
    ShowMessage('Erro Grade: ' + E.Message);
  end;
  if FDQueryValidaItem.IsEmpty then
  begin
    MessageDlg('Código da grade está incorreto!', mtError, [mbOK],0);
    Abort;
  end
  else
  FDQueryVendaItem.FieldByName('DESCRICAO_GRADE').AsString := FDQueryValidaGrade.FieldByName('DESCRICAO_GRADE').AsString;

  if (FDQueryTabelaPreco.FieldByName('PRECOCOR_TABELA').AsString = 'S') and
          (FDQueryTabelaPreco.FieldByName('PRECOGRADE_TABELA').AsString = 'S') and
          (FDQueryVendaItem.FieldByName('COR_DOC_ITEM').AsInteger > 0) then
  Begin
    Validate_Preco(FDQueryVendaItem.FieldByName('ITEM_DOC_ITEM').AsInteger,
        FDQueryVendaItem.FieldByName('COR_DOC_ITEM').AsInteger,
        FDQueryVendaItem.FieldByName('GRADE_DOC_ITEM').AsInteger);
  End;

  if (FDQueryTabelaPreco.FieldByName('PRECOCOR_TABELA').AsString = 'N') and
          (FDQueryTabelaPreco.FieldByName('PRECOGRADE_TABELA').AsString = 'S') then
  Begin
    Validate_Preco(FDQueryVendaItem.FieldByName('ITEM_DOC_ITEM').AsInteger, 0,
        FDQueryVendaItem.FieldByName('GRADE_DOC_ITEM').AsInteger);
  End;
end;

procedure TdmCadVenda.Validate_Item(Sender: TField);
begin
  FDQueryValidaItem.Close();
  FDQueryValidaItem.SQL.Text := 'select ITEM.DESCRICAO_ITEM from ITEM ' +
                  'where ITEM.CODIGO_ITEM = ' + IntToStr(Sender.AsInteger);
  try
    FDQueryValidaItem.Open();
  Except
    On E:Exception do
    ShowMessage('Erro Item: ' + E.Message);
  end;
  if FDQueryValidaItem.IsEmpty then
  begin
    MessageDlg('Código do item está incorreto!', mtError, [mbOK],0);
    Abort;
  end
  else
  FDQueryVendaItem.FieldByName('DESCRICAO_ITEM').AsString := FDQueryValidaItem.FieldByName('DESCRICAO_ITEM').AsString;

  if (FDQueryTabelaPreco.FieldByName('PRECOCOR_TABELA').AsString = 'N') and
         (FDQueryTabelaPreco.FieldByName('PRECOGRADE_TABELA').AsString = 'N') then
  Begin
    Validate_Preco(FDQueryVendaItem.FieldByName('ITEM_DOC_ITEM').AsInteger,0,0);
  End;
end;



procedure TdmCadVenda.Validate_Preco(Item, Cor, Grade: Integer);
begin
  if FDQueryPrincipal.FieldByName('TABELA_DOCUMENTO').AsInteger > 0 then
  Begin
    FDQueryValidaPreco.Close();
    FDQueryValidaPreco.SQL.Text := ('select TABELA_DETALHE.VALOR_TAB_DET from TABELA_DETALHE ' +
        ' where TABELA_DETALHE.ITEM_TAB_DET = ' + IntToStr(Item) +
        ' and TABELA_DETALHE.COR_TAB_DET = ' + IntToStr(Cor) +
        ' and TABELA_DETALHE.GRADE_TAB_DET = ' + IntToStr(Grade) +
        ' and TABELA_DETALHE.TABELA_TAB_DET = ' + FDQueryPrincipal.FieldByName('TABELA_DOCUMENTO').AsString);
    try
      FDQueryValidaPreco.Open();
    Except
      On E:Exception do
      ShowMessage('Erro no preço.');
    end;
    FDQueryVendaItem.FieldByName('VALOR_DOC_ITEM').AsString :=
        FDQueryValidaPreco.FieldByName('VALOR_TAB_DET').AsString;
  End;
end;

end.
