unit uCadVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvComponentBase,
  JvEnterTab, Vcl.StdCtrls, Vcl.Mask, JvExMask, JvToolEdit, JvBaseEdits,
  Vcl.Buttons, Vcl.ExtCtrls, udmCadVenda, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, Vcl.DBCtrls, JvDBControls, Vcl.ComCtrls, JvExComCtrls, JvComCtrls,
  unitVarGlobal, uConsultaCliente, JvExStdCtrls, JvCombobox, JvDBCombobox,
  uConsultaItem, uConsultaCor, uConsultaGrade, Vcl.DBCGrids, JvDataSource;

type
  TfrmCadVenda = class(TfrmCadPai)
    Panel2: TPanel;
    dsItens: TDataSource;
    pcCadVenda: TJvPageControl;
    tsPrincipal: TTabSheet;
    dbceCodPessoa: TJvDBComboEdit;
    dbePessoa: TDBEdit;
    Label2: TLabel;
    dbgItens: TJvDBGrid;
    Label3: TLabel;
    dsTabelaPreco: TDataSource;
    dblucbTabelaPreco: TDBLookupComboBox;
    dbcgPrazo: TDBCtrlGrid;
    dbePrazo: TDBEdit;
    dsPrazo: TDataSource;
    DBNavigator1: TDBNavigator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtnIncluirClick(Sender: TObject);
    procedure BitBtnSalvarClick(Sender: TObject);
    procedure BitBtnExcluirClick(Sender: TObject);
    procedure BitBtnCancelarClick(Sender: TObject);
    procedure dbceCodPessoaButtonClick(Sender: TObject);
    procedure dbgItensKeyPress(Sender: TObject; var Key: Char);
    procedure dbgItensCanEditCell(Grid: TJvDBGrid; Field: TField;
      var AllowEdit: Boolean);
    procedure FormPaint(Sender: TObject);
    procedure DBComboBox1DropDown(Sender: TObject);
    procedure SpeedButtonPrimeiroClick(Sender: TObject);
    procedure dbgItensEditButtonClick(Sender: TObject);
    procedure dbcgPrazoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);


  private

    { Private declarations }
    procedure LimparCache (Sender :TObject);
    //procedure RetornaCodCliente(Sender: TObject);
  public
    { Public declarations }
//    property pCodigoConsulta: String Read FCodigoConsulta;
    Var
      vCodigoConsulta: String;
  end;

var
  frmCadVenda: TfrmCadVenda;

implementation

{$R *.dfm}

procedure TfrmCadVenda.BitBtnCancelarClick(Sender: TObject);
begin
  dmCadVenda.FDSchemaAdapterVenda.CancelUpdates;
  inherited;
end;

procedure TfrmCadVenda.BitBtnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Tem certeza que deseja excluir o registro ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  Begin
    try
      with dmCadVenda do
      Begin
        QryPrincipal.Delete;
        FDSchemaAdapterVenda.ApplyUpdates(0);
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

procedure TfrmCadVenda.BitBtnIncluirClick(Sender: TObject);
begin
  inherited;
  dbceCodPessoa.SetFocus;
  dmCadVenda.QryPrincipal.FieldByName('EMPRESA_DOCUMENTO').AsInteger := varpubCodEmpresa;
end;

procedure TfrmCadVenda.BitBtnSalvarClick(Sender: TObject);
begin
  try
    with dmCadVenda do
    begin
      FDSchemaAdapterVenda.ApplyUpdates(0);
      JvCalcEditCodigo.Text := QryPrincipal.FieldByName('CODIGO_DOCUMENTO').AsString;
    end;
  Except on E: Exception do
    ShowMessage(E.Message);
  end;

  inherited;
end;

procedure TfrmCadVenda.dbceCodPessoaButtonClick(Sender: TObject);
begin
  inherited;
  if (JvCalcEditCodigo.Value <> 0) or (dmCadVenda.QryPrincipal.State = dsInsert) then
  Begin
    Application.CreateForm(TfrmConsultaCliente, frmConsultaCliente);
    frmConsultaCliente.ShowModal;
    if frmConsultaCliente.FDQueryConsulta.FieldByName('CODIGO_PESSOA').AsInteger > 0 then
    Begin
      dmCadVenda.QryPrincipal.FieldByName('CLIENTE_DOCUMENTO').AsInteger :=
          frmConsultaCliente.FDQueryConsulta.FieldByName('CODIGO_PESSOA').AsInteger;;
    End;
    FreeAndNil(frmConsultaCliente);
  End;
end;

procedure TfrmCadVenda.dbcgPrazoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
{  if Key = 9 then // tecla TAB
  begin
    if not (ActiveControl is TDBCtrlGrid) then
    begin
      Key := 0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    end;
  end;}
  if Key = 13 then // tecla ENTER
  Begin
    dmCadVenda.QryPrazo.Post;
    dmCadVenda.QryPrazo.Append;
    dbePrazo.SetFocus;
  End;
end;

procedure TfrmCadVenda.DBComboBox1DropDown(Sender: TObject);
begin
  inherited;
//dmCadVenda.QryPrincipal.Edit;
//dmCadVenda.FDQueryVendaItem.Edit;
end;

procedure TfrmCadVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := CaFree;
  frmCadVenda := nil;
end;

