unit uDocSaida;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvComponentBase,
  JvEnterTab, Vcl.StdCtrls, Vcl.Mask, JvExMask, JvToolEdit, JvBaseEdits,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.ComCtrls, JvExComCtrls, JvComCtrls,
  udmDocSaida, JvDBControls, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid;

type
  TfrmDocSaida = class(TfrmCadPai)
    Panel2: TPanel;
    pcDocSaida: TJvPageControl;
    TabSheet1: TTabSheet;
    dbeCliente: TDBEdit;
    Label2: TLabel;
    dsItens: TDataSource;
    dbceCodCliente: TJvDBComboEdit;
    JvDBGrid1: TJvDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtnSalvarClick(Sender: TObject);
    procedure BitBtnExcluirClick(Sender: TObject);
    procedure BitBtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure LimparCache (Sender :TObject);
  public
    { Public declarations }
  end;

var
  frmDocSaida: TfrmDocSaida;

implementation

{$R *.dfm}

procedure TfrmDocSaida.BitBtnCancelarClick(Sender: TObject);
begin
  dmDocSaida.FDSchemaAdapterDocSaida.CancelUpdates;
  inherited;
end;

procedure TfrmDocSaida.BitBtnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Tem certeza que deseja excluir o registro ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  Begin
    try
      with dmDocSaida do
      Begin
        FDQueryPrincipal.Delete;
        FDSchemaAdapterDocSaida.ApplyUpdates(0);
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

procedure TfrmDocSaida.BitBtnSalvarClick(Sender: TObject);
begin
  inherited;
  try
    with dmDocSaida do
    begin
      FDSchemaAdapterDocSaida.ApplyUpdates(0);
      JvCalcEditCodigo.Text := FDQueryPrincipal.FieldByName('CODIGO_DOC_SAIDA').AsString;
    end;
  Except on E: Exception do
    ShowMessage(E.Message);
  end;

end;

procedure TfrmDocSaida.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := CaFree;
end;

procedure TfrmDocSaida.FormCreate(Sender: TObject);
begin
  inherited;
  dmDocSaida := TdmDocSaida.Create(self); // Instanciar DM
  self.tabela := 'DOCUMENTO_SAIDA';
  self.campochave := 'CODIGO_DOC_SAIDA';
  self.modalidade := 'CODIGO_DOC_SAIDA > 0 ';
  self.fdmCadPai := dmDocSaida;
  //JvDBCheckBoxCliente := ''
  // self.modalidade := QuotedStr('1 = 1'); usar quando nao precisar utilizar
  //modalidade no where

  with dmDocSaida do
  begin
    FDQueryPrincipal.Close;
    FDQueryPrincipal.Open;
  end;
  pcDocSaida.ActivePageIndex := 0;

  with dmDocSaida do
  begin
    FDSchemaAdapterDocSaida.AfterApplyUpdate := LimparCache;
  end;
end;

procedure TfrmDocSaida.LimparCache(Sender: TObject);
begin
  with dmDocSaida do
  Begin
    FDQueryPrincipal.CommitUpdates();
    FDQueryItens.CommitUpdates();
  End;
end;

end.
