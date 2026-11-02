unit FCEPStatus;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, StdCtrls, FFrameBarra;

type
   TFrmCEPStatus = class(TForm)
      Panel1: TPanel;
      LblStatusLocalizacao: TLabel;
      PainelBotao: TPanel;
      FrmFrameBarra1: TFrmFrameBarra;
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmCEPStatus: TFrmCEPStatus;

implementation

{$R *.dfm}

procedure TFrmCEPStatus.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := Cafree;
end;

procedure TFrmCEPStatus.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   if Key = VK_ESCAPE then
      close;

end;

end.

