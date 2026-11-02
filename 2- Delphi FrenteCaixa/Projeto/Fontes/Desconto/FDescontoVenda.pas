unit FDescontoVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit,
  Vcl.ExtCtrls, Vcl.StdCtrls, ACBrUtil, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  TFrmDescontoVenda = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    pnTitulo: TPanel;
    Panel2: TPanel;
    Shape2: TShape;
    Label2: TLabel;
    EditDesconto: TcxCurrencyEdit;
    lblReceber: TLabel;
    EditDescontoValor: TcxCurrencyEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditDescontoPropertiesChange(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure EditDescontoValorPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditDescontoValorKeyPress(Sender: TObject; var Key: Char);
    procedure EditDescontoKeyPress(Sender: TObject; var Key: Char);
  private
    procedure Validar;
    procedure Sair;
    procedure GetPercentual;
    procedure GetValor;
    { Private declarations }
  public
    { Public declarations }
    FReceber : Currency;
    FEditValor : Boolean;
    FEditPercent : Boolean;
  end;

var
  FrmDescontoVenda: TFrmDescontoVenda;

implementation

{$R *.dfm}

uses AppFuncoes;

procedure TFrmDescontoVenda.GetValor();
var
  mPercentual : Currency;
begin
  if FEditPercent = False then
    exit;
  EditDescontoValor.Value := RoundABNT(((FReceber * EditDesconto.Value) / 100 ),2);
end;

procedure TFrmDescontoVenda.GetPercentual();
var
  mPercentual : Currency;
begin
  if FEditValor = False then
    exit;
  EditDesconto.Value := RoundABNT(((EditDescontoValor.Value / FReceber) * 100 ),2);
end;

procedure TFrmDescontoVenda.Sair();
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TFrmDescontoVenda.Validar();
begin
  ModalResult := mrOk;
end;

procedure TFrmDescontoVenda.btnOkClick(Sender: TObject);
begin
  Validar();
end;

procedure TFrmDescontoVenda.EditDescontoPropertiesChange(Sender: TObject);
begin
  if FEditPercent = False then
    exit;
  if EditDesconto.Value > 100 then
  begin
    Informar('Limite é 100%');
    EditDesconto.Clear;
  end;
  GetValor();
end;

procedure TFrmDescontoVenda.EditDescontoValorPropertiesChange(Sender: TObject);
begin
  if FEditValor = False then
    exit;
  if EditDescontoValor.Value > FReceber then
  begin
    Informar('Limite é R$ '+FormatFloatBr(FReceber));
    EditDescontoValor.Clear;
    Exit;
  end;
  GetPercentual();
end;

procedure TFrmDescontoVenda.EditDescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
  FEditPercent := True;
  FEditValor := False;
end;

procedure TFrmDescontoVenda.EditDescontoValorKeyPress(Sender: TObject;
  var Key: Char);
begin
  FEditPercent := False;
  FEditValor := True;
end;

procedure TFrmDescontoVenda.FormCreate(Sender: TObject);
begin
  FReceber := 0;
  FEditValor := False;
  FEditPercent := False;
end;

procedure TFrmDescontoVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    Sair();
  end;
  if Key = VK_F5 then
  begin
    Validar();
  end;
  if Key=VK_RETURN then
  begin
    Selectnext(ActiveControl, True, True);
  end;
end;

procedure TFrmDescontoVenda.FormShow(Sender: TObject);
begin
  FrmDescontoVenda.lblReceber.Caption := 'A Receber: R$ '+FormatFloatBr(FReceber);
end;

end.
