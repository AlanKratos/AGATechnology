program ProjectADM;

uses
  Vcl.Forms,
  Vcl.Controls,
  unitValidaCnpjCpf in 'Fonte\Class\unitValidaCnpjCpf.pas',
  unitVarGlobal in 'Fonte\Class\unitVarGlobal.pas',
  udmCadBanco in 'Fonte\Dm\udmCadBanco.pas',
  udmCadCidade in 'Fonte\Dm\udmCadCidade.pas',
  udmCadCliente in 'Fonte\Dm\udmCadCliente.pas',
  udmCadConta in 'Fonte\Dm\udmCadConta.pas',
  udmCadCor in 'Fonte\Dm\udmCadCor.pas',
  udmCadEmpresa in 'Fonte\Dm\udmCadEmpresa.pas',
  udmCadFinanceiro in 'Fonte\Dm\udmCadFinanceiro.pas',
  udmCadGrade in 'Fonte\Dm\udmCadGrade.pas',
  udmCadPai in 'Fonte\Dm\udmCadPai.pas' {dmCadPai: TDataModule},
  udmCadProduto in 'Fonte\Dm\udmCadProduto.pas' {dmCadProduto: TDataModule},
  udmCadTabelaPreco in 'Fonte\Dm\udmCadTabelaPreco.pas' {dmCadTabelaPreco: TDataModule},
  udmCadVenda in 'Fonte\Dm\udmCadVenda.pas' {dmCadVenda: TDataModule},
  udmConexao in 'Fonte\Dm\udmConexao.pas' {dmConexao: TDataModule},
  udmMovReceber in 'Fonte\Dm\udmMovReceber.pas' {dmMovReceber: TDataModule},
  uCadBanco in 'Fonte\Form\uCadBanco.pas',
  uCadCidade in 'Fonte\Form\uCadCidade.pas',
  uCadCliente in 'Fonte\Form\uCadCliente.pas',
  uCadConta in 'Fonte\Form\uCadConta.pas',
  uCadCor in 'Fonte\Form\uCadCor.pas',
  uCadEmpresa in 'Fonte\Form\uCadEmpresa.pas',
  uCadGrade in 'Fonte\Form\uCadGrade.pas',
  uCadPai in 'Fonte\Form\uCadPai.pas' {frmCadPai},
  uCadProduto in 'Fonte\Form\uCadProduto.pas' {frmCadProduto},
  uCadTabelaPreco in 'Fonte\Form\uCadTabelaPreco.pas' {frmCadTabelaPreco},
  uCadVenda in 'Fonte\Form\uCadVenda.pas' {frmCadVenda},
  uConsultaCliente in 'Fonte\Form\uConsultaCliente.pas',
  uConsultaCor in 'Fonte\Form\uConsultaCor.pas',
  uConsultaGrade in 'Fonte\Form\uConsultaGrade.pas',
  uConsultaItem in 'Fonte\Form\uConsultaItem.pas',
  uConsultaPai in 'Fonte\Form\uConsultaPai.pas' {frmConsultaPai},
  uDetalhamento in 'Fonte\Form\uDetalhamento.pas' {frmDetalhamento},
  uEmissaoNfe in 'Fonte\Form\uEmissaoNfe.pas' {frmEmissaoNfe},
  uLogin in 'Fonte\Form\uLogin.pas' {frmLogin},
  uMovFinanceiro in 'Fonte\Form\uMovFinanceiro.pas' {frmMovFinanceiro},
  uMovReceber in 'Fonte\Form\uMovReceber.pas' {frmMovReceber},
  uParametro in 'Fonte\Form\uParametro.pas' {frmParametro},
  uPrincipal in 'Fonte\Form\uPrincipal.pas' {frmPrincipal},
  relCliente in 'Fonte\Report\relCliente.pas' {frmRelCliente};

{$R *.res}

var
  StartMainForm :Boolean;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;


// CODIGO CORRETO ABAIXO
{  Application.Initialize;
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TfrmCadCidade, frmCadCidade);

  varLogin := TfrmLogin.Create(nil); // setei nil para o sistema nao assumir o form como principal
  try
   // *** se o login for válido, o retorno será mrOk e StartMainForm se tornará TRUE
    StartMainForm := varLogin.ShowModal = mrOk;
  finally
    varLogin.Release; // *** após utilizada, a tela de login é eliminada da memória
  end;

  if StartMainForm then  // *** se a senha era válida inicia a aplicação normalmente
  begin
    Application.CreateForm(TfrmPrincipal, frmPrincipal);
    Application.Run;
  end else  // *** do contrário, terminamos a aplicação
    Application.Terminate; }

end.
