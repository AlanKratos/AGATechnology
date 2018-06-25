unit udmCadEmpresa;

interface

uses
  System.SysUtils, System.Classes, udmCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, VCL.Dialogs, udmConexao;

type
  TdmCadEmpresa = class(TdmCadPai)
    FDQueryValidaCidade: TFDQuery;
    FDQueryValidaUf: TFDQuery;
    FDQueryPrincipalCODIGO_EMPRESA: TIntegerField;
    FDQueryPrincipalRAZAOSOCIAL_EMPRESA: TStringField;
    FDQueryPrincipalNOMEFANTASIA_EMPRESA: TStringField;
    FDQueryPrincipalALIQAPROVEITAMENTOICMS_EMPRESA: TCurrencyField;
    FDQueryPrincipalALIQCOFINS_EMPRESA: TCurrencyField;
    FDQueryPrincipalALIQCST_EMPRESA: TCurrencyField;
    FDQueryPrincipalALIQIR_EMPRESA: TCurrencyField;
    FDQueryPrincipalALIQISSQN_EMPRESA: TCurrencyField;
    FDQueryPrincipalALIQJUROSBOLETA_EMPRESA: TCurrencyField;
    FDQueryPrincipalALIQJUROSBORDERO_EMPRESA: TCurrencyField;
    FDQueryPrincipalALIQJUROSCHEQUE_EMPRESA: TCurrencyField;
    FDQueryPrincipalALIQPIS_EMPRESA: TCurrencyField;
    FDQueryPrincipalALIQSIMPLES_EMPRESA: TCurrencyField;
    FDQueryPrincipalCONTACAIXA_EMPRESA: TIntegerField;
    FDQueryPrincipalSUBSTITUICAO_EMPRESA: TStringField;
    FDQueryPrincipalCRT_EMPRESA: TIntegerField;
    FDQueryPrincipalCSOSN_EMPRESA: TIntegerField;
    FDQueryPrincipalDATAINCLUSAO_EMPRESA: TSQLTimeStampField;
    FDQueryPrincipalTIPOATIVIDADE_EMPRESA: TIntegerField;
    FDQueryPrincipalDATAINICIOCONTINGENCIA_EMPRESA: TSQLTimeStampField;
    FDQueryPrincipalMOTIVOCONTINGENCIA_EMPRESA: TStringField;
    FDQueryPrincipalDATAFIMCONTINGENCIA_EMPRESA: TSQLTimeStampField;
    FDQueryPrincipalLOGO_EMPRESA: TBlobField;
    FDQueryPrincipalEMPRESAMATRIZ_EMPRESA: TIntegerField;
    FDQueryPrincipalNATUREZAPESSOAJURIDICA_EMPRESA: TIntegerField;
    FDQueryPrincipalOBSERVACAO_EMPRESA: TStringField;
    FDQueryPrincipalSLOGAN_EMPRESA: TStringField;
    FDQueryPrincipalENDERECO_EMPRESA: TStringField;
    FDQueryPrincipalNUMERO_EMPRESA: TStringField;
    FDQueryPrincipalCOMPLEMENTO_EMPRESA: TStringField;
    FDQueryPrincipalCIDADE_EMPRESA: TIntegerField;
    FDQueryPrincipalCSTPIS_EMPRESA: TIntegerField;
    FDQueryPrincipalCSTCOFINS_EMPRESA: TIntegerField;
    FDQueryPrincipalDESCRICAO_CIDADE: TStringField;
    FDQueryPrincipalDESCRICAO_UF: TStringField;
    FDQueryPrincipalSTATUS_EMPRESA: TIntegerField;
    strngfldFDQueryPrincipalBAIRRO_EMPRESA: TStringField;
    intgrfldFDQueryPrincipalUF_CIDADE: TIntegerField;
    FDSchemaAdapterEmpresa: TFDSchemaAdapter;
    strngfldFDQueryPrincipalCNPJ_EMPRESA: TStringField;
    strngfldFDQueryPrincipalIE_EMPRESA: TStringField;
    procedure Validate_Cidade(Sender: TField);
    procedure FDQueryPrincipalBeforePost(DataSet: TDataSet);
    procedure FDQueryPrincipalNewRecord(DataSet: TDataSet);
    procedure FDQueryPrincipalAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCadEmpresa: TdmCadEmpresa;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmCadEmpresa }

procedure TdmCadEmpresa.FDQueryPrincipalAfterInsert(DataSet: TDataSet);
begin
  inherited;
  with FDQueryPrincipal do
  Begin
    FieldByName('STATUS_EMPRESA').Value := 1;
  End;
end;

procedure TdmCadEmpresa.FDQueryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_EMPRESA').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_EMPRESA').AsInteger :=
      dmConexao.ProximoCodigo('EMPRESA')
end;

procedure TdmCadEmpresa.FDQueryPrincipalNewRecord(DataSet: TDataSet);
begin
  inherited;
  FDQueryPrincipal.Edit;
end;

procedure TdmCadEmpresa.Validate_Cidade(Sender: TField);
begin
  FDQueryValidaCidade.Close();
  FDQueryValidaCidade.SQL.Text := 'select DESCRICAO_CIDADE, UF_CIDADE from CIDADE' +
  ' where CIDADE.CODIGO_CIDADE = '+ IntToStr(Sender.AsInteger);
  try
    FDQueryValidaCidade.Open();
  Except
    On E:Exception do
    ShowMessage('Erro cidade: ' + E.Message);
  end;
  if FDQueryValidaCidade.IsEmpty then
  begin
    MessageDlg('Campo código da cidade precisa ser preenchido!!', mtError, [mbOK],0);
    Abort;
  end
  else
  FDQueryPrincipal.FieldByName('DESCRICAO_CIDADE').AsString := FDQueryValidaCidade.FieldByName('DESCRICAO_CIDADE').AsString;

  FDQueryValidaUf.Close();
  FDQueryValidaUf.SQL.Text := 'select DESCRICAO_UF from UF' +
  ' where UF.CODIGO_UF = '+ FDQueryValidaCidade.FieldByName('UF_CIDADE').AsString;
  try
    FDQueryValidaUf.Open();
  Except
    On E:Exception do
    ShowMessage('Erro UF: ' + E.Message);
  end;
  if FDQueryValidaCidade.IsEmpty then
  begin
    MessageDlg('UF não preenchido no cadastro da cidade!', mtError, [mbOK],0);
    Abort;
  end
  else
  FDQueryPrincipal.FieldByName('DESCRICAO_UF').AsString := FDQueryValidaUf.FieldByName('DESCRICAO_UF').AsString
end;

end.
