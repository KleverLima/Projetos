Unit FBancos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FCrudSimples, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxCheckBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Buttons, cxClasses,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Mask, Vcl.StdCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxGrid, Vcl.ComCtrls, ISFEdit,
  ISFEditbtn, ISFdbEditbtn, IDBEdit, uEstSearchDialogZeos, FFrameBotoes,
  FFrameBarra, dxSkinsCore, dxSkinsDefaultPainters, dxDateRanges, dxSkinBlack,
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
  TFrmBancos = class(TFrmCrudSimples)
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FrmFrameBotoes1SpbSalvarClick(Sender: TObject);
    procedure FrmFrameBotoes1SpbAdicionarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ExemploBanco;
  public
    { Public declarations }
  end;

var
  FrmBancos: TFrmBancos;

implementation

{$R *.dfm}

uses Biblioteca;

procedure TFrmBancos.ExemploBanco;
begin
   informar(' Nº do Banco se refere a identificação do banco. ' + #13 + #10
     + #13 + #10 + 'Exemplos: ' + #13 + #10 + '001 - BANCO DO BRASIL  ' + #13 +
     #10 + '341 - ITAU   ' + #13 + #10 + 'e assim por diante...  ');
end;

procedure TFrmBancos.FormCreate(Sender: TObject);
begin
  inherited;
  FrmFrameBarra1.Height := 1;
end;

procedure TFrmBancos.FormDestroy(Sender: TObject);
begin
  inherited;
  FrmBancos := Nil;
end;

procedure TFrmBancos.FrmFrameBotoes1SpbAdicionarClick(Sender: TObject);
begin
  inherited;
  EditCodigo.SetFocus;
end;

procedure TFrmBancos.FrmFrameBotoes1SpbSalvarClick(Sender: TObject);
begin
  EditNome.SetFocus;
  if dbTabela.FieldByName('CODIGO').AsInteger<1 then
  begin
    EditCodigo.SetFocus;
    raise Exception.Create('Necessário informar o Nº do Banco.');
  end;
  inherited;
end;

procedure TFrmBancos.SpeedButton1Click(Sender: TObject);
begin
  ExemploBanco;
end;

end.
