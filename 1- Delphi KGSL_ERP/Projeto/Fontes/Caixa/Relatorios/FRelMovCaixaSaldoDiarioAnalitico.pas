unit FRelMovCaixaSaldoDiarioAnalitico;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     DB, quickrpt, Qrctrls, ExtCtrls,
   QRPDFFilt, FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet;

type
   TFrmRelMovCaixaSaldoDiarioAnalitico = class(TForm)
      QuickRep: TQuickRep;
      QRBand1: TQRBand;
      QRLabel7: TQRLabel;
      QRLabel9: TQRLabel;
      QRSysData3: TQRSysData;
      QRLabel10: TQRLabel;
      QRSysData4: TQRSysData;
      Cabecalho: TQRBand;
      QRBand2: TQRBand;
      QuebraBanco: TQRGroup;
      QRLabel15: TQRLabel;
      TotalClasse: TQRBand;
      QRLabel14: TQRLabel;
      QRBand4: TQRBand;
      Sql_MovmCaixa: TFDQuery;
      QRLabel6: TQRLabel;
      QRLabel3: TQRLabel;
      QRLabel11: TQRLabel;
      LblSldAnterior: TQRLabel;
      QRLabel8: TQRLabel;
      QRLabel4: TQRLabel;
      Vlr_SaldoAtual: TQRDBText;
      Vlr_Debito: TQRDBText;
      Vlr_Credito: TQRDBText;
      Vlr_SaldoAnterior: TQRDBText;
      QRDBText2: TQRDBText;
      QRDBText3: TQRDBText;
      QRExpr1: TQRExpr;
      QRExpr3: TQRExpr;
      QRDBText4: TQRDBText;
      QRDBText5: TQRDBText;
      Sql_MovmCaixaDATA: TSQLTimeStampField;
      Sql_MovmCaixaPLANO_CLASSE: TIntegerField;
      Sql_MovmCaixaPLANO_CLASSE_NOME: TStringField;
      Sql_MovmCaixaPLANO_CTA: TStringField;
      Sql_MovmCaixaPLANO_CTA_NOME: TStringField;
      Sql_MovmCaixaHISTORICO: TStringField;
      Sql_MovmCaixaSALDO_ANTERIOR: TFloatField;
      Sql_MovmCaixaCREDITO: TFloatField;
      Sql_MovmCaixaDEBITO: TFloatField;
      Sql_MovmCaixaSALDOATUAL: TFloatField;
      QRDBText1: TQRDBText;
      QRExpr4: TQRExpr;
      QRExpr6: TQRExpr;
      QRDBText6: TQRDBText;
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmRelMovCaixaSaldoDiarioAnalitico: TFrmRelMovCaixaSaldoDiarioAnalitico;

implementation

uses FPrincipal, Global, FRelMovCaixa, FBaseDados, Biblioteca;

{$R *.DFM}

procedure TFrmRelMovCaixaSaldoDiarioAnalitico.FormCreate(Sender: TObject);
begin

   sqlMaster :=
     ' SELECT * FROM SP_CAIXA_SALDO_02(:DATA1, :DATA2, :SLDANTERIOR, :PLANO_CTA) ';

   Sql_MovmCaixa.Close;
   Sql_MovmCaixa.SQL.Clear;
   Sql_MovmCaixa.SQL.Add(sqlMaster);
   Sql_MovmCaixa.ParamByName('data1').AsDateTime :=
     StrToDate(FrmRelMovCaixa.FrameDatas1.MskDataIni.Text);
   Sql_MovmCaixa.ParamByName('data2').AsDateTime :=
     StrToDate(FrmRelMovCaixa.FrameDatas1.MskDataFim.Text);

   // Informar se deve ou não Incluir o Saldo Anterior
   if (FrmRelMovCaixa.RadioGSaldoAnterior.ItemIndex = 0) then
   begin
      Sql_MovmCaixa.ParamByName('SLDANTERIOR').AsString := 'S';
   end;

   if (FrmRelMovCaixa.RadioGSaldoAnterior.ItemIndex = 1) then
   begin
      LblSldAnterior.Enabled := False;
      Vlr_SaldoAnterior.Enabled := False;
      Sql_MovmCaixa.ParamByName('SLDANTERIOR').AsString := 'N';
   end;

   if not FrmRelMovCaixa.chkPlanos.checked then
   Begin
      Sql_MovmCaixa.ParamByName('PLANO_CTA').AsString :=
        FrmRelMovCaixa.EditPlanoContas.Text;
   End
   else
   begin
      Sql_MovmCaixa.ParamByName('PLANO_CTA').AsString := '%';
   end;

   Sql_MovmCaixa.Open;

   QuickRep.Preview;
   Close;

end;

procedure TFrmRelMovCaixaSaldoDiarioAnalitico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Sql_MovmCaixa.Close;

   Action := caFree;
end;

end.
