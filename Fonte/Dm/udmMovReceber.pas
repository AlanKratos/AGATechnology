unit udmMovReceber;

interface

uses
  System.SysUtils, System.Classes, udmCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, udmConexao, Vcl.Dialogs;

type
  TdmMovReceber = class(TdmCadPai)
    FDQueryPrincipalNOME_PESSOA: TStringField;
    FDQueryPrincipalCODIGO_DUPLICATA: TLargeintField;
    FDQueryPrincipalTIPO_DUPLICATA: TIntegerField;
    FDQueryPrincipalEMPRESA_DUPLICATA: TIntegerField;
    FDQueryPrincipalPESSOA_DUPLICATA: TIntegerField;
    FDQueryPrincipalEMISSAO_DUPLICATA: TSQLTimeStampField;
    FDQueryPrincipalDOCUMENTO_DUPLICATA: TStringField;
    FDQueryPrincipalVENCIMENTO_DUPLICATA: TSQLTimeStampField;
    FDQueryPrincipalVALORDUPLICATA_DUPLICATA: TBCDField;
    FDQueryPrincipalVALORPAGO_DUPLICATA: TBCDField;
    FDQueryPrincipalDATAPAGAMENTO_DUPLICATA: TSQLTimeStampField;
    FDQueryPrincipalVALORABERTO_DUPLICATA: TBCDField;
    procedure FDQueryPrincipalBeforePost(DataSet: TDataSet);
    procedure FDQueryPrincipalNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMovReceber: TdmMovReceber;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmMovReceber }

procedure TdmMovReceber.FDQueryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_DUPLICATA').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_DUPLICATA').AsInteger :=
      dmConexao.ProximoCodigo('DUPLICATA')
end;

procedure TdmMovReceber.FDQueryPrincipalNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('TIPO_DUPLICATA').AsInteger := 1;
  QryPrincipal.Edit;
end;


end.
