unit ViewTributacaoIcmsController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB, Windows, Forms, Controller, Rtti, Atributos,
  ViewTributacaoIcmsVO, Generics.Collections;


type
  TViewTributacaoIcmsController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: Integer);
    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
  end;

implementation

uses UDataModule, KGSLERPORM;

class procedure TViewTributacaoIcmsController.Consulta(pFiltro: String; pPagina: Integer);
var
  Retorno: TObjectList<TViewTributacaoIcmsVO>;
begin
  try
    try
      if Pos('ID=', pFiltro) > 0 then
        Retorno := KGSLERPORM.Consultar<TViewTributacaoIcmsVO>(pFiltro, True, pPagina)
      else
        Retorno := KGSLERPORM.Consultar<TViewTributacaoIcmsVO>(pFiltro, False, pPagina);
      if Assigned(Retorno) then
        PopulaGrid<TViewTributacaoIcmsVO>(Retorno);
    finally
    end;
  except
    on E: Exception do
      Application.MessageBox(PChar('Ocorreu um erro durante a consulta. Informe a mensagem ao Administrador do sistema.' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
  end;
end;

class function TViewTributacaoIcmsController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TViewTributacaoIcmsController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

end.
