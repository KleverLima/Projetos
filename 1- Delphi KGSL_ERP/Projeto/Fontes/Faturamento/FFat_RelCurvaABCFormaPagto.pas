unit FFat_RelCurvaABCFormaPagto;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, QuickRpt, DB, SqlExpr, QRCtrls, QRExport,
   QRPDFFilt, Classe.Global, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
   TFrmFat_RelCurvaABCFormaPagto = class(TForm)
      DB_VENDAS: TFDQuery;
      QuickRep: TQuickRep;
      DetailBand1: TQRBand;
      QRDBText3: TQRDBText;
      QRDBText2: TQRDBText;
      qrPercent: TQRLabel;
      SummaryBand1: TQRBand;
      QRLabel13: TQRLabel;
      Qtdolicitada: TQRExpr;
      qrTotal: TQRLabel;
      TitleBand1: TQRBand;
      QRLabel2: TQRLabel;
      QRLabel1: TQRLabel;
      QRLabel15: TQRLabel;
      Band_Cabecalho: TQRBand;
      LblTitulo: TQRLabel;
      QRLabel8: TQRLabel;
      QRShape3: TQRShape;
      QRLabel10: TQRLabel;
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
      procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
        var PrintReport: Boolean);
      procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
        var PrintReport: Boolean);
    procedure DB_VENDASBeforeOpen(DataSet: TDataSet);
   private
      { Private declarations }
      somag, somaP: real;
      valor1, valor2, somat: real;

   public
      { Public declarations }
   end;

var
   FrmFat_RelCurvaABCFormaPagto: TFrmFat_RelCurvaABCFormaPagto;

implementation

uses FPrincipal, Biblioteca, Global,
    FRelFaturamento;

{$R *.dfm}

procedure TFrmFat_RelCurvaABCFormaPagto.FormCreate(Sender: TObject);
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
   sqlMaster := sqlMaster + ' FORMA_PAGTO_NOME,   ';
   sqlMaster := sqlMaster + ' Sum(NF_VALOR_TOTAL)  as FATURAMENTO   ';
   sqlMaster := sqlMaster + ' FROM  VIEW_NOTAFISCAL ';
   sqlMaster := sqlMaster + ' WHERE  ';
   sqlMaster := sqlMaster + ' EMPRESA=:EMPRESA  ';
   sqlMaster := sqlMaster + ' AND  EMISSAO>=:DATA1 AND EMISSAO<=:DATA2 ';
   sqlMaster := sqlMaster + Tipo_NF;

   if not FrmRelFaturamento.chkCliente.Checked then
   Begin
      sqlMaster := sqlMaster + ' AND ';
      sqlMaster := sqlMaster + ' CLIENTE=:CLIENTE ';
   End;

   if not FrmRelFaturamento.chkRepres.Checked then
   Begin
      sqlMaster := sqlMaster + ' AND ';
      sqlMaster := sqlMaster + ' VENDEDOR=:VENDEDOR ';
   End;

   sqlMaster := sqlMaster + ' GROUP BY FORMA_PAGTO_NOME   ';
   sqlMaster := sqlMaster + ' ORDER BY FATURAMENTO DESC, FORMA_PAGTO_NOME ASC ';


   DB_VENDAS.Close;
   DB_VENDAS.SQL.clear;
   DB_VENDAS.SQL.Add(sqlMaster);
   DB_VENDAS.ParamByName('DATA1').AsDateTime := dtDataIni;
   DB_VENDAS.ParamByName('DATA2').AsDateTime := dtDataFim;

   if not FrmRelFaturamento.chkCliente.Checked then
   Begin

      DB_VENDAS.ParamByName('CLIENTE').AsInteger :=
        StrToInt(FrmRelFaturamento.EditCliente.Text);

      LblCliente.Caption := 'CLIENTE: ' +
        FrmRelFaturamento.EditClienteNome.Text;

   End;

   if not FrmRelFaturamento.chkRepres.Checked then
   Begin

      DB_VENDAS.ParamByName('VENDEDOR').AsInteger :=
        StrToInt(FrmRelFaturamento.EditVendedor.Text);

      LblVendedor.Caption := 'VENDEDOR: ' +
        FrmRelFaturamento.EditNomeVendedor.Text;

   End;
   DB_VENDAS.Open;

   Flutuante1 := 0;
   While not DB_VENDAS.Eof do
   Begin
      Flutuante1 := Flutuante1 + DB_VENDAS.FieldByName('Faturamento').AsFloat;
      DB_VENDAS.Next;
   end;
   DB_VENDAS.First;

   if Flutuante1 <= 0 then
      Flutuante1 := 1;

   QuickRep.Preview;

   Close;

end;

procedure TFrmFat_RelCurvaABCFormaPagto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DB_VENDAS.Close;

   Action := caFree;
End;

procedure TFrmFat_RelCurvaABCFormaPagto.DB_VENDASBeforeOpen(DataSet: TDataSet);
begin
   DB_Vendas.ParamByName('EMPRESA').AsInteger := FSistema.Empresa;

end;

procedure TFrmFat_RelCurvaABCFormaPagto.DetailBand1BeforePrint
  (Sender: TQRCustomBand; var PrintBand: Boolean);

begin

   // somar faturamento
   valor1 := 0;
   valor2 := 0;
   somat := 0;

   valor1 := DB_VENDAS.FieldByName('Faturamento').AsFloat;
   valor2 := Flutuante1;

   somat := ((valor1 / valor2) * 100);

   somag := somag + somat;
   qrPercent.Caption := Formatfloat('###,##0.00%', somat);
   qrTotal.Caption := Formatfloat('###,##0.00%', somag);

end;

procedure TFrmFat_RelCurvaABCFormaPagto.QuickRep1BeforePrint
  (Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   somag := 0;

end;

procedure TFrmFat_RelCurvaABCFormaPagto.QuickRepBeforePrint
  (Sender: TCustomQuickRep; var PrintReport: Boolean);
begin

   valor1 := 0;
   valor2 := 0;
   somat := 0;
   somag := 0;
   somaP := 0;

end;

End.
