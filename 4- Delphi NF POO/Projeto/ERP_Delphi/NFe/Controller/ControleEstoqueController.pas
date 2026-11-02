unit ControleEstoqueController;

interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, Controller, DBXJSON, DBXCommon,
  SWSystem;

type
  TControleEstoqueController = class(TController)
  protected
  public
    function AtualizarEstoque(pQuantidade: Extended; pIdProduto: Integer): TJSONArray;
  end;

implementation

uses
  KGSLERPORM;

function TControleEstoqueController.AtualizarEstoque(pQuantidade: Extended; pIdProduto: Integer): TJSONArray;
var
  ComandoSQL: String;
begin
  try
    try
      Result := TJSONArray.Create;

      //atualiza tabela PRODUTO
      ComandoSQL := 'update PRODUTO set QUANTIDADE_ESTOQUE = QUANTIDADE_ESTOQUE + ' + FloatToStr(pQuantidade) + ' where ID= ' + IntToStr(pIdProduto);
      KGSLERPORM.ComandoSQL(ComandoSQL);

      Result.AddElement(TJSONTrue.Create);
    except
      on E: Exception do
      begin
        result.AddElement(TJSONString.Create('ERRO'));
        result.AddElement(TJSONString.Create(E.Message));
      end;
    end;
  finally
  end;
end;

end.
