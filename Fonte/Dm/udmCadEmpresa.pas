unit udmCadEmpresa;

interface

uses
  System.SysUtils, System.Classes, udmCadPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, VCL.Dialogs, udmConexao;

type
  TdmCadEmpresa = class(TdmCadPai)
    QryValidaCidade: TFDQuery;
    QryValidaUf: TFDQuery;
    FDQueryPrincipalCODIGO_EMPRESA: TIntegerField;
    QryPrincipalRAZAOSOCIAL_EMPRESA: TStringField;
    QryPrincipalNOMEFANTASIA_EMPRESA: TStringField;
    QryPrincipalALIQAPROVEITAMENTOICMS_EMPRESA: TCurrencyField;
    QryPrincipalALIQCOFINS_EMPRESA: TCurrencyField;
    QryPrincipalALIQCST_EMPRESA: TCurrencyField;
    QryPrincipalALIQIR_EMPRESA: TCurrencyField;
    QryPrincipalALIQISSQN_EMPRESA: TCurrencyField;
    QryPrincipalALIQJUROSBOLETA_EMPRESA: TCurrencyField;
    QryPrincipalALIQJUROSBORDERO_EMPRESA: TCurrencyField;
    QryPrincipalALIQJUROSCHEQUE_EMPRESA: TCurrencyField;
    QryPrincipalALIQPIS_EMPRESA: TCurrencyField;
    QryPrincipalALIQSIMPLES_EMPRESA: TCurrencyField;
    QryPrincipalCONTACAIXA_EMPRESA: TIntegerField;
    QryPrincipalSUBSTITUICAO_EMPRESA: TStringField;
    QryPrincipalCRT_EMPRESA: TIntegerField;
    QryPrincipalCSOSN_EMPRESA: TIntegerField;
    QryPrincipalDATAINCLUSAO_EMPRESA: TSQLTimeStampField;
    QryPrincipalTIPOATIVIDADE_EMPRESA: TIntegerField;
    QryPrincipalDATAINICIOCONTINGENCIA_EMPRESA: TSQLTimeStampField;
    QryPrincipalMOTIVOCONTINGENCIA_EMPRESA: TStringField;
    QryPrincipalDATAFIMCONTINGENCIA_EMPRESA: TSQLTimeStampField;
    QryPrincipalLOGO_EMPRESA: TBlobField;
    QryPrincipalEMPRESAMATRIZ_EMPRESA: TIntegerField;
    QryPrincipalNATUREZAPESSOAJURIDICA_EMPRESA: TIntegerField;
    QryPrincipalOBSERVACAO_EMPRESA: TStringField;
    QryPrincipalSLOGAN_EMPRESA: TStringField;
    QryPrincipalENDERECO_EMPRESA: TStringField;
    QryPrincipalNUMERO_EMPRESA: TStringField;
    QryPrincipalCOMPLEMENTO_EMPRESA: TStringField;
    QryPrincipalCIDADE_EMPRESA: TIntegerField;
    QryPrincipalCSTPIS_EMPRESA: TIntegerField;
    QryPrincipalCSTCOFINS_EMPRESA: TIntegerField;
    QryPrincipalDESCRICAO_CIDADE: TStringField;
    QryPrincipalDESCRICAO_UF: TStringField;
    QryPrincipalSTATUS_EMPRESA: TIntegerField;
    strngfldQryPrincipalBAIRRO_EMPRESA: TStringField;
    intgrfldQryPrincipalUF_CIDADE: TIntegerField;
    FDSchemaAdapterEmpresa: TFDSchemaAdapter;
    strngfldQryPrincipalCNPJ_EMPRESA: TStringField;
    strngfldQryPrincipalIE_EMPRESA: TStringField;
    procedure Validate_Cidade(Sender: TField);
    procedure QryPrincipalBeforePost(DataSet: TDataSet);
    procedure QryPrincipalNewRecord(DataSet: TDataSet);
    procedure QryPrincipalAfterInsert(DataSet: TDataSet);
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

procedure TdmCadEmpresa.QryPrincipalAfterInsert(DataSet: TDataSet);
begin
  inherited;
  with QryPrincipal do
  Begin
    FieldByName('STATUS_EMPRESA').Value := 1;
  End;
end;

procedure TdmCadEmpresa.QryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_EMPRESA').AsInteger = 0) then
    DataSet.FieldByName('CODIGO_EMPRESA').AsInteger :=
      dmConexao.ProximoCodigo('EMPRESA')
end;

procedure TdmCadEmpresa.QryPrincipalNewRecord(DataSet: TDataSet);
begin
  inherited;
  QryPrincipal.Edit;
end;

procedure TdmCadEmpresa.Validate_Cidade(Sender: TField);
begin
  QryValidaCidade.Close();
  QryValidaCidade.SQL.Text := 'select DESCRICAO_CIDADE, UF_CIDADE from CIDADE' +
  ' where CIDADE.CODIGO_CIDADE = '+ IntToStr(Sender.AsInteger);
  try
    QryValidaCidade.Open();
  Except
    On E:Exception do
    ShowMessage('Erro cidade: ' + E.Message);
  end;
  if QryValidaCidade.IsEmpty then
  begin
    MessageDlg('Campo código da cidade precisa ser preenchido!!', mtError, [mbOK],0);
    Abort;
  end
  else
  QryPrincipal.FieldByName('DESCRICAO_CIDADE').AsString := QryValidaCidade.FieldByName('DESCRICAO_CIDADE').AsString;

  QryValidaUf.Close();
  QryValidaUf.SQL.Text := 'select DESCRICAO_UF from UF' +
  ' where UF.CODIGO_UF = '+ QryValidaCidade.FieldByName('UF_CIDADE').AsString;
  try
    QryValidaUf.Open();
  Except
    On E:Exception do
    ShowMessage('Erro UF: ' + E.Message);
  end;
  if QryValidaCidade.IsEmpty then
  begin
    MessageDlg('UF não preenchido no cadastro da cidade!', mtError, [mbOK],0);
    Abort;
  end
  else
  QryPrincipal.FieldByName('DESCRICAO_UF').AsString := QryValidaUf.FieldByName('DESCRICAO_UF').AsString
end;

end.
