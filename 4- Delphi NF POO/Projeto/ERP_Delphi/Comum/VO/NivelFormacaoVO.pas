unit NivelFormacaoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NIVEL_FORMACAO')]
  TNivelFormacaoVO = class(TVO)
  private
    FID: Integer;
    FNOME: String;
    FDESCRICAO: String;
    FGRAU_INSTRUCAO_CAGED: Integer;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter('0000',taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('NOME','Nome',160,[ldGrid, ldLookup, ldComboBox], False)]
    property Nome: String  read FNOME write FNOME;
    [TColumn('DESCRICAO','Descrição',650,[ldGrid, ldLookup], False)]
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    [TColumn('GRAU_INSTRUCAO_CAGED','Grau Instrução Caged',80,[ldGrid, ldLookup], False)]
    property GrauInstrucaoCaged: Integer  read FGRAU_INSTRUCAO_CAGED write FGRAU_INSTRUCAO_CAGED;

  end;

implementation



end.
