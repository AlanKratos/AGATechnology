unit uConsultaItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPai, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Buttons, JvExButtons, JvBitBtn, JvExStdCtrls, JvCombobox,
  JvDBCombobox, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, udmCadProduto,
  JvExDBGrids, JvDBGrid, udmConexao;

type
  TfrmConsultaItem = class(TfrmConsultaPai)
    procedure FormCreate(Sender: TObject);
    procedure jvbtbtnPesquisarClick(Sender: TObject);
    procedure jvbtbtnConfirmarClick(Sender: TObject);
    procedure leConsultaMouseEnter(Sender: TObject);
    procedure dbgConsultaDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vCodItem: Integer;
  end;

var
  frmConsultaItem: TfrmConsultaItem;

implementation

{$R *.dfm}

procedure TfrmConsultaItem.dbgConsultaDblClick(Sender: TObject);
begin
  inherited;
//  vCodItem := dsConsulta.DataSet.FieldByName('CODIGO_ITEM').AsInteger;
  Close;
end;

procedure TfrmConsultaItem.FormCreate(Sender: TObject);
begin
  inherited;
  varTabela := 'ITEM';
  varModalidade :=  '1 = 1';
//  varChavePrimaria := '1 = 1';
//  varJuncao := 'left join ITEM on(ITEM.CODIGO_ITEM = TABELA_DETALHE.ITEM_TAB_DET)';
  cbCampoConsulta.ItemIndex := 1;
  cbCriterioConsulta.ItemIndex := 6;
  fdmConsulta := dmCadProduto;
end;

procedure TfrmConsultaItem.jvbtbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmConsultaItem.jvbtbtnPesquisarClick(Sender: TObject);
begin
  case cbCampoConsulta.ItemIndex of
      0: varCampo := ' CODIGO_ITEM';
      1: varCampo := ' DESCRICAO_ITEM';
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

procedure TfrmConsultaItem.leConsultaMouseEnter(Sender: TObject);
begin
  inherited;
  jvbtbtnPesquisar.Click;
end;

end.
