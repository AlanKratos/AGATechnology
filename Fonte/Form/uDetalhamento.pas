unit uDetalhamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, udmCadProduto, Data.DB, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.StdCtrls, JvDataSource,
  Datasnap.DBClient, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Buttons;

type
  TfrmDetalhamento = class(TForm)
    dbgCor: TJvDBGrid;
    dbgItemCor: TJvDBGrid;
    dbgGrade: TJvDBGrid;
    dbgItemGrade: TJvDBGrid;
    JvDBGrid5: TJvDBGrid;
    lCores: TLabel;
    lCoresSelecionadas: TLabel;
    lGrades: TLabel;
    lGradesSelecionadas: TLabel;
    dsCor: TJvDataSource;
    dsItemCor: TJvDataSource;
    dsGrade: TJvDataSource;
    dsItemGrade: TJvDataSource;
    dsCombinacao: TJvDataSource;
    cdsCor: TClientDataSet;
    cdsItemCor: TClientDataSet;
    cdsGrade: TClientDataSet;
    cdsItemGrade: TClientDataSet;
    cdsCombinacao: TClientDataSet;
    sbGerar: TButton;
    sbConfirmar: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure dbgCorDblClick(Sender: TObject);
    procedure dbgItemCorDblClick(Sender: TObject);
    procedure dbgGradeDblClick(Sender: TObject);
    procedure dbgItemGradeDblClick(Sender: TObject);
    procedure sbGerarClick(Sender: TObject);
    procedure sbConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
    procedure InserirDetalhamento(pCodCor:Integer; pNomeCor:String; pCodGrade:Integer; pNomeGrade:String);
  public
    { Public declarations }
  end;

var
  frmDetalhamento: TfrmDetalhamento;

implementation

{$R *.dfm}

procedure TfrmDetalhamento.dbgGradeDblClick(Sender: TObject);
begin
  with dmCadProduto do
    Begin
      cdsItemGrade.Insert;
      cdsItemGrade.FieldByName('CodigoItemGrade').AsInteger := cdsGrade.FieldByName('CodigoGrade').AsInteger;
      cdsItemGrade.FieldByName('NomeItemGrade').AsString := cdsGrade.FieldByName('NomeGrade').AsString;
      cdsItemGrade.Post;
      cdsGrade.Delete;
    End;
end;

procedure TfrmDetalhamento.dbgItemCorDblClick(Sender: TObject);
begin
  with dmCadProduto do
    Begin
      cdsCor.Insert;
      cdsCor.FieldByName('CodigoCor').AsInteger := cdsItemCor.FieldByName('CodigoItemCor').AsInteger;
      cdsCor.FieldByName('NomeCor').AsString := cdsItemCor.FieldByName('NomeItemCor').AsString;
      cdsCor.Post;
      cdsItemCor.Delete;
    End;
end;

procedure TfrmDetalhamento.dbgItemGradeDblClick(Sender: TObject);
begin
  with dmCadProduto do
    Begin
      cdsGrade.Insert;
      cdsGrade.FieldByName('CodigoGrade').AsInteger := cdsItemGrade.FieldByName('CodigoItemGrade').AsInteger;
      cdsGrade.FieldByName('NomeGrade').AsString := cdsItemGrade.FieldByName('NomeItemGrade').AsString;
      cdsGrade.Post;
      cdsItemGrade.Delete;
    End;
end;

procedure TfrmDetalhamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
  frmDetalhamento := nil;
end;

