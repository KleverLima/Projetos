unit FComissoes;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, FFrameBotoes, FFramePadrao, FFrameBarra, StdCtrls, Mask, DBCtrls,
   ISFEdit, ISFEditbtn, ISFdbEditbtn, uEstSearchDialogZeos, IDBEdit, ExtCtrls,
  Data.DB,  FireDAC.Comp.Client, Classe.Global, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
   TFrmComissoes = class(TForm)
      Label2: TLabel;
      DBEdit2: TDBEdit;
      Label4: TLabel;
      DBEdit4: TDBEdit;
      EditNomeCliente: TEdit;
      EditNomeVendedor: TEdit;
      EditNomePlanoContas: TEdit;
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
      DCodPlano: TIDBEditDialog;
      DBComboBox1: TDBComboBox;
      EstSearchDialogZeos1: TIDBEditDialog;
      Edit2: TEdit;
    Label8: TLabel;
    ContaProcurar: TIDBEditDialog;
    EditNomeContaCaixa: TEdit;
    FrmFrameBotoes1: TFrmFrameBotoes;
    EditConta_Credito: TIDBEditDialog;
    EditContaCorrente: TEdit;
    dbDlgProcurar: TIDBEditDialog;
    db_Comissoes: TFDQuery;
    ds_Comissoes: TDataSource;
    DBRadioGroup1: TDBRadioGroup;
    DBComboBox2: TDBComboBox;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    Label9: TLabel;
    DBEdit6: TDBEdit;
    Label13: TLabel;
    FrmFrameBarra1: TFrmFrameBarra;
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
    procedure db_ComissoesBeforeOpen(DataSet: TDataSet);
    procedure db_ComissoesNewRecord(DataSet: TDataSet);
    procedure db_ComissoesBeforePost(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure db_ComissoesAfterOpen(DataSet: TDataSet);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmComissoes: TFrmComissoes;

implementation

uses FPrincipal, Global, App.SQL, Biblioteca, App.Funcoes;

{$R *.dfm}

procedure TFrmComissoes.db_ComissoesAfterOpen(DataSet: TDataSet);
begin
  FormataCampo(db_Comissoes);
end;

procedure TFrmComissoes.db_ComissoesBeforeOpen(DataSet: TDataSet);
begin
   db_Comissoes.ParamByName('EMPRESA').AsInteger := FSistema.Empresa;

end;

procedure TFrmComissoes.db_ComissoesBeforePost(DataSet: TDataSet);
begin
   db_Comissoes.FieldByName('EMPRESA').AsInteger := FSistema.Empresa;
end;

procedure TFrmComissoes.db_ComissoesNewRecord(DataSet: TDataSet);
begin
   db_Comissoes.FieldByName('EMPRESA').AsInteger      := FSistema.Empresa ;
   db_Comissoes.FieldByName('VENDEDOR').AsInteger     := 0;
   db_Comissoes.FieldByName('CLIENTE').AsInteger      := 0;
   db_Comissoes.FieldByName('NOTAFISCAL').AsInteger   := 0;
   db_Comissoes.FieldByName('PEDIDO').AsInteger       := 0;
   db_Comissoes.FieldByName('DOCUMENTO').AsString     := '';
   db_Comissoes.FieldByName('DATA').AsDateTime        := Date;
   db_Comissoes.FieldByName('VENCIMENTO').AsDateTime  := Date + 30;
   db_Comissoes.FieldByName('QUITADO').AsString       := 'N';
   db_Comissoes.FieldByName('ATRASADA').AsString      := 'N';
   db_Comissoes.FieldByName('SELECIONADO').AsString   := 'N';
   db_Comissoes.FieldByName('NATUREZA').AsString      := 'DIGITADO';
   db_Comissoes.FieldByName('DC').AsString            := 'CREDITO';
end;

procedure TFrmComissoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   db_Comissoes.Close;
   db_Comissoes.ParamByName('CODIGO').Clear;
   action := cafree;
end;

procedure TFrmComissoes.FormCreate(Sender: TObject);
begin

   db_Comissoes.Close;
   db_Comissoes.ParamByName('CODIGO').Clear;

   FrmFrameBotoes1.DataSource := ds_Comissoes;
//   FrmPrincipal.MnuFin_CtaRecMovto.Enabled := False;

   db_Comissoes.Open;

  FrmFrameBarra1.Height := 1;


end;

procedure TFrmComissoes.FormDestroy(Sender: TObject);
begin
  FrmComissoes := Nil;
end;

procedure TFrmComissoes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key=VK_ESCAPE then
      close;

end;

procedure TFrmComissoes.FrmFrameBotoes1SpbAdicionarClick(Sender: TObject);
begin
   FrmFrameBotoes1.SpbAdicionarClick(Sender);
   EditData.Setfocus;

end;

procedure TFrmComissoes.FrmFrameBotoes1SpbCancelarClick(Sender: TObject);
begin
   FrmFrameBotoes1.SpbCancelarClick(Sender);

end;

procedure TFrmComissoes.FrmFrameBotoes1SpbEditarClick(Sender: TObject);
begin
   FrmFrameBotoes1.SpbEditarClick(Sender);

end;

procedure TFrmComissoes.FrmFrameBotoes1SpbExcluirClick(Sender: TObject);
begin
   FrmFrameBotoes1.SpbExcluirClick(Sender);

end;

procedure TFrmComissoes.FrmFrameBotoes1SpbImprimirClick(Sender: TObject);
begin
   // relatorios

end;

procedure TFrmComissoes.FrmFrameBotoes1SpbProcurarClick(Sender: TObject);
begin

   dbDlgProcurar.SearchQuery.Clear;
   dbDlgProcurar.SearchQuery.Add('SELECT * FROM VIEW_FIN_COMISSOES ');
   dbDlgProcurar.SearchQuery.Add('WHERE');
   dbDlgProcurar.SearchQuery.Add('EMPRESA='+IntToStr(FSistema.Empresa));
   dbDlgProcurar.SearchQuery.Add('AND');
   dbDlgProcurar.SearchQuery.Add('%WHERE%');
   dbDlgProcurar.SearchQuery.Add('ORDER BY VENCIMENTO');
   dbDlgProcurar.SearchQuery.Add('');

   if dbDlgProcurar.Execute then
   begin
      db_Comissoes.Close;
      db_Comissoes.ParamByName('EMPRESA').AsInteger   := FSistema.Empresa ;
      db_Comissoes.ParamByName('CODIGO').AsInteger    := dbDlgProcurar.ResultFieldAsInteger('CODIGO');
      db_Comissoes.Open;
   end;


end;

procedure TFrmComissoes.FrmFrameBotoes1SpbSairClick(Sender: TObject);
begin
  FrmFrameBotoes1.SpbSairClick(Sender);

end;

procedure TFrmComissoes.FrmFrameBotoes1SpbSalvarClick(Sender: TObject);
begin
   FrmFrameBotoes1.SpbSalvarClick(Sender);

end;

end.
