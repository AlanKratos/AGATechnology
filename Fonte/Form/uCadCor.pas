unit uCadCor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvComponentBase,
  JvEnterTab, Vcl.StdCtrls, Vcl.Mask, JvExMask, JvToolEdit, JvBaseEdits,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, udmCadCor;

type
  TfrmCadCor = class(TfrmCadPai)
    Panel2: TPanel;
    dbeDescCor: TDBEdit;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtnIncluirClick(Sender: TObject);
    procedure BitBtnSalvarClick(Sender: TObject);
    procedure BitBtnExcluirClick(Sender: TObject);
    procedure BitBtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCor: TfrmCadCor;

implementation

{$R *.dfm}

procedure TfrmCadCor.BitBtnCancelarClick(Sender: TObject);
begin
  dmCadCor.FDQueryPrincipal.CancelUpdates;
  inherited;
end;

procedure TfrmCadCor.BitBtnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Tem certeza que deseja excluir o registro ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  Begin
    try
      with dmCadCor do
      Begin
        FDQueryPrincipal.Delete;
        FDQueryPrincipal.ApplyUpdates(0);
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

procedure TfrmCadCor.BitBtnIncluirClick(Sender: TObject);
begin
  dbeDescCor.SetFocus;

  inherited;
end;

procedure TfrmCadCor.BitBtnSalvarClick(Sender: TObject);
begin
  try
    begin
      dsCadastro.DataSet.Post;
      JvCalcEditCodigo.Text := dmCadCor.FDQueryPrincipal.FieldByName('CODIGO_COR').AsString;
    end;
  Except on E: Exception do
    ShowMessage(E.Message);
  end;

  inherited;
end;

procedure TfrmCadCor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := CaFree;
  frmCadCor := nil;
end;

procedure TfrmCadCor.FormCreate(Sender: TObject);
begin
  inherited;
  dmCadCor := TdmCadCor.Create(self); // Instanciar DM
  self.tabela := 'COR';
  self.campochave := 'CODIGO_COR';
  self.modalidade := 'CODIGO_COR > 0';
  self.fdmCadPai := dmCadCor;

  with dmCadCor do
  begin
    FDQueryPrincipal.Close;
    FDQueryPrincipal.Open;
  end;

end;

end.
