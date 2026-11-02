unit FStatus;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, ExtCtrls, Vcl.ComCtrls;

type
   TFrmStatus = class(TForm)
    pnTitulo: TPanel;
    Shape2: TShape;
    lblTitulo: TLabel;
    pgbStatus: TProgressBar;
    pnStatus: TPanel;
    lblStatus: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
      { Private declarations }
   public
      { Public declarations }
      procedure SetStatusBar(aMin,Max,aPosicao : Integer);
   end;

var
   FrmStatus: TFrmStatus;

implementation

{$R *.dfm}

{ TFrmStatus }

procedure TFrmStatus.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TFrmStatus.SetStatusBar(aMin, Max, aPosicao: Integer);
begin
  try
    pgbStatus.Min      := aMin;
    pgbStatus.Max      := Max;
    pgbStatus.Position := aPosicao;
  finally
    Application.ProcessMessages;
  end;
end;

end.
