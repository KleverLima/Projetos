unit FTabelaPrecoValor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit,
  Vcl.StdCtrls, Vcl.ExtCtrls, FFrameBarra, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  TFrmTabelaPrecoValor = class(TForm)
    FrmFrameBarra1: TFrmFrameBarra;
    Panel1: TPanel;
    EditReferencia: TLabeledEdit;
    EditReferenciaNome: TLabeledEdit;
    Panel2: TPanel;
    BtnOk: TButton;
    BtnCancelar: TButton;
    EditTabelaNome: TLabeledEdit;
    EditTabela: TLabeledEdit;
    Panel3: TPanel;
    EditValor: TcxCurrencyEdit;
    Label1: TLabel;
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTabelaPrecoValor: TFrmTabelaPrecoValor;

implementation

uses Global;

{$R *.dfm}

procedure TFrmTabelaPrecoValor.BtnCancelarClick(Sender: TObject);
begin
   nValorDigitado :=0;
   close;
end;

procedure TFrmTabelaPrecoValor.BtnOkClick(Sender: TObject);
begin
  nValorDigitado := EditValor.Value;
end;

procedure TFrmTabelaPrecoValor.FormCreate(Sender: TObject);
begin
   nValorDigitado :=0;
end;

procedure TFrmTabelaPrecoValor.FormShow(Sender: TObject);
begin
   EditValor.SetFocus;
end;

end.
