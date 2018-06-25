unit uConsultaCor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPai, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.StdCtrls, Vcl.Buttons,
  JvExButtons, JvBitBtn, JvExStdCtrls, JvCombobox, JvDBCombobox, Vcl.ExtCtrls,
  udmCadCor, udmConexao;

type
  TfrmConsultaCor = class(TfrmConsultaPai)
    procedure FormCreate(Sender: TObject);
    procedure jvbtbtnPesquisarClick(Sender: TObject);
    procedure jvbtbtnConfirmarClick(Sender: TObject);
    procedure dbgConsultaDblClick(Sender: TObject);
    procedure leConsultaMouseEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaCor: TfrmConsultaCor;

implementation

{$R *.dfm}

procedure TfrmConsultaCor.dbgConsultaDblClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmConsultaCor.FormCreate(Sender: TObject);
begin
  inherited;
  varTabela := 'COR';
  varModalidade :=  '1 = 1';
  cbCampoConsulta.ItemIndex := 1;
  cbCriterioConsulta.ItemIndex := 6;
  fdmConsulta := dmCadCor;
end;

procedure TfrmConsultaCor.jvbtbtnConfirmarClick(Sender: TObject);
begin
  inherited;
//  vCodItem := dsConsulta.DataSet.FieldByName('CODIGO_ITEM').AsInteger;
  Close;
end;

procedure TfrmConsultaCor.jvbtbtnPesquisarClick(Sender: TObject);
begin
  case cbCampoConsulta.ItemIndex of
      0: varCampo := ' CODIGO_COR';
      1: varCampo := ' DESCRICAO_COR';
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

procedure TfrmConsultaCor.leConsultaMouseEnter(Sender: TObject);
begin
  inherited;
  jvbtbtnPesquisar.Click;
end;

end.
