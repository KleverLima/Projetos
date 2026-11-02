unit ViewTributacaoIpiController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB, Windows, Forms, Controller, Rtti, Atributos,
  ViewTributacaoIpiVO, Generics.Collections;


type
  TViewTributacaoIpiController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: Integer);
    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
  end;

implementation

uses UDataModule, KGSLERPORM;

class procedure TViewTributacaoIpiController.Consulta(pFiltro: String; pPagina: Integer);
var
  Retorno: TObjectList<TViewTributacaoIpiVO>;
begin
  try
    try
      if Pos('ID=', pFiltro) > 0 then
        Retorno := KGSLERPORM.Consultar<TViewTributacaoIpiVO>(pFiltro, True, pPagina)
      else
        Retorno := KGSLERPORM.Consultar<TViewTributacaoIpiVO>(pFiltro, False, pPagina);
      if Assigned(Retorno) then
        PopulaGrid<TViewTributacaoIpiVO>(Retorno);
    finally
    end;
  except
    on E: Exception do
      Application.MessageBox(PChar('Ocorreu um erro durante a consulta. Informe a mensagem ao Administrador do sistema.' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
  end;
end;

class function TViewTributacaoIpiController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TViewTributacaoIpiController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

end.
