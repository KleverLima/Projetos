unit FSelecionarBandeiraCartao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, pcnConversao;

type
  TFrmSelecionarBandeiraCartao = class(TForm)
    QryBandeira: TFDQuery;
    dsBandeira: TDataSource;
    pnBotoes: TPanel;
    Panel11: TPanel;
    lblFinalizar: TLabel;
    Panel3: TPanel;
    lblSair: TLabel;
    grdDados: TDBGrid;
    Panel1: TPanel;
    Shape1: TShape;
    Label1: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    FIDBandeiraCad    : Integer;
    FBandeiraNome     : String;
    FBandeiraCartao   : TpcnBandeiraCartao;
    FBandeiraCNPJ     : String;
  end;

var
  FrmSelecionarBandeiraCartao: TFrmSelecionarBandeiraCartao;

implementation

{$R *.dfm}

uses FPrincipal;

procedure TFrmSelecionarBandeiraCartao.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmSelecionarBandeiraCartao.btnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrmSelecionarBandeiraCartao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  QryBandeira.Close;
end;

procedure TFrmSelecionarBandeiraCartao.FormCreate(Sender: TObject);
begin
  FBandeiraNome := '';
  ModalResult := mrNone;
end;

procedure TFrmSelecionarBandeiraCartao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_ESCAPE then
  begin
    key := 0;
    ModalResult := mrCancel;
    close;
  end;
  if key=VK_RETURN then
  begin
    Key := 0;
    FIDBandeiraCad    := QryBandeira.FieldByName('ID').AsInteger;
    FBandeiraNome     := QryBandeira.FieldByName('BANDEIRA').AsString;
    FBandeiraCartao   := TpcnBandeiraCartao(QryBandeira.FieldByName('IDACBR').AsInteger);
    FBandeiraCNPJ     := QryBandeira.FieldByName('CNPJ').AsString;
    ModalResult := mrOk;
    close;
  end;
end;

procedure TFrmSelecionarBandeiraCartao.FormShow(Sender: TObject);
begin
  FBandeiraCartao      := bcOutros;
  lblFinalizar.Caption := 'Confirmar'+sLineBreak+'(Enter)';
  lblSair.Caption      := 'Sair'+sLineBreak+'(Esc)';

  QryBandeira.Open;
  grdDados.SetFocus;
end;

end.
