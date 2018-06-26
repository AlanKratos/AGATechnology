unit udmCadCor;

interface

uses
  System.SysUtils, System.Classes, udmCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, udmConexao;

type
  TdmCadCor = class(TdmCadPai)
    procedure QryCadastroAfterInsert(DataSet: TDataSet);
    procedure QryCadastroBeforePost(DataSet: TDataSet);
    procedure QryCadastroNewRecord(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCadCor: TdmCadCor;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmCadCor.DataModuleCreate(Sender: TObject);
begin
  inherited;
  self.tabela := 'COR';
  self.campochave := 'CODIGO_COR';
  self.TipoCadastro := '1 = ';
end;

procedure TdmCadCor.QryCadastroAfterInsert(DataSet: TDataSet);
begin
  inherited;
  with QryCadastro do
  Begin
    FieldByName('STATUS_COR').Value := 1;
  End;
end;

procedure TdmCadCor.QryCadastroBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_COR').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_COR').AsInteger :=
      dmConexao.ProximoCodigo('COR')
end;

procedure TdmCadCor.QryCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;
  QryCadastro.Edit;
end;

end.
