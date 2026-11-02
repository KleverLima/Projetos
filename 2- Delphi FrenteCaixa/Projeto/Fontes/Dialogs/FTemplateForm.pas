unit FTemplateForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Mask, Vcl.DBCtrls;

type
  TFrmTemplateForm = class(TForm)
    pnBotoes: TPanel;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    pnPrincipal: TPanel;
    pnTitulo: TPanel;
    Shape1: TShape;
    lblTitulo: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    FFocoOk : Boolean;
  end;

var
  FrmTemplateForm: TFrmTemplateForm;

implementation

{$R *.dfm}

uses AppFuncoes;

procedure TFrmTemplateForm.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmTemplateForm.btnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrmTemplateForm.FormCreate(Sender: TObject);
begin
  ModalResult := mrNone;
  FFocoOk := False;
end;

procedure TFrmTemplateForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_ESCAPE then
  begin
    key := 0;
    ModalResult := mrCancel;
    close;
  end;
end;

procedure TFrmTemplateForm.FormShow(Sender: TObject);
begin
  if FFocoOk then
    btnOk.SetFocus;
end;

end.