procedure TfrmDetalhamento.FormCreate(Sender: TObject);
begin
  with dmCadProduto do
  Begin
    if QryCadastro.FieldByName('CONTROLACOR_ITEM').AsString = 'S' then
    Begin
    //DBGrid Cor
      QryCor.close;
      QryCor.SQL.Clear;
      QryCor.SQL.Add('select COR.CODIGO_COR, COR.DESCRICAO_COR, ' +
          'COR.ABREVIACAO_COR, COR.STATUS_COR ' +
          'from COR ' +
          'where not exists(select ITEM_COR.CODIGO_ITEM_COR from ITEM_COR ' +
          'where ITEM_COR.COR_ITEM_COR = COR.CODIGO_COR ' +
          'and ITEM_COR.ITEM_ITEM_COR = ' + QryCadastro.FieldByName('CODIGO_ITEM').AsString + ')');
      QryCor.open;
      cdsCor.DisableControls;
      cdsCor.Close;
      cdsCor.FieldDefs.Clear;
      cdsCor.FieldDefs.Add('CodigoCor',     ftInteger);
      cdsCor.FieldDefs.Add('NomeCor',       ftString, 20);
      cdsCor.CreateDataSet;
      cdsCor.Open;
      cdsCor.EnableControls;
      cdsCor.FieldByName('NomeCor').DisplayLabel := 'Cor';
      //fdqDaTela.Data := FDQueryCor.Data; Otimizacao
      QryCor.First;
      while not QryCor.Eof do
      Begin
        cdsCor.Insert;
        cdsCor.FieldByName('CodigoCor').AsInteger := QryCor.FieldByName('CODIGO_COR').AsInteger;
        cdsCor.FieldByName('NomeCor').AsString := QryCor.FieldByName('DESCRICAO_COR').AsString;
        cdsCor.Post;
        QryCor.Next;
      End;
      dsCor.DataSet := cdsCor;
      //DBGrid ItemCor
      QryItemCor.Close;
      QryItemCor.SQL.Clear;
      QryItemCor.SQL.Add('select ITEM_COR.CODIGO_ITEM_COR, ITEM_COR.ITEM_ITEM_COR, ' +
          'ITEM_COR.COR_ITEM_COR, COR.DESCRICAO_COR ' +
          'from ITEM_COR ' +
          'left join COR on (COR.CODIGO_COR = ITEM_COR.COR_ITEM_COR) ' +
          'where ITEM_COR.ITEM_ITEM_COR = ' + QryCadastro.FieldByName('CODIGO_ITEM').AsString);
      QryItemCor.Open;

      cdsItemCor.DisableControls;
      cdsItemCor.Close;
      cdsItemCor.FieldDefs.Clear;
      cdsItemCor.FieldDefs.Add('CodigoItemCor',     ftInteger);
      cdsItemCor.FieldDefs.Add('NomeItemCor',       ftString, 20);
      cdsItemCor.CreateDataSet;
      cdsItemCor.Open;
      cdsItemCor.EnableControls;
      cdsItemCor.FieldByName('NomeItemCor').DisplayLabel := 'Cor Selecionada';
      //fdqDaTela.Data := FDQueryCor.Data; Otimizacao

      QryItemCor.First;
      while not QryItemCor.Eof do
      Begin
        cdsItemCor.Insert;
        cdsItemCor.FieldByName('CodigoItemCor').AsInteger := QryItemCor.FieldByName('COR_ITEM_COR').AsInteger;
        cdsItemCor.FieldByName('NomeItemCor').AsString := QryItemCor.FieldByName('DESCRICAO_COR').AsString;
        cdsItemCor.Post;
        QryItemCor.Next;
      End;
      dsItemCor.DataSet := cdsItemCor;

      dbgCor.Visible := True;
      dbgItemCor.Visible := True;
      lCores.Visible := True;
      lCoresSelecionadas.Visible := True;
    End
    Else
    Begin
      dbgCor.Visible := False;
      dbgItemCor.Visible := False;
      lCores.Visible := False;
      lCoresSelecionadas.Visible := False;
    End;

    if QryCadastro.FieldByName('CONTROLACOR_ITEM').AsString = 'S'  then
    Begin
      //DBGrid Grade
      QryGrade.close;
      QryGrade.sql.Clear;
      QryGrade.sql.Add('select GRADE.CODIGO_GRADE, GRADE.DESCRICAO_GRADE, ' +
          'GRADE.STATUS_GRADE ' +
          'from GRADE ' +
          'where not exists(select ITEM_GRADE.CODIGO_ITEM_GRADE from ITEM_GRADE ' +
                 'where ITEM_GRADE.GRADE_ITEM_GRADE = GRADE.CODIGO_GRADE ' +
                 'and ITEM_GRADE.ITEM_ITEM_GRADE = ' + QryCadastro.FieldByName('CODIGO_ITEM').AsString + ')');
      QryGrade.open;
      cdsGrade.DisableControls;
      cdsGrade.Close;
      cdsGrade.FieldDefs.Clear;
      cdsGrade.FieldDefs.Add('CodigoGrade',     ftInteger);
      cdsGrade.FieldDefs.Add('NomeGrade',       ftString, 20);
      cdsGrade.CreateDataSet;
      cdsGrade.Open;
      cdsGrade.EnableControls;
      cdsGrade.FieldByName('NomeGrade').DisplayLabel := 'Grade';
      QryGrade.First;
      while not QryGrade.Eof do
      Begin
        cdsGrade.Insert;
        cdsGrade.FieldByName('CodigoGrade').AsInteger := QryGrade.FieldByName('CODIGO_GRADE').AsInteger;
        cdsGrade.FieldByName('NomeGrade').AsString := QryGrade.FieldByName('DESCRICAO_GRADE').AsString;
        cdsGrade.Post;
        QryGrade.Next;
      End;
      dsGrade.DataSet := cdsGrade;

      //DBGrid ItemGrade
      QryItemGrade.Close;
      QryItemGrade.sql.Clear;
      QryItemGrade.sql.Add('select ITEM_GRADE.CODIGO_ITEM_GRADE, ITEM_GRADE.ITEM_ITEM_GRADE, ' +
          'ITEM_GRADE.GRADE_ITEM_GRADE, GRADE.DESCRICAO_GRADE ' +
          'from ITEM_GRADE ' +
          'left join GRADE on (GRADE.CODIGO_GRADE = ITEM_GRADE.GRADE_ITEM_GRADE) ' +
          'where ITEM_GRADE.ITEM_ITEM_GRADE = ' + QryCadastro.FieldByName('CODIGO_ITEM').AsString);
      QryItemGrade.Open;
      cdsItemGrade.DisableControls;
      cdsItemGrade.Close;
      cdsItemGrade.FieldDefs.Clear;
      cdsItemGrade.FieldDefs.Add('CodigoItemGrade',     ftInteger);
      cdsItemGrade.FieldDefs.Add('NomeItemGrade',       ftString, 20);
      cdsItemGrade.CreateDataSet;
      cdsItemGrade.Open;
      cdsItemGrade.EnableControls;
      cdsItemGrade.FieldByName('NomeItemGrade').DisplayLabel := 'Grade Selecionada';
      QryItemGrade.First;
      while not QryItemGrade.Eof do
      Begin
        cdsItemGrade.Insert;
        cdsItemGrade.FieldByName('CodigoItemGrade').AsInteger := QryItemGrade.FieldByName('GRADE_ITEM_GRADE').AsInteger;
        cdsItemGrade.FieldByName('NomeItemGrade').AsString := QryItemGrade.FieldByName('DESCRICAO_GRADE').AsString;
        cdsItemGrade.Post;
        QryItemGrade.Next;
      End;
      dsItemGrade.DataSet := cdsItemGrade;

      dbgGrade.Visible := True;
      dbgItemGrade.Visible := True;
      lGrades.Visible := True;
      lGradesSelecionadas.Visible := True;
    End
    Else
    Begin
      dbgGrade.Visible := False;
      dbgItemGrade.Visible := False;
      lGrades.Visible := False;
      lGradesSelecionadas.Visible := False;
    End;
  End;
