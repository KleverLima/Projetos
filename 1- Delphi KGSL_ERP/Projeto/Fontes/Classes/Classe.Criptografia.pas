unit Classe.Criptografia;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;
Type
   TCriptografia = Class(TPersistent)
   Private
      class var FEncriptar  : WideString;
      class var FDecriptar  : WideString;
      class Procedure prcLimparVariaveis;
   Public
     class function  Encrypt(Encript: WideString): WideString;
     class function  Decrypt(Decript: WideString): WideString;
   end;
implementation
{ TCriptografia }
class procedure TCriptografia.prcLimparVariaveis;
begin
  FEncriptar  :='';
  FDecriptar  :='';
end;
class function TCriptografia.Decrypt(Decript: WideString): WideString;
var
   strEncriptar            : WideString;
   StrEncriptado           : WideString;
   intComprimento          : Integer;
   intContador             : Integer;
   intOrdinal              : Integer;
   strOrdinal              : WideString;
   intRestoDivisor         : Integer;
begin
   strEncriptar := Decript;
   StrEncriptado := '';
   intComprimento := Length(Decript);
   intRestoDivisor := Length(Decript) mod 2;
   For intContador := intComprimento downto 1 do
      StrEncriptado := StrEncriptado + Copy(strEncriptar, intContador, 1);
   strEncriptar := '';
   For intContador := 1 To intComprimento do
   begin
      strOrdinal := Copy(StrEncriptado, intContador, 1);
      intOrdinal := ord(strOrdinal[1]);
      if intRestoDivisor > 0 then
      begin
         if not(intContador / 2 = Int(intContador / 2)) then
            strEncriptar := strEncriptar + CHR(intOrdinal + 1)
         else
            strEncriptar := strEncriptar + CHR(intOrdinal - 1);
      end
      else
      begin
         if intContador / 2 = Int(intContador / 2) then
            strEncriptar := strEncriptar + CHR(intOrdinal + 1)
         else
            strEncriptar := strEncriptar + CHR(intOrdinal - 1);
      end;
   end;
   StrEncriptado := strEncriptar;
   Result := StrEncriptado;
   prcLimparVariaveis;
end;
class function TCriptografia.Encrypt(Encript: WideString): WideString;
var
   strEncriptar            : WideString;
   StrEncriptado           : WideString;
   intComprimento          : Integer;
   intContador             : Integer;
   intOrdinal              : Integer;
   strOrdinal              : WideString;
begin
   strEncriptar := Encript;
   StrEncriptado := '';
   intComprimento := Length(Encript);
   for intContador := intComprimento downto 1 do
      StrEncriptado := StrEncriptado + Copy(strEncriptar, intContador, 1);
   strEncriptar := '';
   For intContador := 1 To intComprimento do
   begin
      strOrdinal := Copy(StrEncriptado, intContador, 1);
      intOrdinal := ord(strOrdinal[1]);
      if intContador / 2 = Int(intContador / 2) then
         strEncriptar := strEncriptar + CHR(intOrdinal + 1)
      else
         strEncriptar := strEncriptar + CHR(intOrdinal - 1);
   end;
   StrEncriptado := strEncriptar;
   Result := StrEncriptado;
   prcLimparVariaveis;
end;
end.
