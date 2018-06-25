unit uConsultaPai;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, JvExStdCtrls, JvCombobox, JvDBCombobox, udmCadPai,
  udmCadFinanceiro, udmCadVenda, JvExButtons, JvBitBtn, JvExDBGrids, JvDBGrid;

type
  TfrmConsultaPai = class(TForm)
    leConsulta: TLabeledEdit;
    dsConsulta: TDataSource;
    FDQueryConsulta: TFDQuery;
    cbCampoConsulta: TJvDBComboBox;
    cbCriterioConsulta: TJvDBComboBox;
    jvbtbtnPesquisar: TJvBitBtn;
    jvbtbtnConfirmar: TJvBitBtn;
    dbgConsulta: TJvDBGrid;
    procedure FormShow(Sender: TObject);
    procedure jvbtbtnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var varTabela, varCampo, varCriterio, varModalidade, varChavePrimaria :string;
    var varJuncao: String;
 // protected
  //  RefDM: TdmCadPai;
  fdmConsulta :TdmCadPai;
  end;

var
  frmConsultaPai: TfrmConsultaPai;

implementation

{$R *.dfm}

procedure TfrmConsultaPai.FormShow(Sender: TObject);
begin
  leConsulta.SetFocus;
end;

procedure TfrmConsultaPai.jvbtbtnPesquisarClick(Sender: TObject);
var
  consulta, teste : String;
  qry : TFDQuery;
begin
  if leConsulta.Text = '' then
  Begin
    ShowMessage('Favor preencher o campo de consulta.');
    leConsulta.SetFocus;
  End
  else
  Begin
    with FDQueryConsulta do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('select * from ' + varTabela);
//      SQL.Add(' ' + varJuncao);
      SQL.Add(' where ' + varCampo + varCriterio);
      SQL.Add(' and ' + varModalidade);
//      SQL.Add(' and ' + varChavePrimaria);
      SQL.Add(' order by ' + varCampo);
      teste := SQL.Text;
      Open();
    End;
  End;
end;
end.
