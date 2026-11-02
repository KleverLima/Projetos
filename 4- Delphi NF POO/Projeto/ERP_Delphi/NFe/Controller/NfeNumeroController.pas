unit NfeNumeroController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB, Windows, Forms, Controller, Rtti, Atributos,
  NfeNumeroVO, Generics.Collections;


type
  TNfeNumeroController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: Integer); overload;
    class function Consulta: TNfeNumeroVO; overload;
    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
  end;

implementation

uses UDataModule, KGSLERPORM;

class function TNfeNumeroController.Consulta: TNfeNumeroVO;
var
  SQL: string;
  UltimoID: Integer;
  objNfeNumero: TNfeNumeroVO;
begin
  try
    try
      //Verifica se a tabela está vazia
      if KGSLERPORM.SelectMax('NFE_NUMERO', '1=1') = -1 then
      begin
        objNfeNumero := TNfeNumeroVO.Create;
        objNfeNumero.Serie := '001';
        objNfeNumero.Numero := 1;
        objNfeNumero.IdEmpresa := 1;
        UltimoID := KGSLERPORM.Inserir(objNfeNumero);
        Result := KGSLERPORM.ConsultarUmObjeto<TNfeNumeroVO>('ID=' + IntToStr(UltimoID), False);
      end
      else
      begin
        SQL := 'update NFE_NUMERO set NUMERO = NUMERO + 1';
        KGSLERPORM.ComandoSQL(SQL);
        Result := KGSLERPORM.ConsultarUmObjeto<TNfeNumeroVO>('', False);
      end;
    finally
    end;
  except
    on E: Exception do
      Application.MessageBox(PChar('Ocorreu um erro durante a consulta. Informe a mensagem ao Administrador do sistema.' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
  end;
end;

class procedure TNfeNumeroController.Consulta(pFiltro: String; pPagina: Integer);
var
  Retorno: TObjectList<TNfeNumeroVO>;
begin
  try
    try
      if Pos('ID=', pFiltro) > 0 then
        Retorno := KGSLERPORM.Consultar<TNfeNumeroVO>(pFiltro, True, pPagina)
      else
        Retorno := KGSLERPORM.Consultar<TNfeNumeroVO>(pFiltro, False, pPagina);
      if Assigned(Retorno) then
        PopulaGrid<TNfeNumeroVO>(Retorno);
    finally
    end;
  except
    on E: Exception do
      Application.MessageBox(PChar('Ocorreu um erro durante a consulta. Informe a mensagem ao Administrador do sistema.' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
  end;
end;

class function TNfeNumeroController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TNfeNumeroController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

end.
