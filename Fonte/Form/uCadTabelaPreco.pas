unit uCadTabelaPreco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvComponentBase,
  JvEnterTab, Vcl.StdCtrls, Vcl.Mask, JvExMask, JvToolEdit, JvBaseEdits,
  Vcl.Buttons, Vcl.ExtCtrls, udmCadTabelaPreco, Vcl.DBCtrls, Vcl.ComCtrls,
  JvExComCtrls, JvComCtrls, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid,
  JvDBCheckBox, uConsultaItem, uParametro, uConsultaCor, uConsultaGrade;

type
  TfrmCadTabelaPreco = class(TfrmCadPai)
    Panel2: TPanel;
    pcTabelaPreco: TJvPageControl;
    dsItens: TDataSource;
    tsPrincipal: TTabSheet;
    dbeDescricaoTabela: TDBEdit;
    Label2: TLabel;
    dbcbPrecoCor: TJvDBCheckBox;
    dbcbPrecoGrade: TJvDBCheckBox;
    tsItem: TTabSheet;
    dbgItens: TJvDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgItensCanEditCell(Grid: TJvDBGrid; Field: TField;
      var AllowEdit: Boolean);
    procedure dbgItensKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtnSalvarClick(Sender: TObject);
    procedure BitBtnIncluirClick(Sender: TObject);
    procedure BitBtnExcluirClick(Sender: TObject);
    procedure BitBtnCancelarClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure PanelTopExit(Sender: TObject);
    procedure dbcbPrecoCorChange(Sender: TObject);
    procedure dbcbPrecoGradeChange(Sender: TObject);
    procedure dbgItensEditButtonClick(Sender: TObject);
    procedure dbgItensDrawColumnCell(Sender: TObject; const [Ref] Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    procedure LimparCache (Sender :TObject);
  public
    { Public declarations }
  end;

var
  frmCadTabelaPreco: TfrmCadTabelaPreco;

implementation

{$R *.dfm}

procedure TfrmCadTabelaPreco.BitBtnCancelarClick(Sender: TObject);
begin
  inherited;
  dmCadTabelaPreco.FDSchemaAdapterTabelaPreco.CancelUpdates;
end;

procedure TfrmCadTabelaPreco.BitBtnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Tem certeza que deseja excluir o registro ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  Begin
    try
      with dmCadTabelaPreco do
      Begin
        QryCadastro.Delete;
        FDSchemaAdapterTabelaPreco.ApplyUpdates(0);
        JvCalcEditCodigo.Value := 0;
      End;
    Except on E: Exception do
      ShowMessage(E.Message);
    end;
  End
  else
  Abort;

  inherited;
end;

procedure TfrmCadTabelaPreco.BitBtnIncluirClick(Sender: TObject);
begin
  inherited;
  dbeDescricaoTabela.SetFocus;

  with frmParametro.FDQueryParametro do
  if FieldByName('CONTROLACOR_PARAMETRO').AsString = 'S' then
    dbcbPrecoCor.Enabled := True
  else
  Begin
    dbcbPrecoCor.Enabled := False;
    dbcbPrecoCor.Checked := False;
  End;

  with frmParametro.FDQueryParametro do
  if FieldByName('CONTROLAGRADE_PARAMETRO').AsString = 'S' then
    dbcbPrecoGrade.Enabled := True
  else
  Begin
    dbcbPrecoGrade.Enabled := False;
    dbcbPrecoGrade.Checked := False;
  End;
end;

procedure TfrmCadTabelaPreco.BitBtnSalvarClick(Sender: TObject);
begin
  try
    with dmCadTabelaPreco do
    begin
      FDSchemaAdapterTabelaPreco.ApplyUpdates(0);
      JvCalcEditCodigo.Text := QryCadastro.FieldByName('CODIGO_TABELA').AsString;
    end;
  Except on E: Exception do
    ShowMessage(E.Message);
  end;
  inherited;
end;

procedure TfrmCadTabelaPreco.dbcbPrecoCorChange(Sender: TObject);
begin
  inherited;
  if dbcbPrecoCor.Checked = True then
  Begin
    dbgItens.Columns[2].Visible := True;
    dbgItens.Columns[3].Visible := True;
  End;

  if dbcbPrecoCor.Checked = False then
  Begin
    dbgItens.Columns[2].Visible := False;
    dbgItens.Columns[3].Visible := False;
  End;
end;

procedure TfrmCadTabelaPreco.dbcbPrecoGradeChange(Sender: TObject);
begin
  inherited;
  if dbcbPrecoGrade.Checked = True then
  Begin
    dbgItens.Columns[4].Visible := True;
    dbgItens.Columns[5].Visible := True;
  End;

  if dbcbPrecoGrade.Checked = False then
  Begin
    dbgItens.Columns[4].Visible := False;
    dbgItens.Columns[5].Visible := False;
  End;
end;

procedure TfrmCadTabelaPreco.dbgItensCanEditCell(Grid: TJvDBGrid; Field: TField;
  var AllowEdit: Boolean);
begin
  inherited;
//  dmCadTabelaPreco.QryPrincipal.Edit;
//  dmCadTabelaPreco.FDQueryTabela_Detalhe.Edit; Deixei desabilitado para obrigar excluir o item
end;

procedure TfrmCadTabelaPreco.dbgItensDrawColumnCell(Sender: TObject;
  const [Ref] Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  with dbgItens do
  begin
    if Odd( DataSource.DataSet.RecNo) then
      Canvas.Brush.Color := clSilver
    else
      Canvas.Brush.Color := clMoneyGreen;

    Canvas.FillRect(Rect);
    DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end;
end;

procedure TfrmCadTabelaPreco.dbgItensEditButtonClick(Sender: TObject);
begin
  inherited;
  if dsItens.DataSet.state in [dsInsert, dsEdit] then
  Begin
    if dbgItens.SelectedField.FieldName = 'ITEM_TAB_DET' then
    Begin
      Application.CreateForm(TfrmConsultaItem, frmConsultaItem);
      frmConsultaItem.ShowModal;
      if frmConsultaItem.FDQueryConsulta.FieldByName('CODIGO_ITEM').AsInteger > 0 then
      Begin
        dmCadTabelaPreco.QryTabela_Detalhe.FieldByName('ITEM_TAB_DET').AsInteger :=
            frmConsultaItem.FDQueryConsulta.FieldByName('CODIGO_ITEM').AsInteger;;
      End;
      FreeAndNil(frmConsultaItem);
    End;

    if dbgItens.SelectedField.FieldName = 'COR_TAB_DET' then
    Begin
      Application.CreateForm(TfrmConsultaCor, frmConsultaCor);
      frmConsultaCor.ShowModal;
      if frmConsultaCor.FDQueryConsulta.FieldByName('CODIGO_COR').AsInteger > 0 then
      Begin
        dmCadTabelaPreco.QryTabela_Detalhe.FieldByName('COR_TAB_DET').AsInteger :=
            frmConsultaCor.FDQueryConsulta.FieldByName('CODIGO_COR').AsInteger;;
      End;
      FreeAndNil(frmConsultaCor);
    End;

    if dbgItens.SelectedField.FieldName = 'GRADE_TAB_DET' then
    Begin
      Application.CreateForm(TfrmConsultaGrade, frmConsultaGrade);
      frmConsultaGrade.ShowModal;
      if frmConsultaGrade.FDQueryConsulta.FieldByName('CODIGO_GRADE').AsInteger > 0 then
      Begin
        dmCadTabelaPreco.QryTabela_Detalhe.FieldByName('GRADE_TAB_DET').AsInteger :=
            frmConsultaGrade.FDQueryConsulta.FieldByName('CODIGO_GRADE').AsInteger;;
      End;
      FreeAndNil(frmConsultaGrade);
    End;
  End
  else
  ShowMessage('Edição não permitida, exclua o item atual ou insira um novo!');
end;

procedure TfrmCadTabelaPreco.dbgItensKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  dbgItens.Perform(WM_KEYDOWN, VK_TAB, 0);
end;

procedure TfrmCadTabelaPreco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := CaFree;
  frmCadTabelaPreco := nil;
end;

procedure TfrmCadTabelaPreco.FormCreate(Sender: TObject);
begin
  inherited;
  dmCadTabelaPreco := TdmCadTabelaPreco.Create(self); // Instanciar DM
  self.fdmCadPai := dmCadTabelaPreco;

  with dmCadTabelaPreco do
  begin
    QryCadastro.Close;
    QryCadastro.Open;
    QryTabela_Detalhe.Close;
    QryTabela_Detalhe.Open;
  end;

  with dmCadTabelaPreco do
  begin
    FDSchemaAdapterTabelaPreco.AfterApplyUpdate := LimparCache;
  end;
end;

procedure TfrmCadTabelaPreco.FormPaint(Sender: TObject);
begin
  inherited;
//  JvCalcEditCodigo.AsInteger := fdmCadPai.QryPrincipal.FieldByName(campochave).AsInteger
end;

procedure TfrmCadTabelaPreco.FormShow(Sender: TObject);
begin
  inherited;
  with dmCadTabelaPreco do
  Begin
    QryTabela_Detalhe.FieldByName('ITEM_TAB_DET').OnValidate := Validate_Item;
    QryTabela_Detalhe.FieldByName('COR_TAB_DET').OnValidate := Validate_Cor;
    QryTabela_Detalhe.FieldByName('GRADE_TAB_DET').OnValidate := Validate_Grade;
  End;
end;

procedure TfrmCadTabelaPreco.LimparCache(Sender: TObject);
begin
  with dmCadTabelaPreco do
  Begin
    QryCadastro.CommitUpdates();
    QryTabela_Detalhe.CommitUpdates();
  End;
end;

procedure TfrmCadTabelaPreco.PanelTopExit(Sender: TObject);
begin
  inherited;
  with dbgItens do
  begin
//       Parent     := pnAgenda;
//       Align      := alClient;
//       Name       := dgAge + Dtm.QryPesquisar.FieldByName(ProNome).AsString;
//       Options    := [dgEditing, dgTitles, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit];
    DataSource := dsItens;
    //Adiciona as Colunas na grid
    Columns.Add;
    Columns.Items[0].FieldName     := 'ITEM_TAB_DET';
    Columns.Items[0].Title.Caption := 'Cod. Item';
    Columns.Items[0].ButtonStyle := cbsEllipsis;
    Columns.Items[0].ReadOnly := False;
    Columns.Add;
    Columns.Items[1].FieldName     := 'DESCRICAO_ITEM';
    Columns.Items[1].Title.Caption := 'Item';
    Columns.Items[1].Width := 300;
    Columns.Items[1].ReadOnly := True;
    Columns.Add;
    Columns.Items[2].FieldName     := 'COR_TAB_DET';
    Columns.Items[2].Title.Caption := 'Cod. Cor';
    Columns.Items[2].ButtonStyle := cbsEllipsis;
    Columns.Items[2].ReadOnly := False;
    Columns.Add;
    Columns.Items[3].FieldName     := 'DESCRICAO_COR';
    Columns.Items[3].Title.Caption := 'Cor';
    Columns.Items[3].ReadOnly := True;
    Columns.Add;
    Columns.Items[4].FieldName     := 'GRADE_TAB_DET';
    Columns.Items[4].Title.Caption := 'Cod. Grade';
    Columns.Items[4].ButtonStyle := cbsEllipsis;
    Columns.Items[4].ReadOnly := False;
    Columns.Add;
    Columns.Items[5].FieldName     := 'DESCRICAO_GRADE';
    Columns.Items[5].Title.Caption := 'Grade';
    Columns.Items[5].ReadOnly := True;
    Columns.Add;
    Columns.Items[6].FieldName     := 'VALOR_TAB_DET';
    Columns.Items[6].Title.Caption := 'Valor';
  End;
end;

end.
