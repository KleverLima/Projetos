unit FQuestionar;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons;

type
   TFrmQuestionar = class(TForm)
    pnTitulo: TPanel;
    shpTitulo: TShape;
    lblTitulo: TLabel;
    pnBotoes: TPanel;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    pnMensagem: TPanel;
    lblMensagem: TLabel;
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
    FFocoOk : Boolean;
   end;

var
   FrmQuestionar: TFrmQuestionar;

implementation

uses Biblioteca;

{$R *.dfm}

procedure TFrmQuestionar.FormCreate(Sender: TObject);
begin
  lblMensagem.Caption := '';
  ModalResult := mrNone;
  FFocoOk := False;
end;

procedure TFrmQuestionar.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmQuestionar.btnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrmQuestionar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TFrmQuestionar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_ESCAPE then
  begin
    key := 0;
    ModalResult := mrCancel;
    close;
  end;
end;

procedure TFrmQuestionar.FormShow(Sender: TObject);
begin
  if FFocoOk then
  begin
    btnOk.Caption := '&Ok';
    btnOk.SetFocus;
  end;
end;

end.