end;

procedure TfrmDetalhamento.InserirDetalhamento(pCodCor:Integer; pNomeCor:String; pCodGrade:Integer; pNomeGrade:String);
var
  vCodCor, vNomeCor, vCodGrade, vNomeGrade: Integer;
begin
  with dmCadProduto do
  Begin
    cdsCombinacao.Insert;
    cdsCombinacao.FieldByName('CodCorComb').AsInteger := pCodCor;//cdsItemCor.FieldByName('CodigoItemCor').AsInteger;
    cdsCombinacao.FieldByName('NomeCorComb').AsString := pNomeCor;//cdsItemCor.FieldByName('NomeItemCor').AsString;
    cdsCombinacao.FieldByName('CodGradeComb').AsInteger := pCodGrade;//cdsItemGrade.FieldByName('CodigoItemGrade').AsInteger;
    cdsCombinacao.FieldByName('NomeGradeComb').AsString := pNomeGrade;//cdsItemGrade.FieldByName('NomeItemGrade').AsString;
    cdsCombinacao.Post;
  End;
end;

procedure TfrmDetalhamento.sbConfirmarClick(Sender: TObject);
  Label FimCor, FimGrade;
Var
  LogicoCor, LogicoGrade: Boolean;
begin
  cdsCombinacao.First;
  while not cdsCombinacao.Eof do
  Begin
  //Item Detalhe
    with dmCadProduto do
    Begin
      QryItemDetalhe.Insert;
      QryItemDetalhe.FieldByName('COR_ITEM_DETALHE').AsInteger :=
          cdsCombinacao.FieldByName('CodCorComb').AsInteger;
      QryItemDetalhe.FieldByName('DESCRICAO_COR').AsString :=
          cdsCombinacao.FieldByName('NomeCorComb').AsString;
      QryItemDetalhe.FieldByName('GRADE_ITEM_DETALHE').AsInteger :=
          cdsCombinacao.FieldByName('CodGradeComb').AsInteger;
      QryItemDetalhe.FieldByName('DESCRICAO_GRADE').AsString :=
          cdsCombinacao.FieldByName('NomeGradeComb').AsString;
      QryItemDetalhe.FieldByName('STATUS_ITEM_DETALHE').AsInteger := 1;
    End;
    cdsCombinacao.Next;
  End;

  //Item Cor
  if (dmCadProduto.QryCadastro.FieldByName('CONTROLAGRADE_ITEM').AsString = 'S') then
  Begin
    cdsItemCor.First;
    while not cdsItemCor.Eof do
    Begin
      dmCadProduto.QryItemCor.First;
      while not dmCadProduto.QryItemCor.Eof do
      Begin
        if (dmCadProduto.QryItemCor.FieldByName('COR_ITEM_COR').AsInteger =
               cdsItemCor.FieldByName('CodigoItemCor').AsInteger) then
        Begin
          LogicoCor := False;
          Break;
        End
        else
        Begin
          LogicoCor := True;
        End;
        dmCadProduto.QryItemCor.Next;
      End;
      if LogicoCor then
      Begin
        dmCadProduto.QryItemCor.Insert;
        dmCadProduto.QryItemCor.FieldByName('ITEM_ITEM_COR').AsInteger :=
                     dmCadProduto.QryCadastro.FieldByName('CODIGO_ITEM').AsInteger;
        dmCadProduto.QryItemCor.FieldByName('COR_ITEM_COR').AsInteger :=
                     cdsItemCor.FieldByName('CodigoItemCor').AsInteger;
      End;
      cdsItemCor.Next;
    End;
  End;

  //Item Grade
  if (dmCadProduto.QryCadastro.FieldByName('CONTROLAGRADE_ITEM').AsString = 'S') then
  Begin
    cdsItemGrade.First;
    while not cdsItemGrade.Eof do
    Begin
      dmCadProduto.QryItemGrade.First;
      while not dmCadProduto.QryItemGrade.Eof do
      Begin
        if (dmCadProduto.QryItemGrade.FieldByName('GRADE_ITEM_GRADE').AsInteger =
                         cdsItemGrade.FieldByName('CodigoItemGrade').AsInteger) then
        Begin
          LogicoGrade := False;
          Break;
        End
        else
        Begin
          LogicoGrade := True;
        End;
        dmCadProduto.QryItemGrade.Next;
      End;
      if LogicoGrade then
      Begin
        dmCadProduto.QryItemGrade.Insert;
        dmCadProduto.QryItemGrade.FieldByName('ITEM_ITEM_GRADE').AsInteger :=
                     dmCadProduto.QryCadastro.FieldByName('CODIGO_ITEM').AsInteger;
        dmCadProduto.QryItemGrade.FieldByName('GRADE_ITEM_GRADE').AsInteger :=
                     cdsItemGrade.FieldByName('CodigoItemGrade').AsInteger;
      End;
      cdsItemGrade.Next;
    End;
  End;

  cdsCombinacao.Free;
  cdsItemCor.Free;
  cdsItemGrade.Free;
  cdsCor.Free;
  cdsGrade.Free;
  frmDetalhamento.Close;
