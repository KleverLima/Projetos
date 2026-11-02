unit FRelRepresentantes;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ExtCtrls, quickrpt, Qrctrls, Db,  
   QRPDFFilt, FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet;

type
   TFrmRelRepresentantes = class(TForm)
      Prever: TQuickRep;
      DetailBand1: TQRBand;
      QRDBText4: TQRDBText;
      QRDBText2: TQRDBText;
      QRDBText3: TQRDBText;
      QRDBText1: TQRDBText;
      ColumnHeaderBand1: TQRBand;
      QRLabel4: TQRLabel;
      QRLabel2: TQRLabel;
      QRLabel3: TQRLabel;
      QRLabel1: TQRLabel;
      QRGroup1: TQRGroup;
      PageHeaderBand1: TQRBand;
      QRLabel15: TQRLabel;
      QRLabel17: TQRLabel;
      QRSysData4: TQRSysData;
      QRLabel16: TQRLabel;
      QRSysData3: TQRSysData;
      SummaryBand1: TQRBand;
      ADO_Clientes: TFDQuery;
      QRLabel7: TQRLabel;
      QRDBText7: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmRelRepresentantes: TFrmRelRepresentantes;

implementation

uses Biblioteca, FRelClientes, Global;

{$R *.DFM}

procedure TFrmRelRepresentantes.FormCreate(Sender: TObject);
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

procedure TFrmRelRepresentantes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   ADO_Clientes.Close;
   Action := cafree;

end;

end.
