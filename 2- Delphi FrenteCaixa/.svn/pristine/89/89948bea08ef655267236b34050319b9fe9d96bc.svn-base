unit FNotaFiscalCancelar;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, ExtCtrls, Buttons, DBCtrls, DB, Vcl.Mask;

type
   TFrmNotaFiscalCancelar = class(TForm)
    Panel1: TPanel;
    BtnOk: TBitBtn;
    BtnSair: TBitBtn;
    GroupBox1: TGroupBox;
    dbMemoJustificar: TMemo;
    painelCaracteres: TPanel;
    pnTitulo: TPanel;
    Shape2: TShape;
    Label3: TLabel;
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbMemoJustificarChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
   private
      { Private declarations }
     FJustificativa : String;
     mTipo : String;
    procedure Sair;
   public
      { Public declarations }
     FIDVenda : String;
     FIDNF : String;
     FTipoNF : String;
   end;

var
   FrmNotaFiscalCancelar: TFrmNotaFiscalCancelar;

implementation


{$R *.dfm}

uses FManutencaoNFe, AppFuncoes;


procedure TFrmNotaFiscalCancelar.BtnSairClick(Sender: TObject);
begin
  Sair();
end;

procedure TFrmNotaFiscalCancelar.FormCreate(Sender: TObject);
begin
  FIDVenda := '';
  FIDNF := '';
  FTipoNF := '';
  ModalResult := mrNone;
end;

procedure TFrmNotaFiscalCancelar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if (FrmManutencaoNFe.QryNFe.state in [dsedit,dsinsert] ) then
      FrmManutencaoNFe.QryNFe.Cancel;
   Action :=Cafree;
end;

procedure TFrmNotaFiscalCancelar.FormShow(Sender: TObject);
begin
   if FTipoNF = 'NFCE' then
     mTipo := 'NFC-e Número: '+ZeroEsquerda(FIDNF,6)
   else if FTipoNF = 'SAT' then
     mTipo := 'SAT Número: '+ZeroEsquerda(FIDNF,6);
   Caption := mTipo +' | Cancelar ';
   dbMemoJustificarChange(Sender);
end;

procedure TFrmNotaFiscalCancelar.dbMemoJustificarChange(Sender: TObject);
begin
  FJustificativa :='';
  FJustificativa:=Trim(dbMemoJustificar.Text);
  painelCaracteres.Caption :=Concat(' caracteres: ',IntToStr( Length(FJustificativa.Trim) )  );
end;

procedure TFrmNotaFiscalCancelar.BtnOkClick(Sender: TObject);
begin
  FJustificativa :='';
  FJustificativa:=Trim(dbMemoJustificar.Text);
  FJustificativa:=UpperCase(FJustificativa);
  painelCaracteres.Caption :=Concat(' caracteres: ',IntToStr( Length(FJustificativa) )  );
  if Length(FJustificativa.Trim) < 15 then
  begin
    Informar('Escreva uma justificativa válida para o cancelamento da '+mTipo+'.'+
             sLineBreak+
             'O minimo é 15 caracteres.',
             'Cancelar Documento Fiscal',True);
    Abort;
  end;
  if Pergunta('Tem certeza que deseja CANCELAR?') then
  begin
    ModalResult := mrOk; // Esse comando já força fechamento do formulário.
  end
  else
  begin
    ModalResult := mrNone;
    Close;
  end;
end;

procedure TFrmNotaFiscalCancelar.Sair;
begin
  ModalResult := mrCancel;
  Close;
end;


procedure TFrmNotaFiscalCancelar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   IF Key = VK_ESCAPE then
   begin
      Sair();
   end;

end;

end.
