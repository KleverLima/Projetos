unit ViewSessaoEmpresaVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('VIEW_SESSAO_EMPRESA')]
  TViewSessaoEmpresaVO = class(TVO)
  private
    FID_EMPRESA: Integer;
    FID_PESSOA: Integer;
    FRAZAO_SOCIAL: String;

  public 
    [TColumn('ID_EMPRESA','Id Empresa',80,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    [TColumn('ID_PESSOA','Id Pessoa',80,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdPessoa: Integer  read FID_PESSOA write FID_PESSOA;
    [TColumn('RAZAO_SOCIAL','Razao Social',450,[ldGrid, ldLookup, ldCombobox], False)]
    property RazaoSocial: String  read FRAZAO_SOCIAL write FRAZAO_SOCIAL;

  end;

implementation



end.
