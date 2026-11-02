unit FRelComprasFornecedor;

interface

uses
   SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
   Forms, Dialogs,   DB, Qrctrls,
   quickrpt, ExtCtrls, QRPDFFilt,
   QRExport, FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet;

type
   TFrmRelComprasFornecedor = class(TForm)
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
      QuebraProduto: TQRGroup;
      QRLabel15: TQRLabel;
      QRDBText13: TQRDBText;
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
    dsComprasItens: TDataSource;
    QryComprasItens: TFDQuery;
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
    QRLabel12: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText10: TQRDBText;
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmRelComprasFornecedor: TFrmRelComprasFornecedor;

implementation

uses Global, FRelCompras, Biblioteca;

{$R *.DFM}

procedure TFrmRelComprasFornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   QryComprasItens.Close;
   Action := caFree;
end;

procedure TFrmRelComprasFornecedor.FormCreate(Sender: TObject);
begin
   dtDataIni := StrToDate(FrmRelCompras.MskDataIni.Text);
   dtDataFim := StrToDate(FrmRelCompras.MskDataFim.Text);

   sqlMaster := '';
   sqlMaster := sqlMaster +
     ' SELECT A.*, B.CODIGO, B.NOME FROM COMPRAS_ITENS A, CAD_CLIENTES B  ';
   sqlMaster := sqlMaster + ' WHERE  ';
   sqlMaster := sqlMaster + ' B.CODIGO=A.FORNECEDOR ';
   sqlMaster := sqlMaster + ' AND  (A.DATA>=:DATAINI AND A.DATA<=:DATAFIM )';
   if not FrmRelCompras.chkFornecedor.Checked then
     sqlMaster := sqlMaster + ' AND  A.FORNECEDOR='+strFornecedor;
   QryComprasItens.Close;
   QryComprasItens.SQL.clear;
   QryComprasItens.SQL.Add(sqlMaster);
   QryComprasItens.ParamByName('DATAINI').AsDate := dtDataIni;
   QryComprasItens.ParamByName('DATAFIM').AsDate := dtDataFim;
   QryComprasItens.Open;
   try
     QuickRep.Preview;
   finally
     QryComprasItens.Close;
     Close;
   end;

end;

end.
