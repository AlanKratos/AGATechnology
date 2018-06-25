unit uParametro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, JvDBCheckBox,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, udmConexao, JvDataSource;

type
  TfrmParametro = class(TForm)
    dbcbControlaCor: TJvDBCheckBox;
    dbcbControlaGrade: TJvDBCheckBox;
    FDQueryParametro: TFDQuery;
    dbcbPedidoGeraFinanceiro: TJvDBCheckBox;
    dsParametro: TJvDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParametro: TfrmParametro;

implementation

{$R *.dfm}

end.
