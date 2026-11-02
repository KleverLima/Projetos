unit FRelCliAnalitico;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ExtCtrls, quickrpt, Qrctrls, Db,  
   QRPDFFilt, FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet;

type
   TFrmRelCliAnalit = class(TForm)
      ADO_Clientes: TFDQuery;
      Prever: TQuickRep;
      DetailBand1: TQRBand;
      QRDBText1: TQRDBText;
      QRDBText3: TQRDBText;
      QRGroup1: TQRGroup;
      QRExpr1: TQRExpr;
      QRDBText5: TQRDBText;
      QRLabel1: TQRLabel;
      QRLabel3: TQRLabel;
      QRLabel5: TQRLabel;
      QRLabel6: TQRLabel;
      QRDBText6: TQRDBText;
      QRLabel7: TQRLabel;
      QRDBText7: TQRDBText;
      QRLabel8: TQRLabel;
      QRDBText8: TQRDBText;
      QRDBText9: TQRDBText;
      QRLabel9: TQRLabel;
      QRLabel11: TQRLabel;
      QRDBText10: TQRDBText;
      QRLabel13: TQRLabel;
      QRDBText12: TQRDBText;
      PageHeaderBand1: TQRBand;
      QRLabel10: TQRLabel;
      QRDBText2: TQRDBText;
      QRLabel16: TQRLabel;
      QRSysData3: TQRSysData;
      QRLabel15: TQRLabel;
      QRLabel17: TQRLabel;
      QRSysData4: TQRSysData;
      QRLabel2: TQRLabel;
      QRDBText14: TQRDBText;
      QRLabel18: TQRLabel;
      QRDBText15: TQRDBText;
      QRLabel19: TQRLabel;
      QRDBText16: TQRDBText;
      QRLabel20: TQRLabel;
      QRDBText17: TQRDBText;
      QRLabel21: TQRLabel;
      QRDBText18: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmRelCliAnalit: TFrmRelCliAnalit;

implementation

uses Biblioteca, FRelClientes, FPrincipal, Global;

{$R *.DFM}

procedure TFrmRelCliAnalit.FormCreate(Sender: TObject);
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

End;

procedure TFrmRelCliAnalit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   ADO_Clientes.Close;
   Action := cafree;

end;

end.
