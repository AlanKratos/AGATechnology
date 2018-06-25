unit relCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxDBSet, Vcl.StdCtrls,
  udmConexao, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxExportPDF, unitVarGlobal;

type
  TfrmRelCliente = class(TForm)
    btImprimir: TButton;
    frxRelCliente: TfrxDBDataset;
    FDQueryCliente: TFDQuery;
    frxPDFExport: TfrxPDFExport;
    frxReport: TfrxReport;
    procedure btImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCliente: TfrmRelCliente;

implementation

{$R *.dfm}

procedure TfrmRelCliente.btImprimirClick(Sender: TObject);
begin
  //varEmpresa := frmRelCliente.Empresa; // o campo que criei para repassar os dados.
  frxReport.Variables.Clear; // limpa a variável do fast report
  frxReport.Variables['EMPRESA'] := QuotedStr(varpubEmpresa); // repassa o dado para a variável do fast report
  frxReport.Variables['USUARIO'] := QuotedStr(varpubUsuario);
  frxReport.ShowReport();
end;


end.
