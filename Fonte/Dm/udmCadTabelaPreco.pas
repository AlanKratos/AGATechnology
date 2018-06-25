unit udmCadTabelaPreco;

interface

uses
  System.SysUtils, System.Classes, udmCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, udmConexao, Vcl.Dialogs;

type
  TdmCadTabelaPreco = class(TdmCadPai)
    FDQueryTabela_Detalhe: TFDQuery;
    dsMaster: TDataSource;
    FDSchemaAdapterTabelaPreco: TFDSchemaAdapter;
    FDQueryValidaItem: TFDQuery;
    FDQueryPrincipalCODIGO_TABELA: TIntegerField;
    FDQueryPrincipalDESCRICAO_TABELA: TStringField;
    FDQueryPrincipalPADRAO_TABELA: TStringField;
    FDQueryPrincipalREFERENCIA_TABELA: TIntegerField;
    FDQueryPrincipalPRECOCOR_TABELA: TStringField;
    FDQueryPrincipalPRECOGRADE_TABELA: TStringField;
    FDQueryTabela_DetalheCODIGO_TAB_DET: TIntegerField;
    FDQueryTabela_DetalheTABELA_TAB_DET: TIntegerField;
    FDQueryTabela_DetalheITEM_TAB_DET: TIntegerField;
    FDQueryTabela_DetalheCOR_TAB_DET: TIntegerField;
    FDQueryTabela_DetalheGRADE_TAB_DET: TIntegerField;
    FDQueryTabela_DetalheVALOR_TAB_DET: TBCDField;
    FDQueryTabela_DetalheDESCRICAO_ITEM: TStringField;
    FDQueryValidaCor: TFDQuery;
    FDQueryValidaGrade: TFDQuery;
    FDQueryTabela_DetalheDESCRICAO_COR: TStringField;
    FDQueryTabela_DetalheDESCRICAO_GRADE: TStringField;
    procedure FDQueryPrincipalBeforePost(DataSet: TDataSet);
    procedure FDQueryPrincipalNewRecord(DataSet: TDataSet);
    procedure FDQueryTabela_DetalheBeforeInsert(DataSet: TDataSet);
    procedure FDQueryTabela_DetalheBeforePost(DataSet: TDataSet);
    procedure FDQueryTabela_DetalheNewRecord(DataSet: TDataSet);
    procedure Validate_Item(Sender: TField);
    procedure Validate_Cor(Sender: TField);
    procedure Validate_Grade(Sender: TField);
    procedure FDQueryTabela_DetalheBeforeEdit(DataSet: TDataSet);
    procedure FDQueryTabela_DetalheBeforeDelete(DataSet: TDataSet);
    procedure FDQueryTabela_DetalheReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure FDQueryPrincipalReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCadTabelaPreco: TdmCadTabelaPreco;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmCadTabelaPreco.FDQueryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_TABELA').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_TABELA').AsInteger :=
      dmConexao.ProximoCodigo('TABELA')
end;

procedure TdmCadTabelaPreco.FDQueryPrincipalNewRecord(DataSet: TDataSet);
begin
  inherited;
  FDQueryPrincipal.Edit;
end;

procedure TdmCadTabelaPreco.FDQueryPrincipalReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
  inherited;
raise Exception.Create(e.Message + 'Error: ');
end;

procedure TdmCadTabelaPreco.FDQueryTabela_DetalheBeforeDelete(
  DataSet: TDataSet);
begin
  inherited;
  FDQueryPrincipal.Edit;
end;

procedure TdmCadTabelaPreco.FDQueryTabela_DetalheBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  with FDQueryPrincipal do
  Begin
    Edit;
  End;
end;

procedure TdmCadTabelaPreco.FDQueryTabela_DetalheBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
  if FDQueryPrincipal.State = dsInsert then
    FDQueryPrincipal.Post;
    FDQueryPrincipal.Edit;
end;

procedure TdmCadTabelaPreco.FDQueryTabela_DetalheBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_TAB_DET').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_TAB_DET').AsInteger :=
      dmConexao.ProximoCodigo('TABELA_DETALHE');
end;

procedure TdmCadTabelaPreco.FDQueryTabela_DetalheNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('TABELA_TAB_DET').AsInteger :=
    FDQueryPrincipal.FieldByName('CODIGO_TABELA').AsInteger;
end;

procedure TdmCadTabelaPreco.FDQueryTabela_DetalheReconcileError(
  DataSet: TFDDataSet; E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
  inherited;
  raise Exception.Create(e.Message + 'Error: ');
end;

procedure TdmCadTabelaPreco.Validate_Cor(Sender: TField);
begin
  FDQueryValidaCor.Close();
  FDQueryValidaCor.SQL.Text := 'select DESCRICAO_COR from COR' +
  ' where COR.CODIGO_COR = '+ IntToStr(Sender.AsInteger);
  try
    FDQueryValidaCor.Open();
  Except
    On E:Exception do
    ShowMessage('Erro Cor: ' + E.Message);
  end;
  if FDQueryValidaCor.IsEmpty then
  begin
    MessageDlg('Códido da cor não pode ficar vazio!', mtError, [mbOK],0);
    Abort;
  end
  else
  FDQueryTabela_Detalhe.FieldByName('DESCRICAO_COR').AsString := FDQueryValidaCor.FieldByName('DESCRICAO_COR').AsString;
end;

procedure TdmCadTabelaPreco.Validate_Grade(Sender: TField);
begin
  FDQueryValidaGrade.Close();
  FDQueryValidaGrade.SQL.Text := 'select DESCRICAO_GRADE from GRADE' +
  ' where GRADE.CODIGO_GRADE = '+ IntToStr(Sender.AsInteger);
  try
    FDQueryValidaGrade.Open();
  Except
    On E:Exception do
    ShowMessage('Erro Grade: ' + E.Message);
  end;
  if FDQueryValidaGrade.IsEmpty then
  begin
    MessageDlg('Códido da grade não pode ficar vazio!', mtError, [mbOK],0);
    Abort;
  end
  else
  FDQueryTabela_Detalhe.FieldByName('DESCRICAO_GRADE').AsString := FDQueryValidaGrade.FieldByName('DESCRICAO_GRADE').AsString;
end;

procedure TdmCadTabelaPreco.Validate_Item(Sender: TField);
begin
  FDQueryValidaItem.Close();
  FDQueryValidaItem.SQL.Text := 'select DESCRICAO_ITEM from ITEM' +
  ' where ITEM.CODIGO_ITEM = '+ IntToStr(Sender.AsInteger);
  try
    FDQueryValidaItem.Open();
  Except
    On E:Exception do
    ShowMessage('Erro Item: ' + E.Message);
  end;
  if FDQueryValidaItem.IsEmpty then
  begin
    MessageDlg('Códido do item não pode ficar vazio!', mtError, [mbOK],0);
    Abort;
  end
  else
  FDQueryTabela_Detalhe.FieldByName('DESCRICAO_ITEM').AsString := FDQueryValidaItem.FieldByName('DESCRICAO_ITEM').AsString;
end;

end.
