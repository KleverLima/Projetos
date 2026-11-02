unit FOperador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FTemplateForm, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, ACBrBase, ACBrEnterTab;

type
  TFrmOperador = class(TFrmTemplateForm)
    QryUsuario: TFDQuery;
    EditID: TLabeledEdit;
    EditNome: TLabeledEdit;
    EditSenha: TLabeledEdit;
    ACBrEnterTab1: TACBrEnterTab;
    procedure EditIDExit(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FSenha : String;
    procedure GetUsuario;
  public
    { Public declarations }
    FMovimento : String;
  end;

var
  FrmOperador: TFrmOperador;

implementation

{$R *.dfm}

uses FPrincipal, AppFuncoes, AppSQL;

procedure TFrmOperador.FormShow(Sender: TObject);
begin
  inherited;
  if FMovimento='SAIDA' then
  begin
    EditID.Enabled := False;
    EditNome.Enabled := False;

    EditID.Text   := FConfiguracao.Operador.ToString;
    EditNome.Text := FConfiguracao.OperadorNome;

    GetUsuario();
    EditSenha.SetFocus;
  end;
  if FMovimento='ENTRADA' then
    EditID.SetFocus;

end;

procedure TFrmOperador.GetUsuario;
begin
  if StrToIntDef(EditID.Text,0)<1 then
    exit;
  try
    QryUsuario.Close;
    QryUsuario.ParamByName('ID').AsInteger := StrToIntDef(EditID.Text,-1);
    QryUsuario.Open();
    if QryUsuario.IsEmpty then
    begin
      EditNome.Text := 'Operador(a) de caixa não encontrado.';
      exit;
    end;
    FSenha := QryUsuario.FieldByName('SENHA').AsString;
    EditNome.Text := QryUsuario.FieldByName('USERNAME').AsString
  finally
    QryUsuario.Close;
  end;
end;

procedure TFrmOperador.EditIDExit(Sender: TObject);
begin
  if StrToIntDef(EditID.Text,0)<1 then
  begin
    exit;
  end;
  try
    QryUsuario.Close;
    QryUsuario.ParamByName('ID').AsInteger := StrToIntDef(EditID.Text,-1);
    QryUsuario.Open();
    if QryUsuario.IsEmpty then
    begin
      informar('Operador(a) de caixa não encontrado.');
      EditID.SetFocus;
      exit;
    end;
    FSenha := QryUsuario.FieldByName('SENHA').AsString;
    EditNome.Text := 'USUARIO DO SISTEMA: '+QryUsuario.FieldByName('USERNAME').AsString;
  finally
    QryUsuario.Close;
  end;
end;

procedure TFrmOperador.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key=VK_F2 then
    btnOkClick(Sender);
end;


procedure TFrmOperador.btnOkClick(Sender: TObject);
var
  mTexto : String;
  mData  : TDateTime;
begin
  if StrToIntDef(EditID.Text,0)<1 then
  begin
    Informar('Informe o campo ID Operador(a)');
    if FMovimento='ENTRADA' then
      EditID.SetFocus;
    exit;
  end;

  if trim(EditSenha.Text).IsEmpty then
  begin
    informar('Informe o campo Senha.');
    EditSenha.SetFocus;
    Exit;
  end;
  if trim(EditSenha.Text)<>FSenha then
  begin
    informar('Senha incorreta.');
    if FMovimento='SAIDA' then
      EditSenha.SetFocus
    else
      EditID.SetFocus;
    Abort;
  end;
  mData := FrmPrincipal.QryMovimento.FieldByName('INICIO').AsDateTime;
  //--------------------------------------------------------------------
  // Se for entrada
  //--------------------------------------------------------------------
  if FMovimento='ENTRADA' then
  begin
    mTexto := 'Movimento do dia: '+FormatDateTime('c',mData)+sLineBreak+
              ' '+sLineBreak+
              'Operador(a)'+EditID.Text+' '+EditNome.Text+sLineBreak+
              ' '+sLineBreak+
              ' '+sLineBreak+
              ' '+sLineBreak+
              ' '+StringOfChar('_',40)+sLineBreak+
              'Assinatura'+sLineBreak+
              ' ';
    SQLUpdateMovimento(FrmPrincipal.QryMovimento.FieldByName('ID').AsInteger,StrToInt(EditID.Text),'OPERADOR');
  end;

  //--------------------------------------------------------------------
  // Se for saida, apresenta resumo do caixa
  //--------------------------------------------------------------------
  if FMovimento='SAIDA' then
  begin
    GetUsuario();
    SQLUpdateMovimento(FrmPrincipal.QryMovimento.FieldByName('ID').AsInteger,0,'OPERADOR');

    mTexto := 'Movimento do dia: '+FormatDateTime('c',mData)+sLineBreak+
              ' '+sLineBreak+
              'Operador(a) ID: '+EditID.Text+sLineBreak+
              'Operador(a)NOME: '+EditNome.Text+sLineBreak+
              ' '+sLineBreak+
              ' '+sLineBreak+
              ' '+sLineBreak+
              ' '+StringOfChar('_',40)+sLineBreak+
              'Assinatura'+sLineBreak+
              ' ';
    FConfiguracao.Operador     := 0;
    FConfiguracao.OperadorNome := '';
    FrmPrincipal.QryMovimento.Close;
    FrmPrincipal.QryMovimento.Open;
    FrmPrincipal.EncerrarVenda(False);
  end;
  ImprimirDiversos(FMovimento+' DE OPERADOR(A)',mTexto);
  ModalResult := mrOk;
end;

end.
