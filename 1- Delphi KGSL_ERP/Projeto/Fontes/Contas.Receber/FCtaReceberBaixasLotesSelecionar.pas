unit FCtaReceberBaixasLotesSelecionar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FFrameBarra, ExtCtrls, StdCtrls, StrUtils, DB,  FireDAC.Comp.Client,
  Buttons, ISFEdit, ISFEditbtn, ISFdbEditbtn, IDBEdit, uEstSearchDialogZeos,
  Mask, DBCtrls, Grids,  cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxCheckBox,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, dxSkinsCore, dxSkinsDefaultPainters,
  dxDateRanges, cxDataControllerConditionalFormattingRulesManagerDialog,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinOffice2019Colorful, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinTheBezier, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TFrmCtaReceberBaixasLotesSelecionar = class(TForm)
    FrmFrameBarra1: TFrmFrameBarra;
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cxGrid1: TcxGrid;
    cxGridSelecionar: TcxGridDBTableView;
    cxGridSelecionarColumn1: TcxGridDBColumn;
    cxGridSelecionarColumn2: TcxGridDBColumn;
    cxGridSelecionarColumn3: TcxGridDBColumn;
    cxGridSelecionarColumn4: TcxGridDBColumn;
    cxGridSelecionarColumn5: TcxGridDBColumn;
    cxGridSelecionarColumn6: TcxGridDBColumn;
    cxGridSelecionarColumn7: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCtaReceberBaixasLotesSelecionar: TFrmCtaReceberBaixasLotesSelecionar;

implementation

uses FPrincipal, Global, App.SQL, Biblioteca, FCtaReceberBaixasLotes;

{$R *.dfm}

procedure TFrmCtaReceberBaixasLotesSelecionar.BitBtn1Click(Sender: TObject);
begin

   If (FrmCtaReceberBaixasLotes.db_ctaReceber.State in [dsedit, dsinsert]) then
      FrmCtaReceberBaixasLotes.db_ctaReceber.Post;

   close;

end;

procedure TFrmCtaReceberBaixasLotesSelecionar.BitBtn2Click(Sender: TObject);
begin
   close;
end;

procedure TFrmCtaReceberBaixasLotesSelecionar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action :=Cafree;
end;

end.
