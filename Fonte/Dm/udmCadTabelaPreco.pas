unit udmCadTabelaPreco;

interface

uses
  System.SysUtils, System.Classes, udmCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, udmConexao, Vcl.Dialogs;

type
  TdmCadTabelaPreco = class(TdmCadPai)
    QryTabela_Detalhe: TFDQuery;
    dsMaster: TDataSource;
    FDSchemaAdapterTabelaPreco: TFDSchemaAdapter;
    QryValidaItem: TFDQuery;
    FDQueryPrincipalCODIGO_TABELA: TIntegerField;
    FDQueryPrincipalDESCRICAO_TABELA: TStringField;
    FDQueryPrincipalPADRAO_TABELA: TStringField;
    FDQueryPrincipalREFERENCIA_TABELA: TIntegerField;
    FDQueryPrincipalPRECOCOR_TABELA: TStringField;
    FDQueryPrincipalPRECOGRADE_TABELA: TStringField;
    QryTabela_DetalheCODIGO_TAB_DET: TIntegerField;
    QryTabela_DetalheTABELA_TAB_DET: TIntegerField;
    QryTabela_DetalheITEM_TAB_DET: TIntegerField;
    QryTabela_DetalheCOR_TAB_DET: TIntegerField;
    QryTabela_DetalheGRADE_TAB_DET: TIntegerField;
    QryTabela_DetalheVALOR_TAB_DET: TBCDField;
    QryTabela_DetalheDESCRICAO_ITEM: TStringField;
    QryValidaCor: TFDQuery;
    QryValidaGrade: TFDQuery;
    QryTabela_DetalheDESCRICAO_COR: TStringField;
    QryTabela_DetalheDESCRICAO_GRADE: TStringField;
    procedure FDQueryPrincipalBeforePost(DataSet: TDataSet);
    procedure FDQueryPrincipalNewRecord(DataSet: TDataSet);
    procedure QryTabela_DetalheBeforeInsert(DataSet: TDataSet);
    procedure QryTabela_DetalheBeforePost(DataSet: TDataSet);
    procedure QryTabela_DetalheNewRecord(DataSet: TDataSet);
    procedure Validate_Item(Sender: TField);
    procedure Validate_Cor(Sender: TField);
    procedure Validate_Grade(Sender: TField);
    procedure QryTabela_DetalheBeforeEdit(DataSet: TDataSet);
    procedure QryTabela_DetalheBeforeDelete(DataSet: TDataSet);
    procedure QryTabela_DetalheReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure FDQueryPrincipalReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure DataModuleCreate(Sender: TObject);
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

procedure TdmCadTabelaPreco.DataModuleCreate(Sender: TObject);
begin
  inherited;
  self.tabela := 'TABELA';
  self.campochave := 'CODIGO_TABELA';
  self.TipoCadastro := '1 = 1';
end;

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
  QryPrincipal.Edit;
end;

procedure TdmCadTabelaPreco.FDQueryPrincipalReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
  inherited;
raise Exception.Create(e.Message + 'Error: ');
end;

procedure TdmCadTabelaPreco.QryTabela_DetalheBeforeDelete(
  DataSet: TDataSet);
begin
  inherited;
  QryPrincipal.Edit;
end;

procedure TdmCadTabelaPreco.QryTabela_DetalheBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  with QryPrincipal do
  Begin
    Edit;
  End;
end;

procedure TdmCadTabelaPreco.QryTabela_DetalheBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
  if QryPrincipal.State = dsInsert then
    QryPrincipal.Post;
    QryPrincipal.Edit;
end;

procedure TdmCadTabelaPreco.QryTabela_DetalheBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_TAB_DET').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_TAB_DET').AsInteger :=
      dmConexao.ProximoCodigo('TABELA_DETALHE');
end;

procedure TdmCadTabelaPreco.QryTabela_DetalheNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('TABELA_TAB_DET').AsInteger :=
    QryPrincipal.FieldByName('CODIGO_TABELA').AsInteger;
end;

procedure TdmCadTabelaPreco.QryTabela_DetalheReconcileError(
  DataSet: TFDDataSet; E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
  inherited;
  raise Exception.Create(e.Message + 'Error: ');
end;

procedure TdmCadTabelaPreco.Validate_Cor(Sender: TField);
begin
  QryValidaCor.Close();
  QryValidaCor.SQL.Text := 'select DESCRICAO_COR from COR' +
  ' where COR.CODIGO_COR = '+ IntToStr(Sender.AsInteger);
  try
    QryValidaCor.Open();
  Except
    On E:Exception do
    ShowMessage('Erro Cor: ' + E.Message);
  end;
  if QryValidaCor.IsEmpty then
  begin
    MessageDlg('Códido da cor não pode ficar vazio!', mtError, [mbOK],0);
    Abort;
  end
  else
  QryTabela_Detalhe.FieldByName('DESCRICAO_COR').AsString := QryValidaCor.FieldByName('DESCRICAO_COR').AsString;
end;

procedure TdmCadTabelaPreco.Validate_Grade(Sender: TField);
begin
  QryValidaGrade.Close();
  QryValidaGrade.SQL.Text := 'select DESCRICAO_GRADE from GRADE' +
  ' where GRADE.CODIGO_GRADE = '+ IntToStr(Sender.AsInteger);
  try
    QryValidaGrade.Open();
  Except
    On E:Exception do
    ShowMessage('Erro Grade: ' + E.Message);
  end;
  if QryValidaGrade.IsEmpty then
  begin
    MessageDlg('Códido da grade não pode ficar vazio!', mtError, [mbOK],0);
    Abort;
  end
  else
  QryTabela_Detalhe.FieldByName('DESCRICAO_GRADE').AsString := QryValidaGrade.FieldByName('DESCRICAO_GRADE').AsString;
end;

procedure TdmCadTabelaPreco.Validate_Item(Sender: TField);
begin
  QryValidaItem.Close();
  QryValidaItem.SQL.Text := 'select DESCRICAO_ITEM from ITEM' +
  ' where ITEM.CODIGO_ITEM = '+ IntToStr(Sender.AsInteger);
  try
    QryValidaItem.Open();
  Except
    On E:Exception do
    ShowMessage('Erro Item: ' + E.Message);
  end;
  if QryValidaItem.IsEmpty then
  begin
    MessageDlg('Códido do item não pode ficar vazio!', mtError, [mbOK],0);
    Abort;
  end
  else
  QryTabela_Detalhe.FieldByName('DESCRICAO_ITEM').AsString := QryValidaItem.FieldByName('DESCRICAO_ITEM').AsString;
end;

end.
