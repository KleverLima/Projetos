unit FRelCliFones;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ExtCtrls, quickrpt, Qrctrls, Db,  
   QRPDFFilt, FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet;

type
   TFrmRelCliFones = class(TForm)
      Prever: TQuickRep;
      DetailBand1: TQRBand;
      QRDBText1: TQRDBText;
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
      ADO_Clientes: TFDQuery;
      QRLabel10: TQRLabel;
      QRLabel2: TQRLabel;
      QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmRelCliFones: TFrmRelCliFones;

implementation

uses Biblioteca, FRelClientes, Global, FPrincipal;

{$R *.DFM}

procedure TFrmRelCliFones.FormCreate(Sender: TObject);
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

   ADO_Clientes.Close;
   ADO_Clientes.SQL.clear;
   ADO_Clientes.SQL.Add(vSelect);
   ADO_Clientes.ParamByName('data1').AsDateTime :=  dtDataIni;
   ADO_Clientes.ParamByName('data2').AsDateTime :=  dtDataFim;
   ADO_Clientes.Open;

  try
    Prever.Preview;
  finally
    ADO_Clientes.Close;
    Close;
  end;

end;

procedure TFrmRelCliFones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   ADO_Clientes.Close;
   Action := cafree;

end;

end.
