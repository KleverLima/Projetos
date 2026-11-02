unit FConciliacaoBanco;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, DB,
   FileCtrl, FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  ACBrBase, ACBrBoleto, FFrameBarra;

type
   TFrmConciliacaoBanco = class(TForm)
      OpenDialog1: TOpenDialog;
    pgrBar: TProgressBar;
    QryCtaReceber: TFDQuery;
    PainelBotoes: TPanel;
    BtnSair: TBitBtn;
    BtnProcessar: TBitBtn;
    ACBrBoleto1: TACBrBoleto;
    GrupoArquivos1: TGroupBox;
    EditArquivo: TLabeledEdit;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    lblRegistos: TLabel;
    Label3: TLabel;
    lblData: TLabel;
    lblNoarquivo: TLabel;
    btnArqPasta: TBitBtn;
    lblQtdBaixas: TLabel;
    FrmFrameBarra1: TFrmFrameBarra;
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure btnArqPastaClick(Sender: TObject);
      procedure BtnProcessarClick(Sender: TObject);
      procedure BtnSairClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
   private
      { Private declarations }
    procedure ProcessaRetorno;

   public
      { Public declarations }
   end;

var
   FrmConciliacaoBanco: TFrmConciliacaoBanco;

implementation

uses Biblioteca, FPrincipal, Global, App.Funcoes;

{$R *.dfm}

procedure TFrmConciliacaoBanco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (FormStyle = fsMDIChild) then
  begin
    Action := CaFree;
  end;
end;

procedure TFrmConciliacaoBanco.FormCreate(Sender: TObject);
begin
  ACBrBoleto1.LeCedenteRetorno := True;
  FrmFrameBarra1.Height := 1;
end;

procedure TFrmConciliacaoBanco.FormDestroy(Sender: TObject);
begin
  FrmConciliacaoBanco := nil;
end;

procedure TFrmConciliacaoBanco.btnArqPastaClick(Sender: TObject);
var
  mNomeArq : String;
  mQtdTitulo : Integer;
begin
  mQtdTitulo := 0;
  if OpenDialog1.Execute = false then
    Exit;

  mNomeArq := Trim( OpenDialog1.FileName );
  EditArquivo.Text           := mNomeArq;
  ACBrBoleto1.NomeArqRetorno := mNomeArq;

  MsgEsperar('Arquivo de Retorno', 'Lendo arquivo. Aguarde...');
  try
    ACBrBoleto1.LerRetorno();

    mQtdTitulo := ACBrBoleto1.ListadeBoletos.Count;
    pgrBar.Max := mQtdTitulo;

    lblData.Caption      := FormatDateTime('dd/mm/yyyy', ACBrBoleto1.DataArquivo);
    lblRegistos.Caption  := FormatFloat('###,##0', mQtdTitulo);
    lblNoarquivo.Caption := FormatFloat('###,##0', ACBrBoleto1.NumeroArquivo);
  finally
     MsgEsperar('','',False);
  end;
end;


procedure TFrmConciliacaoBanco.BtnProcessarClick(Sender: TObject);
begin

  If empty(EditArquivo.text) then
  begin
     Informar('Selecione um arquivo de retorno');
     exit;
  end;

  if pergunta('Realizar Conciliação Bancária? ') = false then
    exit;

  ProcessaRetorno;
End;

procedure TFrmConciliacaoBanco.ProcessaRetorno;
var
  i         : Integer;
  mQtdUpdt  : Integer;
  mCont     : Integer;
begin
  mQtdUpdt := 0;
  mCont    := 0;
  QryCtaReceber.Close;
  QryCtaReceber.SQL.Clear;
  QryCtaReceber.SQL.Add('UPDATE FIN_CTARECEBER SET');
  QryCtaReceber.SQL.Add('DATA_PAGTO = :PDATA,');
  QryCtaReceber.SQL.Add('VALOR_PAGO = :PVALOR,');
  QryCtaReceber.SQL.Add('DESPESAS_TOTAL = :PTAXA');
  QryCtaReceber.SQL.Add('WHERE NOSSONUMERO = :PNOSSONUM');

  try
    for i := 0 to ACBrBoleto1.ListadeBoletos.Count-1 do
    begin
      if ACBrBoleto1.ListadeBoletos.Objects[i].ValorRecebido > 0 then
      begin
        QryCtaReceber.Params.ParamByName('PDATA').AsDateTime    := ACBrBoleto1.ListadeBoletos.Objects[i].DataCredito;
        QryCtaReceber.Params.ParamByName('PVALOR').AsCurrency   := ACBrBoleto1.ListadeBoletos.Objects[i].ValorRecebido;
        QryCtaReceber.Params.ParamByName('PNOSSONUM').AsString  := Copy(ACBrBoleto1.ListadeBoletos.Objects[i].NossoNumero, 1, ACBrBoleto1.Banco.TamanhoMaximoNossoNum);
        QryCtaReceber.Params.ParamByName('PTAXA').AsCurrency    := ACBrBoleto1.ListadeBoletos.Objects[i].ValorDespesaCobranca;
        mCont := QryCtaReceber.ExecSQL(False);;
        mQtdUpdt := mQtdUpdt + mCont;
        pgrBar.Position := pgrBar.Position + 1;
      end;
    end;
    lblQtdBaixas.Caption := 'Total de Baixados.....: ' + FormatFloat('###,##0', mQtdUpdt);
  finally
    QryCtaReceber.Close;
  end;
  Informar('Concluído.');
  pgrBar.Position := 0;

end;

procedure TFrmConciliacaoBanco.BtnSairClick(Sender: TObject);
begin
   close;
end;

End.
