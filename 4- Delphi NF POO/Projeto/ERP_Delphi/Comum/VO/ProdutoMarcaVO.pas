unit ProdutoMarcaVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('PRODUTO_MARCA')]
  TProdutoMarcaVO = class(TVO)
  private
    FID: Integer;
    FNOME: String;
    FDESCRICAO: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    property Id: Integer  read FID write FID;
    [TColumn('NOME','Nome',[ldGrid, ldLookup, ldComboBox],False)]
    property Nome: String  read FNOME write FNOME;
    [TColumn('DESCRICAO','Descrição',[ldGrid, ldLookup, ldComboBox],False)]
    property Descricao: String  read FDESCRICAO write FDESCRICAO;

  end;

implementation



end.
