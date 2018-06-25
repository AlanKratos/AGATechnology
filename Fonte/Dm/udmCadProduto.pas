unit udmCadProduto;

interface

uses
  System.SysUtils, System.Classes, udmCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, udmConexao, Vcl.Dialogs;

type
  TdmCadProduto = class(TdmCadPai)
    FDQueryItemDetalhe: TFDQuery;
    FDSchemaAdapterProduto: TFDSchemaAdapter;
    dsMaster: TDataSource;
    FDQueryUnidade: TFDQuery;
    FDQueryValidaGrupo: TFDQuery;
    FDQueryValidaSubGrupo: TFDQuery;
    FDQueryPrincipalCODIGO_ITEM: TIntegerField;
    FDQueryPrincipalTIPO_ITEM: TIntegerField;
    FDQueryPrincipalDESCRICAO_ITEM: TStringField;
    FDQueryPrincipalCODIGOBARRAS_ITEM: TStringField;
    FDQueryPrincipalCOLECAO_ITEM: TIntegerField;
    FDQueryPrincipalVARIACOR_ITEM: TBooleanField;
    FDQueryPrincipalVALIDADE_ITEM: TIntegerField;
    FDQueryPrincipalVARIATECIDO_ITEM: TStringField;
    FDQueryPrincipalVARIAGRADE_ITEM: TBooleanField;
    FDQueryPrincipalVARIAACABAMENTO_ITEM: TStringField;
    FDQueryPrincipalGRUPO_ITEM: TIntegerField;
    FDQueryPrincipalSUBGRUPO_ITEM: TIntegerField;
    FDQueryPrincipalNCM_ITEM: TIntegerField;
    FDQueryPrincipalPESOBRUTO_ITEM: TBCDField;
    FDQueryPrincipalPESOLIQUIDO_ITEM: TBCDField;
    FDQueryPrincipalSTATUS_ITEM: TIntegerField;
    FDQueryPrincipalUNIDADE_ITEM: TIntegerField;
    FDQueryPrincipalPRODUTO_ITEM: TIntegerField;
    FDQueryPrincipalDESCRICAO_GRUPO: TStringField;
    FDQueryPrincipalDESCRICAO_SUBGRUPO: TStringField;
    FDQueryPrincipalOBSERVACAO_ITEM: TMemoField;
    FDQueryPrincipalTRIBUTACAO_ITEM: TIntegerField;
    FDQueryPrincipalCOD_NCM: TStringField;
    FDQueryValida_Ncm: TFDQuery;
    FDQueryItemCor: TFDQuery;
    FDQueryItemGrade: TFDQuery;
    FDQueryCor: TFDQuery;
    FDQueryGrade: TFDQuery;
    dsDetalhe: TDataSource;
    FDQueryValidaCor: TFDQuery;
    FDQueryValidaGrade: TFDQuery;
    FDQueryItemDetalheCODIGO_ITEM_DETALHE: TIntegerField;
    FDQueryItemDetalheCOR_ITEM_DETALHE: TIntegerField;
    FDQueryItemDetalheGRADE_ITEM_DETALHE: TIntegerField;
    FDQueryItemDetalheTECIDO_ITEM_DETALHE: TIntegerField;
    FDQueryItemDetalheSTATUS_ITEM_DETALHE: TIntegerField;
    FDQueryItemDetalheCODIGOBARRAS_ITEM_DETALHE: TStringField;
    FDQueryItemDetalheCOD_ITEM_DETALHE: TIntegerField;
    FDQueryItemDetalheDESCRICAO_COR: TStringField;
    FDQueryItemDetalheDESCRICAO_GRADE: TStringField;
    procedure FDQueryPrincipalAfterInsert(DataSet: TDataSet);
    procedure FDQueryPrincipalBeforePost(DataSet: TDataSet);
    procedure FDQueryPrincipalNewRecord(DataSet: TDataSet);
    procedure FDQueryItemDetalheBeforeEdit(DataSet: TDataSet);
    procedure FDQueryItemDetalheBeforeInsert(DataSet: TDataSet);
    procedure FDQueryItemDetalheBeforePost(DataSet: TDataSet);
    procedure FDQueryItemDetalheNewRecord(DataSet: TDataSet);
    procedure Validate_Grupo(Sender: TField);
    procedure Validate_SubGrupo(Sender: TField);
    procedure Validate_Ncm(Sender: TField);
    procedure FDQueryItemCorBeforeEdit(DataSet: TDataSet);
    procedure FDQueryItemCorBeforeInsert(DataSet: TDataSet);
    procedure FDQueryItemCorBeforePost(DataSet: TDataSet);
    procedure FDQueryItemGradeBeforePost(DataSet: TDataSet);
    procedure FDQueryItemGradeBeforeInsert(DataSet: TDataSet);
    procedure FDQueryItemGradeBeforeEdit(DataSet: TDataSet);
    procedure Validate_Cor(Sender: TField);
    procedure Validate_Grade(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCadProduto: TdmCadProduto;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmCadProduto.FDQueryItemCorBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  with FDQueryPrincipal do
  Begin
    Edit;
  End;
end;

procedure TdmCadProduto.FDQueryItemCorBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if FDQueryPrincipal.State = dsInsert then
    FDQueryPrincipal.Post;
    FDQueryPrincipal.Edit;
end;

procedure TdmCadProduto.FDQueryItemCorBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_ITEM_COR').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_ITEM_COR').AsInteger :=
      dmConexao.ProximoCodigo('ITEM_COR');
end;

procedure TdmCadProduto.FDQueryItemDetalheBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  with FDQueryPrincipal do
  Begin
    Edit;
