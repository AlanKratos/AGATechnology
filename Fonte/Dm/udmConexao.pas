unit udmConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TdmConexao = class(TDataModule)
    FDConexao: TFDConnection;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    FDQueryProximoCodigo: TFDQuery;
    FDTransactionProximoCodigo: TFDTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
    function ProximoCodigo(ATabela :String): Int64;
  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmConexao }

function TdmConexao.ProximoCodigo(ATabela: String): Int64;
begin
  with FDQueryProximoCodigo do
  begin
    if not Transaction.Active then
      Transaction.StartTransaction;
      Close;
      SQL.Clear;
      SQL.Add('select AUTOINCREMENTOS.DESCRICAO_AUTOINCREMENTOS, AUTOINCREMENTOS.CODIGO_AUTOINCREMENTOS');
      SQL.Add('from AUTOINCREMENTOS');
      SQL.Add('where AUTOINCREMENTOS.DESCRICAO_AUTOINCREMENTOS = ' +
      QuotedStr(ATabela));
      SQL.Add('for update'); //não deixa 2 pessoas gravarem informações da mesta tabela ao mesmo tempo
      Open();
    // comando abaixo serve para caso alguem tente salvar ao mesmo tempo fica na fila aguardando
    while True do
    begin
      try
        Close;
        Open();
      Except
        on E: Exception do
        begin
          continue;
        end;

      end;
      if IsEmpty then
      begin
        Edit;
        FieldByName('DESCRICAO_AUTOINCREMENTOS').AsString := ATabela;
        Result := 1
      end
      else
      begin
        Result := FieldByName('CODIGO_AUTOINCREMENTOS').AsLargeInt;
      end;
      Edit;
      FieldByName('CODIGO_AUTOINCREMENTOS').AsLargeInt := Result + 1;
      Post;
      Break;
    end;
    if Transaction.Active then
      Transaction.Commit;
  end;
end;

end.
