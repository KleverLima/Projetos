unit FRelPlanos;

interface

uses
   SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
   Forms, Dialogs,   DB, Qrctrls, quickrpt,
   ExtCtrls, QRPDFFilt, FireDAC.Comp.Client, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
   TFrmRelPlanos = class(TForm)
      QuickRep: TQuickRep;
      EmpresaTitulo: TQRBand;
      QRLabel1: TQRLabel;
      QRLabel3: TQRLabel;
      QRSysData1: TQRSysData;
      QRLabel4: TQRLabel;
      QRSysData2: TQRSysData;
      Cabecalho: TQRBand;
      Datalhes: TQRBand;
      QRLabel6: TQRLabel;
      QRDBText5: TQRDBText;
      QRLabel13: TQRLabel;
      QRDBText10: TQRDBText;
      QRLabel14: TQRLabel;
      QRDBText11: TQRDBText;
      QuebraProduto: TQRGroup;
      QRDBText13: TQRDBText;
      TotalProduto: TQRBand;
      QRExpr4: TQRExpr;
      QRExpr5: TQRExpr;
      SummaryBand1: TQRBand;
      QRExpr9: TQRExpr;
      QRExpr10: TQRExpr;
      db_PlanoContas: TFDQuery;
      QRLabel5: TQRLabel;
      QRDBText1: TQRDBText;
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmRelPlanos: TFrmRelPlanos;

implementation

uses Global, Biblioteca, FRelPlanoContas;

{$R *.DFM}

procedure TFrmRelPlanos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TFrmRelPlanos.FormCreate(Sender: TObject);
begin

   sqlMaster := '';
   sqlMaster := sqlMaster + ' SELECT  *  FROM VIEW_PLANOCONTAS ';

   if FrmRelPlanoContas.RadioG.ItemIndex = 1 then
   Begin
      sqlMaster := sqlMaster + ' WHERE ';
      sqlMaster := sqlMaster + ' TIPO=''DEBITO'' ';
   End;

   if FrmRelPlanoContas.RadioG.ItemIndex = 2 then
   Begin
      sqlMaster := sqlMaster + ' WHERE ';
      sqlMaster := sqlMaster + ' TIPO=''CREDITO'' ';
   End;

   sqlMaster := sqlMaster + ' ORDER BY PLANO, TIPO, CODIGO_PLANO  ';

   db_PlanoContas.Close;
   db_PlanoContas.SQL.clear;
   db_PlanoContas.SQL.Add(sqlMaster);
   db_PlanoContas.Open;

   QuickRep.Preview;
   Close;

end;

end.
