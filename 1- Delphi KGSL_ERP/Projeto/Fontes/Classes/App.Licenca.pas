unit App.Licenca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,   FireDAC.Comp.Client, System.StrUtils,
  Vcl.Grids, Vcl.DBGrids,   System.Generics.Collections, Data.DB, Vcl.DBCtrls, System.Math,
  System.JSON, pcnConversaoNFe, pcnConversao, pcnNFe, ACBrValidador, ACBrUtil, ACBrDFeSSL,
  System.DateUtils, System.Types, ACBrNFe;

  //--------------------------------------------------------------------
  // Segurança do sistema
  //--------------------------------------------------------------------
  function DecryptStr(const S: String; Key: Word): String;
  function EncryptStr(const S :WideString; Key: Word): String;
  function ExtrairTexto(const Str: string; const Delim1, Delim2: string): string;
  function GerarChave(aTempoDias: string; aData: TDate; aChave : Integer) : String;
  function ReverterChave(aValue : String; aChave : Integer) : String;
  function VerificarChave(aValue : String; var outData : TDate; var outDias : Integer) : Boolean;


implementation

uses App.Constantes;

//--------------------------------------------------------------------
// Segurança do sistema
//--------------------------------------------------------------------
function GerarChave(aTempoDias: string; aData: TDate; aChave : Integer) : String;
var
  mString     : String;
  mEncripar   : String;
  LMilsSince: Int64;
begin
  Result := '';
  if (aTempoDias.IsEmpty) or (aChave=0) then
    exit;
  LMilsSince := MilliSecondsBetween(DateDelta, Now);
  LMilsSince := (LMilsSince * -1);
  mString    := (Random(LMilsSince)).ToString;
  // ----------------------------------------------------------------------
  // Conteudo a encripitar
  // ----------------------------------------------------------------------
  mEncripar  :=_INICIO_+ // prefixo
               FormatDateTime('dd/mm/yyyy',aData)+ // Data de ativação
               '|'+                                // Separado
               aTempoDias+                         // Quantidade de dias
               _FIM_;                              // Sufixo
  // ----------------------------------------------------------------------
  //
  // ----------------------------------------------------------------------
  Insert(mEncripar, mString, (length(mString) div 2) );
  Result := Copy(EncryptStr(mString, aChave  ),1,38);
end;

function ReverterChave(aValue : String; aChave : Integer) : String;
var
  mDecript : String;
begin
  Result := '';
  mDecript := DecryptStr(aValue, aChave);
  mDecript := ExtrairTexto(mDecript,_INICIO_,_FIM_);
  if mDecript.IsEmpty then
    mDecript :='0';
  Result := mDecript;
end;

function ExtrairTexto(const Str: string; const Delim1, Delim2: string): string;
var
  pos1, pos2: integer;
begin
  result := '';
  pos1 := Pos(Delim1, Str);
  if pos1 > 0 then begin
    pos2 := PosEx(Delim2, Str, pos1+1);
    if pos2 > 0 then
      result := Copy(Str, pos1 + 1, pos2 - pos1 - 1);
  end;
end;

function EncryptStr(const S :WideString; Key: Word): String;
var   i          :Integer;
      RStr       :RawByteString;
      RStrB      :TBytes Absolute RStr;
begin
  Result:= '';
  RStr:= UTF8Encode(S);
  for i := 0 to Length(RStr)-1 do begin
    RStrB[i] := RStrB[i] xor (Key shr 8);
    Key := (RStrB[i] + Key) * CKEY1 + CKEY2;
  end;
  for i := 0 to Length(RStr)-1 do begin
    Result:= Result + IntToHex(RStrB[i], 2);
  end;
end;

function DecryptStr(const S: String; Key: Word): String;
var   i, tmpKey  :Integer;
      RStr       :RawByteString;
      RStrB      :TBytes Absolute RStr;
      tmpStr     :string;
begin
  tmpStr:= UpperCase(S);
  SetLength(RStr, Length(tmpStr) div 2);
  i:= 1;
  try
    while (i < Length(tmpStr)) do begin
      RStrB[i div 2]:= StrToInt('$' + tmpStr[i] + tmpStr[i+1]);
      Inc(i, 2);
    end;
  except
    Result:= '';
    Exit;
  end;
  for i := 0 to Length(RStr)-1 do begin
    tmpKey:= RStrB[i];
    RStrB[i] := RStrB[i] xor (Key shr 8);
    Key := (tmpKey + Key) * CKEY1 + CKEY2;
  end;
  Result:= UTF8Decode(RStr);
end;

//function VerificarChave(aValue : String; Var aData : TDate; Out nDias : Integer) : Boolean;
function VerificarChave(aValue : String; var outData : TDate; var outDias : Integer) : Boolean;
var
  mDecodificar : String;
  mSequencia   : TStringDynArray;
  //mData,
  mDataLimite : TDate;
  //mDias : Integer;
  mPrazo : Extended;
  mChave : String;
begin
  Result := False;
  mChave := aValue;
  mDecodificar := ReverterChave(mChave, _CHAVESEGREDO);
  mSequencia   :=  mDecodificar.Split(['|']);
  outData := StrToDateDef(mSequencia[0],0);
  outDias := StrToIntDef(mSequencia[1],0);
  mDataLimite := outData + outDias;
  mPrazo := mDataLimite - Date();
  Result := ((outDias>0) and (mPrazo>0));
end;

end.
