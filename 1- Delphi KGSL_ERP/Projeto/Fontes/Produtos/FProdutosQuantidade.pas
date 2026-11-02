unit FProdutosQuantidade;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, FFrameBarra, ExtCtrls, FFrameBotoes, Grids, DBGrids, DB,
    ComCtrls, StdCtrls, Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
   TFrmProdutosQuantidade = class(TForm)
      FrmFrameBotoes1: TFrmFrameBotoes;
      Panel1: TPanel;
      FrmFrameBarra1: TFrmFrameBarra;
      db_referencias: TFDQuery;
      DS_Referencia: TDataSource;
    ProgressBar1: TProgressBar;
    EditPesquisa: TLabeledEdit;
    dbGrid_Produtos: TDBGrid;
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FrmFrameBotoes1SpbAdicionarClick(Sender: TObject);
      procedure FrmFrameBotoes1SpbEditarClick(Sender: TObject);
      procedure FrmFrameBotoes1SpbSalvarClick(Sender: TObject);
      procedure FrmFrameBotoes1SpbCancelarClick(Sender: TObject);
      procedure FrmFrameBotoes1SpbExcluirClick(Sender: TObject);
      procedure FrmFrameBotoes1SpbSairClick(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditPesquisaChange(Sender: TObject);
    procedure db_referenciasBeforeInsert(DataSet: TDataSet);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmProdutosQuantidade: TFrmProdutosQuantidade;

implementation

uses FPrincipal, Biblioteca, Classe.Global, Global, App.SQL;

{$R *.dfm}

procedure TFrmProdutosQuantidade.db_referenciasBeforeInsert(DataSet: TDataSet);
begin
  Abort;
end;

procedure TFrmProdutosQuantidade.EditPesquisaChange(Sender: TObject);
begin
   //if Trim(EditPesquisa.Text) = '' then
   //  exit;
   db_referencias.Close;
   db_referencias.ParamByName('PROCURAR').AsString := '%' + Trim(EditPesquisa.Text) + '%';
   db_referencias.Open;
end;

procedure TFrmProdutosQuantidade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

   db_referencias.close;
   Action := Cafree;

end;

procedure TFrmProdutosQuantidade.FormCreate(Sender: TObject);
begin
   FrmFrameBotoes1.DataSource := DS_Referencia;
   db_referencias.close;
   db_referencias.Open;
   EditPesquisaChange(Sender);

   FrmFrameBarra1.Height := 1;
end;

procedure TFrmProdutosQuantidade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   if Key = vk_escape then
      close;
end;

procedure TFrmProdutosQuantidade.FrmFrameBotoes1SpbAdicionarClick
  (Sender: TObject);
begin
   FrmFrameBotoes1.SpbAdicionarClick(Sender);

end;

procedure TFrmProdutosQuantidade.FrmFrameBotoes1SpbCancelarClick
  (Sender: TObject);
begin
   FrmFrameBotoes1.SpbCancelarClick(Sender);

end;

procedure TFrmProdutosQuantidade.FrmFrameBotoes1SpbEditarClick(Sender: TObject);
begin
   FrmFrameBotoes1.SpbEditarClick(Sender);

end;

procedure TFrmProdutosQuantidade.FrmFrameBotoes1SpbExcluirClick
  (Sender: TObject);
begin
   FrmFrameBotoes1.SpbExcluirClick(Sender);

end;

procedure TFrmProdutosQuantidade.FrmFrameBotoes1SpbSairClick(Sender: TObject);
begin
   FrmFrameBotoes1.SpbSairClick(Sender);

end;

procedure TFrmProdutosQuantidade.FrmFrameBotoes1SpbSalvarClick(Sender: TObject);
begin
   FrmFrameBotoes1.SpbSalvarClick(Sender);

end;

end.
