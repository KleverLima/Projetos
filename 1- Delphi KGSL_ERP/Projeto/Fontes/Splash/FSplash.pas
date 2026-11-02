unit FSplash;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, jpeg, StdCtrls,  pngimage, dxGDIPlusClasses;

Type
   TFrmSplash = class(TForm)
    Panel1: TPanel;
    lblStatus: TPanel;
    Label2: TLabel;
    Label5: TLabel;
    TitleImage: TImage;
    AdditionalLabel: TLabel;
    AdditionalInfoLabel: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
   private
      { Private declarations }

   public
      { Public declarations }
   end;

var
   FrmSplash: TFrmSplash;

implementation

uses FPrincipal, Classe.Global;

{$R *.dfm}

procedure TFrmSplash.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := cafree;
end;

procedure TFrmSplash.FormDestroy(Sender: TObject);
begin
  if FrmSplash<>nil then
    FrmSplash := Nil;
end;

end.
