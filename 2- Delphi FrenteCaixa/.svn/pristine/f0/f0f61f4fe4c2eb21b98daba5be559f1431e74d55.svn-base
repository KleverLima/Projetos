unit FInformarPesoManual;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit,
  Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFrmInformarPesoManual = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    pnTitulo: TPanel;
    btnOk: TButton;
    btnSair: TButton;
    Panel2: TPanel;
    Shape2: TShape;
    Label2: TLabel;
    EditPeso: TEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure EditPesoKeyPress(Sender: TObject; var Key: Char);
  private
    procedure Validar;
    procedure Sair;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmInformarPesoManual: TFrmInformarPesoManual;

implementation

{$R *.dfm}

uses AppFuncoes;

procedure TFrmInformarPesoManual.Sair();
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TFrmInformarPesoManual.Validar();
begin
  ModalResult := mrOk;
end;

procedure TFrmInformarPesoManual.btnOkClick(Sender: TObject);
begin
  Validar();
end;

procedure TFrmInformarPesoManual.btnSairClick(Sender: TObject);
begin
  Sair();
end;

procedure TFrmInformarPesoManual.EditPesoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key in ['0' .. '9', #8, #13, #46, #37, #38, #39, #40,',']) = False Then
    Key := #0;
end;

procedure TFrmInformarPesoManual.FormKeyDown(Sender: TObject; var Key: Word;
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
