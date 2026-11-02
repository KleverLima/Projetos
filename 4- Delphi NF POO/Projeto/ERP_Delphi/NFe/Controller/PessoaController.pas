unit PessoaController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti, Atributos,
  PessoaVO, Generics.Collections;

type
  TPessoaController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: Integer);
    class function Insere(pPessoa: TPessoaVO): Boolean;
    class function Altera(pPessoa, pPessoaOld: TPessoaVO): Boolean;
    class function Exclui(pId: Integer): Boolean;
    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
  end;

implementation

uses UDataModule, KGSLERPORM,
     PessoaFisicaVO, PessoaJuridicaVO, ContatoVO, EnderecoVO;

class procedure TPessoaController.Consulta(pFiltro: String; pPagina: Integer);
var
  Retorno: TObjectList<TPessoaVO>;
  i: Integer;
begin
  try
    try
      if Pos('ID=', pFiltro) > 0 then
        Retorno := KGSLERPORM.Consultar<TPessoaVO>(pFiltro, True, pPagina)
      else
        Retorno := KGSLERPORM.Consultar<TPessoaVO>(pFiltro, False, pPagina);
      if Assigned(Retorno) then
        PopulaGrid<TPessoaVO>(Retorno);
    finally
    end;
  except
    on E: Exception do
      Application.MessageBox(PChar('Ocorreu um erro durante a consulta. Informe a mensagem ao Administrador do sistema.' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
  end;
end;

class function TPessoaController.Insere(pPessoa: TPessoaVO): Boolean;
var
  UltimoID:Integer;
  Contato: TContatoVO;
  Endereco: TEnderecoVO;
  ContatosEnumerator: TEnumerator<TContatoVO>;
  EnderecosEnumerator: TEnumerator<TEnderecoVO>;
  TipoPessoa: string;
begin
  Result := False;
  try
    try
      TipoPessoa := pPessoa.Tipo;
      UltimoID := KGSLERPORM.Inserir(pPessoa);

      // Tipo de Pessoa
      if (TipoPessoa = 'F') and (Assigned(pPessoa.PessoaFisicaVO)) then
      begin
        pPessoa.PessoaFisicaVO.IdPessoa := UltimoID;
        KGSLERPORM.Inserir(pPessoa.PessoaFisicaVO);
      end
      else if (TipoPessoa = 'J') and (Assigned(pPessoa.PessoaJuridicaVO)) then
      begin
        pPessoa.PessoaJuridicaVO.IdPessoa := UltimoID;
        KGSLERPORM.Inserir(pPessoa.PessoaJuridicaVO);
      end;

      // Contatos
      ContatosEnumerator := pPessoa.ListaContatoVO.GetEnumerator;
      try
        with ContatosEnumerator do
        begin
          while MoveNext do
          begin
            Contato := Current;
            Contato.IdPessoa := UltimoID;
            KGSLERPORM.Inserir(Contato);
          end;
        end;
      finally
        ContatosEnumerator.Free;
      end;

      // Endereços
      EnderecosEnumerator := pPessoa.ListaEnderecoVO.GetEnumerator;
      try
        with EnderecosEnumerator do
        begin
          while MoveNext do
          begin
            Endereco := Current;
            Endereco.IdPessoa := UltimoID;
            KGSLERPORM.Inserir(Endereco);
          end;
        end;
      finally
        EnderecosEnumerator.Free;
      end;

      Consulta('ID = ' + IntToStr(UltimoID), 0);
      Result := True;
    finally
    end;
  except
    on E: Exception do
      Application.MessageBox(PChar('Ocorreu um erro na inclusão do registro. Informe a mensagem ao Administrador do sistema.' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
  end;
end;

class function TPessoaController.Altera(pPessoa, pPessoaOld: TPessoaVO): Boolean;
var
  ContatosEnumerator: TEnumerator<TContatoVO>;
  EnderecosEnumerator: TEnumerator<TEnderecoVO>;
  TipoPessoa: String;
begin
  try
    try
      Result := KGSLERPORM.Alterar(pPessoa, pPessoaOld);

      TipoPessoa := pPessoa.Tipo;

      // Tipo de Pessoa
      try
        if (TipoPessoa = 'F') and (Assigned(pPessoa.PessoaFisicaVO)) then
        begin
          if pPessoa.PessoaFisicaVO.Id > 0 then
            Result := KGSLERPORM.Alterar(pPessoa.PessoaFisicaVO, pPessoaOld.PessoaFisicaVO)
          else
            Result := KGSLERPORM.Inserir(pPessoa.PessoaFisicaVO) > 0;
        end
        else if (TipoPessoa = 'J') and (Assigned(pPessoa.PessoaJuridicaVO)) then
        begin
          if pPessoa.PessoaJuridicaVO.Id > 0 then
            Result := KGSLERPORM.Alterar(pPessoa.PessoaJuridicaVO, pPessoaOld.PessoaJuridicaVO)
          else
            Result := KGSLERPORM.Inserir(pPessoa.PessoaJuridicaVO) > 0;
        end;
      finally
      end;

      // Contatos
      try
        ContatosEnumerator := pPessoa.ListaContatoVO.GetEnumerator;
        with ContatosEnumerator do
        begin
          while MoveNext do
          begin
            if Current.Id > 0 then
              Result := KGSLERPORM.Alterar(Current)
            else
              Result := KGSLERPORM.Inserir(Current) > 0;
          end;
        end;
      finally
      end;

      // Endereços
      try
        EnderecosEnumerator := pPessoa.ListaEnderecoVO.GetEnumerator;
        with EnderecosEnumerator do
        begin
          while MoveNext do
          begin
            if Current.Id > 0 then
              Result := KGSLERPORM.Alterar(Current)
            else
              Result := KGSLERPORM.Inserir(Current) > 0;
          end;
        end;
      finally
      end;

    finally
    end;
  except
    on E: Exception do
      Application.MessageBox(PChar('Ocorreu um erro na inclusão do registro. Informe a mensagem ao Administrador do sistema.' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
  end;
end;

class function TPessoaController.Exclui(pId: Integer): Boolean;
var
  pPessoa: TPessoaVO;
begin
  pPessoa := TPessoaVO.Create;
  try
    pPessoa.Id := pId;
    Result := KGSLERPORM.Excluir(pPessoa);
  except
    on E: Exception do
      Application.MessageBox(PChar('Ocorreu um erro na exclusão do registro. Informe a mensagem ao Administrador do sistema.' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
  end;
end;

class function TPessoaController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TPessoaController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

end.
