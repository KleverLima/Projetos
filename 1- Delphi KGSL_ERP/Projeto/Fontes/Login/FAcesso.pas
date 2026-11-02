unit FAcesso;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   DB, ExtCtrls, StdCtrls, pngimage, FFrameBarra,
   App.Constantes,   Classe.Global,
   FPrincipal, Vcl.DBCtrls, Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, dxGDIPlusClasses, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Colorful, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxButtons;


type

   TFrmAcesso = class(TForm)
    QryUsuario: TFDQuery;
    QryFilial: TFDQuery;
    dsFilial: TDataSource;
    Label2: TLabel;
    EditSenha: TLabeledEdit;
    EditUsuario: TLabeledEdit;
    TitleImage: TImage;
    cbxEmpresa: TDBLookupComboBox;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Image1: TImage;
    Image3: TImage;
    Image2: TImage;
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
   private
      { Private declarations }
    FFecharTela: Boolean;
    procedure LoginValidar;
    procedure SairSitema;
    procedure GravarEmpresa;
   public
      { Public declarations }
   end;

var
   FrmAcesso: TFrmAcesso;

implementation

uses Biblioteca, Global, FBaseDados;

{$R *.dfm}

procedure TFrmAcesso.SairSitema;
begin
   FFecharTela := True;
   blnUsuarioAutorizado := false;
   FProsseguir :=False;
   TerminarAplicacao();
end;

procedure TFrmAcesso.cxButton1Click(Sender: TObject);
begin
  LoginValidar();
end;

procedure TFrmAcesso.cxButton2Click(Sender: TObject);
begin
  SairSitema();
end;

procedure TFrmAcesso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QryUsuario.Close;
  QryFilial.Close;
  Action := caFree;
end;

procedure TFrmAcesso.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if FFecharTela = false then
    abort;
end;

procedure TFrmAcesso.FormCreate(Sender: TObject);
begin
  QryUsuario.Open;
  QryFilial.Open;
end;

procedure TFrmAcesso.FormDestroy(Sender: TObject);
begin
  if FrmAcesso<>nil then
    FrmAcesso := Nil;
end;

procedure TFrmAcesso.LoginValidar;
begin
   nUsuario :=0;
   if (cbxEmpresa.KeyValue = Null) or (cbxEmpresa.KeyValue<1) then
   begin
     Informar('Informe a empresa que deseja trabalhar');
     Abort;
   end;

   FUsuario.Nome := UpperCase(EditUsuario.text);
   FUsuario.Senha := UpperCase(EditSenha.text);

   if empty(FUsuario.Nome) then
   Begin
      FFecharTela := false;
      blnUsuarioAutorizado := false;
      Informar('Você esqueceu de informar o seu nome de Login');
      EditUsuario.SetFocus;
      abort;
   end;

   if empty(FUsuario.Senha) then
   Begin
      FFecharTela := false;
      blnUsuarioAutorizado := false;
      Informar('Você esqueceu de informar a sua senha Login');
      EditSenha.SetFocus;
      abort;
   end;

   // primeiro, tentar esenha master
   If (UpperCase(FUsuario.Nome) = MASTER_USUARIO) and (UpperCase(FUsuario.Senha) = MASTER_SENHA) then
   begin
      blnUsuarioAutorizado := True;
      GravarEmpresa();
      ModalResult := mrOk;
      //close;
   end;

   // abrir tabela
   If blnUsuarioAutorizado = false then
   begin
      QryUsuario.close;
      QryUsuario.ParamByName('USERNAME').AsString := UpperCase(FUsuario.Nome);
      QryUsuario.ParamByName('SENHA').AsString := UpperCase(FUsuario.Senha);
      QryUsuario.Open;

      // If QryUsuario.LOCATE('UserName;SENHA',VarArrayOf([FUsuario.UsuarioNome,FUsuario.UsuarioSenha]),[])=true then
      If not QryUsuario.IsEmpty then
      begin
         nUsuario :=QryUsuario.FieldByName('ID').AsInteger;

         // checar se usuario está autorizado
         if QryUsuario.FieldByName('BLOQUEAR').AsString='S' then
         begin
            AvisoSistemaErro('Prezado(a) '+FUsuario.Nome+', '+#13+#10+
             'Você está cadastrado no sistema, porém seu acesso não está autorizado.'+#13+#10+
             'Por favor, informe o administrador do sistema.' );

            FFecharTela := false;
            blnUsuarioAutorizado := false;
            EditUsuario.SetFocus;
            abort;
         end;
         GravarEmpresa();
         ModalResult := mrOk;
      End
      else
      Begin
         FFecharTela := false;
         blnUsuarioAutorizado := false;
         Informar('Usuário "' + FUsuario.Nome + '" não foi reconhecido pelo sistema.'+sLineBreak+'Acesso negado');
         EditUsuario.SetFocus;
         abort;
      End;
   End;
   FFecharTela := True;
end;

procedure TFrmAcesso.GravarEmpresa;
begin
  // marcar usuário como online;
  FUsuario.ID := QryUsuario.FieldByname('ID').AsInteger;
  FSistema.Empresa := QryFilial.FieldByname('ID').AsInteger;
  blnUsuarioAutorizado := True;
  ModalResult := mrOk;
end;

procedure TFrmAcesso.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   If Key = VK_RETURN then
      LoginValidar();
   If Key = VK_ESCAPE then
     SairSitema();
end;

procedure TFrmAcesso.FormShow(Sender: TObject);
var
  mFilial : Integer;
begin
  mFilial:=FInfFile.LerItemINI('PARAMETROS', 'Empresa' , 1 );
  nUsuario :=0;
  if FileExists(_ARQUIVOAUTENTICASENHA) then
  Begin
     EditUsuario.text := MASTER_USUARIO;
     EditSenha.text := MASTER_SENHA;
  end;
  FFecharTela := false;
  blnUsuarioAutorizado := false;
  QryUsuario.Open;
  QryFilial.First;
  cbxEmpresa.KeyValue := mFilial;
  QryFilial.Locate('ID', mFilial, []);

end;

end.
