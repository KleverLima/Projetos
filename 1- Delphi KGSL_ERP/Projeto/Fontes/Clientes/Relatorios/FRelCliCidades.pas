unit FRelCliCidades;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ExtCtrls, quickrpt, Qrctrls, Db,  
   QRPDFFilt, FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet;

type
   TFrmRelCliCidades = class(TForm)
      Prever: TQuickRep;
      DetailBand1: TQRBand;
      QRDBText1: TQRDBText;
      QRDBText3: TQRDBText;
      QRDBText4: TQRDBText;
      ColumnHeaderBand1: TQRBand;
      QRLabel1: TQRLabel;
      QRLabel3: TQRLabel;
      QRLabel4: TQRLabel;
      QRGroup1: TQRGroup;
      PageHeaderBand1: TQRBand;
      QRLabel15: TQRLabel;
      QRSysData3: TQRSysData;
      QRLabel16: TQRLabel;
      QRSysData4: TQRSysData;
      QRLabel17: TQRLabel;
      DB_Clientes: TFDQuery;
      SummaryBand1: TQRBand;
      groups: TQRExpr;
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
   FrmRelCliCidades: TFrmRelCliCidades;

implementation

uses Biblioteca, FRelClientes, Global;

{$R *.DFM}

procedure TFrmRelCliCidades.FormCreate(Sender: TObject);
begin

   vSelect := ' SELECT * FROM VIEW_CLIENTES  ';
   vSelect := vSelect + ' WHERE  ';
   vSelect := vSelect + ' TIPO=' + QuotedStr('CLIENTE');
   vSelect := vSelect + ' AND (DATA>=:data1 AND DATA<=:data2) ';

   if strCliente <> '' then
      vSelect := vSelect + ' AND CODIGO=' + strCliente;

   if strVendedor <> '' then
      vSelect := vSelect + ' AND VENDEDOR=' + strVendedor;

   if strCidade <> '' then
      vSelect := vSelect + ' AND CIDADECODIGO=' + strCidade;

   if strEstado <> '' then
      vSelect := vSelect + ' AND UF=' + QuotedStr(strEstado);

   vSelect := vSelect + ' ORDER BY ' + strOrdemDados;

   DB_Clientes.Close;
   DB_Clientes.SQL.clear;
   DB_Clientes.SQL.Add(vSelect);
   DB_Clientes.ParamByName('data1').AsDateTime :=  dtDataIni;
   DB_Clientes.ParamByName('data2').AsDateTime :=  dtDataFim;
   DB_Clientes.Open;

  try
    Prever.Preview;
  finally
    DB_Clientes.Close;
    Close;
  end;

end;

procedure TFrmRelCliCidades.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DB_Clientes.Close;
   Action := cafree;

end;

end.
