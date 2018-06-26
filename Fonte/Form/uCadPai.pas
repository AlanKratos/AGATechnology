unit uCadPai;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvComponentBase, JvEnterTab,
  Vcl.StdCtrls, Vcl.Mask, JvExMask, JvToolEdit, JvBaseEdits, Vcl.Buttons,
  Vcl.ExtCtrls, udmCadPai, udmConexao;

type
  TfrmCadPai = class(TForm)
    PanelTop: TPanel;
    Label1: TLabel;
    Panel1: TPanel;
    SpeedButtonPrimeiro: TSpeedButton;
    SpeedButtonAnterior: TSpeedButton;
    SpeedButtonProximo: TSpeedButton;
    SpeedButtonUltimo: TSpeedButton;
    JvCalcEditCodigo: TJvCalcEdit;
    PanelLeft: TPanel;
    BitBtnRelatorio: TSpeedButton;
    BitBtnOutros: TSpeedButton;
    BitBtnCancelar: TSpeedButton;
    BitBtnSalvar: TSpeedButton;
    BitBtnExcluir: TSpeedButton;
    BitBtnPesquisar: TSpeedButton;
    BitBtnIncluir: TSpeedButton;
    dsCadastro: TDataSource;
    JvEnterAsTab1: TJvEnterAsTab;
    procedure BitBtnCancelarClick(Sender: TObject);
    procedure BitBtnIncluirClick(Sender: TObject);
    procedure PanelTopExit(Sender: TObject);
    procedure dsCadastroStateChange(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BitBtnSalvarClick(Sender: TObject);
    procedure SpeedButtonPrimeiroClick(Sender: TObject);
  private
    { Private declarations }
{    varTabela: string; //tabela chamada
    varCampochave: string; //chave primaria
    varModalidade: string; //Cliente,Fornecedor...
}    procedure FDQueryCadastroBeforePost (DataSet: TDataSet);

public
    { Public declarations }
    fdmCadPai: TdmCadPai;   // Variavel : Classe -- vinculando ao DM
{    property tabela:string read varTabela write varTabela;
    property modalidade:string read varModalidade write varModalidade;
    property campochave:string read varCampochave write varCampochave;
}  end;

var
  frmCadPai: TfrmCadPai;

implementation

{$R *.dfm}

procedure TfrmCadPai.BitBtnCancelarClick(Sender: TObject);
begin
  if (fdmCadPai.QryPrincipal.State in [dsInsert, dsedit]) then
    fdmCadPai.QryPrincipal.Cancel;
end;

procedure TfrmCadPai.BitBtnIncluirClick(Sender: TObject);
begin
  PanelTop.OnExit := nil;
  try
  JvCalcEditCodigo.AsInteger := 0;
  fdmCadPai.QryPrincipal.Insert;
  finally
   PanelTop.OnExit := PanelTopExit;
  end;
end;

procedure TfrmCadPai.BitBtnSalvarClick(Sender: TObject);
begin
  JvCalcEditCodigo.SetFocus;
end;

procedure TfrmCadPai.dsCadastroStateChange(Sender: TObject);
begin
  JvCalcEditCodigo.Enabled := dsCadastro.DataSet.State = dsBrowse;
  BitBtnIncluir.Enabled := (dsCadastro.DataSet.State = dsBrowse);
  BitBtnExcluir.Enabled := (dsCadastro.DataSet.State = dsBrowse);
  BitBtnSalvar.Enabled := (dsCadastro.DataSet.State in [dsEdit, dsInsert]);
  BitBtnCancelar.Enabled := (dsCadastro.DataSet.State in [dsEdit, dsInsert]);
  BitBtnPesquisar.Enabled := (dsCadastro.DataSet.State = dsBrowse);
  SpeedButtonPrimeiro.Visible := (dsCadastro.DataSet.State = dsBrowse);
  SpeedButtonAnterior.Enabled := (dsCadastro.DataSet.State = dsBrowse);
  SpeedButtonProximo.Enabled := (dsCadastro.DataSet.State = dsBrowse);
  SpeedButtonUltimo.Enabled := (dsCadastro.DataSet.State = dsBrowse);
end;

procedure TfrmCadPai.FDQueryCadastroBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) and (fdmCadPai.QryPrincipal.FieldByName(dmCadPai.Campochave).AsInteger = 0) then
    begin
      JvCalcEditCodigo.AsInteger := dmConexao.ProximoCodigo(dmCadPai.tabela);
      fdmCadPai.QryPrincipal.FieldByName(dmCadPai.campochave).AsInteger := JvCalcEditCodigo.AsInteger;
    end;
end;

procedure TfrmCadPai.FormPaint(Sender: TObject);
begin
//  JvCalcEditCodigo.AsInteger := fdmCadPai.QryPrincipal.FieldByName(dmCadPai.campochave).AsInteger
end;

procedure TfrmCadPai.PanelTopExit(Sender: TObject);
begin
  with fdmCadPai.QryPrincipal do
    Begin
      Close;
      ParamByName('CODIGO').AsInteger := JvCalcEditCodigo.AsInteger; //Declara o campo do panel que vai ser referenciado
      Open;
    End
end;

procedure TfrmCadPai.SpeedButtonPrimeiroClick(Sender: TObject);
begin
  if sender = SpeedButtonPrimeiro then
    fdmCadPai.Navegar(0)
  else if sender = SpeedButtonUltimo then
    fdmCadPai.Navegar(1)
  else if sender = SpeedButtonAnterior then
    fdmCadPai.Navegar(2)
  else if sender = SpeedButtonProximo then
    fdmCadPai.Navegar(3);

  JvCalcEditCodigo.AsInteger := fdmCadPai.Codigo;
  PanelTopExit(PanelTop);
end;

end.
