unit FAutenticarAcao;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, FFrameBarra,
   Classe.Global;

type
   TFrmAutenticarAcao = class(TForm)
      EditSenha: TLabeledEdit;
      BtnOk: TBitBtn;
      BtnCancelar: TBitBtn;
      Panel1: TPanel;
      EditUsuario: TLabeledEdit;
      FrmFrameBarra1: TFrmFrameBarra;
      Label1: TLabel;
      procedure BtnCancelarClick(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormCreate(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure BtnOkClick(Sender: TObject);
      procedure FlatSpeedButton1Click(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmAutenticarAcao: TFrmAutenticarAcao;

implementation

uses  Biblioteca, Global, App.Constantes;

{$R *.dfm}

procedure TFrmAutenticarAcao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   if Key = VK_RETURN then
   Begin
      BtnOk.Click;
   end;

   if Key = VK_ESCAPE then
   Begin
      BtnCancelar.Click;
   end;

end;

procedure TFrmAutenticarAcao.FormCreate(Sender: TObject);
begin
   if FileExists(_ARQUIVOAUTENTICASENHA) then
   Begin
      EditUsuario.text := 'Admin';
      EditSenha.text := 'Admin';
   end;
   EditUsuario.Text := FUsuario.Nome;
   ModalResult :=mrCancel;
end;

procedure TFrmAutenticarAcao.FormShow(Sender: TObject);
begin
   EditSenha.SetFocus;
end;

procedure TFrmAutenticarAcao.BtnOkClick(Sender: TObject);
begin
  If Uppercase(EditSenha.Text) <> Uppercase(FUsuario.Senha) then
  Begin
    Informar('Senha incorreta');
    EditSenha.SetFocus;
  end;

  If Uppercase(EditSenha.Text) = Uppercase(FUsuario.Senha) then
  Begin
    ModalResult :=mrOk;
  End;

end;

procedure TFrmAutenticarAcao.BtnCancelarClick(Sender: TObject);
begin
   ModalResult :=mrCancel;
   close;
end;

procedure TFrmAutenticarAcao.FlatSpeedButton1Click(Sender: TObject);
begin
   close;
end;

end.
