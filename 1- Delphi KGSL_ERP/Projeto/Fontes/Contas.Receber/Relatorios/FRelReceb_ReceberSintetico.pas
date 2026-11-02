unit FRelReceb_ReceberSintetico;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ExtCtrls, quickrpt, Qrctrls, Db,   QRPrntr, QRExport,
   QRPDFFilt, FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet;

type
   TFrmRelReceb_ReceberSintetico = class(TForm)
      QuickRep: TQuickRep;
      PageHeaderBand1: TQRBand;
      QRLabel2: TQRLabel;
      QRSysData2: TQRSysData;
      QRLabel31: TQRLabel;
      QRSysData1: TQRSysData;
      QRLabel10: TQRLabel;
      Datalhes: TQRBand;
      QRDBText4: TQRDBText;
      QRDBText9: TQRDBText;
      QuebraBanco: TQRGroup;
      QRLabel15: TQRLabel;
      QRDBText5: TQRDBText;
      Cabecalho: TQRBand;
      QRLabel1: TQRLabel;
      QRLabel12: TQRLabel;
      TotalOperacao: TQRBand;
      QRLabel4: TQRLabel;
      QRExpr4: TQRExpr;
      SummaryBand1: TQRBand;
      QRExpr6: TQRExpr;
      db_CtaReceber: TFDQuery;
      QRLabel5: TQRLabel;
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmRelReceb_ReceberSintetico: TFrmRelReceb_ReceberSintetico;

implementation

uses Biblioteca, FRelCtaReceber, Global, FPrincipal;

{$R *.DFM}

procedure TFrmRelReceb_ReceberSintetico.FormCreate(Sender: TObject);
begin

   {
     vSelect := '         select * from view_fin_ctareceber ';
     vSelect := vSelect+' WHERE  ';
     vSelect := vSelect+' (VENCIMENTO>=:data1 AND VENCIMENTO<=:data2) ';
     vSelect := vSelect+' AND  ';
     vSelect := vSelect+' QUITADO<>''S'' ';

     If FrmRelCtaReceber.chkClientes.Checked=False Then
     Begin
     vSelect := vSelect+' AND   ';
     vSelect := vSelect+' CLIENTE='''+xCodCliente+''' ';
     End;
     // selecionar representante
     if not FrmRelCtaReceber.chkRepres.Checked then
     Begin
     vSelect  :=vSelect  + ' AND ';
     vSelect  :=vSelect  + ' VENDEDOR=:vendedor01 ';
     End;

     //vSelect := vSelect+' ORDER BY B.VENC, '+OrdemDados;
     vSelect := vSelect+' ORDER BY '+OrdemDados;

     db_CtaReceber.close;
     db_CtaReceber.SQL.clear;
     db_CtaReceber.SQL.Add(vSelect);
   }

   db_CtaReceber.ParamByName('data1').AsDateTime := dtDataIni;
   db_CtaReceber.ParamByName('data2').AsDateTime := dtDataFim;

   db_CtaReceber.open;
   QuickRep.Preview;
   close;

end;

procedure TFrmRelReceb_ReceberSintetico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   db_CtaReceber.close;

   Action := caFree;

end;

end.
