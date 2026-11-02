unit App.IniFiles;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.IniFiles;
Type
  TInfFile = Class
  Private
     FIniConfiguracao: TIniFile;
  Public
    procedure CarregarINI;
    procedure GravarINI;
    function  LerCaminhoFDB: String;
    function  LerItemINI(strSessao, strChave: String; ValueDefault:Variant): Variant;
    procedure GravarItemINI(strSessao, strChave: String; ValueDefault:Variant);
  End;

implementation
uses Classe.Global, App.Constantes;

procedure TInfFile.CarregarINI;
begin
   try
     FIniConfiguracao := TIniFile.create(FSistema.ArquivoCFG);
     FBancoDados.BancoDados          := FIniConfiguracao.ReadString('PARAMETROS',    'Database',      _BANCODADOS_PADRAO);
     FBancoDados.Endereco            := FIniConfiguracao.ReadString('PARAMETROS',    'Server',        _DATABASE_SERVIDOR);
     FBancoDados.Porta               := FIniConfiguracao.ReadInteger('PARAMETROS',   'porta',         _DATABASE_PORTA);
     FBancoDados.Usuario             := _DATABASE_USUARIO;
     FBancoDados.Senha               := _DATABASE_SENHA;
   finally
     FIniConfiguracao.Free;
   end;
end;
procedure TInfFile.GravarINI;
begin
   try
     FIniConfiguracao := TIniFile.create(FSistema.ArquivoCFG);
     FIniConfiguracao.WriteInteger('PARAMETROS', 'EMPRESA',      1        );
     FIniConfiguracao.WriteString('PARAMETROS',  'Server',   FBancoDados.Endereco);
     FIniConfiguracao.WriteString('PARAMETROS',  'Database', LowerCase(FBancoDados.BancoDados));
   finally
     FIniConfiguracao.Free;
   end;
end;
function TInfFile.LerItemINI(strSessao, strChave: String; ValueDefault:Variant): Variant;
begin
   try
     FIniConfiguracao := TIniFile.create(FSistema.ArquivoCFG);
     Result  := FIniConfiguracao.ReadInteger(strSessao, strChave, ValueDefault );
   finally
     FIniConfiguracao.Free;
   end;
end;
function TInfFile.LerCaminhoFDB: String;
begin
   Result := '';
   try
     FIniConfiguracao := TIniFile.create(FSistema.ArquivoCFG);
     Result  := FIniConfiguracao.ReadString('PARAMETROS', 'Database', _BANCODADOS_PADRAO);
   finally
     FIniConfiguracao.Free;
   end;
end;
procedure TInfFile.GravarItemINI(strSessao, strChave: String;
  ValueDefault: Variant);
begin
   try
     FIniConfiguracao := TIniFile.create(FSistema.ArquivoCFG);
     FIniConfiguracao.WriteInteger(strSessao, strChave, ValueDefault);
   finally
     FIniConfiguracao.Free;
   end;
end;


end.
