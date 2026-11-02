unit FStatusNFe;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, ExtCtrls;

type
   TFrmStatusNFe = class(TForm)
    pnMensagens: TPanel;
    pnTitulo: TPanel;
    Shape2: TShape;
    LblBarraTitulo: TLabel;
    lblStatus: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);

   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmStatusNFe: TFrmStatusNFe;

implementation

{$R *.dfm}

procedure TFrmStatusNFe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TFrmStatusNFe.FormDestroy(Sender: TObject);
begin
  FrmStatusNFe := nil;
end;

end.
