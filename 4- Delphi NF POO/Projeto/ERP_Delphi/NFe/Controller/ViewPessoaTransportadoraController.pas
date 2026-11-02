unit ViewPessoaTransportadoraController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB, Windows, Forms, Controller, Rtti, Atributos,
  ViewPessoaTransportadoraVO, Generics.Collections;


type
  TViewPessoaTransportadoraController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: Integer);
    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
  end;

implementation

uses UDataModule, KGSLERPORM;

class procedure TViewPessoaTransportadoraController.Consulta(pFiltro: String; pPagina: Integer);
var
  Retorno: TObjectList<TViewPessoaTransportadoraVO>;
begin
  try
    try
      if Pos('ID=', pFiltro) > 0 then
        Retorno := KGSLERPORM.Consultar<TViewPessoaTransportadoraVO>(pFiltro, True, pPagina)
      else
        Retorno := KGSLERPORM.Consultar<TViewPessoaTransportadoraVO>(pFiltro, False, pPagina);
      if Assigned(Retorno) then
        PopulaGrid<TViewPessoaTransportadoraVO>(Retorno);
    finally
    end;
  except
    on E: Exception do
      Application.MessageBox(PChar('Ocorreu um erro durante a consulta. Informe a mensagem ao Administrador do sistema.' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
  end;
end;

class function TViewPessoaTransportadoraController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TViewPessoaTransportadoraController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

end.
