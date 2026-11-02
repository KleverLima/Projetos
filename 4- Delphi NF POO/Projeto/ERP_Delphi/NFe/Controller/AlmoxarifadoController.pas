unit AlmoxarifadoController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB, Windows, Forms, Controller, Rtti, Atributos,
  AlmoxarifadoVO, Generics.Collections;


type
  TAlmoxarifadoController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: Integer);
    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
  end;

implementation

uses UDataModule, KGSLERPORM;

class procedure TAlmoxarifadoController.Consulta(pFiltro: String; pPagina: Integer);
var
  Retorno: TObjectList<TAlmoxarifadoVO>;
begin
  try
    try
      if Pos('ID=', pFiltro) > 0 then
        Retorno := KGSLERPORM.Consultar<TAlmoxarifadoVO>(pFiltro, True, pPagina)
      else
        Retorno := KGSLERPORM.Consultar<TAlmoxarifadoVO>(pFiltro, False, pPagina);
      if Assigned(Retorno) then
        PopulaGrid<TAlmoxarifadoVO>(Retorno);
    finally
    end;
  except
    on E: Exception do
      Application.MessageBox(PChar('Ocorreu um erro durante a consulta. Informe a mensagem ao Administrador do sistema.' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
  end;
end;

class function TAlmoxarifadoController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TAlmoxarifadoController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

end.
