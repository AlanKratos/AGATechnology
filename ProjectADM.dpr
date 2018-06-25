program ProjectADM;

uses
  Vcl.Forms,
  Vcl.Controls,
  unitValidaCnpjCpf in 'Class\unitValidaCnpjCpf.pas',
  unitVarGlobal in 'Class\unitVarGlobal.pas',
  udmCadBanco in 'Dm\udmCadBanco.pas',
  udmCadCidade in 'Dm\udmCadCidade.pas',
  udmCadCliente in 'Dm\udmCadCliente.pas',
  udmCadConta in 'Dm\udmCadConta.pas',
  udmCadCor in 'Dm\udmCadCor.pas',
  udmCadEmpresa in 'Dm\udmCadEmpresa.pas',
  udmCadFinanceiro in 'Dm\udmCadFinanceiro.pas',
  udmCadGrade in 'Dm\udmCadGrade.pas',
  udmCadPai in 'Dm\udmCadPai.pas' {dmCadPai: TDataModule},
  udmCadProduto in 'Dm\udmCadProduto.pas' {dmCadProduto: TDataModule},
  udmCadTabelaPreco in 'Dm\udmCadTabelaPreco.pas' {dmCadTabelaPreco: TDataModule},
  udmCadVenda in 'Dm\udmCadVenda.pas' {dmCadVenda: TDataModule},
  udmConexao in 'Dm\udmConexao.pas' {dmConexao: TDataModule},
  udmDocEntrada in 'Dm\udmDocEntrada.pas' {dmDocEntrada: TDataModule},
  udmDocSaida in 'Dm\udmDocSaida.pas' {dmDocSaida: TDataModule},
  udmMovReceber in 'Dm\udmMovReceber.pas' {dmMovReceber: TDataModule},
  uCadBanco in 'Form\uCadBanco.pas',
  uCadCidade in 'Form\uCadCidade.pas',
  uCadCliente in 'Form\uCadCliente.pas',
  uCadCompra in 'Form\uCadCompra.pas',
  uCadConta in 'Form\uCadConta.pas',
  uCadCor in 'Form\uCadCor.pas',
  uCadEmpresa in 'Form\uCadEmpresa.pas',
  uCadGrade in 'Form\uCadGrade.pas',
  uCadPai in 'Form\uCadPai.pas' {frmCadPai},
  uCadProduto in 'Form\uCadProduto.pas' {frmCadProduto},
  uCadTabelaPreco in 'Form\uCadTabelaPreco.pas' {frmCadTabelaPreco},
  uCadVenda in 'Form\uCadVenda.pas' {frmCadVenda},
  uCarregaXML in 'Form\uCarregaXML.pas' {frmCarregaXML},
  uConsultaCliente in 'Form\uConsultaCliente.pas',
  uConsultaCor in 'Form\uConsultaCor.pas',
  uConsultaGrade in 'Form\uConsultaGrade.pas',
  uConsultaItem in 'Form\uConsultaItem.pas',
  uConsultaPai in 'Form\uConsultaPai.pas' {frmConsultaPai},
  uDetalhamento in 'Form\uDetalhamento.pas' {frmDetalhamento},
  uDocSaida in 'Form\uDocSaida.pas' {frmDocSaida},
  uEmissaoNfe in 'Form\uEmissaoNfe.pas' {frmEmissaoNfe},
  uLogin in 'Form\uLogin.pas' {frmLogin},
  uMovFinanceiro in 'Form\uMovFinanceiro.pas' {frmMovFinanceiro},
  uMovReceber in 'Form\uMovReceber.pas' {frmMovReceber},
  uParametro in 'Form\uParametro.pas' {frmParametro},
  uPrincipal in 'Form\uPrincipal.pas' {frmPrincipal},
  relCliente in 'Report\relCliente.pas' {frmRelCliente};

{$R *.res}

var
  StartMainForm :Boolean;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmCadPai, dmCadPai);
  Application.CreateForm(TdmCadProduto, dmCadProduto);
  Application.CreateForm(TdmCadTabelaPreco, dmCadTabelaPreco);
  Application.CreateForm(TdmCadVenda, dmCadVenda);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TdmDocEntrada, dmDocEntrada);
  Application.CreateForm(TdmDocSaida, dmDocSaida);
  Application.CreateForm(TdmMovReceber, dmMovReceber);
  Application.CreateForm(TfrmCadPai, frmCadPai);
  Application.CreateForm(TfrmCadProduto, frmCadProduto);
  Application.CreateForm(TfrmCadTabelaPreco, frmCadTabelaPreco);
  Application.CreateForm(TfrmCadVenda, frmCadVenda);
  Application.CreateForm(TfrmCarregaXML, frmCarregaXML);
  Application.CreateForm(TfrmConsultaPai, frmConsultaPai);
  Application.CreateForm(TfrmDetalhamento, frmDetalhamento);
  Application.CreateForm(TfrmDocSaida, frmDocSaida);
  Application.CreateForm(TfrmEmissaoNfe, frmEmissaoNfe);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmMovFinanceiro, frmMovFinanceiro);
  Application.CreateForm(TfrmMovReceber, frmMovReceber);
  Application.CreateForm(TfrmParametro, frmParametro);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmRelCliente, frmRelCliente);
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
