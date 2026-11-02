unit Classe.BancoDados;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.IniFiles,
  Data.DB, Classe.Criptografia, App.Constantes;
Type
   TBancoDados = Class(TPersistent)
   Private
     FSQLNome         : String;
     FSQLVersao       : String;
     FBancoDados            : WideString;
     FEndereco        : WideString;
     FPorta           : Integer;
     FUsuario         : String;
     FSenha           : String;
     function GetEndereco: WideString;
     function GetNome: WideString;
     function GetPorta: Integer;
     function GetSenha: String;
     function  GetUsuario: String;
     procedure SetEndereco(const Value: WideString);
     procedure SetNome(const Value: WideString);
     procedure SetPorta(const Value: Integer);
     procedure SetSenha(const Value: String);
     procedure SetUsuario(const Value: String);
    function GetSQLNome: String;
    function GetSQLVersao: String;
    procedure SetSQLNome(const Value: String);
    procedure SetSQLVersao(const Value: String);
   Public
     constructor Create;
     destructor  Destroy; Override;
     property SQLNome               : String            Read  GetSQLNome            Write SetSQLNome;
     property SQLVersao             : String            Read  GetSQLVersao          Write SetSQLVersao;
     property BancoDados            : WideString        Read  GetNome               Write SetNome;
     property Endereco              : WideString        Read  GetEndereco           Write SetEndereco;
     property Porta                 : Integer           Read  GetPorta              Write SetPorta;
     property Usuario               : String            Read  GetUsuario            Write SetUsuario;
     property Senha                 : String            Read  GetSenha              Write SetSenha;
   End;
implementation
{ TBancoDados }

uses Classe.Global;
constructor TBancoDados.Create;
begin
  FBancoDados      := _BANCODADOS_PADRAO;
  FUsuario         := _DATABASE_USUARIO;
  FSenha           := _DATABASE_SENHA;
  FPorta           := _DATABASE_PORTA;
  FEndereco        := _DATABASE_SERVIDOR;
  FSQLNome         := DATABASE_GERENCIADOR;
  FSQLVersao       := DATABASE_VERSAO;
end;
destructor TBancoDados.Destroy;
begin
//
end;
function TBancoDados.GetEndereco: WideString;
begin
  Result := Trim(FEndereco);
end;
function TBancoDados.GetNome: WideString;
begin
  Result := Trim(FBancoDados);
end;
function TBancoDados.GetPorta: Integer;
begin
  Result := FPorta;
end;
function TBancoDados.GetSenha: String;
begin
  Result := Trim(FSenha);
end;
function TBancoDados.GetSQLNome: String;
begin
   Result := FSQLNome;
end;
function TBancoDados.GetSQLVersao: String;
begin
   Result := FSQLVersao;
end;
function TBancoDados.GetUsuario: String;
begin
   Result := Trim(FUsuario);
end;
procedure TBancoDados.SetEndereco(const Value: WideString);
begin
   FEndereco := Trim(Value);
end;
procedure TBancoDados.SetNome(const Value: WideString);
begin
   FBancoDados := Trim(Value);
end;
procedure TBancoDados.SetPorta(const Value: Integer);
begin
   FPorta := Value;
end;
procedure TBancoDados.SetSenha(const Value: String);
begin
   FSenha := Trim(Value);
end;
procedure TBancoDados.SetSQLNome(const Value: String);
begin
   FSQLNome := Value;
end;
procedure TBancoDados.SetSQLVersao(const Value: String);
begin
   FSQLVersao := Value;
end;
procedure TBancoDados.SetUsuario(const Value: String);
begin
   FUsuario := Trim(Value);
end;
end.
