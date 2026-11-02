unit FUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, cxDataControllerConditionalFormattingRulesManagerDialog,
  Data.DB, cxDBData, cxCalendar, cxCheckBox, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FFrameBotoes, System.Actions, Vcl.ActnList, FFrameBarra, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Colorful, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue;

type
  TFrmUsuarios = class(TForm)
    QryExcluirAcesso: TFDQuery;
    QryUsuarioSetarAcesso: TFDQuery;
    QueryMenu: TFDQuery;
    dsMenu: TDataSource;
    dsDados: TDataSource;
    QryDados: TFDQuery;
    pgControl: TPageControl;
    tabRegistro: TTabSheet;
    cxGrid1: TcxGrid;
    cxGridDB: TcxGridDBTableView;
    cxGridDBID: TcxGridDBColumn;
    cxGridDBNome: TcxGridDBColumn;
    cxGridNivel: TcxGridLevel;
    tabDetalhe: TTabSheet;
    gbDados: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    EditID: TDBEdit;
    EditUsuario: TDBEdit;
    EditSenha: TDBEdit;
    gbPermissao: TGroupBox;
    cxGridAcessos: TcxGrid;
    cxGridMenus: TcxGridDBTableView;
    cxGridMenusColumn1: TcxGridDBColumn;
    cxGridMenusColumn2: TcxGridDBColumn;
    cxGridMenusColumn3: TcxGridDBColumn;
    cxGridAcessosLevel1: TcxGridLevel;
    FrmFrameBotoes1: TFrmFrameBotoes;
    FrmFrameBarra1: TFrmFrameBarra;
    Panel1: TPanel;
    btnBloquear: TBitBtn;
    btnRecriar: TBitBtn;
    btnLiberar: TBitBtn;
    procedure FrmFrameBotoes1SpbAdicionarClick(Sender: TObject);
    procedure FrmFrameBotoes1SpbSalvarClick(Sender: TObject);
    procedure FrmFrameBotoes1SpbProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRecriarClick(Sender: TObject);
    procedure btnLiberarClick(Sender: TObject);
    procedure btnBloquearClick(Sender: TObject);
    procedure cxGridDBDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsDadosStateChange(Sender: TObject);
    procedure FrmFrameBotoes1SpbCancelarClick(Sender: TObject);
    procedure FrmFrameBotoes1SpbSairClick(Sender: TObject);
    procedure FrmFrameBotoes1SpbExcluirClick(Sender: TObject);
    procedure pgControlChanging(Sender: TObject; var AllowChange: Boolean);
    procedure FrmFrameBotoes1SpbEditarClick(Sender: TObject);
    procedure QryDadosNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    FTreeView_Listar  : TTreeView;
    FCategoria  : TStringList;
    FIteMMenu   : TStringList;

    FMudarAba : Boolean;
    procedure MudarAbaDetalhe;
    procedure ChecarModoEdicao;
    function EncontrarNo(aNome: string): TTreeNode;
    procedure ListarMenus;
    procedure ValidarCampos;
    procedure ReabrirQryAcesso;


  public
    { Public declarations }
  end;

var
  FrmUsuarios: TFrmUsuarios;

implementation

{$R *.dfm}

uses Biblioteca, FPrincipal;

procedure TFrmUsuarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
  FrmUsuarios := Nil;
end;

procedure TFrmUsuarios.FormCreate(Sender: TObject);
begin
  pgControl.ActivePageIndex := 0;
  FrmFrameBotoes1.DataSource := dsDados;
  FTreeView_Listar      := TTreeView.Create(Self);
  FCategoria            := TStringList.Create;
  FIteMMenu             := TStringList.Create;
  FCategoria.Duplicates := dupIgnore;
  FIteMMenu.Duplicates  := dupIgnore;
  QryDados.Open();

  FrmFrameBarra1.Height := 1;

end;

procedure TFrmUsuarios.FrmFrameBotoes1SpbAdicionarClick(Sender: TObject);
begin
  if  (QryDados.Active = False) then
  begin
    Informar('Tabela não está ativa.');
  end;
  ChecarModoEdicao();
  pgControl.ActivePageIndex := 1;
  FMudarAba := True;
  EditUsuario.SetFocus;
  QryDados.Append;

end;

procedure TFrmUsuarios.FrmFrameBotoes1SpbCancelarClick(Sender: TObject);
begin
  QueryMenu.Cancel;
  FrmFrameBotoes1.SpbCancelarClick(Sender);
  pgControl.ActivePageIndex := 0;
end;

procedure TFrmUsuarios.FrmFrameBotoes1SpbEditarClick(Sender: TObject);
begin
  FrmFrameBotoes1.SpbEditarClick(Sender);
end;

procedure TFrmUsuarios.FrmFrameBotoes1SpbExcluirClick(Sender: TObject);
begin
  FrmFrameBotoes1.SpbExcluirClick(Sender);
end;

function TFrmUsuarios.EncontrarNo(aNome: string): TTreeNode;
var
  i: Integer;
begin

  Result := nil;
  with FTreeView_Listar.Items do
  begin
    for i := 0 to Pred(Count) do
      if Item[i].Text=aNome then
      begin
        Result := Item[i];
        Break;
      end;
  end;
end;

procedure TFrmUsuarios.btnBloquearClick(Sender: TObject);
begin
   try
     QueryMenu.close;
     QryUsuarioSetarAcesso.ParamByName('ID').AsInteger := QryDados.FieldByName('ID').AsInteger;
     QryUsuarioSetarAcesso.ParamByName('ACAO').AsString :='NAO';
     QryUsuarioSetarAcesso.ExecSQL;
   finally
     QueryMenu.Open;
   end;