end;

procedure TfrmDetalhamento.sbGerarClick(Sender: TObject);
Var
  Logico: Boolean;
begin
  //Gerar Combinações
  cdsCombinacao.DisableControls;
  cdsCombinacao.Close;
  cdsCombinacao.FieldDefs.Clear;
  cdsCombinacao.FieldDefs.Add('CodCorComb',     ftInteger);
  cdsCombinacao.FieldDefs.Add('NomeCorComb',       ftString, 20);
  cdsCombinacao.FieldDefs.Add('CodGradeComb',     ftInteger);
  cdsCombinacao.FieldDefs.Add('NomeGradeComb',       ftString, 20);
  cdsCombinacao.CreateDataSet;
  cdsCombinacao.Open;
  cdsCombinacao.EnableControls;
  cdsCombinacao.FieldByName('CodCorComb').DisplayLabel := 'Codigo Cor';
  cdsCombinacao.FieldByName('NomeCorComb').DisplayLabel := 'Cor';
  cdsCombinacao.FieldByName('CodGradeComb').DisplayLabel := 'CodigoGrade';
  cdsCombinacao.FieldByName('NomeGradeComb').DisplayLabel := 'Grade';

  //Varrendo as dbgrid de ItemCor e ItemGrade
  if (dmCadProduto.QryCadastro.FieldByName('CONTROLACOR_ITEM').AsString = 'S') and
      (dmCadProduto.QryCadastro.FieldByName('CONTROLAGRADE_ITEM').AsString = 'S') then
  Begin
    cdsItemCor.First;
    while not cdsItemCor.Eof do
    Begin
      cdsItemGrade.First;
      while not cdsItemGrade.Eof do
      Begin
        dmCadProduto.QryItemDetalhe.First;
        if not(dmCadProduto.QryItemDetalhe.IsEmpty) then
        Begin
          while not dmCadProduto.QryItemDetalhe.Eof do
          Begin
            if (dmCadProduto.QryItemDetalhe.FieldByName('COR_ITEM_DETALHE').AsInteger =
                cdsItemCor.FieldByName('CodigoItemCor').AsInteger) and
               (dmCadProduto.QryItemDetalhe.FieldByName('GRADE_ITEM_DETALHE').AsInteger =
                 cdsItemGrade.FieldByName('CodigoItemGrade').AsInteger) then
            Begin
            Logico := False;
            Break;
            End
            Else
            Begin
              Logico := True;
            End;
            dmCadProduto.QryItemDetalhe.Next;
          End;
          if Logico then
          Begin
            InserirDetalhamento(cdsItemCor.FieldByName('CodigoItemCor').AsInteger,
                                cdsItemCor.FieldByName('NomeItemCor').AsString,
                                cdsItemGrade.FieldByName('CodigoItemGrade').AsInteger,
                                cdsItemGrade.FieldByName('NomeItemGrade').AsString);
          End;
          cdsItemGrade.Next;
        End
        Else
        Begin
          InserirDetalhamento(cdsItemCor.FieldByName('CodigoItemCor').AsInteger,
                                cdsItemCor.FieldByName('NomeItemCor').AsString,
                                cdsItemGrade.FieldByName('CodigoItemGrade').AsInteger,
                                cdsItemGrade.FieldByName('NomeItemGrade').AsString);
        End;
        cdsItemCor.Next
      End;
    End;
  End;

  if (dmCadProduto.QryCadastro.FieldByName('CONTROLACOR_ITEM').AsString = 'S') and
      (dmCadProduto.QryCadastro.FieldByName('CONTROLAGRADE_ITEM').AsString = 'N') then
  Begin
    cdsItemCor.First;
    while not cdsItemCor.Eof do
    Begin
      dmCadProduto.QryItemCor.First;
      if not(dmCadProduto.QryItemCor.IsEmpty) then
      Begin
        while not dmCadProduto.QryItemCor.Eof do
        Begin
          if (dmCadProduto.QryItemCor.FieldByName('COR_ITEM_COR').AsInteger =
                  cdsItemCor.FieldByName('CodigoItemCor').AsInteger) then
          else
          Begin
            InserirDetalhamento(cdsItemCor.FieldByName('CodigoItemCor').AsInteger,
                                cdsItemCor.FieldByName('NomeItemCor').AsString,
                                0,
                                '');
          End;
          dmCadProduto.QryItemCor.Next;
        End;
