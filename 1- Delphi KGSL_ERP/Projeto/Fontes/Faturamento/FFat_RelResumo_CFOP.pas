unit FFat_RelResumo_CFOP;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, QuickRpt, DB, SqlExpr, QRCtrls, QRExport,
   QRPDFFilt, Classe.Global, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
   TFrmFat_RelResumo_CFOP = class(TForm)
      QuickRep1: TQuickRep;
      DetailBand1: TQRBand;
      SummaryBand1: TQRBand;
      DB_Vendas: TFDQuery;
      PageHeaderBand1: TQRBand;
      QRLabel13: TQRLabel;
      QRLabel7: TQRLabel;
      QRDBText3: TQRDBText;
      QRLabel15: TQRLabel;
      Qtdolicitada: TQRExpr;
      QRLabel1: TQRLabel;
      QRDBText2: TQRDBText;
      QRExpr1: TQRExpr;
      QRLabel3: TQRLabel;
      QRExpr2: TQRExpr;
      QRLabel2: TQRLabel;
      QRDBText4: TQRDBText;
      QRExpr3: TQRExpr;
      QRLabel4: TQRLabel;
      QRDBText6: TQRDBText;
      QRExpr4: TQRExpr;
      QRLabel6: TQRLabel;
      QRDBText7: TQRDBText;
      Band_Cabecalho: TQRBand;
      LblTitulo: TQRLabel;
      QRLabel8: TQRLabel;
      QRShape3: TQRShape;
      QRLabel10: TQRLabel;
      QRLabel11: TQRLabel;
      QRSysData1: TQRSysData;
      QRSysData4: TQRSysData;
      QRSysData5: TQRSysData;
      LblPeriodo: TQRLabel;
      QRShape2: TQRShape;
      LblVendedor: TQRLabel;
      LblCliente: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText1: TQRDBText;
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
   private
      { Private declarations }
      somag, somaP: real;
   public
      { Public declarations }
   end;

var
   FrmFat_RelResumo_CFOP: TFrmFat_RelResumo_CFOP;

implementation

uses FPrincipal, Biblioteca, Global,
    FRelFaturamento;

{$R *.dfm}

procedure TFrmFat_RelResumo_CFOP.FormCreate(Sender: TObject);
begin
   dtDataIni := StrToDate(FrmRelFaturamento.MskDataIni.Text);
   dtDataFim := StrToDate(FrmRelFaturamento.MskDataFim.Text);

   LblPeriodo.Caption := 'PERÍODO: ' + DateToStr(dtDataIni) + ' - ' +   DateToStr(dtDataFim);

   case FrmRelFaturamento.RadioNF.ItemIndex of
      0: LblTitulo.Caption := LblTitulo.Caption + #13 + #10 + '(TODAS AS NOTAS FISCAIS)   ';
      1: LblTitulo.Caption := LblTitulo.Caption + #13 + #10 + '(NF SAÍDAS)   ';
      2: LblTitulo.Caption := LblTitulo.Caption + #13 + #10 + '(NF ENTRADAS) ';
      3: LblTitulo.Caption := LblTitulo.Caption + #13 + #10 + '(NF CANCELADAS) ';

   end;

   sqlMaster := '';
   sqlMaster := sqlMaster + '  SELECT   ';
   sqlMaster := sqlMaster + '  CFOP,   ';
   sqlMaster := sqlMaster + '  CFOP_NOME,   ';
   sqlMaster := sqlMaster + '  COUNT(CFOP) AS QTEVENDA,   ';
   sqlMaster := sqlMaster + '  SUM(NF_QTDE_PRODUTOS) AS QTDE_PRODUTOS,   ';
   sqlMaster := sqlMaster + '  SUM(NF_VALOR_PRODUTOS)  AS VALOR_PRODUTOS,   ';
   sqlMaster := sqlMaster + '  SUM(NF_VALOR_TOTAL) AS VALOR_CONTABIL ,   ';
   sqlMaster := sqlMaster + '  SUM(NF_VALOR_TOTAL) AS VALOR_BASE_CALCULO ,   ';
   sqlMaster := sqlMaster + '  SUM(NF_VALOR_ICMS)  AS VALOR_ICMS   ';
   sqlMaster := sqlMaster + '  FROM VIEW_NOTAFISCAL   ';
   sqlMaster := sqlMaster + '  WHERE   ';
   sqlMaster := sqlMaster + '  EMPRESA='+FSistema.Empresa.ToString;
   sqlMaster := sqlMaster + '  AND  EMISSAO>=:DATA1 AND EMISSAO<=:DATA2 ';
   sqlMaster := sqlMaster + Tipo_NF;

   if not FrmRelFaturamento.chkCliente.Checked then
   Begin
      sqlMaster := sqlMaster + ' AND  CLIENTE=:CLIENTE ';
   End;

   if not FrmRelFaturamento.chkRepres.Checked then
   Begin
      sqlMaster := sqlMaster + '  AND VENDEDOR=:VENDEDOR ';
   End;

   sqlMaster := sqlMaster + ' GROUP BY  CFOP, CFOP_NOME  ';
   sqlMaster := sqlMaster + ' ORDER BY  CFOP   ';

   DB_Vendas.Close;
   DB_Vendas.SQL.clear;
   DB_Vendas.SQL.Add(sqlMaster);
   DB_Vendas.ParamByName('DATA1').AsDateTime := dtDataIni;
   DB_Vendas.ParamByName('DATA2').AsDateTime := dtDataFim;

   if not FrmRelFaturamento.chkCliente.Checked then
   Begin
      DB_Vendas.ParamByName('CLIENTE').AsInteger := StrToInt(FrmRelFaturamento.EditCliente.Text);
      LblCliente.Caption := 'CLIENTE: ' +  FrmRelFaturamento.EditClienteNome.Text;
   End;

   if not FrmRelFaturamento.chkRepres.Checked then
   Begin
      DB_Vendas.ParamByName('VENDEDOR').AsInteger := StrToInt(FrmRelFaturamento.EditVendedor.Text);
      LblVendedor.Caption := 'VENDEDOR: ' + FrmRelFaturamento.EditNomeVendedor.Text;
   End;

   try
     DB_Vendas.Open;
     QuickRep1.Preview;
   finally
     DB_Vendas.Close;
     Close;
   end;
end;

procedure TFrmFat_RelResumo_CFOP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DB_Vendas.Close;

   Action := caFree;
End;

End.
