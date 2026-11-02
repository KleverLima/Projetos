unit FExcluirItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit,
  Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFrmExcluirItem = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    pnTitulo: TPanel;
    btnOk: TButton;
    btnSair: TButton;
    Panel2: TPanel;
    Shape2: TShape;
    Label2: TLabel;
    EditNumItem: TEdit;
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
  FrmExcluirItem: TFrmExcluirItem;

implementation

{$R *.dfm}

uses AppFuncoes;

procedure TFrmExcluirItem.Sair();
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TFrmExcluirItem.Validar();
begin
  ModalResult := mrOk;
end;

procedure TFrmExcluirItem.btnOkClick(Sender: TObject);
begin
  Validar();
end;

procedure TFrmExcluirItem.btnSairClick(Sender: TObject);
begin
  Sair();
end;

procedure TFrmExcluirItem.FormKeyDown(Sender: TObject; var Key: Word;
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
