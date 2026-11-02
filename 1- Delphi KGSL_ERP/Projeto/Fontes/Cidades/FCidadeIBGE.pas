Unit FCidadeIBGE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxCheckBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, ISFEdit, ISFEditbtn, ISFdbEditbtn, IDBEdit,
  uEstSearchDialogZeos, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, Vcl.ComCtrls, FFrameBotoes, FFrameBarra,
  dxDateRanges, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Colorful, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue;

type
   TFrmCidadeIBGE = class(TForm)
    dbCidadeIBGE: TFDQuery;
    dsCidadeIBGE: TDataSource;
    FrmFrameBarra1: TFrmFrameBarra;
    FrmFrameBotoes1: TFrmFrameBotoes;
    pgControl: TPageControl;
    tabPrincipal: TTabSheet;
    tabDetalhe: TTabSheet;
    GroupBox1: TGroupBox;
    lblCodigo: TLabel;
    lblNome: TLabel;
    EditCodigo: TDBEdit;
    EditNome: TDBEdit;
    rgStatus: TDBRadioGroup;
    Label1: TLabel;
    EditBairro: TDBEdit;
    EditCodigoIBGE: TDBEdit;
    EditMunicipio: TDBEdit;
    EditCodigoIBGEUF: TDBEdit;
    EditUF: TDBEdit;
    CEPProcurar: TIDBEditDialog;
    DBAdvEdit1: TDBEdit;
    DBAdvEdit2: TDBEdit;
    EditTipo: TDBEdit;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    cxGrid1DBTableView1Column5: TcxGridDBColumn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject); Virtual;
    procedure Btn_SairClick(Sender: TObject); Virtual;
    procedure FormClose(Sender: TObject; var Action: TCloseAction); Virtual;
    procedure FrmFrameBotoes1SpbAdicionarClick(Sender: TObject); Virtual;
    procedure FrmFrameBotoes1SpbEditarClick(Sender: TObject); Virtual;
    procedure FrmFrameBotoes1SpbSalvarClick(Sender: TObject); Virtual;
    procedure FrmFrameBotoes1SpbCancelarClick(Sender: TObject); Virtual;
    procedure FrmFrameBotoes1SpbExcluirClick(Sender: TObject); Virtual;
    procedure FrmFrameBotoes1SpbProcurarClick(Sender: TObject); Virtual;
    procedure FrmFrameBotoes1SpbSairClick(Sender: TObject); Virtual;
    procedure tabDetalheShow(Sender: TObject); Virtual;
    procedure tabPrincipalShow(Sender: TObject); Virtual;
    procedure pgControlChanging(Sender: TObject; var AllowChange: Boolean); Virtual;
    procedure dbCidadeIBGENewRecord(DataSet: TDataSet); Virtual;
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
   private
    FCodigoRegistro : Variant;
    FEditando       : Boolean;

   procedure AcaoEditar;
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmCidadeIBGE: TFrmCidadeIBGE;

implementation

uses FPrincipal, App.SQL, Biblioteca, Global, Classe.Usuarios;

{$R *.DFM}

procedure TFrmCidadeIBGE.FormCreate(Sender: TObject);
begin
  dbCidadeIBGE.close;
  FrmFrameBotoes1.DataSource := dsCidadeIBGE;
  // FTrocarAba :=False;
  pgControl.ActivePageIndex :=0;
  FCodigoRegistro :=0;
  Self.Caption :=FrmFrameBarra1.LblBarraTitulo.Caption;
  dbCidadeIBGE.open;

end;

procedure TFrmCidadeIBGE.FrmFrameBotoes1SpbAdicionarClick(Sender: TObject);
begin

  FCodigoRegistro :=dbCidadeIBGE.FieldByName('CEP').AsVariant;
  pgControl.ActivePage :=tabDetalhe;
  FrmFrameBotoes1.SpbAdicionarClick(Sender);
  FEditando:=False;

  if (EditNome.Visible) and (EditNome.Enabled) then
    EditNome.SetFocus;

end;

procedure TFrmCidadeIBGE.FrmFrameBotoes1SpbCancelarClick(Sender: TObject);
begin
  FrmFrameBotoes1.SpbCancelarClick(Sender);
  if pgControl.ActivePageIndex>0 then
    pgControl.ActivePage :=tabPrincipal;
