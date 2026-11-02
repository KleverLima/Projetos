unit FOpcaoVenda;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, FFrameBarra, ExtCtrls;

type
   TFrmOpcaoVenda = class(TForm)
      FrmFrameBarra1: TFrmFrameBarra;
      Panel5: TPanel;
    BtnImportar: TButton;
    BtnDigitar: TButton;
    BtnSair: TButton;
    Button1: TButton;
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnImportarClick(Sender: TObject);
    procedure BtnDigitarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmOpcaoVenda: TFrmOpcaoVenda;

implementation

uses Classe.Global, Global, FVendaExpressa;

{$R *.dfm}

procedure TFrmOpcaoVenda.BtnDigitarClick(Sender: TObject);
begin
  OpcaoVenda := 'N';
  wOperacao := 'S'; // Saida de Produto
  close;
end;

procedure TFrmOpcaoVenda.BtnImportarClick(Sender: TObject);
begin
  OpcaoVenda := 'P';
  wOperacao := 'S'; // Saida de Produto
  close;
end;

procedure TFrmOpcaoVenda.BtnSairClick(Sender: TObject);
begin
  OpcaoVenda := 'S';
  close;
end;

procedure TFrmOpcaoVenda.Button1Click(Sender: TObject);
begin
  OpcaoVenda := 'D';
  wOperacao := 'E'; // Entrada de Produto
  close;
end;

procedure TFrmOpcaoVenda.FormCreate(Sender: TObject);
begin
  FrmFrameBarra1.Height := 1;
end;

procedure TFrmOpcaoVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   OpcaoVenda := '';

   IF Key = VK_F3 then
   begin
      BtnImportarClick(Sender);
   end;

   IF Key = VK_F4 then
   begin
      BtnDigitarClick(Sender);
   end;

   IF Key = VK_ESCAPE then
   begin
      BtnSairClick(Sender);
   end;

end;

end.
