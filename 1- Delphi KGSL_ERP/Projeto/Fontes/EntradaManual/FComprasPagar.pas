unit FComprasPagar;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB;

type
   TFrmComprasPagar = class(TForm)
      GroupBox5: TGroupBox;
      DBGrid2: TDBGrid;
    Panel7: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure BitBtn2Click(Sender: TObject);
      procedure BitBtn3Click(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmComprasPagar: TFrmComprasPagar;

implementation

uses FCompraEntrada, Biblioteca;

{$R *.dfm}

procedure TFrmComprasPagar.BitBtn2Click(Sender: TObject);
begin
   If FrmCompraEntrada.db_CtaPagar.IsEmpty then
     exit;
   If Pergunta('Deseja excluir registro selecionado?') = false then
     exit;

   FrmCompraEntrada.db_CtaPagar.close;
   FrmCompraEntrada.db_CtaPagar.Open;
   try
      FrmCompraEntrada.db_CtaPagar.Delete;
   finally
     FrmCompraEntrada.db_CtaPagar.close;
     FrmCompraEntrada.db_CtaPagar.Open;
   end;

end;

procedure TFrmComprasPagar.BitBtn3Click(Sender: TObject);
begin
   If FrmCompraEntrada.db_CtaPagar.IsEmpty then
     exit;
   If Pergunta('Deseja realmente excluir tudo?') = false then
     exit;
   FrmCompraEntrada.db_CtaPagar.close;
   FrmCompraEntrada.db_CtaPagar.Open;
   try
      While not FrmCompraEntrada.DB_CtaPagar.Eof do
         FrmCompraEntrada.DB_CtaPagar.Delete;
   finally
     FrmCompraEntrada.db_CtaPagar.close;
     FrmCompraEntrada.db_CtaPagar.Open;
   end;
end;

procedure TFrmComprasPagar.BitBtn4Click(Sender: TObject);
begin
   If FrmCompraEntrada.db_CtaPagarFrete.IsEmpty then
     exit;

   If Pergunta('[FRETE A PAGAR] Deseja excluir registro selecionado?') = false then
     exit;

   FrmCompraEntrada.db_CtaPagarFrete.close;
   FrmCompraEntrada.db_CtaPagarFrete.Open;
   try
      FrmCompraEntrada.db_CtaPagarFrete.Delete;
   finally
     FrmCompraEntrada.db_CtaPagarFrete.close;
     FrmCompraEntrada.db_CtaPagarFrete.Open;
   end;

end;

procedure TFrmComprasPagar.BitBtn5Click(Sender: TObject);
begin
   If FrmCompraEntrada.db_CtaPagarFrete.IsEmpty then
     exit;

   If Pergunta('[FRETE A PAGAR] Deseja realmente excluir tudo?') = false then
     exit;
   FrmCompraEntrada.db_CtaPagarFrete.close;
   FrmCompraEntrada.db_CtaPagarFrete.Open;
   try
      While not FrmCompraEntrada.db_CtaPagarFrete.Eof do
         FrmCompraEntrada.db_CtaPagarFrete.Delete;
   finally
     FrmCompraEntrada.db_CtaPagarFrete.close;
     FrmCompraEntrada.db_CtaPagarFrete.Open;
   end;
end;

procedure TFrmComprasPagar.BitBtn6Click(Sender: TObject);
begin

   If (FrmCompraEntrada.DB_CtaPagar.state in [dsedit, dsinsert]) then
   Begin
      FrmCompraEntrada.DB_CtaPagar.Post;
   End;

   If (FrmCompraEntrada.db_CtaPagarFrete.state in [dsedit, dsinsert]) then
   Begin
      FrmCompraEntrada.db_CtaPagarFrete.Post;
   End;

   close;


end;

procedure TFrmComprasPagar.DBGrid2KeyPress(Sender: TObject; var Key: Char);
begin
   Key := AnsiUpperCase(Key)[1];

end;

procedure TFrmComprasPagar.FormClose(Sender: TObject; var Action: TCloseAction);
begin

   Action := cafree;
end;

procedure TFrmComprasPagar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   if Key = VK_ESCAPE then
      close;

end;

end.