end;

procedure TFrmCidadeIBGE.FrmFrameBotoes1SpbEditarClick(Sender: TObject);
begin
  pgControl.ActivePage :=tabDetalhe;
  FrmFrameBotoes1.SpbEditarClick(Sender);
end;

procedure TFrmCidadeIBGE.FrmFrameBotoes1SpbExcluirClick(Sender: TObject);
begin
   FrmFrameBotoes1.SpbExcluirClick(Sender);

end;

procedure TFrmCidadeIBGE.FrmFrameBotoes1SpbProcurarClick(Sender: TObject);
begin
   if CEPProcurar.Execute then
   begin
      dbCidadeIBGE.Locate('CEP', CEPProcurar.ResultFieldAsInteger('CEP'), []);
   end;
end;

procedure TFrmCidadeIBGE.FrmFrameBotoes1SpbSairClick(Sender: TObject);
begin
   FrmFrameBotoes1.SpbSairClick(Sender);
end;

procedure TFrmCidadeIBGE.FrmFrameBotoes1SpbSalvarClick(Sender: TObject);
begin
   if empty(dbCidadeIBGE.FieldByName('CEP').AsString) Then
   Begin
      AvisoSistema('Informe o CEP');
      EditCodigo.Setfocus;
      Exit;
   End;

   if empty(dbCidadeIBGE.FieldByName('ENDERECO').AsString) Then
   Begin
      AvisoSistema('Informe o ENDEREÇO');
      EditNome.Setfocus;
      Exit;
   End;

   if empty(dbCidadeIBGE.FieldByName('CIDADE').AsString) Then
   Begin
      AvisoSistema('Informe o nome da CIDADE');
      EditMunicipio.Setfocus;
      Exit;
   End;

   if empty(dbCidadeIBGE.FieldByName('UF').AsString) Then
   Begin
      AvisoSistema('Informe a sigla do ESTADO');
      EditUF.Setfocus;
      Exit;
   End;

  FrmFrameBotoes1.SpbSalvarClick(Sender);
  FCodigoRegistro :=dbCidadeIBGE.FieldByName('CEP').AsVariant;
  pgControl.ActivePage :=tabPrincipal;

end;

procedure TFrmCidadeIBGE.pgControlChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange :=False;
end;

procedure TFrmCidadeIBGE.tabDetalheShow(Sender: TObject);
begin
  //  FTrocarAba :=False;
  if (Trim(EditNome.Text)<>'') then
    FrmFrameBotoes1.AtivaEdicao;

  if (EditNome.Visible) and (EditNome.Enabled) then
    EditNome.SetFocus;

end;

procedure TFrmCidadeIBGE.tabPrincipalShow(Sender: TObject);
begin
//  FTrocarAba :=True;

  if (TVarData(FCodigoRegistro).VType = varString) and (FCodigoRegistro<>'') then
  begin
     dbCidadeIBGE.Locate('CEP', FCodigoRegistro, []);
     FCodigoRegistro :='';
  end;

  if (TVarData(FCodigoRegistro).VType = varInteger) and (FCodigoRegistro>0) then
  begin
     dbCidadeIBGE.Locate('CEP', FCodigoRegistro, []);
     FCodigoRegistro :=0;
  end;

end;

procedure TFrmCidadeIBGE.Btn_SairClick(Sender: TObject);
begin
   close;
end;

procedure TFrmCidadeIBGE.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  AcaoEditar;
end;

procedure TFrmCidadeIBGE.dbCidadeIBGENewRecord(DataSet: TDataSet);
begin
  dbCidadeIBGE.FieldByName('STATUS').AsString :='S';
end;

procedure TFrmCidadeIBGE.AcaoEditar;
begin
  FCodigoRegistro :=dbCidadeIBGE.FieldByName('CEP').AsVariant;
  if dbCidadeIBGE.IsEmpty then
    Exit;

  pgControl.ActivePage :=tabDetalhe;
  FrmFrameBotoes1.SpbEditar.Click;

end;

procedure TFrmCidadeIBGE.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dbCidadeIBGE.close;
   Action :=caFree;
end;

end.
