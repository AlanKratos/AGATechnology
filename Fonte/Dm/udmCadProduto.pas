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
    QryCadastroCODIGO_ITEM: TIntegerField;
    QryCadastroTIPO_ITEM: TIntegerField;
    QryCadastroDESCRICAO_ITEM: TStringField;
    QryCadastroCODIGOBARRAS_ITEM: TStringField;
    QryCadastroCOLECAO_ITEM: TIntegerField;
    QryCadastroVALIDADE_ITEM: TIntegerField;
    QryCadastroGRUPO_ITEM: TIntegerField;
    QryCadastroSUBGRUPO_ITEM: TIntegerField;
    QryCadastroNCM_ITEM: TIntegerField;
    QryCadastroPESOBRUTO_ITEM: TBCDField;
    QryCadastroPESOLIQUIDO_ITEM: TBCDField;
    QryCadastroSTATUS_ITEM: TIntegerField;
    QryCadastroUNIDADE_ITEM: TIntegerField;
    QryCadastroPRODUTO_ITEM: TIntegerField;
    QryCadastroOBSERVACAO_ITEM: TMemoField;
    QryCadastroTRIBUTACAO_ITEM: TIntegerField;
    QryCadastroDESCRICAO_GRUPO: TStringField;
    QryCadastroDESCRICAO_SUBGRUPO: TStringField;
    QryCadastroCOD_NCM: TStringField;
    QryCadastroCONTROLACOR_ITEM: TStringField;
    QryCadastroCONTROLAGRADE_ITEM: TStringField;
    procedure QryCadastroAfterInsert(DataSet: TDataSet);
    procedure QryCadastroBeforePost(DataSet: TDataSet);
    procedure QryCadastroNewRecord(DataSet: TDataSet);
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
    procedure QryCadastroAfterPost(DataSet: TDataSet);
    procedure QryCadastroAfterApplyUpdates(DataSet: TFDDataSet;
      AErrors: Integer);
    procedure FDSchemaAdapterProdutoAfterApplyUpdate(Sender: TObject);
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
  with QryCadastro do
  Begin
    Edit;
  End;
end;

procedure TdmCadProduto.QryItemCorBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if QryCadastro.State = dsInsert then
    QryCadastro.Post;
    QryCadastro.Edit;
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
  with QryCadastro do
  Begin
    Edit;
//    FieldByName('ENDERECO_PESSOA').AsInteger := 0;
  End;
end;

procedure TdmCadProduto.QryItemDetalheBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if QryCadastro.State = dsInsert then
    QryCadastro.Post;
    QryCadastro.Edit;
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
    QryCadastro.FieldByName('CODIGO_ITEM').AsInteger;
end;

procedure TdmCadProduto.QryItemGradeBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  with QryCadastro do
  Begin
    Edit;
  End;
end;

procedure TdmCadProduto.QryItemGradeBeforeInsert(DataSet: TDataSet);
begin
  inherited;
   if QryCadastro.State = dsInsert then
    QryCadastro.Post;
    QryCadastro.Edit;
end;

procedure TdmCadProduto.QryItemGradeBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_ITEM_GRADE').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_ITEM_GRADE').AsInteger :=
      dmConexao.ProximoCodigo('ITEM_GRADE');
end;

procedure TdmCadProduto.FDSchemaAdapterProdutoAfterApplyUpdate(Sender: TObject);
begin
  inherited;
  QryItemCor.ApplyUpdates;
end;

procedure TdmCadProduto.QryCadastroAfterApplyUpdates(DataSet: TFDDataSet;
  AErrors: Integer);
begin
  inherited;
  QryItemCor.ApplyUpdates;
end;

procedure TdmCadProduto.QryCadastroAfterInsert(DataSet: TDataSet);
begin
  inherited;
  with QryCadastro do
  Begin
    FieldByName('STATUS_ITEM').AsInteger := 1;
    FieldByName('CONTROLACOR_ITEM').AsString := 'N';
    FieldByName('CONTROLAGRADE_ITEM').AsString := 'N';
  End;
end;

procedure TdmCadProduto.QryCadastroAfterPost(DataSet: TDataSet);
begin
  inherited;
  QryItemCor.CommitUpdates;
end;

procedure TdmCadProduto.QryCadastroBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) and (DataSet.FieldByName('CODIGO_ITEM').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_ITEM').AsInteger := dmConexao.ProximoCodigo('ITEM');

  inherited;
end;

procedure TdmCadProduto.QryCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('PRODUTO_ITEM').AsInteger := 1; //indica se � um produto
  QryCadastro.Edit;

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
    MessageDlg('Campo c�digo da cor precisa ser preenchido!', mtError, [mbOK],0);
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
    MessageDlg('Campo c�digo da grade precisa ser preenchido!', mtError, [mbOK],0);
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
    MessageDlg('Campo c�digo do grupo precisa ser preenchido!', mtError, [mbOK],0);
    Abort;
  end
  else
  QryCadastro.FieldByName('DESCRICAO_GRUPO').AsString := QryValidaGrupo.FieldByName('DESCRICAO_GRUPO').AsString;
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
    MessageDlg('Campo c�digo do NCM precisa ser preenchido!', mtError, [mbOK],0);
    Abort;
  end
  else
  QryCadastro.FieldByName('COD_NCM').AsString := QryValida_Ncm.FieldByName('COD_NCM').AsString;
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
    MessageDlg('Campo c�digo do sub grupo precisa ser preenchido!', mtError, [mbOK],0);
    Abort;
  end
  else
  QryCadastro.FieldByName('DESCRICAO_SUBGRUPO').AsString := QryValidaSubGrupo.FieldByName('DESCRICAO_SUBGRUPO').AsString;
end;

end.
