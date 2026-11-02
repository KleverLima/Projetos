unit FCarneImprimir;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, FFrameBarra, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids,
   ACBrNFeDANFEClass, ACBrNFe, pcnConversao, DB,
   frxClass, frxDBSet,  ISFEdit, ISFEditbtn, ISFdbEditbtn,
  IDBEdit, uEstSearchDialogZeos, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxCurrencyEdit, dxSkinsCore, dxSkinsDefaultPainters, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog, dxSkinBlack,
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

   TFrmCarneImprimir = class(TForm)
      FrmFrameBarra1: TFrmFrameBarra;
      Panel1: TPanel;
      Panel2: TPanel;
    btnCarne: TBitBtn;
      BtnSair: TBitBtn;
      BitBtn9: TBitBtn;
    dsBoletos: TDataSource;
    QryBoletos: TFDQuery;
      dbCarnes: TfrxDBDataset;
    frxReportCarnes: TfrxReport;
    dbDlgProcurar: TIDBEditDialog;
    cxGridBoletos: TcxGridDBTableView;
    cxGridViewLevel1: TcxGridLevel;
    cxGridView: TcxGrid;
    cxGridBoletosColumn1: TcxGridDBColumn;
    cxGridBoletosColumn2: TcxGridDBColumn;
    cxGridBoletosColumn3: TcxGridDBColumn;
    cxGridBoletosColumn4: TcxGridDBColumn;
    cxGridBoletosColumn5: TcxGridDBColumn;
    cxGridBoletosColumn7: TcxGridDBColumn;
    BitBtn10: TBitBtn;
      procedure BtnSairClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
      procedure BitBtn10Click(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure btnCarneClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
   private
      { Private declarations }
      procedure FecharTabelas;
      procedure AbrirTabelas;
   public
      { Public declarations }
   end;

var
   FrmCarneImprimir: TFrmCarneImprimir;

implementation

uses FPrincipal, Biblioteca, Global;

{$R *.dfm}

procedure TFrmCarneImprimir.AbrirTabelas;
begin
   QryBoletos.Open;

end;

procedure TFrmCarneImprimir.BitBtn10Click(Sender: TObject);
begin
   if dbDlgProcurar.Execute then
   begin
      QryBoletos.Close;
      QryBoletos.ParamByName('NOTAFISCAL').AsInteger := dbDlgProcurar.ResultFieldAsInteger('NOTAFISCAL');
      QryBoletos.Open;
   end;
end;

procedure TFrmCarneImprimir.btnCarneClick(Sender: TObject);
begin
   frxReportCarnes.ShowReport;
end;

procedure TFrmCarneImprimir.BtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmCarneImprimir.FecharTabelas;
begin
   QryBoletos.Close;

end;

procedure TFrmCarneImprimir.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   QryBoletos.Close;
   Action :=Cafree;
end;

procedure TFrmCarneImprimir.FormCreate(Sender: TObject);
begin
   QryBoletos.Close;
   QryBoletos.sql.clear;
   QryBoletos.sql.Add('SELECT *  FROM VIEW_BOLETOS');
   QryBoletos.sql.Add('WHERE');
   QryBoletos.sql.Add('NOTAFISCAL=:NOTAFISCAL');
   QryBoletos.sql.Add('ORDER BY DATA DESC,VENCIMENTO DESC, DOCUMENTO  ASC');
   QryBoletos.Open;

   FrmFrameBarra1.Height := 1;
end;

procedure TFrmCarneImprimir.FormDestroy(Sender: TObject);
begin
  FrmCarneImprimir := Nil;
end;

procedure TFrmCarneImprimir.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   if Key = VK_F8 then
      BitBtn10Click(Sender);

   if Key = VK_F9 then
      btnCarneClick(Sender);

   if Key = VK_ESCAPE then
      Close;

end;

procedure TFrmCarneImprimir.FormShow(Sender: TObject);
begin
   cxGridView.SetFocus;
end;

end.

