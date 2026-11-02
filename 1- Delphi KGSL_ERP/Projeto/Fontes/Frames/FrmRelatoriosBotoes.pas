unit FrmRelatoriosBotoes;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Buttons, ExtCtrls, StdCtrls;

type
   TFrameRelatoriosBotoes = class(TFrame)
      Panel1: TPanel;
    SpbImprimir: TBitBtn;
    SpbSair: TBitBtn;
    procedure SpbSairClick(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

implementation

{$R *.dfm}

procedure TFrameRelatoriosBotoes.SpbSairClick(Sender: TObject);
begin
   Screen.ActiveForm.Close;
end;

end.
