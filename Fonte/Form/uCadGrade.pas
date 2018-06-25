unit uCadGrade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvComponentBase,
  JvEnterTab, Vcl.StdCtrls, Vcl.Mask, JvExMask, JvToolEdit, JvBaseEdits,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, System.Actions, Vcl.ActnList,
  udmCadGrade;

type
  TfrmCadGrade = class(TfrmCadPai)
    Panel2: TPanel;
    Label2: TLabel;
    dbeDescGrade: TDBEdit;
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
  frmCadGrade: TfrmCadGrade;

implementation

{$R *.dfm}

procedure TfrmCadGrade.BitBtnCancelarClick(Sender: TObject);
begin
  dmCadGrade.QryPrincipal.CancelUpdates;

  inherited;
end;

procedure TfrmCadGrade.BitBtnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Tem certeza que deseja excluir o registro ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  Begin
    try
      with dmCadGrade do
      Begin
        QryPrincipal.Delete;
        QryPrincipal.ApplyUpdates(0);
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

procedure TfrmCadGrade.BitBtnIncluirClick(Sender: TObject);
begin
  dbeDescGrade.SetFocus;

  inherited;
end;

procedure TfrmCadGrade.BitBtnSalvarClick(Sender: TObject);
begin
  try
    begin
      dsCadastro.DataSet.Post;
      JvCalcEditCodigo.Text := dmCadGrade.QryPrincipal.FieldByName('CODIGO_GRADE').AsString;
    end;
  Except on E: Exception do
    ShowMessage(E.Message);
  end;

  inherited;
end;

procedure TfrmCadGrade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := CaFree;
  frmCadGrade := nil;
end;

procedure TfrmCadGrade.FormCreate(Sender: TObject);
begin
  inherited;
  dmCadGrade := TdmCadGrade.Create(self); // Instanciar DM
  self.tabela := 'GRADE';
  self.campochave := 'CODIGO_GRADE';
  self.modalidade := 'CODIGO_GRADE > 0';
  self.fdmCadPai := dmCadGrade;

  with dmCadGrade do
  begin
    QryPrincipal.Close;
    QryPrincipal.Open;
  end;


 { procedure TForm1.Button1Click(Sender: TObject);
  begin
  memo1.SelectAll;
  Memo1.CopyToClipboard;
  memo2.PasteFromClipboard;
  Clipboard.Clear
  end;}

end;

end.
