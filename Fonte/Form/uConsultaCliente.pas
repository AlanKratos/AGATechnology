unit uConsultaCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPai, Data.DB, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, udmCadCliente, Vcl.DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  udmConexao, JvExStdCtrls, JvCombobox, JvDBCombobox, uCadPai, udmCadVenda,
  Vcl.Mask, JvExButtons, JvBitBtn, JvExDBGrids, JvDBGrid;

type
  TfrmConsultaCliente = class(TfrmConsultaPai)
    procedure FormCreate(Sender: TObject);
    procedure dbgConsultaDblClick(Sender: TObject);
    procedure jvbtbtnPesquisarClick(Sender: TObject);
    procedure leConsultaEnter(Sender: TObject);
    procedure jvbtbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vCodCliente :Integer;
  end;

  RefConsultaPai = class of TfrmConsultaPai;

var
  frmConsultaCliente: TfrmConsultaCliente;

implementation

{$R *.dfm}


procedure TfrmConsultaCliente.dbgConsultaDblClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmConsultaCliente.FormCreate(Sender: TObject);
begin
  inherited;
  varTabela := 'PESSOA';
  varModalidade :=  'CLIENTE_PESSOA = ' + QuotedStr('S');
  varChavePrimaria := 'CODIGO_PESSOA > 0';
  cbCampoConsulta.ItemIndex := 1;
  cbCriterioConsulta.ItemIndex := 6;
  fdmConsulta := dmCadCliente;
end;

procedure TfrmConsultaCliente.jvbtbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmConsultaCliente.jvbtbtnPesquisarClick(Sender: TObject);
begin
  case cbCampoConsulta.ItemIndex of
      0: varCampo := ' CODIGO_PESSOA';
      1: varCampo := ' NOME_PESSOA';
      2: varCampo := ' CNPJ_PESSOA';
      3: varCampo := ' CPF_PESSOA';
    end;
  case cbCriterioConsulta.ItemIndex of
      0: varCriterio := ' > ' + leConsulta.Text;
      1: varCriterio := ' < ' + leConsulta.Text;
      2: varCriterio := ' >= ' + leConsulta.Text;
      3: varCriterio := ' <= ' + leConsulta.Text;
      4: varCriterio := ' LIKE ' + QuotedStr(leConsulta.Text + '%');
      5: varCriterio := ' LIKE ' + QuotedStr('%' + leConsulta.Text);
      6: varCriterio := ' LIKE ' + QuotedStr('%' + leConsulta.Text + '%');
    end;
  inherited;
end;

procedure TfrmConsultaCliente.leConsultaEnter(Sender: TObject);
begin
  inherited;
  jvbtbtnPesquisar.Click;
end;

end.
