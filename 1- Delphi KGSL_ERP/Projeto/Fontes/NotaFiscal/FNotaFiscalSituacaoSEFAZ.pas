unit FNotaFiscalSituacaoSEFAZ;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, FFrameBarra, StdCtrls, Buttons, ExtCtrls;

type
   TFrmNotaFiscalSituacaoSEFAZ = class(TForm)
      FrmFrameBarra1: TFrmFrameBarra;
      Panel1: TPanel;
      BitBtn1: TBitBtn;
      MemoDados: TMemo;
      procedure BitBtn1Click(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmNotaFiscalSituacaoSEFAZ: TFrmNotaFiscalSituacaoSEFAZ;

implementation

{$R *.dfm}

procedure TFrmNotaFiscalSituacaoSEFAZ.BitBtn1Click(Sender: TObject);
begin
   close;
end;

end.
