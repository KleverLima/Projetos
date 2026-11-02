unit FConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FCrudSimples, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxCheckBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, cxClasses, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.StdCtrls,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridCustomView, cxGrid, Vcl.ComCtrls, ISFEdit, ISFEditbtn, ISFdbEditbtn,
  IDBEdit, uEstSearchDialogZeos, FFrameBotoes, FFrameBarra, dxDateRanges,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
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
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue;

type
  TFrmConta = class(TFrmCrudSimples)
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    ContaProcurar: TIDBEditDialog;
    procedure FrmFrameBotoes1SpbProcurarClick(Sender: TObject);
    procedure dbTabelaNewRecord(DataSet: TDataSet);
    procedure dbTabelaBeforePost(DataSet: TDataSet);
    procedure dbTabelaAfterOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConta: TFrmConta;

implementation

{$R *.dfm}

uses App.Funcoes;

procedure TFrmConta.dbTabelaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  FormataCampo(dbTabela);

end;

procedure TFrmConta.dbTabelaBeforePost(DataSet: TDataSet);
begin
  inherited;
  dbTabela.FieldByName('DATAALTERACAO').AsDateTime := Now;
end;

procedure TFrmConta.dbTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  dbTabela.FieldByName('DATA').AsDateTime          := Now;
  dbTabela.FieldByName('DATAALTERACAO').AsDateTime := Now;
end;

procedure TFrmConta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  action := Cafree;
end;

procedure TFrmConta.FormCreate(Sender: TObject);
begin
  inherited;
  FrmFrameBarra1.Height := 1;
end;

procedure TFrmConta.FormDestroy(Sender: TObject);
begin
  inherited;
  FrmConta := Nil;
end;

procedure TFrmConta.FrmFrameBotoes1SpbProcurarClick(Sender: TObject);
begin
   if ContaProcurar.Execute then
   begin
      dbTabela.Cancel;
      dbTabela.Locate('CODIGO', ContaProcurar.ResultFieldAsInteger('CODIGO'), []);
      EditNOME.SetFocus;
   end;
end;

end.
