unit Classe.GetConnect;
interface
uses
   Forms, Classes, Windows, Controls, Variants, ComCtrls,
   WinTypes, WinProcs, Tabs, ExtCtrls, DBCtrls,
   Dialogs, StdCtrls, Messages, Graphics, shellapi, Sysutils,
   FMTBcd,  WideStrings, DBCommon, System.DateUtils,
   System.StrUtils, System.Types,
   FireDAC.Comp.Client, System.IniFiles,
   Data.DB,
   App.Constantes,
   Classe.Criptografia;
  procedure GravarINIFB;
  procedure GetConfigFB(aFDConnection: TFDConnection; aLocalDados: TLocalDados = ldPadrao);

const
  _INI_FB      = Concat(_DRIVE,PathDelim,_SISTEMA_NOME,PathDelim,PASTA_BINARIO,PathDelim,CONFIG_INI );
implementation

procedure GravarINIFB;
var
  FIniConfiguracao : TIniFile;
begin
   try
     FIniConfiguracao := TIniFile.create(_INI_FB);
     FIniConfiguracao.WriteString('PARAMETROS',  'Database', _BANCODADOS_PADRAO);
     FIniConfiguracao.WriteString('PARAMETROS',  'DBConfig', _BANCODADOS_PDV);
     FIniConfiguracao.WriteString('PARAMETROS',  'DBCEP',    _BANCODADOS_CEP);
     FIniConfiguracao.WriteString('PARAMETROS',  'Server',   _DATABASE_SERVIDOR);
   finally
     FIniConfiguracao.Free;
   end;
end;
procedure GetConfigFB(aFDConnection: TFDConnection; aLocalDados: TLocalDados = ldPadrao);
var
  mIniFile      : TIniFile;
  mServidor     : String;
  mBancoDados   : String;
  usuario       : String;
  mSenha        : String;
  mPorta        : Integer;
begin
   if (aFDConnection=nil) then
     raise Exception.Create('Objeto aFDConnection não instanciado.');
   try
     if not FileExists(_INI_FB) then
     begin
       GravarINIFB; // Força Criar um novo ".INI"
       sleep(1000); // esperar 1 segundo
     end;
     mIniFile := TIniFile.create(_INI_FB);
     case aLocalDados of
       ldPadrao : mBancoDados := Trim(mIniFile.ReadString('PARAMETROS', 'Database', _BANCODADOS_PADRAO));
       ldCEP    : mBancoDados := Trim(mIniFile.ReadString('PARAMETROS', 'DBCEP',    _BANCODADOS_CEP));
     end;
     mServidor     := Trim(mIniFile.ReadString('PARAMETROS',    'Server',        _DATABASE_SERVIDOR));
     mPorta        := mIniFile.ReadInteger('PARAMETROS',        'porta',         3050);
     usuario       := _DATABASE_USUARIO;
     mSenha        := _DATABASE_SENHA;
     aFDConnection.Params.Values['DriverID']  := _DATABASE_DRIVER;
     aFDConnection.Params.Values['Server']    := mServidor;
     aFDConnection.Params.Values['Database']  := mBancoDados;
     aFDConnection.Params.Values['User_Name'] := usuario;
     aFDConnection.Params.Values['Password']  := mSenha;
     aFDConnection.Params.Values['Port']      := '';
     if mPorta > 0 then
       aFDConnection.Params.Values['Port']    := mPorta.ToString;
   finally
     mIniFile.Free;
   end;
end;
end.
