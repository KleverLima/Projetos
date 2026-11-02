unit UsuarioController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB, Biblioteca,
  Windows, Forms, Controller, Rtti, Atributos, UsuarioVO, Generics.Collections;

type
  TUsuarioController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class function Usuario(pLogin, pSenha: string): TUsuarioVO; overload;
    class procedure Consulta(pFiltro: String; pPagina: Integer);
    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class function CriptografarLoginSenha(pLogin, pSenha: string): string;
  end;

implementation

uses UDataModule, Conversor, KGSLERPORM;

class procedure TUsuarioController.Consulta(pFiltro: String; pPagina: Integer);
var
  Retorno: TObjectList<TUsuarioVO>;
begin
  try
    try
      if Pos('ID=', pFiltro) > 0 then
        Retorno := KGSLERPORM.Consultar<TUsuarioVO>(pFiltro, True, pPagina)
      else
        Retorno := KGSLERPORM.Consultar<TUsuarioVO>(pFiltro, False, pPagina);
      if Assigned(Retorno) then
        PopulaGrid<TUsuarioVO>(Retorno);
    finally
    end;
  except
    on E: Exception do
      Application.MessageBox(PChar('Ocorreu um erro durante a consulta. Informe a mensagem ao Administrador do sistema.' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
  end;
end;

class function TUsuarioController.Usuario(pLogin, pSenha: string): TUsuarioVO;
var
  Filtro: string;
begin
  Result := nil;
  try
    try
      Filtro := 'LOGIN = '+QuotedStr(pLogin)+' AND SENHA = '+QuotedStr(CriptografarLoginSenha(pLogin,pSenha));
      Result := KGSLERPORM.ConsultarUmObjeto<TUsuarioVO>(Filtro, True)
    finally
    end;
  except
    on E: Exception do
      Application.MessageBox(PChar('Ocorreu um erro durante a consulta. Informe a mensagem ao Administrador do sistema.' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
  end;
end;

class function TUsuarioController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TUsuarioController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class function TUsuarioController.CriptografarLoginSenha(pLogin, pSenha: string): string;
begin
  Result := MD5String(pLogin+pSenha);
end;

end.

