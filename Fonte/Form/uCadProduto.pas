unit uCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvComponentBase,
  JvEnterTab, Vcl.StdCtrls, Vcl.Mask, JvExMask, JvToolEdit, JvBaseEdits,
  Vcl.Buttons, Vcl.ExtCtrls, udmCadProduto, Vcl.DBCtrls, Vcl.ComCtrls,
  JvExComCtrls, JvComCtrls, FireDAC.VCLUI.Controls, JvDBCheckBox, JvExControls,
  JvDBLookup, JvDBControls, JvExStdCtrls, JvCombobox, JvDBCombobox, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, uDetalhamento;

type
  TfrmCadProduto = class(TfrmCadPai)
    dsItemDetalhe: TDataSource;
    Panel2: TPanel;
    pcItem: TJvPageControl;
    tsPrincipal: TTabSheet;
    dbeDescricao: TDBEdit;
    Label2: TLabel;
    Panel3: TPanel;
    Label3: TLabel;
    dbcbCor: TJvDBCheckBox;
    dbcbGrade: TJvDBCheckBox;
    Label4: TLabel;
    dbeGrupo: TDBEdit;
    Label5: TLabel;
    dbeSubGrupo: TDBEdit;
    Label6: TLabel;
    dblucbUnidade: TJvDBLookupCombo;
    dsUnidade: TDataSource;
    jvdbceGrupo: TJvDBComboEdit;
    jvdbceSubGrupo: TJvDBComboEdit;
    Panel4: TPanel;
    Label7: TLabel;
    dbmObservacao: TDBMemo;
    Label8: TLabel;
    Label9: TLabel;
    jvdbceCodNcm: TJvDBComboEdit;
    dbeNcm: TDBEdit;
    Label10: TLabel;
    jvdbcbTipoTributacao: TJvDBComboBox;
    tsDiferenciacao: TTabSheet;
    dbgDiferenciacao: TJvDBGrid;
    Label11: TLabel;
    sbGerarCombinacao: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtnIncluirClick(Sender: TObject);
    procedure BitBtnSalvarClick(Sender: TObject);
    procedure BitBtnExcluirClick(Sender: TObject);
    procedure BitBtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbmObservacaoKeyPress(Sender: TObject; var Key: Char);
    procedure sbGerarCombinacaoClick(Sender: TObject);
    procedure PanelTopExit(Sender: TObject);
  private
    { Private declarations }
    procedure LimparCache (Sender :TObject);
  public
    { Public declarations }
  end;

var
  frmCadProduto: TfrmCadProduto;

implementation

{$R *.dfm}

procedure TfrmCadProduto.BitBtnCancelarClick(Sender: TObject);
begin
  inherited;
  dmCadProduto.FDSchemaAdapterProduto.CancelUpdates;
end;

procedure TfrmCadProduto.BitBtnExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Tem certeza que deseja excluir o registro ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  Begin
    try
      with dmCadProduto do
      Begin
        QryPrincipal.Delete;
        FDSchemaAdapterProduto.ApplyUpdates(0);
        JvCalcEditCodigo.Value := 0;
      End;
    Except on E: Exception do
      ShowMessage(E.Message);
    end;
  End
  else
  Abort;

end;

procedure TfrmCadProduto.BitBtnIncluirClick(Sender: TObject);
begin
  inherited;
  dbeDescricao.SetFocus;
end;

procedure TfrmCadProduto.BitBtnSalvarClick(Sender: TObject);
begin
  try
  with dmCadProduto do
    begin
      FDSchemaAdapterProduto.ApplyUpdates(0);
      JvCalcEditCodigo.Text := QryPrincipal.FieldByName('CODIGO_ITEM').AsString;
    end;
  Except on E: Exception do
    ShowMessage(E.Message);
  end;

  inherited;
end;

procedure TfrmCadProduto.dbmObservacaoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  Key:= Upcase(Key);
end;

procedure TfrmCadProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := CaFree;
  frmCadProduto := nil;
end;

procedure TfrmCadProduto.FormCreate(Sender: TObject);
begin
  inherited;
  dmCadProduto := TdmCadProduto.Create(self); // Instanciar DM
  self.tabela := 'ITEM';
  self.campochave := 'CODIGO_ITEM';
  self.modalidade := 'PRODUTO_ITEM = 1';
  self.fdmCadPai := dmCadProduto;

  with dmCadProduto do
  begin
    QryPrincipal.Close;
    QryPrincipal.Open;
    QryItemDetalhe.Close;
    QryItemDetalhe.Open;
    QryUnidade.Close;
    QryUnidade.Open;
  end;

  with dmCadProduto do
  begin
    FDSchemaAdapterProduto.AfterApplyUpdate := LimparCache;
  end;

end;

procedure TfrmCadProduto.FormShow(Sender: TObject);
begin
  inherited;
  with dmCadProduto do
  Begin
    QryPrincipal.FieldByName('GRUPO_ITEM').OnValidate := Validate_Grupo;
    QryPrincipal.FieldByName('SUBGRUPO_ITEM').OnValidate := Validate_SubGrupo;
    QryPrincipal.FieldByName('NCM_ITEM').OnValidate := Validate_Ncm;

  //  FDQueryItemDetalhe.FieldByName('COR_ITEM_DETALHE').OnValidate := Validate_Cor;
  //  FDQueryItemDetalhe.FieldByName('GRADE_ITEM_DETALHE').OnValidate := Validate_Grade;
  End;
end;

procedure TfrmCadProduto.LimparCache(Sender: TObject);
begin
  with dmCadProduto do
  Begin
    QryPrincipal.CommitUpdates();
    QryItemDetalhe.CommitUpdates();
  End;
end;

procedure TfrmCadProduto.PanelTopExit(Sender: TObject);
begin
  inherited;
{  with dmCadProduto do
  Begin
  if (FDQueryPrincipal.FieldByName('CONTROLACOR_ITEM').AsString = 'N') and
          (FDQueryPrincipal.FieldByName('CONTROLACOR_ITEM').AsString = 'N') then
    Begin
      tsDiferenciacao.Visible := False;
    End
    Else
    Begin
      tsDiferenciacao.Visible := True;
    End;
  End;
}
end;

procedure TfrmCadProduto.sbGerarCombinacaoClick(Sender: TObject);
begin
  inherited;
  if frmDetalhamento = nil then
    frmDetalhamento := TfrmDetalhamento.Create(self);
  if frmDetalhamento.WindowState = wsMinimized then
    frmDetalhamento.WindowState := wsNormal
  else
    frmDetalhamento.Show;
end;

end.
