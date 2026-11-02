unit FRelFornFones;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ExtCtrls, quickrpt, Qrctrls, Db,  
   QRPDFFilt, FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet;

type
   TFrmRelFornFones = class(TForm)
      Prever: TQuickRep;
      DetailBand1: TQRBand;
      QRDBText1: TQRDBText;
      QRDBText4: TQRDBText;
      ColumnHeaderBand1: TQRBand;
      QRLabel1: TQRLabel;
      QRLabel4: TQRLabel;
      QRGroup1: TQRGroup;
      QRExpr1: TQRExpr;
      QRLabel5: TQRLabel;
      QRDBText5: TQRDBText;
      PageHeaderBand1: TQRBand;
      QRSysData3: TQRSysData;
      QRLabel16: TQRLabel;
      QRSysData4: TQRSysData;
      QRLabel17: TQRLabel;
      DB_Fornecedor: TFDQuery;
      QRLabel10: TQRLabel;
      QRLabel2: TQRLabel;
      QRDBText2: TQRDBText;
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmRelFornFones: TFrmRelFornFones;

implementation

uses Biblioteca, FRelClientes, Global, FPrincipal;

{$R *.DFM}

procedure TFrmRelFornFones.FormCreate(Sender: TObject);
begin

   vSelect := ' SELECT * FROM VIEW_CLIENTES  ';
   vSelect := vSelect + ' WHERE ';
   vSelect := vSelect + ' TIPO=''FORNECEDOR'' ';

   if strCidade <> '' then
      vSelect := vSelect + ' AND CIDADECODIGO=' + strCidade;


   vSelect := vSelect + ' ORDER BY NOME ';;
   DB_Fornecedor.Close;
   DB_Fornecedor.SQL.clear;
   DB_Fornecedor.SQL.Add(vSelect);
   DB_Fornecedor.Open;

   Prever.Preview;
   Close;

end;

procedure TFrmRelFornFones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   DB_Fornecedor.Close;
   Action := cafree;

end;

end.
