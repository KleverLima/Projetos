unit PapelVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('PAPEL')]
  TPapelVO = class(TVO)
  private
    FID: Integer;
    FNOME: String;
    FDESCRICAO: String;
    FACESSO_COMPLETO: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('NOME','Nome',160,[ldGrid, ldLookup, ldCombobox], False)]
    property Nome: String  read FNOME write FNOME;
    [TColumn('DESCRICAO','Descricao',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    [TColumn('ACESSO_COMPLETO','Acesso Completo',8,[ldGrid, ldLookup, ldCombobox], False)]
    property AcessoCompleto: String  read FACESSO_COMPLETO write FACESSO_COMPLETO;

  end;

implementation



end.
