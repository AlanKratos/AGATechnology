unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, uCadCliente,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, udmConexao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvExControls,
  JvSpeedButton, Vcl.Menus, unitVarGlobal, relCliente, Vcl.ComCtrls, uCadCidade,
  uCadVenda, uCadTabelaPreco, uCadEmpresa, JvDBImage, uCadProduto, uMovReceber,
  uCadGrade;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    sbCliente: TSpeedButton;
    FDQueryPrincipal: TFDQuery;
    dsPrincipal: TDataSource;
    sbEmpresa: TJvSpeedButton;
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Clientes1: TMenuItem;
    Fornecedores1: TMenuItem;
    Empresa1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Sair1: TMenuItem;
    Movimentos1: TMenuItem;
    Relatrios1: TMenuItem;
    Parmetros1: TMenuItem;
    Sobre1: TMenuItem;
    Clientes2: TMenuItem;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Cidade1: TMenuItem;
    N3: TMenuItem;
    Vendas1: TMenuItem;
    Financeiro1: TMenuItem;
    N4: TMenuItem;
    Receber1: TMenuItem;
    Pagar1: TMenuItem;
    Faturamento1: TMenuItem;
    N5: TMenuItem;
    EmissodeNotaFiscal1: TMenuItem;
    CancelamentodeNota1: TMenuItem;
    Compras1: TMenuItem;
    N6: TMenuItem;
    Entrada1: TMenuItem;
    Devoluo1: TMenuItem;
    Emisso1: TMenuItem;
    Cancelamento1: TMenuItem;
    ChequesRecebidos1: TMenuItem;
    ChequesEmitidos1: TMenuItem;
    abeladePreo1: TMenuItem;
    N7: TMenuItem;
    sbVenda: TSpeedButton;
    JvDBImage1: TJvDBImage;
    sbProduto: TSpeedButton;
    Itens1: TMenuItem;
    N8: TMenuItem;
    Produto1: TMenuItem;
    N9: TMenuItem;
    Cor1: TMenuItem;
    Grade1: TMenuItem;
    sbReceber: TSpeedButton;
    procedure sbClienteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Clientes2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure WMNCLButtonDblClk(var Message: TWMNCLButtonDblClk); message WM_NCLButtonDblClk;
    procedure Cidade1Click(Sender: TObject);
    procedure Emisso1Click(Sender: TObject);
    procedure abeladePreo1Click(Sender: TObject);
    procedure sbVendaClick(Sender: TObject);
    procedure Empresa1Click(Sender: TObject);
    procedure sbProdutoClick(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure sbReceberClick(Sender: TObject);
    procedure Cor1Click(Sender: TObject);
    procedure Grade1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    varEmpresa: String;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCadCor;

procedure TfrmPrincipal.abeladePreo1Click(Sender: TObject);
begin
  if frmCadTabelaPreco = nil then
    frmCadTabelaPreco := TfrmCadTabelaPreco.Create(self);
 if frmCadTabelaPreco.WindowState = wsMinimized then
    frmCadTabelaPreco.WindowState := wsNormal
  else
    frmCadTabelaPreco.Show;
end;

procedure TfrmPrincipal.Cidade1Click(Sender: TObject);
begin
  if frmCadCidade = nil then
    frmCadCidade := TfrmCadCidade.Create(self);
 if frmCadCidade.WindowState = wsMinimized then
    frmCadCidade.WindowState := wsNormal
  else
    frmCadCidade.Show;
end;

procedure TfrmPrincipal.Clientes1Click(Sender: TObject);
begin
  if frmCadCliente = nil then
    frmCadCliente := TfrmCadCliente.Create(self);
  if frmCadCliente.WindowState = wsMinimized then
    frmCadCliente.WindowState := wsNormal
  else
    frmCadCliente.Show;
end;

procedure TfrmPrincipal.Clientes2Click(Sender: TObject);
begin
  if frmRelCliente = nil then
    frmRelCliente := TfrmRelCliente.Create(self);
  if frmRelCliente.WindowState = wsMinimized then
    frmRelCliente.WindowState := wsNormal
  else
    frmRelCliente.Show;
end;

procedure TfrmPrincipal.Cor1Click(Sender: TObject);
begin
  if frmCadCor = nil then
    frmCadCor := TfrmCadCor.Create(self);
  if frmCadCor.WindowState = wsMinimized then
    frmCadCor.WindowState := wsNormal
  else
    frmCadCor.Show;
end;

procedure TfrmPrincipal.Emisso1Click(Sender: TObject);
begin
  if frmCadVenda = nil then
    frmCadVenda := TfrmCadVenda.Create(self);
  if frmCadVenda.WindowState = wsMinimized then
    frmCadVenda.WindowState := wsNormal
  else
    frmCadVenda.Show;
end;

procedure TfrmPrincipal.Empresa1Click(Sender: TObject);
begin
  if frmCadEmpresa = nil then
    frmCadEmpresa := TfrmCadEmpresa.Create(self);
  if frmCadEmpresa.WindowState = wsMinimized then
    frmCadEmpresa.WindowState := wsNormal
  else
    frmCadEmpresa.Show;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
//  FDQueryPrincipal.Active;
  with FDQueryPrincipal do
  Begin
    Close;
    //SQL.Clear;
    //SQL.Add('SELECT CODIGO_EMPRESA, RAZAOSOCIAL_EMPRESA FROM EMPRESA WHERE EMPRESA.CODIGO_EMPRESA = 1');
    Open();
    varpubEmpresa := FieldByName('RAZAOSOCIAL_EMPRESA').AsString;
    varpubCodEmpresa := FieldByName('CODIGO_EMPRESA').AsInteger;
    sbEmpresa.Caption := varpubEmpresa;
  End;
  StatusBar1.Panels[0].Text := varpubUsuario;
end;

procedure TfrmPrincipal.Grade1Click(Sender: TObject);
begin
  if frmCadGrade = nil then
    frmCadGrade := TfrmCadGrade.Create(self);
  if frmCadGrade.WindowState = wsMinimized then
    frmCadGrade.WindowState := wsNormal
  else
    frmCadGrade.Show;
end;

procedure TfrmPrincipal.Produto1Click(Sender: TObject);
begin
  if frmCadProduto = nil then
    frmCadProduto := TfrmCadProduto.Create(self);
  if frmCadProduto.WindowState = wsMinimized then
    frmCadProduto.WindowState := wsNormal
  else
    frmCadProduto.Show;
end;

procedure TfrmPrincipal.sbClienteClick(Sender: TObject);
begin
  if frmCadCliente = nil then
    frmCadCliente := TfrmCadCliente.Create(self);
  if frmCadCliente.WindowState = wsMinimized then
    frmCadCliente.WindowState := wsNormal
  else
    frmCadCliente.Show;
end;

procedure TfrmPrincipal.sbProdutoClick(Sender: TObject);
begin
  if frmCadProduto = nil then
    frmCadProduto := TfrmCadProduto.Create(self);
  if frmCadProduto.WindowState = wsMinimized then
    frmCadProduto.WindowState := wsNormal
  else
    frmCadProduto.Show;
end;

procedure TfrmPrincipal.sbReceberClick(Sender: TObject);
begin
  if frmMovReceber = nil then
    frmMovReceber := TfrmMovReceber.Create(self);
  if frmMovReceber.WindowState = wsMinimized then
    frmMovReceber.WindowState := wsNormal
  else
    frmMovReceber.Show;
end;

procedure TfrmPrincipal.sbVendaClick(Sender: TObject);
begin
  if frmCadVenda = nil then
    frmCadVenda := TfrmCadVenda.Create(self);
  if frmCadVenda.WindowState = wsMinimized then
    frmCadVenda.WindowState := wsNormal
  else
    frmCadVenda.Show;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := varpubUsuario;
  StatusBar1.Panels[1].Text := 'Hora: ' + TimeToStr(time);
  StatusBar1.Panels[2].Text := 'Data: ' + DateToStr(date);
end;

procedure TfrmPrincipal.WMNCLButtonDblClk(var Message: TWMNCLButtonDblClk);
begin
  //Message.Result := 0; //bloqueia o duplo clique co mouse na barra de títulos
end;

end.
