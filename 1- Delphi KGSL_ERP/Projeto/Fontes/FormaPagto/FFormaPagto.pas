unit FFormaPagto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FCrudSimples, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxCheckBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, cxClasses, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ExtCtrls, Vcl.Mask, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxGrid, Vcl.ComCtrls, ISFEdit,
  ISFEditbtn, ISFdbEditbtn, IDBEdit, uEstSearchDialogZeos, FFrameBotoes,
  FFrameBarra, dxDateRanges, dxSkinsCore, dxSkinsDefaultPainters, dxSkinBlack,
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
  TFrmFormaPagto = class(TFrmCrudSimples)
    DS_Prazos: TDataSource;
    db_FormaPagtoDias: TFDQuery;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    Label7: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    DBEdit_Multiplicador: TDBEdit;
    DBEdit_indice: TDBEdit;
    DBEdit2: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit3: TDBEdit;
    DBRG_arredond: TDBRadioGroup;
    procedure db_FormaPagtoDiasBeforePost(DataSet: TDataSet);
    procedure dbTabelaNewRecord(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FrmFrameBotoes1SpbSalvarClick(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFormaPagto: TFrmFormaPagto;

implementation

{$R *.dfm}

procedure TFrmFormaPagto.DBGrid1Enter(Sender: TObject);
begin
   if (dbTabela.State in [dsInsert, dsEdit]) then
      dbTabela.Post;
end;

procedure TFrmFormaPagto.dbTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  dbTabela.FieldByName('ARREDONDAR').AsString := 'P';
  dbTabela.FieldByName('ARRED_SN').AsString   := 'N';

end;

procedure TFrmFormaPagto.db_FormaPagtoDiasBeforePost(DataSet: TDataSet);
begin
  inherited;
   db_FormaPagtoDias.FieldByName('CODIGO').AsInteger := dbTabela.FieldByName('CODIGO').AsInteger;
end;

procedure TFrmFormaPagto.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  db_FormaPagtoDias.Close;
end;

procedure TFrmFormaPagto.FormCreate(Sender: TObject);
begin
  inherited;
  db_FormaPagtoDias.Open;

  FrmFrameBarra1.Height := 1;
end;

procedure TFrmFormaPagto.FormDestroy(Sender: TObject);
begin
  inherited;
  FrmFormaPagto := Nil;
end;

procedure TFrmFormaPagto.FrmFrameBotoes1SpbSalvarClick(Sender: TObject);
begin
  inherited;
   if (db_FormaPagtoDias.State in [dsInsert, dsEdit]) then
      db_FormaPagtoDias.Post;

end;

end.
