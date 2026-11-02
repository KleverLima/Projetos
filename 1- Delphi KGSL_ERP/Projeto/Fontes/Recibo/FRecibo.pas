unit FRecibo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  ACBrBase, ACBrExtenso, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, ISFEdit, ISFEditbtn, ISFdbEditbtn, IDBEdit,
  uEstSearchDialogZeos, FFrameBotoes, FFrameBarra, Vcl.ExtCtrls, Vcl.DBCtrls,
  cxTextEdit, cxCurrencyEdit, cxDBEdit, Vcl.Mask, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
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
   TFrmRecibo = class(TForm)
      db_recibo: TFDQuery;
      GroupBox1: TGroupBox;
      Label2: TLabel;
      Label5: TLabel;
      EditNOME: TDBEdit;
      ds_recibo: TDataSource;
      GroupBox2: TGroupBox;
      Label3: TLabel;
      DBEdit2: TDBEdit;
      Label1: TLabel;
      EditReferencia: TDBEdit;
      Label4: TLabel;
      Editdata: TDBEdit;
      Label6: TLabel;
      ACBrExtenso1: TACBrExtenso;
      GroupBox3: TGroupBox;
      DBMemo1: TDBMemo;
      DBRadioGroup1: TDBRadioGroup;
    FrmFrameBarra1: TFrmFrameBarra;
    FrmFrameBotoes1: TFrmFrameBotoes;
    dbEditPesquisar: TIDBEditDialog;
    cxDBCurrencyEdit1: TcxDBCurrencyEdit;
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure db_reciboNewRecord(DataSet: TDataSet);
    procedure FrmFrameBotoes1SpbAdicionarClick(Sender: TObject);
    procedure FrmFrameBotoes1SpbEditarClick(Sender: TObject);
    procedure FrmFrameBotoes1SpbCancelarClick(Sender: TObject);
    procedure FrmFrameBotoes1SpbSalvarClick(Sender: TObject);
    procedure FrmFrameBotoes1SpbExcluirClick(Sender: TObject);
    procedure FrmFrameBotoes1SpbProcurarClick(Sender: TObject);
    procedure FrmFrameBotoes1SpbSairClick(Sender: TObject);
    procedure FrmFrameBotoes1SpbImprimirClick(Sender: TObject);
    procedure db_reciboAfterOpen(DataSet: TDataSet);
    procedure cxDBCurrencyEdit1PropertiesChange(Sender: TObject);
    procedure db_reciboBeforePost(DataSet: TDataSet);
   private
    procedure GetValorExtenso;
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmRecibo: TFrmRecibo;

implementation

uses FPrincipal, Global, Biblioteca, FReciboImprimir, FBaseDados, App.Funcoes;

{$R *.dfm}

procedure TFrmRecibo.FormCreate(Sender: TObject);
begin
   FrmFrameBotoes1.DataSource := ds_recibo;
   db_recibo.open;
end;

procedure TFrmRecibo.FrmFrameBotoes1SpbAdicionarClick(Sender: TObject);
begin
   FrmFrameBotoes1.SpbAdicionarClick(Sender);
   Editdata.SetFocus;

end;

procedure TFrmRecibo.FrmFrameBotoes1SpbCancelarClick(Sender: TObject);
begin
  FrmFrameBotoes1.SpbCancelarClick(Sender);

end;

procedure TFrmRecibo.FrmFrameBotoes1SpbEditarClick(Sender: TObject);
begin
  FrmFrameBotoes1.SpbEditarClick(Sender);

end;

procedure TFrmRecibo.FrmFrameBotoes1SpbExcluirClick(Sender: TObject);
begin
  FrmFrameBotoes1.SpbExcluirClick(Sender);

end;

procedure TFrmRecibo.FrmFrameBotoes1SpbImprimirClick(Sender: TObject);
begin
  FrmFrameBotoes1.SpbSalvarClick(Sender);
  FrmReciboImprimir := TFrmReciboImprimir.create(self);

end;

procedure TFrmRecibo.FrmFrameBotoes1SpbProcurarClick(Sender: TObject);
begin
   if dbEditPesquisar.Execute then
   begin
      FrmFrameBotoes1.SpbCancelarClick(Sender);
      db_recibo.Locate('CODIGO', dbEditPesquisar.ResultFieldAsInteger('CODIGO'), []);
   End;

end;

procedure TFrmRecibo.FrmFrameBotoes1SpbSairClick(Sender: TObject);
begin
  FrmFrameBotoes1.SpbSairClick(Sender);

end;

procedure TFrmRecibo.FrmFrameBotoes1SpbSalvarClick(Sender: TObject);
begin
  FrmFrameBotoes1.SpbSalvarClick(Sender);

end;

procedure TFrmRecibo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  db_recibo.close;
  Action := Cafree;
end;

procedure TFrmRecibo.GetValorExtenso();
begin
   ACBrExtenso1.Valor := db_recibo.FieldByname('Valor').AsFloat;
   if (db_recibo.State in [dsedit,dsinsert]) then
     db_recibo.FieldByname('EXTENSO').AsString := UpperCase(ACBrExtenso1.Texto);
end;

procedure TFrmRecibo.cxDBCurrencyEdit1PropertiesChange(Sender: TObject);
begin
   GetValorExtenso();
end;

procedure TFrmRecibo.db_reciboAfterOpen(DataSet: TDataSet);
begin
  FormataCampo(db_recibo);
end;

procedure TFrmRecibo.db_reciboBeforePost(DataSet: TDataSet);
begin
  GetValorExtenso();
end;

procedure TFrmRecibo.db_reciboNewRecord(DataSet: TDataSet);
begin
   db_recibo.FieldByname('DATA').AsDateTime := Date;
   db_recibo.FieldByname('TIPO').AsString := 'C';

end;

end.