//    FieldByName('ENDERECO_PESSOA').AsInteger := 0;
  End;
end;

procedure TdmCadProduto.FDQueryItemDetalheBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if FDQueryPrincipal.State = dsInsert then
    FDQueryPrincipal.Post;
    FDQueryPrincipal.Edit;
end;

procedure TdmCadProduto.FDQueryItemDetalheBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_ITEM_DETALHE').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_ITEM_DETALHE').AsInteger :=
      dmConexao.ProximoCodigo('ITEM_DETALHE');
end;

procedure TdmCadProduto.FDQueryItemDetalheNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('COD_ITEM_DETALHE').AsInteger :=
    FDQueryPrincipal.FieldByName('CODIGO_ITEM').AsInteger;
end;

procedure TdmCadProduto.FDQueryItemGradeBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  with FDQueryPrincipal do
  Begin
    Edit;
  End;
end;

procedure TdmCadProduto.FDQueryItemGradeBeforeInsert(DataSet: TDataSet);
begin
  inherited;
   if FDQueryPrincipal.State = dsInsert then
    FDQueryPrincipal.Post;
    FDQueryPrincipal.Edit;
end;

procedure TdmCadProduto.FDQueryItemGradeBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_ITEM_GRADE').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_ITEM_GRADE').AsInteger :=
      dmConexao.ProximoCodigo('ITEM_GRADE');
end;

procedure TdmCadProduto.FDQueryPrincipalAfterInsert(DataSet: TDataSet);
begin
  inherited;
  with FDQueryPrincipal do
  Begin
    FieldByName('STATUS_ITEM').Value := 1;
    FieldByName('VARIACOR_ITEM').Value := False;
    FieldByName('VARIAGRADE_ITEM').Value := False;
  End;
end;

procedure TdmCadProduto.FDQueryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_ITEM').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_ITEM').AsInteger :=
      dmConexao.ProximoCodigo('ITEM')
end;

procedure TdmCadProduto.FDQueryPrincipalNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('PRODUTO_ITEM').AsInteger := 1;
  FDQueryPrincipal.Edit;

end;

procedure TdmCadProduto.Validate_Cor(Sender: TField);
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
  if FDQueryValidaGrupo.IsEmpty then
  begin
    MessageDlg('Campo código da cor precisa ser preenchido!', mtError, [mbOK],0);
    Abort;
  end
  else
  FDQueryItemDetalhe.FieldByName('DESCRICAO_COR').AsString := FDQueryValidaCor.FieldByName('DESCRICAO_COR').AsString;
end;

procedure TdmCadProduto.Validate_Grade(Sender: TField);
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
  if FDQueryValidaGrupo.IsEmpty then
  begin
    MessageDlg('Campo código da grade precisa ser preenchido!', mtError, [mbOK],0);
    Abort;
  end
  else
  FDQueryItemDetalhe.FieldByName('DESCRICAO_GRADE').AsString := FDQueryValidaGrupo.FieldByName('DESCRICAO_GRADE').AsString;
end;

procedure TdmCadProduto.Validate_Grupo(Sender: TField);
begin
  FDQueryValidaGrupo.Close();
  FDQueryValidaGrupo.SQL.Text := 'select DESCRICAO_GRUPO from GRUPO' +
  ' where GRUPO.CODIGO_GRUPO = '+ IntToStr(Sender.AsInteger);
  try
    FDQueryValidaGrupo.Open();
  Except
    On E:Exception do
    ShowMessage('Erro Grupo: ' + E.Message);
  end;
  if FDQueryValidaGrupo.IsEmpty then
  begin
    MessageDlg('Campo código do grupo precisa ser preenchido!', mtError, [mbOK],0);
    Abort;
  end
  else
  FDQueryPrincipal.FieldByName('DESCRICAO_GRUPO').AsString := FDQueryValidaGrupo.FieldByName('DESCRICAO_GRUPO').AsString;
end;

procedure TdmCadProduto.Validate_Ncm(Sender: TField);
begin
  FDQueryValida_Ncm.Close();
  FDQueryValida_Ncm.SQL.Text := 'select COD_NCM from NCM' +
  ' where NCM.CODIGO_NCM = '+ IntToStr(Sender.AsInteger);
  try
    FDQueryValida_Ncm.Open();
  Except
    On E:Exception do
    ShowMessage('Erro SubGrupo: ' + E.Message);
  end;
  if FDQueryValida_Ncm.IsEmpty then
  begin
    MessageDlg('Campo código do NCM precisa ser preenchido!', mtError, [mbOK],0);
    Abort;
  end
  else
  FDQueryPrincipal.FieldByName('COD_NCM').AsString := FDQueryValida_Ncm.FieldByName('COD_NCM').AsString;
end;

procedure TdmCadProduto.Validate_SubGrupo(Sender: TField);
begin
  FDQueryValidaSubGrupo.Close();
  FDQueryValidaSubGrupo.SQL.Text := 'select DESCRICAO_SUBGRUPO from SUBGRUPO' +
  ' where SUBGRUPO.CODIGO_SUBGRUPO = '+ IntToStr(Sender.AsInteger);
  try
    FDQueryValidaSubGrupo.Open();
  Except
    On E:Exception do
    ShowMessage('Erro SubGrupo: ' + E.Message);
  end;
  if FDQueryValidaSubGrupo.IsEmpty then
  begin
    MessageDlg('Campo código do sub grupo precisa ser preenchido!', mtError, [mbOK],0);
    Abort;
  end
  else
  FDQueryPrincipal.FieldByName('DESCRICAO_SUBGRUPO').AsString := FDQueryValidaSubGrupo.FieldByName('DESCRICAO_SUBGRUPO').AsString;
end;

end.
