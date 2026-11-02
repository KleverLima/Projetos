unit NfeDeclaracaoImportacaoController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB, Windows, Forms, Controller, Rtti, Atributos,
  NfeDeclaracaoImportacaoVO, Generics.Collections;


type
  TNfeDeclaracaoImportacaoController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: Integer);
    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
  end;

implementation

uses UDataModule, KGSLERPORM;

class procedure TNfeDeclaracaoImportacaoController.Consulta(pFiltro: String; pPagina: Integer);
var
  Retorno: TObjectList<TNfeDeclaracaoImportacaoVO>;
begin
  try
    try
      if Pos('ID=', pFiltro) > 0 then
        Retorno := KGSLERPORM.Consultar<TNfeDeclaracaoImportacaoVO>(pFiltro, True, pPagina)
      else
        Retorno := KGSLERPORM.Consultar<TNfeDeclaracaoImportacaoVO>(pFiltro, False, pPagina);
      if Assigned(Retorno) then
        PopulaGrid<TNfeDeclaracaoImportacaoVO>(Retorno);
    finally
    end;
  except
    on E: Exception do
      Application.MessageBox(PChar('Ocorreu um erro durante a consulta. Informe a mensagem ao Administrador do sistema.' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
  end;
end;

class function TNfeDeclaracaoImportacaoController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TNfeDeclaracaoImportacaoController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

end.
