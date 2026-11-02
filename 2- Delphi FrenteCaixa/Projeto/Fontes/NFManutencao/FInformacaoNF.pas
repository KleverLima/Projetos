unit FInformacaoNF;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Buttons, ExtCtrls, System.StrUtils, pcnRede;

type
   TFrmInformacaoNF = class(TForm)
      Panel1: TPanel;
      BitBtn1: TBitBtn;
      MemoDados: TMemo;
    pnTitulo: TPanel;
    Shape2: TShape;
    Label2: TLabel;
      procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
      FTipo : String;
   end;

var
   FrmInformacaoNF: TFrmInformacaoNF;

implementation

{$R *.dfm}

uses FPrincipal, AppFuncoes, FManutencaoNFe;

procedure TFrmInformacaoNF.BitBtn1Click(Sender: TObject);
begin
   close;
end;

procedure TFrmInformacaoNF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TFrmInformacaoNF.FormCreate(Sender: TObject);
begin
  FTipo := '';
end;

procedure TFrmInformacaoNF.FormDestroy(Sender: TObject);
begin
  FrmInformacaoNF := Nil;
end;

procedure TFrmInformacaoNF.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TFrmInformacaoNF.FormShow(Sender: TObject);
begin
  if FTipo = 'STATUSNF' then
  begin
    FrmPrincipal.ACBrNFe1.NotasFiscais.Clear;
    FrmPrincipal.ACBrNFe1.NotasFiscais.LoadFromFile(Trim(FrmManutencaoNFe.QryNFe.FieldByName('NFE_ARQUIVO').AsString));
    FrmPrincipal.ACBrNFe1.Consultar;
    try
      MemoDados.Clear;
      MemoDados.Lines.Add('');
      MemoDados.Lines.Add('SITUAÇÃO DA NFCE:');
      MemoDados.Lines.Add('Chave............: ' + FrmPrincipal.ACBrNFe1.WebServices.Consulta.NFeChave);
      MemoDados.Lines.Add('Protocolo........: ' + FrmPrincipal.ACBrNFe1.WebServices.Consulta.Protocolo);
      MemoDados.Lines.Add('Código Retorno...: ' + IntToStr(FrmPrincipal.ACBrNFe1.WebServices.Consulta.cStat));
      MemoDados.Lines.Add('Situação.........: ' + FrmPrincipal.ACBrNFe1.WebServices.Consulta.xMotivo);
    finally
      FrmPrincipal.ACBrNFe1.NotasFiscais.Clear;
    end;
  end;
  if FTipo = 'INFOSAT' then
  begin
    MsgEsperar('Consultando SAT. Aguarde...', 'SAT',True);
    try
      FrmPrincipal.ACBrSAT1.ConsultarStatusOperacional;
      if FrmPrincipal.ACBrSAT1.Resposta.codigoDeRetorno = 10000 then
      begin
        MemoDados.Lines.BeginUpdate;
        try
          with FrmPrincipal.ACBrSAT1.Status do
          begin
            MemoDados.Lines.Add('DADOS GERAIS');
            MemoDados.Lines.Add('---------------------------------------------------------');
            MemoDados.Lines.Add('Número de Série..: ' + NSERIE);
            MemoDados.Lines.Add('MAC..............: ' + LAN_MAC);
            MemoDados.Lines.Add('Status Rede......: ' + StatusLanToStr(STATUS_LAN));
            MemoDados.Lines.Add('Nível Bateria....: ' + NivelBateriaToStr(NIVEL_BATERIA));
            MemoDados.Lines.Add('Memoria Total....: ' + MT_TOTAL);
            MemoDados.Lines.Add('Memoria Usada....: ' + MT_USADA);
            MemoDados.Lines.Add('Data/Hora Atual..: ' + DateTimeToStr(DH_ATUAL));
            MemoDados.Lines.Add('Versao SB........: ' + VER_SB);
            MemoDados.Lines.Add('Versao Layout....: ' + VER_LAYOUT);
            MemoDados.Lines.Add('Ultimo CFe.......: ' + ULTIMO_CFe);
            MemoDados.Lines.Add('Lista Inicial....: ' + LISTA_INICIAL);
            MemoDados.Lines.Add('Lista Final......: ' + LISTA_FINAL);
            MemoDados.Lines.Add('Data/Hora CFe....: ' + DateTimeToStr(DH_CFe));
            MemoDados.Lines.Add('Data/Hora Ult....: ' + DateTimeToStr(DH_ULTIMA));
            MemoDados.Lines.Add('DH Emissao Cert..: ' + DateToStr(CERT_EMISSAO));
            MemoDados.Lines.Add('DH Vencim Cert...: ' + DateToStr(CERT_VENCIMENTO));
            MemoDados.Lines.Add('Estado Operacao..: ' + EstadoOperacaoToStr(ESTADO_OPERACAO));
          end;

          with FrmPrincipal.ACBrSAT1.Rede do
          begin
            MemoDados.Lines.Add('');
            MemoDados.Lines.Add('');
            MemoDados.Lines.Add('CONECTIVIDADE');
            MemoDados.Lines.Add('---------------------------------------------------------');
            MemoDados.Lines.Add('Tipo de Interface: ' + TipoInterfaceToStr(tipoInter));

            case tipoInter of
              infETHE:
                begin
                  MemoDados.Lines.Add('Tipo.............: ' + TipoLanToStr(tipoLan));
                  MemoDados.Lines.Add('IP...............: ' + lanIP);
                  MemoDados.Lines.Add('Mascara..........: ' + lanMask);
                  MemoDados.Lines.Add('Gateway..........: ' + lanGW);
                  MemoDados.Lines.Add('DNS 1............: ' + lanDNS1);
                  MemoDados.Lines.Add('DNS 2............: ' + lanDNS2);

                  if tipoLan = lanPPPoE then
                  begin
                    MemoDados.Lines.Add('Usuário..........: ' + usuario);
                    MemoDados.Lines.Add('Senha............: ' + senha);
                  end;
                end;

              infWIFI:
                begin
                  MemoDados.Lines.Add('SSID.............: ' + SSID);
                  MemoDados.Lines.Add('Segurança........: ' + SegSemFioToStr(seg));
                  MemoDados.Lines.Add('Código...........: ' + codigo);
                end;
            end;

            MemoDados.Lines.Add('');
            MemoDados.Lines.Add('');
            MemoDados.Lines.Add('PROXY');
            MemoDados.Lines.Add('---------------------------------------------------------');
            MemoDados.Lines.Add('Utiliza Proxy....: ' + IfThen(proxy > 0, 'Sim', 'Não'));

            if proxy > 0 then
            begin
              MemoDados.Lines.Add('Host.............: ' + proxy_ip);
              MemoDados.Lines.Add('Porta............: ' + proxy_porta.ToString);
              MemoDados.Lines.Add('Usuário..........: ' + proxy_user);
              MemoDados.Lines.Add('Senha............: ' + proxy_senha);
            end;
          end;
        finally
          MemoDados.Lines.EndUpdate;
        end;
      end
      else
      begin
        MemoDados.Lines.Add(FrmPrincipal.ACBrSAT1.Resposta.RetornoStr);
      end;
    finally
      MsgEsperar('','',False);
      Application.ProcessMessages;
    end;
  end;


end;

end.