procedure TfrmCadVenda.FormCreate(Sender: TObject);
begin
  inherited;
  dmCadVenda := TdmCadVenda.Create(self); // Instanciar DM
  self.fdmCadPai := dmCadVenda;

  with dmCadVenda do
  begin
    QryPrincipal.Close;
    QryPrincipal.Open;
    QryVendaItem.Close;
    QryVendaItem.Open;
    QryTabelaPreco.Close;
    QryTabelaPreco.Open;
    QryPrazo.Close;
    QryPrazo.Open;
  end;

//  pcCadVenda.ActivePageIndex := 0;

  with dmCadVenda do
  begin
    FDSchemaAdapterVenda.AfterApplyUpdate := LimparCache;
  end;
end;

procedure TfrmCadVenda.FormPaint(Sender: TObject);
begin
  inherited;
//  JvCalcEditCodigo.AsInteger := fdmCadPai.QryPrincipal.FieldByName(campochave).AsInteger
end;

procedure TfrmCadVenda.FormShow(Sender: TObject);
begin
  inherited;
  with dmCadVenda do
//  if (JvCalcEditCodigo.Value <> 0) or (QryPrincipal.State = dsEdit) then
  Begin
    QryPrincipal.FieldByName('CLIENTE_DOCUMENTO').OnValidate := Validate_Cliente;
    QryVendaItem.FieldByName('ITEM_DOC_ITEM').OnValidate := Validate_Item;
    QryVendaItem.FieldByName('COR_DOC_ITEM').OnValidate := Validate_Cor;
    QryVendaItem.FieldByName('GRADE_DOC_ITEM').OnValidate := Validate_Grade;
  End;
end;

procedure TfrmCadVenda.dbgItensCanEditCell(Grid: TJvDBGrid; Field: TField;
  var AllowEdit: Boolean);
begin
  inherited;
  dmCadVenda.QryPrincipal.Edit;
end;

procedure TfrmCadVenda.dbgItensEditButtonClick(Sender: TObject);
begin
  inherited;
  if dsItens.DataSet.state in [dsInsert, dsEdit] then
  Begin
  //Produto
    if dbgItens.SelectedField.FieldName = 'ITEM_DOC_ITEM' then
    Begin
      Application.CreateForm(TfrmConsultaItem, frmConsultaItem);
      frmConsultaItem.ShowModal;
      if frmConsultaItem.FDQueryConsulta.FieldByName('CODIGO_ITEM').AsInteger > 0 then
      Begin
        dmCadVenda.QryVendaItem.FieldByName('ITEM_DOC_ITEM').AsInteger :=
            frmConsultaItem.FDQueryConsulta.FieldByName('CODIGO_ITEM').AsInteger;;
      End;
      FreeAndNil(frmConsultaItem);
    End;

  //Cor
    if dbgItens.SelectedField.FieldName = 'COR_DOC_ITEM' then
    Begin
      if dmCadVenda.QryVendaItem.FieldByName('ITEM_DOC_ITEM').AsInteger > 0 then
      Begin
        Application.CreateForm(TfrmConsultaCor, frmConsultaCor);
        frmConsultaCor.ShowModal;
        if frmConsultaCor.FDQueryConsulta.FieldByName('CODIGO_COR').AsInteger > 0 then
        Begin
          dmCadVenda.QryVendaItem.FieldByName('COR_DOC_ITEM').AsInteger :=
              frmConsultaCor.FDQueryConsulta.FieldByName('CODIGO_COR').AsInteger;;
        End;
        FreeAndNil(frmConsultaCor);
      End;
    End
    Else
    Begin
      ShowMessage('Por favor insira o produto primeiro.');
    End;

  //Grade
    if dbgItens.SelectedField.FieldName = 'GRADE_DOC_ITEM' then
    Begin
    if dmCadVenda.QryVendaItem.FieldByName('ITEM_DOC_ITEM').AsInteger > 0 then

    Begin
      Application.CreateForm(TfrmConsultaGrade, frmConsultaGrade);
      frmConsultaGrade.ShowModal;
      if frmConsultaGrade.FDQueryConsulta.FieldByName('CODIGO_GRADE').AsInteger > 0 then
      Begin
        dmCadVenda.QryVendaItem.FieldByName('GRADE_DOC_ITEM').AsInteger :=
            frmConsultaGrade.FDQueryConsulta.FieldByName('CODIGO_GRADE').AsInteger;;
      End;
      FreeAndNil(frmConsultaGrade);
    End;
    End
    Else
    Begin
      ShowMessage('Por favor insira o produto primeiro.');
    End;
  End
  Else
  ShowMessage('Edição não permitida, exclua o item atual ou insira um novo!');
end;

procedure TfrmCadVenda.dbgItensKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  dbgItens.Perform(WM_KEYDOWN, VK_TAB, 0);
{  case Key of
    #13: Perform(WM_NEXTDLGCTL, 0, 0);
    #27: Perform(WM_NEXTDLGCTL, 1, 0);
  end;}
end;

procedure TfrmCadVenda.LimparCache(Sender: TObject);
begin
  with dmCadVenda do
  Begin
    QryPrincipal.CommitUpdates();
    QryVendaItem.CommitUpdates();
  End;
end;



procedure TfrmCadVenda.SpeedButtonPrimeiroClick(Sender: TObject);
begin
  inherited;

end;

{procedure TfrmCadVenda.RetornaCodCliente(Sender: TObject);
begin
  dbceCodPessoa.Text := '1';
end;}

end.
