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
    QryVendaItem: TFDQuery;
    dsMaster: TDataSource;
    QryValidaCliente: TFDQuery;
    FDQueryPrincipalCODIGO_PESSOA: TIntegerField;
    FDQueryPrincipalNOME_PESSOA: TStringField;
    FDQueryPrincipalDESCRICAO_TABELA: TStringField;
    FDQueryPrincipalCODIGO_DOCUMENTO: TIntegerField;
    FDQueryPrincipalCLIENTE_DOCUMENTO: TIntegerField;
    FDQueryPrincipalTABELA_DOCUMENTO: TIntegerField;
    FDQueryPrincipalMODALIDADE_DOCUMENTO: TStringField;
    FDQueryPrincipalEMPRESA_DOCUMENTO: TIntegerField;
    QryValidaItem: TFDQuery;
    QryVendaItemCODIGO_DOC_ITEM: TIntegerField;
    QryVendaItemDOCUMENTO_DOC_ITEM: TIntegerField;
    QryVendaItemITEM_DOC_ITEM: TIntegerField;
    QryVendaItemQTD_DOC_ITEM: TIntegerField;
    QryVendaItemVALOR_DOC_ITEM: TBCDField;
    QryVendaItemDESCRICAO_ITEM: TStringField;
    QryValidaPreco: TFDQuery;
    QryTabelaPreco: TFDQuery;
    QryVendaItemCOR_DOC_ITEM: TIntegerField;
    QryVendaItemGRADE_DOC_ITEM: TIntegerField;
    QryVendaItemDESCRICAO_COR: TStringField;
    QryVendaItemDESCRICAO_GRADE: TStringField;
    QryValidaCor: TFDQuery;
    QryValidaGrade: TFDQuery;
    QryPrazo: TFDQuery;
    procedure FDQueryPrincipalBeforePost(DataSet: TDataSet);
    procedure QryVendaItemBeforePost(DataSet: TDataSet);
    procedure FDQueryPrincipalNewRecord(DataSet: TDataSet);
    procedure QryVendaItemBeforeInsert(DataSet: TDataSet);
    procedure QryVendaItemNewRecord(DataSet: TDataSet);
    procedure Validate_Cliente(Sender: TField);
    procedure Validate_Item(Sender: TField);
    procedure Validate_Cor(Sender: TField);
    procedure Validate_Grade(Sender: TField);
    procedure QryVendaItemBeforeEdit(DataSet: TDataSet);
    procedure QryVendaItemAfterDelete(DataSet: TDataSet);
    procedure Validate_Preco(Item, Cor, Grade: Integer);
    procedure QryPrazoBeforeEdit(DataSet: TDataSet);
    procedure QryPrazoBeforeInsert(DataSet: TDataSet);
    procedure QryPrazoBeforePost(DataSet: TDataSet);
    procedure QryPrazoNewRecord(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
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

procedure TdmCadVenda.QryPrazoBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  with QryPrincipal do
  Begin
    Edit;
  End;
end;

procedure TdmCadVenda.QryPrazoBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if QryPrincipal.State = dsInsert then
    QryPrincipal.Post;
    QryPrincipal.Edit;
end;

procedure TdmCadVenda.QryPrazoBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('AUTOINC_DOC_PRAZO').AsInteger = 0) then
    DataSet.FieldByName('AUTOINC_DOC_PRAZO').AsInteger :=
      dmConexao.ProximoCodigo('DOCUMENTO_PRAZO')
end;

procedure TdmCadVenda.QryPrazoNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('DOCUMENTO_DOC_PRAZO').AsInteger :=
    QryPrincipal.FieldByName('CODIGO_DOCUMENTO').AsInteger;
end;

procedure TdmCadVenda.DataModuleCreate(Sender: TObject);
begin
  inherited;
  self.tabela := 'DOCUMENTO';
  self.campochave := 'CODIGO_DOCUMENTO';
  self.TipoCadastro := 'MODALIDADE_DOCUMENTO = ''S''';
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
  QryPrincipal.Edit;
