unit udmCadProduto;

interface

uses
  System.SysUtils, System.Classes, udmCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, udmConexao, Vcl.Dialogs;

type
  TdmCadProduto = class(TdmCadPai)
    QryItemDetalhe: TFDQuery;
    FDSchemaAdapterProduto: TFDSchemaAdapter;
    dsMaster: TDataSource;
    QryUnidade: TFDQuery;
    QryValidaGrupo: TFDQuery;
    QryValidaSubGrupo: TFDQuery;
    QryValida_Ncm: TFDQuery;
    QryItemCor: TFDQuery;
    QryItemGrade: TFDQuery;
    QryCor: TFDQuery;
    QryGrade: TFDQuery;
    dsDetalhe: TDataSource;
    QryValidaCor: TFDQuery;
    QryValidaGrade: TFDQuery;
    QryItemDetalheCODIGO_ITEM_DETALHE: TIntegerField;
    QryItemDetalheCOR_ITEM_DETALHE: TIntegerField;
    QryItemDetalheGRADE_ITEM_DETALHE: TIntegerField;
    QryItemDetalheTECIDO_ITEM_DETALHE: TIntegerField;
    QryItemDetalheSTATUS_ITEM_DETALHE: TIntegerField;
    QryItemDetalheCODIGOBARRAS_ITEM_DETALHE: TStringField;
    QryItemDetalheCOD_ITEM_DETALHE: TIntegerField;
    QryItemDetalheDESCRICAO_COR: TStringField;
    QryItemDetalheDESCRICAO_GRADE: TStringField;
    QryPrincipalCODIGO_ITEM: TIntegerField;
    QryPrincipalTIPO_ITEM: TIntegerField;
    QryPrincipalDESCRICAO_ITEM: TStringField;
    QryPrincipalCODIGOBARRAS_ITEM: TStringField;
    QryPrincipalCOLECAO_ITEM: TIntegerField;
    QryPrincipalVALIDADE_ITEM: TIntegerField;
    QryPrincipalVARIACOR_ITEM: TStringField;
    QryPrincipalVARIATECIDO_ITEM: TStringField;
    QryPrincipalVARIAGRADE_ITEM: TStringField;
    QryPrincipalGRUPO_ITEM: TIntegerField;
    QryPrincipalSUBGRUPO_ITEM: TIntegerField;
    QryPrincipalNCM_ITEM: TIntegerField;
    QryPrincipalPESOBRUTO_ITEM: TBCDField;
    QryPrincipalPESOLIQUIDO_ITEM: TBCDField;
    QryPrincipalSTATUS_ITEM: TIntegerField;
    QryPrincipalUNIDADE_ITEM: TIntegerField;
    QryPrincipalPRODUTO_ITEM: TIntegerField;
    QryPrincipalOBSERVACAO_ITEM: TMemoField;
    QryPrincipalTRIBUTACAO_ITEM: TIntegerField;
    QryPrincipalDESCRICAO_GRUPO: TStringField;
    QryPrincipalDESCRICAO_SUBGRUPO: TStringField;
    QryPrincipalCOD_NCM: TStringField;
    procedure QryPrincipalAfterInsert(DataSet: TDataSet);
    procedure QryPrincipalBeforePost(DataSet: TDataSet);
    procedure QryPrincipalNewRecord(DataSet: TDataSet);
    procedure QryItemDetalheBeforeEdit(DataSet: TDataSet);
    procedure QryItemDetalheBeforeInsert(DataSet: TDataSet);
    procedure QryItemDetalheBeforePost(DataSet: TDataSet);
    procedure QryItemDetalheNewRecord(DataSet: TDataSet);
    procedure Validate_Grupo(Sender: TField);
    procedure Validate_SubGrupo(Sender: TField);
    procedure Validate_Ncm(Sender: TField);
    procedure QryItemCorBeforeEdit(DataSet: TDataSet);
    procedure QryItemCorBeforeInsert(DataSet: TDataSet);
    procedure QryItemCorBeforePost(DataSet: TDataSet);
    procedure QryItemGradeBeforePost(DataSet: TDataSet);
    procedure QryItemGradeBeforeInsert(DataSet: TDataSet);
    procedure QryItemGradeBeforeEdit(DataSet: TDataSet);
    procedure Validate_Cor(Sender: TField);
    procedure Validate_Grade(Sender: TField);
    procedure DataModuleCreate(Sender: TObject);
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

procedure TdmCadProduto.DataModuleCreate(Sender: TObject);
begin
  inherited;
  self.tabela := 'ITEM';
  self.campochave := 'CODIGO_ITEM';
  self.TipoCadastro := '1 = 1';
end;

procedure TdmCadProduto.QryItemCorBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  with QryPrincipal do
  Begin
    Edit;
  End;
end;

procedure TdmCadProduto.QryItemCorBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if QryPrincipal.State = dsInsert then
    QryPrincipal.Post;
    QryPrincipal.Edit;
end;

procedure TdmCadProduto.QryItemCorBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_ITEM_COR').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_ITEM_COR').AsInteger :=
      dmConexao.ProximoCodigo('ITEM_COR');
end;

procedure TdmCadProduto.QryItemDetalheBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  with QryPrincipal do
  Begin
    Edit;
//    FieldByName('ENDERECO_PESSOA').AsInteger := 0;
  End;