end;

procedure TFrmUsuarios.btnLiberarClick(Sender: TObject);
begin
   try
     QueryMenu.close;
     QryUsuarioSetarAcesso.ParamByName('ID').AsInteger := QryDados.FieldByName('ID').AsInteger;
     QryUsuarioSetarAcesso.ParamByName('ACAO').AsString :='SIM';
     QryUsuarioSetarAcesso.ExecSQL;
   finally
     QueryMenu.Open;
   end;
end;

procedure TFrmUsuarios.btnRecriarClick(Sender: TObject);
begin
  if Pergunta('Esse processo irá recriar todos os Menus para este usuário... Continuar?') = false then
    exit;
  ListarMenus();
end;

procedure TFrmUsuarios.ChecarModoEdicao;
begin
  if  (QryDados.State in [dsedit,dsinsert]) then
  begin
    Informar('Há um registro em edição no momento.');
    exit;
  end;
end;

procedure TFrmUsuarios.cxGridDBDblClick(Sender: TObject);
begin
  MudarAbaDetalhe();
end;

procedure TFrmUsuarios.dsDadosStateChange(Sender: TObject);
begin
  if (FrmFrameBotoes1.DataSource.State in [dsInsert,dsEdit]) then
    FrmFrameBotoes1.AtivaEdicao
  else
    FrmFrameBotoes1.DesativaEdicao;
end;

procedure TFrmUsuarios.FrmFrameBotoes1SpbProcurarClick(Sender: TObject);
begin
//  QryDados.Locate('ID',DlgProcurar.Configurar.Resultado.ToInteger,[]);

end;

procedure TFrmUsuarios.FrmFrameBotoes1SpbSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmUsuarios.FrmFrameBotoes1SpbSalvarClick(Sender: TObject);
begin
  ValidarCampos();
  inherited;
  //if not (QryDados.State in [dsedit,dsinsert]) then
  //  exit;
  FrmFrameBotoes1.SpbSalvarClick(Sender);
  if (QueryMenu.state in [dsEdit, dsInsert]) then
    QueryMenu.Post;
  ReabrirQryAcesso();
  pgControl.ActivePageIndex := 0;
end;

procedure TFrmUsuarios.ListarMenus;
var
  I, IC      : Integer;
  mAction    : TAction;
begin
   FCategoria.Clear;
   FIteMMenu.Clear;

   for I := 0 to Pred(FrmPrincipal.ActionRibbon.ActionCount) do
   begin
     if FCategoria.IndexOf(FrmPrincipal.ActionRibbon.Actions[I].Category)<0 then
     begin
       FCategoria.Add(FrmPrincipal.ActionRibbon.Actions[I].Category);
     end;
   end;
   try
     QueryMenu.DisableControls;
     QueryMenu.Close;
     try
       QryExcluirAcesso.ParamByName('ID').AsInteger := QryDados.FieldByName('ID').AsInteger;
       QryExcluirAcesso.ExecSQL;
     finally
       QueryMenu.Open;
     end;
     for IC := 0 to FCategoria.Count-1 do
     begin
       for I := 0 to Pred(FrmPrincipal.ActionRibbon.ActionCount) do
       begin
         mAction := TAction(FrmPrincipal.ActionRibbon.Actions[I]);
         if FCategoria[IC] = mAction.Category   then
         begin
           QueryMenu.Append;
           QueryMenu.FieldByName('ID').AsInteger        := QryDados.FieldByName('ID').AsInteger;
           QueryMenu.FieldByName('CATEGORIA').AsString  := FCategoria[IC];
           QueryMenu.FieldByName('MENU').AsString       := UpperCase(mAction.Name);
           QueryMenu.FieldByName('TITULO').AsString     := StringReplace(mAction.Caption, '&','',[]);
           QueryMenu.FieldByName('ACESSO').AsString     := 'NAO';
           QueryMenu.Post;
         end;
       end;
     end;
   finally
     QueryMenu.EnableControls;
   end;
end;

procedure TFrmUsuarios.MudarAbaDetalhe;
begin
  if not QryDados.Active then
    exit;
  if QryDados.Fields.FindField('ID') = nil then
    exit;
  if QryDados.FieldByName('ID').AsInteger < 1 then
    exit;
  ReabrirQryAcesso();
  FMudarAba := True;
  pgControl.ActivePageIndex := 1;
  QryDados.Edit; // colocar em edição

end;

procedure TFrmUsuarios.pgControlChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  MudarAbaDetalhe;
  AllowChange := FMudarAba;
end;

procedure TFrmUsuarios.QryDadosNewRecord(DataSet: TDataSet);
begin
  QryDados.FieldByName('ACESSOVISIVEL').AsString := 'NAO';
end;

procedure TFrmUsuarios.ReabrirQryAcesso;
begin
  QueryMenu.Close;
  QueryMenu.ParamByName('ID').AsInteger := QryDados.FieldByName('ID').AsInteger;
  QueryMenu.Open;
end;

procedure TFrmUsuarios.ValidarCampos;
begin
  gbDados.SetFocus; // forçar foco sair dos campos edits para atualizar campos (problema com TSpeedButton que não tira o foco do objeto. Temos que forçar sair o foco).
  if QryDados.FieldByName('USERNAME').AsString = '' then
  begin
    Informar('Campo "Usuário" é obrigatorio.');
    EditUsuario.SetFocus;
    abort;
  end;
  if QryDados.FieldByName('SENHA').AsString = '' then
  begin
    Informar('Campo "Senha" é obrigatorio.');
    EditSenha.SetFocus;
    abort;
  end;
end;

end.