end;

procedure TdmCadVenda.QryVendaItemAfterDelete(DataSet: TDataSet);
begin
  inherited;
  QryPrincipal.Edit;
end;

procedure TdmCadVenda.QryVendaItemBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  with QryPrincipal do
  Begin
    Edit;
  End;
end;

procedure TdmCadVenda.QryVendaItemBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if QryPrincipal.State = dsInsert then
    QryPrincipal.Post;
    QryPrincipal.Edit;
end;

procedure TdmCadVenda.QryVendaItemBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_DOC_ITEM').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_DOC_ITEM').AsInteger :=
      dmConexao.ProximoCodigo('DOCUMENTO_ITEM')
end;

procedure TdmCadVenda.QryVendaItemNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('DOCUMENTO_DOC_ITEM').AsInteger :=
    QryPrincipal.FieldByName('CODIGO_DOCUMENTO').AsInteger;
end;

procedure TdmCadVenda.Validate_Cliente(Sender: TField);
begin
//preencher o campo descrição cliente
  QryValidaCliente.Close();
  QryValidaCliente.SQL.Text := 'select PESSOA.NOME_PESSOA from pessoa ' +
                  'where PESSOA.CODIGO_PESSOA = ' + IntToStr(Sender.AsInteger);
  try
    QryValidaCliente.Open();
  Except
    On E:Exception do
    ShowMessage('Erro Cliente: ' + E.Message);
  end;
  if QryValidaCliente.IsEmpty then
  begin
    MessageDlg('Código do cliente precisa ser preenchido!', mtError, [mbOK],0);
    Abort;
  end
  else
  QryPrincipal.FieldByName('NOME_PESSOA').AsString := QryValidaCliente.FieldByName('NOME_PESSOA').AsString;
end;

procedure TdmCadVenda.Validate_Cor(Sender: TField);
begin
  QryValidaCor.Close();
  QryValidaCor.SQL.Text := 'select COR.DESCRICAO_COR from COR ' +
                  'where COR.CODIGO_COR = ' + IntToStr(Sender.AsInteger);
  try
    QryValidaCor.Open();
  Except
    On E:Exception do
    ShowMessage('Erro Cor: ' + E.Message);
  end;
  if QryValidaCor.IsEmpty then
  begin
    MessageDlg('Código da cor está incorreto!', mtError, [mbOK],0);
    Abort;
  end
  else
  QryVendaItem.FieldByName('DESCRICAO_COR').AsString := QryValidaCor.FieldByName('DESCRICAO_COR').AsString;

  if (QryTabelaPreco.FieldByName('PRECOCOR_TABELA').AsString = 'S') and
         (QryTabelaPreco.FieldByName('PRECOGRADE_TABELA').AsString = 'N') then
  Begin
    Validate_Preco(QryVendaItem.FieldByName('ITEM_DOC_ITEM').AsInteger,
        QryVendaItem.FieldByName('COR_DOC_ITEM').AsInteger,0);
  End;
  if (QryTabelaPreco.FieldByName('PRECOCOR_TABELA').AsString = 'S') and
          (QryTabelaPreco.FieldByName('PRECOGRADE_TABELA').AsString = 'S') and
          (QryVendaItem.FieldByName('GRADE_DOC_ITEM').AsInteger > 0)then
  Begin
    Validate_Preco(QryVendaItem.FieldByName('ITEM_DOC_ITEM').AsInteger,
        QryVendaItem.FieldByName('COR_DOC_ITEM').AsInteger,
        QryVendaItem.FieldByName('GRADE_DOC_ITEM').AsInteger);
  End;
end;

