unit uConsultaGrade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPai, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.StdCtrls, Vcl.Buttons,
  JvExButtons, JvBitBtn, JvExStdCtrls, JvCombobox, JvDBCombobox, Vcl.ExtCtrls,
  udmCadGrade, udmConexao;

type
  TfrmConsultaGrade = class(TfrmConsultaPai)
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
  frmConsultaGrade: TfrmConsultaGrade;

implementation

{$R *.dfm}

procedure TfrmConsultaGrade.dbgConsultaDblClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmConsultaGrade.FormCreate(Sender: TObject);
begin
  inherited;
  varTabela := 'GRADE';
  varModalidade :=  '1 = 1';
  cbCampoConsulta.ItemIndex := 1;
  cbCriterioConsulta.ItemIndex := 6;
  fdmConsulta := dmCadGrade;
end;

procedure TfrmConsultaGrade.jvbtbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmConsultaGrade.jvbtbtnPesquisarClick(Sender: TObject);
begin
  case cbCampoConsulta.ItemIndex of
      0: varCampo := ' CODIGO_GRADE';
      1: varCampo := ' DESCRICAO_GRADE';
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

procedure TfrmConsultaGrade.leConsultaMouseEnter(Sender: TObject);
begin
  inherited;
  jvbtbtnPesquisar.Click;
end;

end.
