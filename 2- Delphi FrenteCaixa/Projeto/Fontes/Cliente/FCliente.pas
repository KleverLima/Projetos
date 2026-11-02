unit FCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit,
  Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFrmCliente = class(TForm)
    Panel1: TPanel;
    pnTitulo: TPanel;
    btnOk: TButton;
    btnSair: TButton;
    Panel2: TPanel;
    Shape2: TShape;
    Label2: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    procedure Validar;
    procedure Sair;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCliente: TFrmCliente;

implementation

{$R *.dfm}

uses AppFuncoes;

procedure TFrmCliente.Sair();
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TFrmCliente.Validar();
begin
  ModalResult := mrOk;
end;

procedure TFrmCliente.btnOkClick(Sender: TObject);
begin
  Validar();
end;

procedure TFrmCliente.btnSairClick(Sender: TObject);
begin
  Sair();
end;

procedure TFrmCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_ESCAPE then
  begin
    Sair();
  end;
  if Key=VK_RETURN then
  begin
    Validar();
  end;

end;

end.
