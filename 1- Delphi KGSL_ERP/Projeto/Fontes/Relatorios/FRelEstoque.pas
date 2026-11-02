unit FRelEstoque;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Buttons, ExtCtrls, StdCtrls, Mask, DB,
   Spin, FrmRelatorios,  DBCtrls, ISFEdit, ISFEditbtn, ISFdbEditbtn,
   IDBEdit, uEstSearchDialogZeos, frxClass, frxDBSet, Classe.Global,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FFrameBarra;

type
   TFrmRelEstoque = class(TForm)
      Panel1: TPanel;
      RadioG: TRadioGroup;
      GroupBox1: TGroupBox;
      chkFornecedor: TCheckBox;
      Panel2: TPanel;
      BtnSair: TBitBtn;
      Btn_Imprimir: TBitBtn;
      GbOrdenar: TRadioGroup;
      GroupBox3: TGroupBox;
      chkgrupos: TCheckBox;
      GroupBox4: TGroupBox;
    FrameRelatorios1: TFrameRelatorios;
    DB_EstoqueDisponivel: TFDQuery;
    frxDBD_EstoqueDisponivel: TfrxDBDataset;
    EditFornecedor: TIDBEditDialog;
    EditNomeCliente: TEdit;
    EditGrupo: TIDBEditDialog;
    Edit1: TEdit;
    PainelProdutos: TPanel;
    EditProdutoFim: TIDBEditDialog;
    EditProdutoInicio: TIDBEditDialog;
    chk_Referencia: TCheckBox;
    FrmFrameBarra1: TFrmFrameBarra;
      procedure Btn_ImprimirClick(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure BtnSairClick(Sender: TObject);
      procedure chkFornecedorClick(Sender: TObject);
      procedure chkgruposClick(Sender: TObject);
    procedure DB_EstoqueDisponivelBeforeOpen(DataSet: TDataSet);
    procedure chk_ReferenciaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmRelEstoque: TFrmRelEstoque;

implementation

uses Biblioteca, Global, FRelPagar_Extrato, FRelPagar_Vencidas,
   FRelPagar_Quitadas,
   FRelPagar_Historico, FRelPagar_Pagar,
   FBaseDados, F_RelEst_Posicao,
   F_RelEst_ListaPreco, F_RelEst_Minimo,
   F_RelEst_Historico;

{$R *.DFM}

procedure TFrmRelEstoque.chk_ReferenciaClick(Sender: TObject);
begin
   if chk_Referencia.Checked then
   begin
      PainelProdutos.Enabled := False;
   end
   else
   begin
      PainelProdutos.Enabled := True;
   end;

end;

procedure TFrmRelEstoque.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := cafree;
end;

procedure TFrmRelEstoque.FormCreate(Sender: TObject);
begin
  FrmFrameBarra1.height := 1;
end;

procedure TFrmRelEstoque.Btn_ImprimirClick(Sender: TObject);
begin
   strFornecedor := Trim(EditFornecedor.text);
   strGrupo      := Trim(EditGrupo.text);

   if GbOrdenar.ItemIndex = 0 then
   Begin
      strOrdemDados := ' GRUPO, REFERENCIA, DESCRICAO  ';
   End;

   If GbOrdenar.ItemIndex = 1 then
   Begin
      strOrdemDados := ' REFERENCIA ';
   End;

   if GbOrdenar.ItemIndex = 2 then
   Begin
      strOrdemDados := ' DESCRICAO  ';
   End;


   // Posição do Estoque
   If RadioG.ItemIndex = 0 then
   Begin
      Frm_RelEst_Posicao := TFrm_RelEst_Posicao.create(self);
   End;

   // Lista de Preços
   If RadioG.ItemIndex = 1 then
   Begin
      Frm_RelEst_ListaPreco := TFrm_RelEst_ListaPreco.create(self);
   End;

   // Estoque Minimo
   If RadioG.ItemIndex = 2 then
   Begin
      Frm_RelEst_Minimo := TFrm_RelEst_Minimo.create(self);
   End;

   // Inventario do Estoque
   If RadioG.ItemIndex = 3 then
   Begin
      Frm_RelEst_Historico := TFrm_RelEst_Historico.create(self);
   End;

End;

procedure TFrmRelEstoque.FormKeyPress(Sender: TObject; var Key: Char);
begin

   If Key = #27 then
      CLOSE;

end;

procedure TFrmRelEstoque.BtnSairClick(Sender: TObject);
begin
   CLOSE;
end;

procedure TFrmRelEstoque.chkFornecedorClick(Sender: TObject);
begin

   if chkFornecedor.Checked = true then
   Begin
      EditFornecedor.Enabled := False;
   End
   Else
   Begin
      EditFornecedor.Enabled := true;
      EditFornecedor.SelectAll;
      EditFornecedor.SetFocus;
   End;

end;

procedure TFrmRelEstoque.DB_EstoqueDisponivelBeforeOpen(DataSet: TDataSet);
begin
//   DB_EstoqueDisponivel.ParamByName('EMPRESA').AsInteger := FSistema.Empresa;

end;

procedure TFrmRelEstoque.chkgruposClick(Sender: TObject);
begin

   if chkgrupos.Checked = true then
   Begin
      EditGrupo.Enabled := False;
   End
   Else
   Begin
      EditGrupo.Enabled := true;
      EditGrupo.SetFocus;
   End;

end;

end.
