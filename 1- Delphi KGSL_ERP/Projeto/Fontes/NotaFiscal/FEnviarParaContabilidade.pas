unit FEnviarParaContabilidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FEmailTemplate, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, dxGDIPlusClasses;

type
  TFrmEnviarParaContabilidade = class(TFrmEmailTemplate)
    procedure btnEnviarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetAnexo(Arquivo01, Arquivo02: String);

  end;

var
  FrmEnviarParaContabilidade: TFrmEnviarParaContabilidade;
  ArquivoAnexo01, ArquivoAnexo02: string;

implementation

uses
  FBaseDados, Classe.Parametros, FAvisoSistemaErro, FAvisoSistema, Biblioteca;

{$R *.dfm}

procedure TFrmEnviarParaContabilidade.btnCancelarClick(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TFrmEnviarParaContabilidade.btnEnviarClick(Sender: TObject);
var
  Anexo: TStringList;
  ErroEnvio: Boolean;

begin
  inherited;
  ErroEnvio := False;
  Anexo := TStringList.Create;
  Anexo.Add(ArquivoAnexo01);
  Anexo.Add(ArquivoAnexo02);

  try
    BaseDados.ACBrNFe1.EnviarEmail(lbledtPara.Text, // Para
      lbledtAssunto.Text, // Assunto
      mmoMensagem.Lines, // Mensagem
      nil, // CC
      Anexo, // Anexo
      nil); // TStream
  except
    on E: Exception do
    begin
      AvisoSistemaErro('E-MAIL NÃO ENVIADO!!' + sLineBreak + sLineBreak + E.Message);
      ErroEnvio := True;
    end;
  end;

  if not ErroEnvio then
    AvisoSistema('Email enviado com sucesso!');

  Anexo.Free;
  Self.Close;
end;

procedure TFrmEnviarParaContabilidade.FormShow(Sender: TObject);
begin
  inherited;

  // Email da contabilidade
  lbledtPara.Text := BaseDados.db_Parametros.FieldByName('CONTAB_EMAIL').AsString;

  // Nome Fantasia da Empresa
  lbledtAssunto.Text := 'Notas Fiscais ' + BaseDados.db_Parametros.FieldByName('NOMEFANTASIA').AsString;

  // Arquivo em Anexo
  mmoAnexo.Clear;
  mmoAnexo.Lines.Add(ExtractFileName(ArquivoAnexo01));
  mmoAnexo.Lines.Add(ExtractFileName(ArquivoAnexo02));

end;

procedure TFrmEnviarParaContabilidade.GetAnexo(Arquivo01, Arquivo02: String);
begin;
  ArquivoAnexo01 := Arquivo01;
  ArquivoAnexo02 := Arquivo02;
end;

end.
