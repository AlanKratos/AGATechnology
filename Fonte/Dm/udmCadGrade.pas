unit udmCadGrade;

interface

uses
  System.SysUtils, System.Classes, udmCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, udmConexao;

type
  TdmCadGrade = class(TdmCadPai)
    QryGradeDetalhe: TFDQuery;
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
  dmCadGrade: TdmCadGrade;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmCadGrade.DataModuleCreate(Sender: TObject);
begin
  inherited;
  self.tabela := 'GRADE';
  self.campochave := 'CODIGO_GRADE';
  self.TipoCadastro := '1 = 1';
end;

procedure TdmCadGrade.QryCadastroAfterInsert(DataSet: TDataSet);
begin
  inherited;
  with QryCadastro do
  Begin
    FieldByName('STATUS_GRADE').Value := 1;
  End;
end;

procedure TdmCadGrade.QryCadastroBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_GRADE').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_GRADE').AsInteger :=
      dmConexao.ProximoCodigo('GRADE')
end;

procedure TdmCadGrade.QryCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;
  QryCadastro.Edit;
end;

end.