end;

procedure TdmCadProduto.QryItemDetalheBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if QryPrincipal.State = dsInsert then
    QryPrincipal.Post;
    QryPrincipal.Edit;
end;

procedure TdmCadProduto.QryItemDetalheBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_ITEM_DETALHE').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_ITEM_DETALHE').AsInteger :=
      dmConexao.ProximoCodigo('ITEM_DETALHE');
end;

procedure TdmCadProduto.QryItemDetalheNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('COD_ITEM_DETALHE').AsInteger :=
    QryPrincipal.FieldByName('CODIGO_ITEM').AsInteger;
end;

procedure TdmCadProduto.QryItemGradeBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  with QryPrincipal do
  Begin
    Edit;
  End;
end;

procedure TdmCadProduto.QryItemGradeBeforeInsert(DataSet: TDataSet);
begin
  inherited;
   if QryPrincipal.State = dsInsert then
    QryPrincipal.Post;
    QryPrincipal.Edit;
end;

procedure TdmCadProduto.QryItemGradeBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_ITEM_GRADE').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_ITEM_GRADE').AsInteger :=
      dmConexao.ProximoCodigo('ITEM_GRADE');
end;

procedure TdmCadProduto.QryPrincipalAfterInsert(DataSet: TDataSet);
begin
  inherited;
  with QryPrincipal do
  Begin
    FieldByName('STATUS_ITEM').Value := 1;
    FieldByName('VARIACOR_ITEM').Value := False;
    FieldByName('VARIAGRADE_ITEM').Value := False;
  End;
end;

procedure TdmCadProduto.QryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_ITEM').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_ITEM').AsInteger :=
      dmConexao.ProximoCodigo('ITEM')
end;

procedure TdmCadProduto.QryPrincipalNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('PRODUTO_ITEM').AsInteger := 1;
  QryPrincipal.Edit;

end;

procedure TdmCadProduto.Validate_Cor(Sender: TField);
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
  if QryValidaGrupo.IsEmpty then
  begin
    MessageDlg('Campo código da cor precisa ser preenchido!', mtError, [mbOK],0);
    Abort;
  end
  else
  QryItemDetalhe.FieldByName('DESCRICAO_COR').AsString := QryValidaCor.FieldByName('DESCRICAO_COR').AsString;
end;

procedure TdmCadProduto.Validate_Grade(Sender: TField);
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
  if QryValidaGrupo.IsEmpty then
  begin
    MessageDlg('Campo código da grade precisa ser preenchido!', mtError, [mbOK],0);
    Abort;
  end
  else
  QryItemDetalhe.FieldByName('DESCRICAO_GRADE').AsString := QryValidaGrupo.FieldByName('DESCRICAO_GRADE').AsString;
end;

procedure TdmCadProduto.Validate_Grupo(Sender: TField);
begin
  QryValidaGrupo.Close();
  QryValidaGrupo.SQL.Text := 'select DESCRICAO_GRUPO from GRUPO' +
  ' where GRUPO.CODIGO_GRUPO = '+ IntToStr(Sender.AsInteger);
  try
    QryValidaGrupo.Open();
  Except
    On E:Exception do
    ShowMessage('Erro Grupo: ' + E.Message);
  end;
  if QryValidaGrupo.IsEmpty then
  begin
    MessageDlg('Campo código do grupo precisa ser preenchido!', mtError, [mbOK],0);
    Abort;
  end
  else
  QryPrincipal.FieldByName('DESCRICAO_GRUPO').AsString := QryValidaGrupo.FieldByName('DESCRICAO_GRUPO').AsString;
end;

procedure TdmCadProduto.Validate_Ncm(Sender: TField);
begin
  QryValida_Ncm.Close();
  QryValida_Ncm.SQL.Text := 'select COD_NCM from NCM' +
  ' where NCM.CODIGO_NCM = '+ IntToStr(Sender.AsInteger);
  try
    QryValida_Ncm.Open();
  Except
    On E:Exception do
    ShowMessage('Erro SubGrupo: ' + E.Message);
  end;
  if QryValida_Ncm.IsEmpty then
  begin
    MessageDlg('Campo código do NCM precisa ser preenchido!', mtError, [mbOK],0);
    Abort;
  end
  else
  QryPrincipal.FieldByName('COD_NCM').AsString := QryValida_Ncm.FieldByName('COD_NCM').AsString;
end;

procedure TdmCadProduto.Validate_SubGrupo(Sender: TField);
begin
  QryValidaSubGrupo.Close();
  QryValidaSubGrupo.SQL.Text := 'select DESCRICAO_SUBGRUPO from SUBGRUPO' +
  ' where SUBGRUPO.CODIGO_SUBGRUPO = '+ IntToStr(Sender.AsInteger);
  try
    QryValidaSubGrupo.Open();
  Except
    On E:Exception do
    ShowMessage('Erro SubGrupo: ' + E.Message);
  end;
  if QryValidaSubGrupo.IsEmpty then
  begin
    MessageDlg('Campo código do sub grupo precisa ser preenchido!', mtError, [mbOK],0);
    Abort;
  end
  else
  QryPrincipal.FieldByName('DESCRICAO_SUBGRUPO').AsString := QryValidaSubGrupo.FieldByName('DESCRICAO_SUBGRUPO').AsString;
end;

end.
