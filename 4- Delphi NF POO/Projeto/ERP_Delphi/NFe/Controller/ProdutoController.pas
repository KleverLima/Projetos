unit ProdutoController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, ProdutoVO, Generics.Collections;

type
  TProdutoController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: Integer);
    class function Insere(pProduto: TProdutoVO): Boolean;
    class function Altera(pProduto, pProdutoOld: TProdutoVO): Boolean;
    class function Exclui(pId: Integer): Boolean;
    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
  end;

implementation

uses UDataModule, Conversor, KGSLERPORM,
     //
     UnidadeProdutoVO, AlmoxarifadoVO, TributIcmsCustomCabVO, TributGrupoTributarioVO,
     ProdutoMarcaVO, ProdutoSubGrupoVO;

class procedure TProdutoController.Consulta(pFiltro: String; pPagina: Integer);
var
  Retorno: TObjectList<TProdutoVO>;
  i: Integer;
begin
  try
    try
      if Pos('ID=', pFiltro) > 0 then
        Retorno := KGSLERPORM.Consultar<TProdutoVO>(pFiltro, True, pPagina)
      else
        Retorno := KGSLERPORM.Consultar<TProdutoVO>(pFiltro, False, pPagina);

      // Campos Transientes
      for i := 0 to Retorno.Count - 1 do
      begin
        // Unidade
        if TProdutoVO(Retorno.Items[i]).IdUnidade > 0 then
        begin
          TProdutoVO(Retorno.Items[i]).UnidadeProdutoVO := KGSLERPORM.ConsultarUmObjeto<TUnidadeProdutoVO>('ID=' + IntToStr(TProdutoVO(Retorno.Items[i]).IdUnidade), False);
          if Assigned(TProdutoVO(Retorno.Items[i]).UnidadeProdutoVO) then
            TProdutoVO(Retorno.Items[i]).UnidadeProdutoSigla := TProdutoVO(Retorno.Items[i]).UnidadeProdutoVO.Sigla;
        end;

        // Almoxarifado
        if TProdutoVO(Retorno.Items[i]).IdAlmoxarifado > 0 then
        begin
          TProdutoVO(Retorno.Items[i]).AlmoxarifadoVO := KGSLERPORM.ConsultarUmObjeto<TAlmoxarifadoVO>('ID=' + IntToStr(TProdutoVO(Retorno.Items[i]).IdAlmoxarifado), False);
          if Assigned(TProdutoVO(Retorno.Items[i]).AlmoxarifadoVO) then
            TProdutoVO(Retorno.Items[i]).AlmoxarifadoNome := TProdutoVO(Retorno.Items[i]).AlmoxarifadoVO.Nome;
        end;

        // ICMS Customizado
        if TProdutoVO(Retorno.Items[i]).IdIcmsCustomizado > 0 then
        begin
          TProdutoVO(Retorno.Items[i]).TributIcmsCustomCabVO := KGSLERPORM.ConsultarUmObjeto<TTributIcmsCustomCabVO>('ID=' + IntToStr(TProdutoVO(Retorno.Items[i]).IdIcmsCustomizado), False);
          if Assigned(TProdutoVO(Retorno.Items[i]).TributIcmsCustomCabVO) then
            TProdutoVO(Retorno.Items[i]).TributIcmsCustomCabDescricao := TProdutoVO(Retorno.Items[i]).TributIcmsCustomCabVO.Descricao;
        end;

        // Grupo Tributário
        if TProdutoVO(Retorno.Items[i]).IdGrupoTributario > 0 then
        begin
          TProdutoVO(Retorno.Items[i]).GrupoTributarioVO := KGSLERPORM.ConsultarUmObjeto<TTributGrupoTributarioVO>('ID=' + IntToStr(TProdutoVO(Retorno.Items[i]).IdGrupoTributario), False);
          if Assigned(TProdutoVO(Retorno.Items[i]).GrupoTributarioVO) then
            TProdutoVO(Retorno.Items[i]).TributGrupoTributarioDescricao := TProdutoVO(Retorno.Items[i]).GrupoTributarioVO.Descricao;
        end;

        // Marca
        if TProdutoVO(Retorno.Items[i]).IdProdutoMarca > 0 then
        begin
          TProdutoVO(Retorno.Items[i]).ProdutoMarcaVO := KGSLERPORM.ConsultarUmObjeto<TProdutoMarcaVO>('ID=' + IntToStr(TProdutoVO(Retorno.Items[i]).IdProdutoMarca), False);
          if Assigned(TProdutoVO(Retorno.Items[i]).ProdutoMarcaVO) then
            TProdutoVO(Retorno.Items[i]).ProdutoMarcaNome := TProdutoVO(Retorno.Items[i]).ProdutoMarcaVO.Nome;
        end;

        // SubGrupo
        if TProdutoVO(Retorno.Items[i]).IdSubGrupo > 0 then
        begin
          TProdutoVO(Retorno.Items[i]).ProdutoSubGrupoVO := KGSLERPORM.ConsultarUmObjeto<TProdutoSubGrupoVO>('ID=' + IntToStr(TProdutoVO(Retorno.Items[i]).IdSubGrupo), True);
          if Assigned(TProdutoVO(Retorno.Items[i]).ProdutoSubGrupoVO) then
          begin
            TProdutoVO(Retorno.Items[i]).ProdutoSubGrupoNome := TProdutoVO(Retorno.Items[i]).ProdutoSubGrupoVO.Nome;
            TProdutoVO(Retorno.Items[i]).ProdutoGrupoNome := TProdutoVO(Retorno.Items[i]).ProdutoSubGrupoVO.ProdutoGrupoVO.Nome;
          end;
        end;
      end;

      if Assigned(Retorno) then
        PopulaGrid<TProdutoVO>(Retorno);
    finally
    end;
  except
    on E: Exception do
      Application.MessageBox(PChar('Ocorreu um erro durante a consulta. Informe a mensagem ao Administrador do sistema.' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
  end;
end;

class function TProdutoController.Insere(pProduto: TProdutoVO): Boolean;
var
  UltimoID:Integer;
begin
  Result := False;
  try
    try
      UltimoID := KGSLERPORM.Inserir(pProduto);
      Consulta('ID = ' + IntToStr(UltimoID), 0);
      Result := True;
    finally
    end;
  except
    on E: Exception do
      Application.MessageBox(PChar('Ocorreu um erro na inclusão do registro. Informe a mensagem ao Administrador do sistema.' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
  end;
end;

class function TProdutoController.Altera(pProduto, pProdutoOld: TProdutoVO): Boolean;
begin
  try
    try
      Result := KGSLERPORM.Alterar(pProduto, pProdutoOld);
    finally
    end;
  except
    on E: Exception do
      Application.MessageBox(PChar('Ocorreu um erro na inclusão do registro. Informe a mensagem ao Administrador do sistema.' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
  end;
end;

class function TProdutoController.Exclui(pId: Integer): Boolean;
var
  objProduto: TProdutoVO;
begin
  objProduto := TProdutoVO.Create;
  try
    objProduto.Id := pId;
    Result := KGSLERPORM.Excluir(objProduto);
  except
    on E: Exception do
      Application.MessageBox(PChar('Ocorreu um erro na exclusão do registro. Informe a mensagem ao Administrador do sistema.' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
  end;
end;

class function TProdutoController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TProdutoController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

end.