//        cdsItemCor.Next;
      End
      Else
      Begin
        InserirDetalhamento(cdsItemCor.FieldByName('CodigoItemCor').AsInteger,
                                cdsItemCor.FieldByName('NomeItemCor').AsString,
                                0,
                                '');
      End;
      cdsItemCor.Next;
    End;
  End;

  if (dmCadProduto.QryCadastro.FieldByName('CONTROLACOR_ITEM').AsString = 'N') and
      (dmCadProduto.QryCadastro.FieldByName('CONTROLAGRADE_ITEM').AsString = 'S') then
  Begin
    cdsItemGrade.First;
    while not cdsItemGrade.Eof do
    Begin
      dmCadProduto.QryItemGrade.First;
      if not(dmCadProduto.QryItemGrade.IsEmpty) then
      Begin
        while not dmCadProduto.QryItemGrade.Eof do
        Begin
          if (dmCadProduto.QryItemGrade.FieldByName('GRADE_ITEM_GRADE').AsInteger =
                  cdsItemGrade.FieldByName('CodigoItemGrade').AsInteger) then
          else
          Begin
            InserirDetalhamento(0,
                                '',
                                cdsItemGrade.FieldByName('CodigoItemGrade').AsInteger,
                                cdsItemGrade.FieldByName('NomeItemGrade').AsString);
          End;
          dmCadProduto.QryItemGrade.Next;
        End;
      End
      Else
      Begin
        InserirDetalhamento(0,
                                '',
                                cdsItemGrade.FieldByName('CodigoItemGrade').AsInteger,
                                cdsItemGrade.FieldByName('NomeItemGrade').AsString);
      End;
      cdsItemGrade.Next;
    End;
  End

  else
  Begin

  End;

  dsCombinacao.DataSet := cdsCombinacao;
end;

procedure TfrmDetalhamento.dbgCorDblClick(Sender: TObject);
begin
  with dmCadProduto do
    Begin
      cdsItemCor.Insert;
      cdsItemCor.FieldByName('CodigoItemCor').AsInteger := cdsCor.FieldByName('CodigoCor').AsInteger;
      cdsItemCor.FieldByName('NomeItemCor').AsString := cdsCor.FieldByName('NomeCor').AsString;
      cdsItemCor.Post;
      cdsCor.Delete;
    End;
end;


end.
