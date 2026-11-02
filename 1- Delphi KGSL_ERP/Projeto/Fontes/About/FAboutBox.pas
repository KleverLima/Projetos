unit FAboutBox;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ExtCtrls, StdCtrls, ComCtrls, jpeg, ShellAPI,  pngimage, FFrameBarra,
  dxGDIPlusClasses;

type
   TFrmAboutBox = class(TForm)
    FrmFrameBarra1: TFrmFrameBarra;
    PanelTop: TPanel;
    LicensedToLabel: TLabel;
    lblVersaoSistema: TLabel;
    AdditionalLabel: TLabel;
    AdditionalInfoLabel: TLabel;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    btnOk: TButton;
    TitleImage: TImage;
    Label6: TLabel;
    Label1: TLabel;
      procedure FormCreate(Sender: TObject);
      procedure Label6Click(Sender: TObject);
    procedure BtnAcessarClick(Sender: TObject);
    procedure AdvSmoothLabel2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject); // ?
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmAboutBox: TFrmAboutBox;

implementation

uses FPrincipal, App.SQL, Biblioteca, Global, Classe.Global, App.Constantes,
  App.Funcoes;


{$R *.dfm}

procedure TFrmAboutBox.AdvSmoothLabel2Click(Sender: TObject);
begin
   strURL := SITE_EMPRESA;
   shellexecute(0, nil, pchar(strURL), nil, nil, SW_SHOW);
end;

procedure TFrmAboutBox.BtnAcessarClick(Sender: TObject);
begin
   close;
end;

procedure TFrmAboutBox.btnOkClick(Sender: TObject);
begin
 Close;
end;

procedure TFrmAboutBox.FormCreate(Sender: TObject);
var
   MS: TMemoryStatus;
   Ano, Mes, Dia: Word;
begin
   //Caption := 'Sistema ' + Application.Title;
   //Caption := 'Sistema ' + '';
   //Caption := 'KGSL ERP (Versão: 2.1.0) - ' + '[Sistema - KGSL ERP]';
   Caption := 'Sistema - ' + '[KGSL ERP]';
   DecodeDate(Date, Ano, Mes, Dia);
   MS.dwLength := sizeof(MemoryStatus);
   GlobalMemoryStatus(MS);

   FrmFrameBarra1.Height := 1;
end;

procedure TFrmAboutBox.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_ESCAPE then
    close;
end;

procedure TFrmAboutBox.FormShow(Sender: TObject);
begin
  //lblVersaoSistema.Caption := GetVersao(Application.ExeName) +  ' (v. 2021)';

  //Antes na versão estava com dois zéros antes colocar na próxima versão 2 zeros antes.
  //lblVersaoSistema.Caption := '3.0.0.2' +  ' (v. 2021)';
  lblVersaoSistema.Caption := '2.1.0.0' +  ' (v. 2021)';
end;

procedure TFrmAboutBox.Label6Click(Sender: TObject);
begin

   strURL := 'informar email';
   shellexecute(0, nil, pchar(strURL), nil, nil, SW_SHOW);

end;

end.