procedure TdmCadVenda.Validate_Grade(Sender: TField);
begin
  QryValidaGrade.Close();
  QryValidaGrade.SQL.Text := 'select GRADE.DESCRICAO_GRADE from GRADE ' +
                  'where GRADE.CODIGO_GRADE = ' + IntToStr(Sender.AsInteger);
  try
    QryValidaGrade.Open();
  Except
    On E:Exception do
    ShowMessage('Erro Grade: ' + E.Message);
  end;
  if QryValidaItem.IsEmpty then
  begin
    MessageDlg('Código da grade está incorreto!', mtError, [mbOK],0);
    Abort;
  end
  else
  QryVendaItem.FieldByName('DESCRICAO_GRADE').AsString := QryValidaGrade.FieldByName('DESCRICAO_GRADE').AsString;

  if (QryTabelaPreco.FieldByName('PRECOCOR_TABELA').AsString = 'S') and
          (QryTabelaPreco.FieldByName('PRECOGRADE_TABELA').AsString = 'S') and
          (QryVendaItem.FieldByName('COR_DOC_ITEM').AsInteger > 0) then
  Begin
    Validate_Preco(QryVendaItem.FieldByName('ITEM_DOC_ITEM').AsInteger,
        QryVendaItem.FieldByName('COR_DOC_ITEM').AsInteger,
        QryVendaItem.FieldByName('GRADE_DOC_ITEM').AsInteger);
  End;

  if (QryTabelaPreco.FieldByName('PRECOCOR_TABELA').AsString = 'N') and
          (QryTabelaPreco.FieldByName('PRECOGRADE_TABELA').AsString = 'S') then
  Begin
    Validate_Preco(QryVendaItem.FieldByName('ITEM_DOC_ITEM').AsInteger, 0,
        QryVendaItem.FieldByName('GRADE_DOC_ITEM').AsInteger);
  End;
end;

procedure TdmCadVenda.Validate_Item(Sender: TField);
begin
  QryValidaItem.Close();
  QryValidaItem.SQL.Text := 'select ITEM.DESCRICAO_ITEM from ITEM ' +
                  'where ITEM.CODIGO_ITEM = ' + IntToStr(Sender.AsInteger);
  try
    QryValidaItem.Open();
  Except
    On E:Exception do
    ShowMessage('Erro Item: ' + E.Message);
  end;
  if QryValidaItem.IsEmpty then
  begin
    MessageDlg('Código do item está incorreto!', mtError, [mbOK],0);
    Abort;
  end
  else
  QryVendaItem.FieldByName('DESCRICAO_ITEM').AsString := QryValidaItem.FieldByName('DESCRICAO_ITEM').AsString;

  if (QryTabelaPreco.FieldByName('PRECOCOR_TABELA').AsString = 'N') and
         (QryTabelaPreco.FieldByName('PRECOGRADE_TABELA').AsString = 'N') then
  Begin
    Validate_Preco(QryVendaItem.FieldByName('ITEM_DOC_ITEM').AsInteger,0,0);
  End;
end;



procedure TdmCadVenda.Validate_Preco(Item, Cor, Grade: Integer);
begin
  if QryPrincipal.FieldByName('TABELA_DOCUMENTO').AsInteger > 0 then
  Begin
    QryValidaPreco.Close();
    QryValidaPreco.SQL.Text := ('select TABELA_DETALHE.VALOR_TAB_DET from TABELA_DETALHE ' +
        ' where TABELA_DETALHE.ITEM_TAB_DET = ' + IntToStr(Item) +
        ' and TABELA_DETALHE.COR_TAB_DET = ' + IntToStr(Cor) +
        ' and TABELA_DETALHE.GRADE_TAB_DET = ' + IntToStr(Grade) +
        ' and TABELA_DETALHE.TABELA_TAB_DET = ' + QryPrincipal.FieldByName('TABELA_DOCUMENTO').AsString);
    try
      QryValidaPreco.Open();
    Except
      On E:Exception do
      ShowMessage('Erro no preço.');
    end;
    QryVendaItem.FieldByName('VALOR_DOC_ITEM').AsString :=
        QryValidaPreco.FieldByName('VALOR_TAB_DET').AsString;
  End;
end;

end.
