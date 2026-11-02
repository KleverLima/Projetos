unit FEmailTemplate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,FTemplate, dxGDIPlusClasses;

type
  TFrmEmailTemplate = class(TForm)
    pnlTitulo: TPanel;
    pnlBotoes: TPanel;
    lblEnviarEmail: TLabel;
    pnlCentro: TPanel;
    pnlPara: TPanel;
    mmoMensagem: TMemo;
    pnlAssunto: TPanel;
    lbledtPara: TLabeledEdit;
    lbledtAssunto: TLabeledEdit;
    btnEnviar: TBitBtn;
    btnCancelar: TBitBtn;
    img1: TImage;
    mmoAnexo: TMemo;
    lblAnexo: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEmailTemplate: TFrmEmailTemplate;

implementation

{$R *.dfm}

end.
