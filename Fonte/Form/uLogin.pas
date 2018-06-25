unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvComponentBase, JvCipher, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, udmConexao, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvExStdCtrls, JvEdit, uPrincipal,
  unitVarGlobal, JvEnterTab;

type
  TfrmLogin = class(TForm)
    JvVigenereCipher1: TJvVigenereCipher;
    FDQueryLogin: TFDQuery;
    btLogin: TButton;
    btSalvar: TButton;
    meSenha: TMaskEdit;
    eUsuario: TEdit;
    FDTransactionLogin: TFDTransaction;
    JvEnterAsTab1: TJvEnterAsTab;
    procedure btSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FDQueryLoginBeforePost(DataSet: TDataSet);
    procedure btLoginClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.btLoginClick(Sender: TObject);
Var
  SenhaCrip : String;
  Usuario : String;
  Result : String;
begin
  JvVigenereCipher1.Key := 'ADM';
  JvVigenereCipher1.Decoded := meSenha.Text;
  Result := JvVigenereCipher1.Encoded;   // Exibe a string encriptada
  Usuario := eUsuario.Text;
  FDQueryLogin.Close;
  FDQueryLogin.SQL.Clear;
  FDQueryLogin.SQL.Add('select DESCRICAO_USUARIO, SENHA_USUARIO FROM USUARIO WHERE DESCRICAO_USUARIO = ' + QuotedStr(eUsuario.Text));
  FDQueryLogin.Open;
  if ((Usuario = FDQueryLogin.FieldByName('DESCRICAO_USUARIO').AsString)) and
    ((Result = FDQueryLogin.FieldByName('SENHA_USUARIO').AsString)) then
  begin




    ShowMessage('Login Efetuado com sucesso!');
    FDQueryLogin.SQL.Clear;
    //ModalResult := mrOk;

    if frmPrincipal = nil then
      frmPrincipal := TfrmPrincipal.Create(self);
    if frmPrincipal.WindowState = wsMinimized then
      frmPrincipal.WindowState := wsNormal
    else
    frmPrincipal.Show;
  end
  else
  begin
    ShowMessage('Usuário e/ou Senha inválido!');
    FDQueryLogin.SQL.Clear;
    meSenha.SetFocus;
  end;
  varpubUsuario := eUsuario.Text;
end;

procedure TfrmLogin.btSalvarClick(Sender: TObject);
Var
  ContSenha, ContRepitida: Integer;
  Senha: String;
begin
// testando se campo Usuário está preenchidos
  if eUsuario.Text = '' then begin
    ShowMessage('Favor informar Usuário!');
    eUsuario.SetFocus;
    Exit;
  end;
// Testando de campo senha está preenchido
  if meSenha.Text = '' then begin
    ShowMessage('Favor informar a senha!');
    meSenha.SetFocus;
    Exit;
  end;
//Testando qtd mínima de caracteres em uma senha
  ContSenha := (Length(meSenha.Text));
//ContRepitida := (Length(EditRepitida.Text));
//  if (ContSenha) < 5  then begin
//     ShowMessage('Senha deve ter no mínimo 6 caracteres!');
//     meSenha.SetFocus;
//     Exit;
//  end;
  // Testando se as senhas são compatíveis
  {if EditSenha.Text <> EditRepitida.Text then begin
     ShowMessage('Senhas não compatíveis!');
     EditSenha.SetFocus;
     Exit;
  end;}
  // Obrigatorio para uma criptografia
  try
    Begin
      JvVigenereCipher1.Key := 'ADM'; /// chave
      JvVigenereCipher1.Decoded := meSenha.Text;
      Senha := JvVigenereCipher1.Encoded;   // Exibe a string encriptada
      FDQueryLogin.Append;
      FDQueryLogin.FieldByName('DESCRICAO_USUARIO').AsString := eUsuario.Text;
      FDQueryLogin.FieldByName('SENHA_USUARIO').AsString := JvVigenereCipher1.Encoded;
      FDQueryLogin.Post;
      FDQueryLogin.ApplyUpdates();
      FDQueryLogin.CommitUpdates;
      ShowMessage('Login Cadastrado com sucesso!');
    End
  except
  On E:Exception do
    Begin
      ShowMessage('Login já cadastro, favor utilizar outro. ' + E.Message);
      exit;
    End;
  end;

end;

procedure TfrmLogin.FDQueryLoginBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) and
    (DataSet.FieldByName('CODIGO_USUARIO').AsInteger = 0) then
  Begin
    DataSet.FieldByName('CODIGO_USUARIO').AsInteger :=
      dmConexao.ProximoCodigo('USUARIO');
    DataSet.FieldByName('STATUS_USUARIO').AsInteger := 1;
  End
  else
  Begin
    DataSet.Insert;
    DataSet.FieldByName('CODIGO_USUARIO').AsInteger :=
      dmConexao.ProximoCodigo('USUARIO')
  End;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  with FDQueryLogin do
  Begin
    Close;
    Open();
  End;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  eUsuario.SetFocus;
end;

end.
