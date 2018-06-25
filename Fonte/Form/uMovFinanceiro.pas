unit uMovFinanceiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, JvBaseEdits, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, JvExStdCtrls, JvCombobox,
  Vcl.Mask, JvExMask, JvToolEdit, Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, udmConexao, JvComponentBase,
  JvEnterTab;

type
  TfrmMovFinanceiro = class(TForm)
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    sbFiltrar: TSpeedButton;
    deVencInicial: TJvDateEdit;
    deVencFinal: TJvDateEdit;
    jvcbSituacao: TJvComboBox;
    dbgFinanceiro: TJvDBGrid;
    ePessoa: TEdit;
    jvceCodPessoa: TJvCalcEdit;
    dsGrade: TDataSource;
    FDQueryDuplicata: TFDQuery;
    FDQueryCliente: TFDQuery;
    JvEnterAsTab1: TJvEnterAsTab;
    sbGravar: TSpeedButton;
    sbExcluir: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure jvceCodPessoaExit(Sender: TObject);
    function Valida_Cliente(Sender: Integer):String;
    procedure sbFiltrarClick(Sender: TObject);
    procedure dsGradeStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var
    varFinTabela, varFinCampo :string;
    vCliente, vSituacaoDup, vTipoDuplicata :String;
    vDataInicial, vDataFinal :TDateTime;
  end;

var
  frmMovFinanceiro: TfrmMovFinanceiro;

implementation

{$R *.dfm}

procedure TfrmMovFinanceiro.dsGradeStateChange(Sender: TObject);
begin
  Begin
    sbExcluir.Enabled := (dsGrade.DataSet.State = dsBrowse);
    sbGravar.Enabled := (dsGrade.DataSet.State in [dsEdit, dsInsert]);
//  BitBtnCancelar.Enabled := (dsCadastro.DataSet.State in [dsEdit, dsInsert]);
  End
end;

procedure TfrmMovFinanceiro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
  frmMovFinanceiro := nil;
end;

procedure TfrmMovFinanceiro.FormShow(Sender: TObject);
begin
  jvceCodPessoa.SetFocus;
end;

procedure TfrmMovFinanceiro.jvceCodPessoaExit(Sender: TObject);
begin
  ePessoa.Text := Valida_Cliente(jvceCodPessoa.AsInteger);
end;

procedure TfrmMovFinanceiro.sbFiltrarClick(Sender: TObject);
var
  vSituacao :integer;
  vConsulta :String;
begin
  inherited;
  //if ((deVencInicial.Text = '  /  /    ') or (deVencFinal.Text = '  /  /    ')) then
  //Begin
  //  ShowMessage('Vencimento inicial e final precisam ser informados.');
  //End
  //else
  Begin
    with FDQueryDuplicata do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('select * from ' + varFinTabela);
      SQL.Add(' where PESSOA_DUPLICATA = ' + vCliente);
//      SQL.Add(' and VENCIMENTO_DUPLICATA between ' + QuotedStr(DateToStr(vDataInicial)) + --Dessa forma a data fica ao contrario
//              ' and ' + QuotedStr(DateToStr(vDataFinal)));
      SQL.Add(' and VENCIMENTO_DUPLICATA between '+ QuotedStr(FormatDateTime('mm/dd/yyyy',vDataInicial)) +
              ' and ' + QuotedStr(FormatDateTime('mm/dd/yyyy',vDataFinal)));
      SQL.Add(' and VALORABERTO_DUPLICATA ' + vSituacaoDup);
      SQL.Add(' and TIPO_DUPLICATA = ' + vTipoDuplicata);
      SQL.Add(' order by VENCIMENTO_DUPLICATA');
      vConsulta := SQL.Text;
      Open();
    End;
  End;
end;

function TfrmMovFinanceiro.Valida_Cliente(Sender: Integer): String;
begin
  FDQueryCliente.Close();
  FDQueryCliente.SQL.Text := 'select PESSOA.NOME_PESSOA from pessoa ' +
                  'where PESSOA.CODIGO_PESSOA = ' + IntToStr(Sender);
  try
    FDQueryCliente.Open();
  Except
    On E:Exception do
    ShowMessage('Erro Cliente: ' + E.Message);
  end;
  if FDQueryCliente.IsEmpty then
  begin
    MessageDlg('Código do cliente precisa ser preenchido!', mtError, [mbOK],0);
    Abort;
  end
  else
  Result := FDQueryCliente.FieldByName('NOME_PESSOA').AsString;
//  else
//  FDQueryPrincipal.FieldByName('NOME_PESSOA').AsString := FDQueryValidaCliente.FieldByName('NOME_PESSOA').AsString;
end;

end.
