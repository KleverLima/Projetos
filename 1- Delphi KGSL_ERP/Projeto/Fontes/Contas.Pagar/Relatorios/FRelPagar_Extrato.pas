unit FRelPagar_Extrato;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ExtCtrls, Db,   Qrctrls, QuickRpt, QRPrntr, QRExport,
   QRPDFFilt,  Classe.Global, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
   TFrmRelPagar_Extrato = class(TForm)
      PageHeaderBand1: TQRBand;
      QRLabel2: TQRLabel;
      QRSysData2: TQRSysData;
      QRLabel31: TQRLabel;
      QRSysData1: TQRSysData;
      Datalhes: TQRBand;
      QRDBText3: TQRDBText;
      QRDBText4: TQRDBText;
      QuebraBanco: TQRGroup;
      QRLabel15: TQRLabel;
      Cabecalho: TQRBand;
      QRLabel9: TQRLabel;
      QRLabel1: TQRLabel;
      TotalOperacao: TQRBand;
      SummaryBand1: TQRBand;
      dbCtaPagar: TFDQuery;
      QRDBText5: TQRDBText;
      QRLabel4: TQRLabel;
      QRLabel5: TQRLabel;
      QRLabel6: TQRLabel;
      QRDBText6: TQRDBText;
      QRLabel10: TQRLabel;
      QRLabel12: TQRLabel;
    lblValor: TQRDBText;
      QRExpr4: TQRExpr;
      QRExpr6: TQRExpr;
      QRLabel13: TQRLabel;
      lbl_situacao: TQRLabel;
      QuickRep: TQuickRep;
    lblValorPago: TQRDBText;
      QRLabel11: TQRLabel;
      QRExpr1: TQRExpr;
      QRExpr2: TQRExpr;
      QRShape1: TQRShape;
      qReceber: TQRLabel;
      QRLabel14: TQRLabel;
      QRLabel16: TQRLabel;
      qVlrPago: TQRLabel;
      qSaldo: TQRLabel;
      PageFooterBand1: TQRBand;
      QRDBText8: TQRDBText;
      LblFornecedor: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
      procedure FormCreate(Sender: TObject);
      procedure DatalhesBeforePrint(Sender: TQRCustomBand;
        var PrintBand: Boolean);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
        var PrintBand: Boolean);
      procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
        var PrintReport: Boolean);
    procedure dbCtaPagarBeforeOpen(DataSet: TDataSet);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmRelPagar_Extrato: TFrmRelPagar_Extrato;

implementation

uses Biblioteca, FRelCtaReceber, Global, FPrincipal, FBaseDados,
   FRelCtaPagar;

{$R *.DFM}

procedure TFrmRelPagar_Extrato.FormCreate(Sender: TObject);
begin

   dbCtaPagar.close;
   dbCtaPagar.SQL.clear;
   dbCtaPagar.SQL.Add('SELECT * FROM VIEW_FIN_CTAPAGAR');
   dbCtaPagar.SQL.Add('WHERE');
   dbCtaPagar.SQL.Add('EMPRESA=:EMPRESA');
   //dbCtaPagar.SQL.Add('AND');
   //dbCtaPagar.SQL.Add('VALOR>0 AND VALOR_PAGO>0');
   dbCtaPagar.SQL.Add('AND');


   dbCtaPagar.SQL.Add('VENCIMENTO BETWEEN :DATAINICIAL AND :DATAFINAL');

   If FrmRelCtaPagar.chkFornecedor.Checked = False Then
   Begin
      dbCtaPagar.SQL.Add('AND');
      dbCtaPagar.SQL.Add('FORNECEDOR='+strFornecedor);
   End;

   if not FrmRelCtaPagar.chkContaCaixa.Checked then
   Begin
      dbCtaPagar.SQL.Add('AND');
      dbCtaPagar.SQL.Add('CONTACAIXA='+strContaCaixa);
   End;

   if not FrmRelCtaPagar.chkContaBancaria.Checked then
   Begin
      dbCtaPagar.SQL.Add('AND');
      dbCtaPagar.SQL.Add('CONTACORRENTE='+strContaCorrente);
   End;


   dbCtaPagar.SQL.Add('ORDER BY VENCIMENTO, NOME_FORNECEDOR' );
   dbCtaPagar.ParamByName('DATAINICIAL').AsDateTime  := dtDataIni;
   dbCtaPagar.ParamByName('DATAFINAL').AsDateTime    := dtDataFim;
   dbCtaPagar.open;

   QuickRep.Preview;
   close;

end;

procedure TFrmRelPagar_Extrato.dbCtaPagarBeforeOpen(DataSet: TDataSet);
begin
   dbCtaPagar.ParamByName('EMPRESA').AsInteger := FSistema.Empresa;

end;

procedure TFrmRelPagar_Extrato.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

   dbCtaPagar.close;

   Action := caFree;

end;

procedure TFrmRelPagar_Extrato.DatalhesBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

   if dbCtaPagar.FieldByName('QUITADO').AsString <> 'S' then
   Begin
      lbl_situacao.caption := 'A PAGAR';
      lbl_situacao.Font.Color := clRed;
   End
   else
   Begin
      lbl_situacao.caption := 'QUITADO';
      lbl_situacao.Font.Color := clBlack;
   End;

   Flutuante1 := Flutuante1 + dbCtaPagar.FieldByName('VALOR').AsFloat;
   Flutuante2 := Flutuante2 + dbCtaPagar.FieldByName('VALOR_PAGO').AsFloat;

   if (dbCtaPagar.FieldByName('VALOR').AsFloat=0)       and
      (dbCtaPagar.FieldByName('VALOR_PAGO').AsFloat=0) then
   begin
      lblValor.Enabled     :=false;
      lblValorPago.Enabled :=false;
      lbl_situacao.caption := '';
   end
   else
   begin
      lblValor.Enabled     :=true;
      lblValorPago.Enabled :=true;
   end;


end;

procedure TFrmRelPagar_Extrato.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

   Flutuante := 0;

   // Saldo
   Flutuante := (Flutuante1 - Flutuante2);
   if Flutuante < 1 then
      Flutuante := 0;

   qReceber.caption := FormatFloat('###,##0.00', Flutuante1);
   qVlrPago.caption := FormatFloat('###,##0.00', Flutuante2);
   qSaldo.caption := FormatFloat('###,##0.00', Flutuante);

End;

procedure TFrmRelPagar_Extrato.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   Flutuante := 0;
   Flutuante1 := 0;
   Flutuante2 := 0;

   // LblFornecedor.Caption:='Fornecedor: '+TxtAuxiliar+'-'+dbCtaPagar.FieldByName('NOME').AsString;

end;

end.
