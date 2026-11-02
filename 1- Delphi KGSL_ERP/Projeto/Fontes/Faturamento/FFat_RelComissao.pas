unit FFat_RelComissao;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, QuickRpt, DB, SqlExpr, QRCtrls, QRExport,
   QRPDFFilt, Classe.Global, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
   TFrmFat_RelComissao = class(TForm)
      DB_Vendas: TFDQuery;
      QuickRep1: TQuickRep;
      Datalhes: TQRBand;
      QRDBText4: TQRDBText;
      QRDBText7: TQRDBText;
      Cabecalho: TQRBand;
      QRLabel19: TQRLabel;
      QRLabel21: TQRLabel;
      SummaryBand1: TQRBand;
      QRExpr6: TQRExpr;
      QRLabel5: TQRLabel;
      QRLabel2: TQRLabel;
      QRLabel7: TQRLabel;
      QRDBText2: TQRDBText;
      QRDBText3: TQRDBText;
      QuebraBanco: TQRGroup;
      QRDBText5: TQRDBText;
      QRLabel1: TQRLabel;
      TotalOperacao: TQRBand;
      QRLabel4: TQRLabel;
      QRExpr4: TQRExpr;
      QRExpr1: TQRExpr;
      lblComissaoTotal: TQRLabel;
      lblVrlComiss: TQRLabel;
      Band_Cabecalho: TQRBand;
      LblTitulo: TQRLabel;
      QRLabel17: TQRLabel;
      QRShape3: TQRShape;
      QRLabel3: TQRLabel;
      QRLabel8: TQRLabel;
      QRSysData2: TQRSysData;
      QRSysData4: TQRSysData;
      QRSysData5: TQRSysData;
      LblPeriodo: TQRLabel;
      QRShape1: TQRShape;
      LblVendedor: TQRLabel;
      LblCliente: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
      procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
        var PrintReport: Boolean);
      procedure DatalhesBeforePrint(Sender: TQRCustomBand;
        var PrintBand: Boolean);
    procedure DB_VendasBeforeOpen(DataSet: TDataSet);
   private
      { Private declarations }
      a1, a2, a3: Real;

   public
      { Public declarations }
   end;

var
   FrmFat_RelComissao: TFrmFat_RelComissao;

implementation

uses FPrincipal, Biblioteca, Global,
    FRelFaturamento;

{$R *.dfm}

procedure TFrmFat_RelComissao.FormCreate(Sender: TObject);
begin

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

   // montar script da tabela Mestre
   sqlMaster := '';
   sqlMaster := sqlMaster + ' SELECT * FROM  VIEW_COMISSAO ';
   sqlMaster := sqlMaster + '  WHERE  ';
   sqlMaster := sqlMaster + '  EMPRESA=:EMPRESA  ';
   sqlMaster := sqlMaster + '  AND EMISSAO>=:DATA1 AND EMISSAO<=:DATA2 ';
   sqlMaster := sqlMaster + Tipo_NF;

   if not FrmRelFaturamento.chkCliente.Checked then
   Begin
      sqlMaster := sqlMaster + '  AND CLIENTE=:CLIENTE ';
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

procedure TFrmFat_RelComissao.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   a1 := 0;
   a2 := 0;
   a3 := 0;
end;

procedure TFrmFat_RelComissao.DB_VendasBeforeOpen(DataSet: TDataSet);
begin
   DB_Vendas.ParamByName('EMPRESA').AsInteger := FSistema.Empresa;

end;

procedure TFrmFat_RelComissao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DB_Vendas.Close;

   Action := caFree;
End;

procedure TFrmFat_RelComissao.DatalhesBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   lblVrlComiss.Caption := FormatFloat('###,##0.00',
     DB_Vendas.FieldByName('COMISSAO_VENDA').AsFloat);

   a1 := a1 + DB_Vendas.FieldByName('COMISSAO_VENDA').AsFloat;
   lblComissaoTotal.Caption := FormatFloat('###,##0.00', a1);

end;

End.
