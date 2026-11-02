unit ColaboradorController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB, Windows, Forms, Controller, Rtti, Atributos,
  ColaboradorVO, Generics.Collections;


type
  TColaboradorController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: Integer);
    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
  end;

implementation

uses UDataModule, KGSLERP;

class procedure TColaboradorController.Consulta(pFiltro: String; pPagina: Integer);
var
  Retorno: TObjectList<TColaboradorVO>;
begin
  try
    try
      if Pos('ID=', pFiltro) > 0 then
        Retorno := KGSLERP.Consultar<TColaboradorVO>(pFiltro, True, pPagina)
      else
        Retorno := KGSLERP.Consultar<TColaboradorVO>(pFiltro, False, pPagina);
      if Assigned(Retorno) then
        PopulaGrid<TColaboradorVO>(Retorno);
    finally
    end;
  except
    on E: Exception do
      Application.MessageBox(PChar('Ocorreu um erro durante a consulta. Informe a mensagem ao Administrador do sistema.' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
  end;
end;

class function TColaboradorController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TColaboradorController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

end.
