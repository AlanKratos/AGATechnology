unit uMovReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMovFinanceiro, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  JvBaseEdits, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid,
  JvExStdCtrls, JvCombobox, Vcl.Mask, JvExMask, JvToolEdit, Vcl.Buttons,
  Vcl.ExtCtrls, JvComponentBase, JvEnterTab, udmCadFinanceiro;

type
  TfrmMovReceber = class(TfrmMovFinanceiro)
    procedure FormCreate(Sender: TObject);
    procedure sbFiltrarClick(Sender: TObject);
    procedure sbGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMovReceber: TfrmMovReceber;

implementation

{$R *.dfm}

procedure TfrmMovReceber.FormCreate(Sender: TObject);
begin
  inherited;
  varFinTabela := 'DUPLICATA';
  vTipoDuplicata := '1';
end;

procedure TfrmMovReceber.sbFiltrarClick(Sender: TObject);
begin
  vCliente := jvceCodPessoa.Text;
  vDataInicial := deVencInicial.Date;
  vDataFinal := deVencFinal.Date;
  case jvcbSituacao.ItemIndex of
      0: vSituacaoDup := ' <> 0';
      1: vSituacaoDup := ' = 0';
      2: vSituacaoDup := ' is not null ';
  end;
//  with dmCadFinanceiro do
//  Begin
//    FDQueryPrincipal.FieldByName('PESSOA_DUPLICATA').AsInteger := 2;
//  End;
  inherited;
end;

procedure TfrmMovReceber.sbGravarClick(Sender: TObject);
begin
  inherited;
  try
    with dmCadFinanceiro do
    begin
      QryPrincipal.ApplyUpdates(0);
    end;
  Except on E: Exception do
    ShowMessage(E.Message);
  end;

end;

end.
