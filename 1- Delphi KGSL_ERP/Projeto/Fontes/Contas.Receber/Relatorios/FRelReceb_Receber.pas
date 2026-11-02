unit FRelReceb_Receber;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ExtCtrls, quickrpt, Qrctrls, Db,   QRPrntr, QRExport,
   QRPDFFilt,  Classe.Global, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
   TFrmRelReceb_Receber = class(TForm)
      QuickRep: TQuickRep;
      PageHeaderBand1: TQRBand;
      QRLabel2: TQRLabel;
      QRSysData2: TQRSysData;
      QRLabel31: TQRLabel;
      QRSysData1: TQRSysData;
      QRLabel10: TQRLabel;
      Datalhes: TQRBand;
      QRDBText3: TQRDBText;
      QRDBText4: TQRDBText;
      QRDBText6: TQRDBText;
      QRDBText9: TQRDBText;
      QuebraBanco: TQRGroup;
    LblAgrupar: TQRLabel;
    lblCampoGrupo: TQRDBText;
      Cabecalho: TQRBand;
      QRLabel9: TQRLabel;
      QRLabel1: TQRLabel;
      QRLabel6: TQRLabel;
      QRLabel12: TQRLabel;
      TotalOperacao: TQRBand;
      QRLabel4: TQRLabel;
      QRExpr4: TQRExpr;
      SummaryBand1: TQRBand;
      QRExpr6: TQRExpr;
      ADO_CtaReceber:  TFDQuery;
      PageFooterBand1: TQRBand;
      QRDBText1: TQRDBText;
      QRLabel5: TQRLabel;
      Lblvendedor: TQRLabel;
      QRDBText7: TQRDBText;
      QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText8: TQRDBText;
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
        var PrintReport: Boolean);
    procedure ADO_CtaReceberBeforeOpen(DataSet: TDataSet);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmRelReceb_Receber: TFrmRelReceb_Receber;

implementation

uses Biblioteca, FRelCtaReceber, Global, FPrincipal;

{$R *.DFM}

procedure TFrmRelReceb_Receber.FormCreate(Sender: TObject);
begin


   vSelect := ' SELECT * FROM VIEW_FIN_CTARECEBER ';
   vSelect := vSelect + ' WHERE  ';
   vSelect := vSelect + ' EMPRESA=:EMPRESA  ';
   vSelect := vSelect + ' AND QUITADO=' + QuotedStr('N');

   if strRestricaoCredito <> '' then
     vSelect := vSelect + ' AND RESTRICAO=' +QuotedStr(strRestricaoCredito);

   if FrmRelCtaReceber.rAgrupar.ItemIndex=0 then
      vSelect := vSelect + '  AND (VENCIMENTO>=:data1 AND VENCIMENTO<=:data2) ';

   if FrmRelCtaReceber.rAgrupar.ItemIndex=1 then
      vSelect := vSelect + '  AND (DATA>=:data1 AND DATA<=:data2) ';

   if FrmRelCtaReceber.rAgrupar.ItemIndex=2 then
      vSelect := vSelect + '  AND (DATA_PAGTO>=:data1 AND DATA_PAGTO<=:data2) ';

   If FrmRelCtaReceber.chkClientes.Checked = False Then
   Begin
      vSelect := vSelect + '  AND CLIENTE=''' + Trim(FrmRelCtaReceber.EditCliente.Text) + ''' ';
   End;

   if not FrmRelCtaReceber.chkRepres.Checked then
   Begin
      vSelect := vSelect + '  AND VENDEDOR=' + strVendedor
   End;

   if not FrmRelCtaReceber.chkContaCaixa.Checked then
   Begin
      vSelect := vSelect + '  AND CONTACAIXA=' + strContaCaixa;
   End;

   if not FrmRelCtaReceber.chkCarteira.Checked then
   Begin
      vSelect := vSelect + '  AND CARTEIRA=' + strCarteira;
   End;

   if not FrmRelCtaReceber.chkContaBancaria.Checked then
   Begin
      vSelect := vSelect + '  AND CONTACORRENTE=' + strContaCorrente;
   End;

   if not FrmRelCtaReceber.chkFormaPagto.Checked then
   Begin
      vSelect := vSelect + '  AND FORMA_PAGTO=' + strFormaPagamento;
   End;

   vSelect := vSelect + ' ORDER BY ' + strOrdemDados;

   ADO_CtaReceber.close;
   ADO_CtaReceber.SQL.clear;
   ADO_CtaReceber.SQL.Add(vSelect);
   ADO_CtaReceber.ParamByName('data1').AsDateTime := dtDataIni;
   ADO_CtaReceber.ParamByName('data2').AsDateTime := dtDataFim;
   ADO_CtaReceber.open;

   QuebraBanco.Expression := 'ADO_CtaReceber.' + Agrupar;
   LblAgrupar.Caption := strNomeAgrupamento;
   lblCampoGrupo.DataField := Agrupar;

   QuickRep.Preview;
   close;

end;

procedure TFrmRelReceb_Receber.ADO_CtaReceberBeforeOpen(DataSet: TDataSet);
begin
   ADO_CtaReceber.ParamByName('EMPRESA').AsInteger := FSistema.Empresa;

end;

procedure TFrmRelReceb_Receber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ADO_CtaReceber.close;
  Action := CaFree;
end;

procedure TFrmRelReceb_Receber.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   // Lblvendedor.Caption:='Representante: '+sCodVendedor+'-'+ADO_CtaReceber.FieldByName('NOMEVEND').AsString;

end;

end.
