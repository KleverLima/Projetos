unit FFat_RelCurvaABC_Clientes;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, QuickRpt, DB, SqlExpr, QRCtrls, QRExport,
   QRPDFFilt, Classe.Global, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
   TFrmFat_RelCurvaABC_Clientes = class(TForm)
      QuickRep: TQuickRep;
      DetailBand1: TQRBand;
      SummaryBand1: TQRBand;
      DB_Vendas: TFDQuery;
      QRLabel13: TQRLabel;
      QRDBText3: TQRDBText;
      QRDBText8: TQRDBText;
      Qtdolicitada: TQRExpr;
      qrPercent: TQRLabel;
      qrTotal: TQRLabel;
      TitleBand1: TQRBand;
      QRLabel2: TQRLabel;
      QRLabel1: TQRLabel;
      QRLabel3: TQRLabel;
      Band_Cabecalho: TQRBand;
      LblTitulo: TQRLabel;
      QRLabel8: TQRLabel;
      QRShape3: TQRShape;
      QRLabel4: TQRLabel;
      QRLabel11: TQRLabel;
      QRSysData2: TQRSysData;
      QRSysData4: TQRSysData;
      QRSysData5: TQRSysData;
      LblPeriodo: TQRLabel;
      QRShape2: TQRShape;
      LblVendedor: TQRLabel;
      LblCliente: TQRLabel;
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
      procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
        var PrintBand: Boolean);
      procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
        var PrintReport: Boolean);
    procedure DB_VendasBeforeOpen(DataSet: TDataSet);
   private
      { Private declarations }
      somag, somaP: real;
      valor1, valor2, somat: real;
     Flutuante  : Double;
     Flutuante1 : Double;
     Flutuante2 : Double;

   public
      { Public declarations }
   end;

var
   FrmFat_RelCurvaABC_Clientes: TFrmFat_RelCurvaABC_Clientes;

implementation

uses FPrincipal, Biblioteca, Global,
    FRelFaturamento;

{$R *.dfm}

procedure TFrmFat_RelCurvaABC_Clientes.FormCreate(Sender: TObject);
begin
   Flutuante1 := 0;
   Flutuante2 := 0;

   case FrmRelFaturamento.RadioNF.ItemIndex of
      0:
         LblTitulo.Caption := LblTitulo.Caption + #13 + #10 +
           '(TODAS AS NOTAS FISCAIS)   ';
      1:
         LblTitulo.Caption := LblTitulo.Caption + #13 + #10 + '(NF SAÍDAS)   ';
      2:
         LblTitulo.Caption := LblTitulo.Caption + #13 + #10 + '(NF ENTRADAS) ';
      3:
         LblTitulo.Caption := LblTitulo.Caption + #13 + #10 +
           '(NF CANCELADAS) ';

   end;

   dtDataIni := StrToDate(FrmRelFaturamento.MskDataIni.Text);
   dtDataFim := StrToDate(FrmRelFaturamento.MskDataFim.Text);
   LblPeriodo.Caption := 'PERÍODO: ' + DateToStr(dtDataIni) + ' - ' +
     DateToStr(dtDataFim);

   sqlMaster := '';
   sqlMaster := sqlMaster + ' SELECT  ';
   sqlMaster := sqlMaster + ' CLIENTE_NOME,   ';
   sqlMaster := sqlMaster + ' Sum(NF_VALOR_TOTAL)  as FATURAMENTO   ';
   sqlMaster := sqlMaster + ' FROM  VIEW_NOTAFISCAL ';
   sqlMaster := sqlMaster + ' WHERE  ';
   sqlMaster := sqlMaster + ' EMPRESA=:EMPRESA  ';
   sqlMaster := sqlMaster + ' AND  EMISSAO>=:DATA1 AND EMISSAO<=:DATA2 ';
   sqlMaster := sqlMaster + Tipo_NF;


   if not FrmRelFaturamento.chkCliente.Checked then
   Begin
      sqlMaster := sqlMaster + '  AND   CLIENTE=:CLIENTE ';
   End;

   if not FrmRelFaturamento.chkRepres.Checked then
   Begin
      sqlMaster := sqlMaster + '   AND  VENDEDOR=:VENDEDOR ';
   End;

   sqlMaster := sqlMaster + ' GROUP BY CLIENTE_NOME   ';
   sqlMaster := sqlMaster + ' ORDER BY FATURAMENTO DESC, CLIENTE_NOME ASC ';

   DB_Vendas.Close;
   DB_Vendas.SQL.clear;
   DB_Vendas.SQL.Add(sqlMaster);
   DB_Vendas.ParamByName('DATA1').AsDateTime := dtDataIni;
   DB_Vendas.ParamByName('DATA2').AsDateTime := dtDataFim;

   if not FrmRelFaturamento.chkCliente.Checked then
   Begin

      DB_Vendas.ParamByName('CLIENTE').AsInteger :=
        StrToInt(FrmRelFaturamento.EditCliente.Text);

      LblCliente.Caption := 'CLIENTE: ' +
        FrmRelFaturamento.EditClienteNome.Text;

   End;

   if not FrmRelFaturamento.chkRepres.Checked then
   Begin

      DB_Vendas.ParamByName('VENDEDOR').AsInteger :=
        StrToInt(FrmRelFaturamento.EditVendedor.Text);

      LblVendedor.Caption := 'VENDEDOR: ' +
        FrmRelFaturamento.EditNomeVendedor.Text;

   End;
   DB_Vendas.Open;

   Flutuante1 := 0;
   While not DB_Vendas.Eof do
   Begin
      Flutuante1 := Flutuante1 + DB_Vendas.FieldByName('FATURAMENTO').AsFloat;
      DB_Vendas.Next;
   end;
   DB_Vendas.First;

   if Flutuante1 <= 0 then
      Flutuante1 := 1;

   QuickRep.Preview;

   Close;

end;

procedure TFrmFat_RelCurvaABC_Clientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DB_Vendas.Close;

   Action := caFree;
End;

procedure TFrmFat_RelCurvaABC_Clientes.DB_VendasBeforeOpen(DataSet: TDataSet);
begin
   DB_Vendas.ParamByName('EMPRESA').AsInteger := FSistema.Empresa;

end;

procedure TFrmFat_RelCurvaABC_Clientes.DetailBand1BeforePrint
  (Sender: TQRCustomBand; var PrintBand: Boolean);

var

   valor1, valor2, somat: real;

begin

   // somar faturamento
   valor1 := 0;
   valor2 := 0;
   somat := 0;

   valor1 := DB_Vendas.FieldByName('FATURAMENTO').AsFloat;
   valor2 := Flutuante1;

   somat := ((valor1 / valor2) * 100);

   somag := somag + somat;
   qrPercent.Caption := Formatfloat('###,##0.00%', somat);
   qrTotal.Caption := Formatfloat('###,##0.00%', somag);

end;

procedure TFrmFat_RelCurvaABC_Clientes.QuickRepBeforePrint
  (Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   valor1 := 0;
   valor2 := 0;
   somat := 0;
   somag := 0;
   somaP := 0;

end;

End.
