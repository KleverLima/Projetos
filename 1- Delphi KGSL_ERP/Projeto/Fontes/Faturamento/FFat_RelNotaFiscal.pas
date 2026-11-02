unit FFat_RelNotaFiscal;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, QuickRpt, DB, SqlExpr, QRCtrls, QRExport,
   Classe.Global, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
   TFrmFat_RelNotaFiscal = class(TForm)
      QuickRep1: TQuickRep;
      DetailBand1: TQRBand;
      SummaryBand1: TQRBand;
      QRDBText1: TQRDBText;
      DB_Vendas: TFDQuery;
      QRDBText5: TQRDBText;
      QRDBText4: TQRDBText;
      QRLabel13: TQRLabel;
      QRDBText3: TQRDBText;
      QRDBText8: TQRDBText;
      QRDBText2: TQRDBText;
      Qtdolicitada: TQRExpr;
      QRDBText9: TQRDBText;
      QRDBText10: TQRDBText;
      QRExpr1: TQRExpr;
      QRExpr2: TQRExpr;
      Band_Cabecalho: TQRBand;
      LblTitulo: TQRLabel;
      QRLabel17: TQRLabel;
      QRShape3: TQRShape;
      QRLabel19: TQRLabel;
      QRLabel20: TQRLabel;
      QRSysData3: TQRSysData;
      QRSysData4: TQRSysData;
      QRSysData5: TQRSysData;
      LblPeriodo: TQRLabel;
      QRShape1: TQRShape;
      QRLabel23: TQRLabel;
      QRLabel24: TQRLabel;
      QRLabel25: TQRLabel;
      QRLabel26: TQRLabel;
      QRLabel27: TQRLabel;
      QRLabel28: TQRLabel;
      QRLabel30: TQRLabel;
      QRLabel31: TQRLabel;
      LblVendedor: TQRLabel;
      LblCliente: TQRLabel;
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
    procedure DB_VendasBeforeOpen(DataSet: TDataSet);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmFat_RelNotaFiscal: TFrmFat_RelNotaFiscal;

implementation

uses FPrincipal, Biblioteca, Global,
    FRelFaturamento;

{$R *.dfm}

procedure TFrmFat_RelNotaFiscal.DB_VendasBeforeOpen(DataSet: TDataSet);
begin
   DB_Vendas.ParamByName('EMPRESA').AsInteger := FSistema.Empresa;

end;

procedure TFrmFat_RelNotaFiscal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DB_Vendas.Close;
   Action := caFree;
end;

procedure TFrmFat_RelNotaFiscal.FormCreate(Sender: TObject);
begin

   case FrmRelFaturamento.RadioNF.ItemIndex of
      0:
         LblTitulo.Caption := LblTitulo.Caption + #13 + #10 + '(TODAS)   ';
      1:
         LblTitulo.Caption := LblTitulo.Caption + #13 + #10 + '(SAÍDAS)   ';
      2:
         LblTitulo.Caption := LblTitulo.Caption + #13 + #10 + '(ENTRADAS) ';
      3:
         LblTitulo.Caption := LblTitulo.Caption + #13 + #10 + '(CANCELADAS) ';

   end;

   dtDataIni := StrToDate(FrmRelFaturamento.MskDataIni.Text);
   dtDataFim := StrToDate(FrmRelFaturamento.MskDataFim.Text);
   LblPeriodo.Caption := 'PERÍODO: ' + DateToStr(dtDataIni) + ' - ' +
     DateToStr(dtDataFim);

   // montar script da tabela Mestre
   sqlMaster := '';
   sqlMaster := sqlMaster + ' SELECT * FROM  VIEW_NOTAFISCAL ';
   sqlMaster := sqlMaster + '  WHERE  ';
   sqlMaster := sqlMaster + '  EMPRESA=:EMPRESA  ';
   sqlMaster := sqlMaster + '  AND EMISSAO>=:DATA1 AND EMISSAO<=:DATA2 ';
   sqlMaster := sqlMaster + Tipo_NF;

   if not FrmRelFaturamento.chkCliente.Checked then
   Begin
      sqlMaster := sqlMaster + ' AND  CLIENTE=:CLIENTE ';
   End;

   if not FrmRelFaturamento.chkRepres.Checked then
   Begin
      sqlMaster := sqlMaster + '  AND VENDEDOR=:VENDEDOR ';
   End;

   sqlMaster := sqlMaster + ' ORDER BY ' + strOrdemDados;

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
   QuickRep1.Preview;

   Close;

end;

end.
