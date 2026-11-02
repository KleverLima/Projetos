unit FFormModelo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFrmFormModelo = class(TForm)
    pnTitulo: TPanel;
    Shape2: TShape;
    lblTitulo: TLabel;
    pnBotoes: TPanel;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    pnMensagem: TPanel;
    lblMensagem: TLabel;
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
  FrmFormModelo: TFrmFormModelo;

implementation

{$R *.dfm}

procedure TFrmFormModelo.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmFormModelo.btnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrmFormModelo.FormCreate(Sender: TObject);
begin
  ModalResult := mrNone;
  FFocoOk := False;
end;

procedure TFrmFormModelo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_ESCAPE then
  begin
    key := 0;
    ModalResult := mrCancel;
    close;
  end;
end;

procedure TFrmFormModelo.FormShow(Sender: TObject);
begin
  if FFocoOk then
    btnOk.SetFocus;
end;

end.
