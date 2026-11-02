unit FNotaFiscalCartaCorrecao;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, FFrameBarra, ExtCtrls, Buttons, DBCtrls, DB, Vcl.Mask,
   classe.global, Vcl.Samples.Spin;

type
   TFrmNotaFiscalCartaCorrecao = class(TForm)
      FrmFrameBarra1: TFrmFrameBarra;
    Panel1: TPanel;
    BtnOk: TBitBtn;
    BtnSair: TBitBtn;
    PnlValorDevolucao: TPanel;
    GroupBox1: TGroupBox;
    dbMemoJustificar: TDBMemo;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    painelCaracteres: TPanel;
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dbMemoJustificarChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmNotaFiscalCartaCorrecao: TFrmNotaFiscalCartaCorrecao;

implementation

uses Global, Biblioteca, App.SQL, FNotaFiscal,
  Classe.Usuarios, FNotaFiscalEmitidas;

{$R *.dfm}


procedure TFrmNotaFiscalCartaCorrecao.BtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmNotaFiscalCartaCorrecao.dbMemoJustificarChange(Sender: TObject);
begin
   strJustificativa :='';
   strJustificativa:=Trim(dbMemoJustificar.Text);
   painelCaracteres.Caption :=Concat(' caracteres: ',IntToStr( Length(strJustificativa) )  );
end;

procedure TFrmNotaFiscalCartaCorrecao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if (FrmNotaFiscalEmitidas.db_Vendas_nfe.state in [dsedit,dsinsert] ) then
      FrmNotaFiscalEmitidas.db_Vendas_nfe.Cancel;
   Action :=Cafree;
end;

procedure TFrmNotaFiscalCartaCorrecao.FormCreate(Sender: TObject);
begin
   strSimNao:='';
end;

procedure TFrmNotaFiscalCartaCorrecao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   IF Key = VK_ESCAPE then
   begin
      BtnSairClick(Sender);
   end;

end;

procedure TFrmNotaFiscalCartaCorrecao.FormShow(Sender: TObject);
begin
  Caption :='Nota Fiscal: ' + IntToStr(FrmNotaFiscalEmitidas.inNotaFiscal) +' | Carta de Correção ';
  dbMemoJustificarChange(Sender);
end;

procedure TFrmNotaFiscalCartaCorrecao.BtnOkClick(Sender: TObject);
begin
   if (FrmNotaFiscalEmitidas.db_Vendas_nfe.state in [dsedit,dsinsert] ) then
      FrmNotaFiscalEmitidas.db_Vendas_nfe.Post;

   strJustificativa :='';
   strJustificativa:=Trim(dbMemoJustificar.Text);
   strJustificativa:=UpperCase(strJustificativa);

   painelCaracteres.Caption :=Concat(' caracteres: ',IntToStr( Length(strJustificativa) )  );

   if Length(strJustificativa)<16 then
   begin
     AvisoSistemaErro('Escreva uma justificativa válida para a Carta de Correção.'
                      +sLineBreak
                      +sLineBreak
                      +'O minimo é 16 caracteres.' );
     exit;
   end;
   strSimNao:='OK';
   Close;
end;

end.
