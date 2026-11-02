Unit FTabelaNCM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FCrudSimples, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxCheckBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls, Vcl.DBCtrls, cxClasses,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.Mask,
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
  TFrmTabelaNCM = class(TFrmCrudSimples)
    DBMemo1: TDBMemo;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    cxGridDadosColumn1: TcxGridDBColumn;
    IDBEditDialog1: TIDBEditDialog;
    EditNomeSegmento: TEdit;
    DBEdit2: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    procedure tabDetalheShow(Sender: TObject);
    procedure FrmFrameBotoes1SpbAdicionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTabelaNCM: TFrmTabelaNCM;

implementation

{$R *.dfm}

procedure TFrmTabelaNCM.FormCreate(Sender: TObject);
begin
  inherited;
  ValidarCampoNome :=False;

  FrmFrameBarra1.Height := 1;
end;

procedure TFrmTabelaNCM.FormDestroy(Sender: TObject);
begin
  inherited;
  FrmTabelaNCM := Nil;
end;

procedure TFrmTabelaNCM.FrmFrameBotoes1SpbAdicionarClick(Sender: TObject);
begin
  inherited;

  if (EditCodigo.Visible) and (EditCodigo.Enabled) then
    EditCodigo.SetFocus;

end;

procedure TFrmTabelaNCM.tabDetalheShow(Sender: TObject);
begin
  inherited;

  if (EditCodigo.Visible) and (EditCodigo.Enabled) then
    EditCodigo.SetFocus;

end;

end.
