unit FComprasImprimir;

interface

uses
   SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
   Forms, Dialogs,   DB, ExtCtrls, jpeg, QRCtrls, QuickRpt;

type
   TFrmComprasImprimir = class(TForm)
      QuickRep: TQuickRep;
      EmpresaTitulo: TQRBand;
      QRLabel1: TQRLabel;
      QRLabel3: TQRLabel;
      QRSysData1: TQRSysData;
      QRLabel4: TQRLabel;
      QRSysData2: TQRSysData;
      Cabecalho: TQRBand;
      QRLabel8: TQRLabel;
      QRLabel10: TQRLabel;
      QRLabel14: TQRLabel;
      Datalhes: TQRBand;
      QRDBText6: TQRDBText;
      QRDBText7: TQRDBText;
      QRDBText11: TQRDBText;
      TotalProduto: TQRBand;
      QRExpr1: TQRExpr;
      QRExpr2: TQRExpr;
      QRExpr4: TQRExpr;
      QRExpr5: TQRExpr;
      QRShape5: TQRShape;
      SummaryBand1: TQRBand;
      QRExpr6: TQRExpr;
      QRExpr7: TQRExpr;
      QRExpr9: TQRExpr;
      QRExpr10: TQRExpr;
      QRLabel16: TQRLabel;
      QRDBText5: TQRDBText;
      QRLabel6: TQRLabel;
      QRLabel11: TQRLabel;
      QRLabel13: TQRLabel;
      QRLabel17: TQRLabel;
      QRExpr11: TQRExpr;
      QRExpr12: TQRExpr;
      QRLabel7: TQRLabel;
      QRLabel18: TQRLabel;
      QRDBText1: TQRDBText;
      QRExpr13: TQRExpr;
    QRGroup1: TQRGroup;
    QRLabel9: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText10: TQRDBText;
    NomeFornecedor: TQRLabel;
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmComprasImprimir: TFrmComprasImprimir;

implementation


{$R *.DFM}

uses FPrincipal, FCompra;

procedure TFrmComprasImprimir.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

   Action := caFree;
end;

procedure TFrmComprasImprimir.FormCreate(Sender: TObject);
begin
  NomeFornecedor.Caption := FrmCompra.QryEntrada.FieldByName('FORNECEDOR').AsString + '-' + FrmCompra.EditNomeFornecedor.Text;
  try
    QuickRep.Preview;
  finally
    Close;
  end;
end;

end.
