unit FNotaFiscalInutilizar;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, FFrameBarra, ExtCtrls, Buttons, DBCtrls, DB, Vcl.Mask,
   classe.global, Vcl.Samples.Spin, System.DateUtils;

type
   TFrmNotaFiscalInutilizar = class(TForm)
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
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    EditNumInicial: TSpinEdit;
    EditNumFinal: TSpinEdit;
    Label3: TLabel;
    EditAno: TSpinEdit;
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
   FrmNotaFiscalInutilizar: TFrmNotaFiscalInutilizar;

implementation

uses Global, Biblioteca, App.SQL, FNotaFiscal,
  Classe.Usuarios, FNotaFiscalEmitidas;

{$R *.dfm}


procedure TFrmNotaFiscalInutilizar.BtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmNotaFiscalInutilizar.dbMemoJustificarChange(Sender: TObject);
begin
   strJustificativa :='';
   strJustificativa:=Trim(dbMemoJustificar.Text);
   painelCaracteres.Caption :=Concat(' caracteres: ',IntToStr( Length(strJustificativa) )  );
end;

procedure TFrmNotaFiscalInutilizar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if (FrmNotaFiscalEmitidas.db_Vendas_nfe.state in [dsedit,dsinsert] ) then
      FrmNotaFiscalEmitidas.db_Vendas_nfe.Cancel;
   Action :=Cafree;
end;

procedure TFrmNotaFiscalInutilizar.FormCreate(Sender: TObject);
begin
   strSimNao:='';
end;

procedure TFrmNotaFiscalInutilizar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   IF Key = VK_ESCAPE then
   begin
      BtnSairClick(Sender);
   end;

end;

procedure TFrmNotaFiscalInutilizar.FormShow(Sender: TObject);
begin
  Caption :='Nota Fiscal: ' + IntToStr(FrmNotaFiscalEmitidas.inNotaFiscal) +' | Inutilizar NF-e ';
  EditNumInicial.Value := FrmNotaFiscalEmitidas.inNotaFiscal;
  EditNumFinal.Value := FrmNotaFiscalEmitidas.inNotaFiscal;
  EditAno.Value :=  Integer(CurrentYear);
  dbMemoJustificarChange(Sender);
end;

procedure TFrmNotaFiscalInutilizar.BtnOkClick(Sender: TObject);
begin
  if (FrmNotaFiscalEmitidas.db_Vendas_nfe.state in [dsedit,dsinsert] ) then
      FrmNotaFiscalEmitidas.db_Vendas_nfe.Post;
  strJustificativa := '';
  strJustificativa:=Trim(dbMemoJustificar.Text);
  strJustificativa:=UpperCase(strJustificativa);
  painelCaracteres.Caption := Concat(' caracteres: ',IntToStr( Length(strJustificativa) )  );
  if Length(strJustificativa)<16 then
  begin
     AvisoSistemaErro('Escreva uma justificativa válida para a Inutilização.'
                      +sLineBreak
                      +sLineBreak
                      +'O minimo é 16 caracteres.' );
     exit;
  end;
  if EditNumInicial.Value > EditNumFinal.Value then
  begin
     AvisoSistemaErro('Numero e inicial é maior que numero final.');
     exit;
  end;
  strSimNao := 'OK';
  Close;
end;

end.
