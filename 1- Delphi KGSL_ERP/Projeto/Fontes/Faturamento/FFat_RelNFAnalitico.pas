unit FFat_RelNFAnalitico;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ExtCtrls, quickrpt, Qrctrls, Db,   QRPrntr, QRExport, QRPREV,Classe.Global,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
   TFrmFat_RelNFAnalitico = class(TForm)
      db_Vendas: TFDQuery;
      QuickRep1: TQuickRep;
      Cabecalho: TQRBand;
      QRBand2: TQRBand;
      Vlr_Credito: TQRDBText;
      Vlr_SaldoAnterior: TQRDBText;
      QRDBText2: TQRDBText;
      QRDBText3: TQRDBText;
      QuebraReport: TQRGroup;
      TotalNotaFiscal: TQRBand;
      QRBand4: TQRBand;
      QRDBText7: TQRDBText;
      QRDBText8: TQRDBText;
      QRDBText9: TQRDBText;
      QRExpr1: TQRExpr;
      QRExpr2: TQRExpr;
      QRExpr4: TQRExpr;
      QRExpr5: TQRExpr;
      QRExpr6: TQRExpr;
      QRLabel14: TQRLabel;
      QRExpr3: TQRExpr;
      QRExpr7: TQRExpr;
      QRExpr8: TQRExpr;
      QRExpr9: TQRExpr;
      QRDBText4: TQRDBText;
      QRLabel15: TQRLabel;
      Vlr_Debito: TQRDBText;
      QRDBText12: TQRDBText;
      QRLabel17: TQRLabel;
      QRLabel18: TQRLabel;
      QRDBText14: TQRDBText;
      QRLabel6: TQRLabel;
      QRLabel5: TQRLabel;
      QRLabel3: TQRLabel;
      QRLabel1: TQRLabel;
      QRLabel11: TQRLabel;
      LblSldAnterior: TQRLabel;
      QRLabel8: TQRLabel;
      QRLabel4: TQRLabel;
      QRLabel25: TQRLabel;
      QRDBText1: TQRDBText;
      QRDBText5: TQRDBText;
      QRLabel26: TQRLabel;
      QRLabel27: TQRLabel;
      QRDBText21: TQRDBText;
      Band_Cabecalho: TQRBand;
      LblTitulo: TQRLabel;
      QRLabel28: TQRLabel;
      QRLabel29: TQRLabel;
      QRLabel30: TQRLabel;
      QRSysData2: TQRSysData;
      QRSysData1: TQRSysData;
      QRSysData5: TQRSysData;
      LblPeriodo: TQRLabel;
      QRShape1: TQRShape;
      LblVendedor: TQRLabel;
      LblCliente: TQRLabel;
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DB_VendasBeforeOpen(DataSet: TDataSet);
   private
      { Private declarations }
      somag, somaP: real;
   public
      { Public declarations }
   end;

var
   FrmFat_RelNFAnalitico: TFrmFat_RelNFAnalitico;

implementation

uses Biblioteca, Global, FPrincipal, FRelFaturamento;

{$R *.DFM}

procedure TFrmFat_RelNFAnalitico.FormCreate(Sender: TObject);
var
  mProduto : String;
begin
  mProduto := Trim(FrmRelFaturamento.EditProduto.Text);

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

      4:
         LblTitulo.Caption := LblTitulo.Caption + #13 + #10 +
           '(SOMENTE CUPOM FISCAL)   ';
   end;

   dtDataIni := StrToDate(FrmRelFaturamento.MskDataIni.Text);
   dtDataFim := StrToDate(FrmRelFaturamento.MskDataFim.Text);
   LblPeriodo.Caption := 'PERÍODO: ' + DateToStr(dtDataIni) + ' - ' + DateToStr(dtDataFim);


   // montar script da tabela Mestre
   sqlMaster := '';
   sqlMaster := sqlMaster + ' SELECT * FROM  VIEW_VENDAITEM ';
   sqlMaster := sqlMaster + ' WHERE  ';
   sqlMaster := sqlMaster + ' EMPRESA=:EMPRESA  ';
   sqlMaster := sqlMaster + ' AND EMISSAO>=:DATA1 AND EMISSAO<=:DATA2 ';
   sqlMaster := sqlMaster + Tipo_NF;

  if mProduto <> '' then
  begin
    sqlMaster := sqlMaster + ' AND PRODUTO='+mProduto;
  end;

   if not FrmRelFaturamento.chkCliente.Checked then
   Begin
      sqlMaster := sqlMaster + '  AND CLIENTE=:CLIENTE ';
   End;

   if not FrmRelFaturamento.chkRepres.Checked then
   Begin
      sqlMaster := sqlMaster + '  AND VENDEDOR=:VENDEDOR ';
   End;

   case FrmRelFaturamento.RadioNF.ItemIndex of
      4:
      Begin
         sqlMaster := sqlMaster + '  AND CUPOM='+QuotedStr('S');
      End;

   end;

   sqlMaster := sqlMaster + ' ORDER BY ' + strOrdemDados;

   db_Vendas.Close;
   db_Vendas.SQL.clear;
   db_Vendas.SQL.Add(sqlMaster);
   db_Vendas.ParamByName('DATA1').AsDateTime := dtDataIni;
   db_Vendas.ParamByName('DATA2').AsDateTime := dtDataFim;

   if not FrmRelFaturamento.chkCliente.Checked then
   Begin

      db_Vendas.ParamByName('CLIENTE').AsInteger :=
        StrToInt(FrmRelFaturamento.EditCliente.Text);

      LblCliente.Caption := 'CLIENTE: ' +
        FrmRelFaturamento.EditClienteNome.Text;

   End;

   if not FrmRelFaturamento.chkRepres.Checked then
   Begin

      db_Vendas.ParamByName('VENDEDOR').AsInteger :=
        StrToInt(FrmRelFaturamento.EditVendedor.Text);

      LblVendedor.Caption := 'VENDEDOR: ' +
        FrmRelFaturamento.EditNomeVendedor.Text;

   End;

   db_Vendas.Open;
   QuickRep1.Preview;

   Close;

end;

procedure TFrmFat_RelNFAnalitico.DB_VendasBeforeOpen(DataSet: TDataSet);
begin
   DB_Vendas.ParamByName('EMPRESA').AsInteger := FSistema.Empresa;

end;

procedure TFrmFat_RelNFAnalitico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   db_Vendas.Close;

   Action := caFree;

end;

end.
