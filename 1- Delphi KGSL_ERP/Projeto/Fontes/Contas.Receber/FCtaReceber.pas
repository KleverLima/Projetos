unit FCtaReceber;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, FFrameBotoes, FFramePadrao, FFrameBarra, StdCtrls, Mask, DBCtrls,
   ISFEdit, ISFEditbtn, ISFdbEditbtn, uEstSearchDialogZeos, IDBEdit, ExtCtrls,
   Classe.Global;

type
   TFrmCtaReceber = class(TForm)
      FrmFrameBarra1: TFrmFrameBarra;
      Label2: TLabel;
      DBEdit2: TDBEdit;
      Label3: TLabel;
      DBEdit3: TDBEdit;
      Label4: TLabel;
      DBEdit4: TDBEdit;
      EditNomeCliente: TEdit;
      EditNomeVendedor: TEdit;
      DBEdit10: TDBEdit;
      Label10: TLabel;
      Label5: TLabel;
      EditData: TDBEdit;
      Label11: TLabel;
      DBEdit8: TDBEdit;
      Label12: TLabel;
      DBEdit11: TDBEdit;
      EditCliente: TIDBEditDialog;
      EstSearchDialogZeos2: TIDBEditDialog;
      EditNomeFormaPagto: TEdit;
      EditPagamento: TIDBEditDialog;
      Label1: TLabel;
      GroupBox1: TGroupBox;
      DBMemo1: TDBMemo;
      DBComboBox1: TDBComboBox;
    Label8: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    FrmFrameBotoes1: TFrmFrameBotoes;
    EditConta_Credito: TIDBEditDialog;
    EditContaCorrente: TEdit;
    dbDlgProcurar: TIDBEditDialog;
    DBRadioGroup3: TDBRadioGroup;
    DBRadioGroup4: TDBRadioGroup;
      procedure FrmFrameBotoes1SpbImprimirClick(Sender: TObject);
      procedure FrmFrameBotoes1SpbProcurarClick(Sender: TObject);
      procedure FrmFrameBotoes1SpbExcluirClick(Sender: TObject);
      procedure FrmFrameBotoes1SpbCancelarClick(Sender: TObject);
      procedure FrmFrameBotoes1SpbSalvarClick(Sender: TObject);
      procedure FrmFrameBotoes1SpbEditarClick(Sender: TObject);
      procedure FrmFrameBotoes1SpbAdicionarClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
    procedure FrmFrameBotoes1SpbSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmCtaReceber: TFrmCtaReceber;

implementation

uses FPrincipal, FBaseDados, Global, FCtaReceberGeraParcelas;

{$R *.dfm}

procedure TFrmCtaReceber.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   BaseDados.db_ctaReceber.Close;
   BaseDados.db_ctaReceber.ParamByName('CODIGO').Clear;
   Action := CaFree;
end;

procedure TFrmCtaReceber.FormCreate(Sender: TObject);
begin

   BaseDados.db_ctaReceber.Close;
   BaseDados.db_ctaReceber.ParamByName('CODIGO').Clear;

   FrmFrameBotoes1.DataSource := BaseDados.ds_ctaReceber;

   BaseDados.db_ctaReceber.Open;

   FrmFrameBarra1.Height := 1;
end;

procedure TFrmCtaReceber.FormDestroy(Sender: TObject);
begin
  FrmCtaReceber := Nil;
end;

procedure TFrmCtaReceber.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key=VK_ESCAPE then
      close;

end;

procedure TFrmCtaReceber.FrmFrameBotoes1SpbAdicionarClick(Sender: TObject);
begin
   FrmFrameBotoes1.SpbAdicionarClick(Sender);
   EditData.Setfocus;

end;

procedure TFrmCtaReceber.FrmFrameBotoes1SpbCancelarClick(Sender: TObject);
begin
   FrmFrameBotoes1.SpbCancelarClick(Sender);

end;

procedure TFrmCtaReceber.FrmFrameBotoes1SpbEditarClick(Sender: TObject);
begin
   FrmFrameBotoes1.SpbEditarClick(Sender);

end;

procedure TFrmCtaReceber.FrmFrameBotoes1SpbExcluirClick(Sender: TObject);
begin
   FrmFrameBotoes1.SpbExcluirClick(Sender);

end;

procedure TFrmCtaReceber.FrmFrameBotoes1SpbImprimirClick(Sender: TObject);
begin
   // relatorios

end;

procedure TFrmCtaReceber.FrmFrameBotoes1SpbProcurarClick(Sender: TObject);
begin

   dbDlgProcurar.SearchQuery.Clear;
   dbDlgProcurar.SearchQuery.Add('SELECT * FROM VIEW_FIN_CTARECEBER ');
   dbDlgProcurar.SearchQuery.Add('WHERE');
   dbDlgProcurar.SearchQuery.Add('EMPRESA='+IntToStr(FSistema.Empresa));
   dbDlgProcurar.SearchQuery.Add('AND');
   dbDlgProcurar.SearchQuery.Add('%WHERE%');
   dbDlgProcurar.SearchQuery.Add('ORDER BY DATA DESC, VENCIMENTO DESC');
   dbDlgProcurar.SearchQuery.Add('');

   if dbDlgProcurar.Execute then
   begin
      BaseDados.db_ctaReceber.Close;
      BaseDados.db_ctaReceber.ParamByName('EMPRESA').AsInteger   := FSistema.Empresa ;
      BaseDados.db_ctaReceber.ParamByName('CODIGO').AsInteger    := dbDlgProcurar.ResultFieldAsInteger('CODIGO');
      BaseDados.db_ctaReceber.Open;
   end;


end;

procedure TFrmCtaReceber.FrmFrameBotoes1SpbSairClick(Sender: TObject);
begin
  FrmFrameBotoes1.SpbSairClick(Sender);

end;

procedure TFrmCtaReceber.FrmFrameBotoes1SpbSalvarClick(Sender: TObject);
begin
   FrmFrameBotoes1.SpbSalvarClick(Sender);

end;

end.
