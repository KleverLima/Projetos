unit SituacaoColaboradorVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('SITUACAO_COLABORADOR')]
  TSituacaoColaboradorVO = class(TVO)
  private
    FID: Integer;
    FCODIGO: String;
    FNOME: String;
    FDESCRICAO: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter('0000', taCenter)]
    property Id: Integer  read FID write FID;

    [TColumn('CODIGO','Código',35,[ldGrid, ldLookup, ldComboBox], False)]
    property Codigo: String  read FCODIGO write FCODIGO;
    [TColumn('NOME','Nome',450,[ldGrid, ldLookup, ldComboBox], False)]
    property Nome: String  read FNOME write FNOME;
    [TColumn('DESCRICAO','Descrição',450,[ldGrid, ldLookup], False)]
    property Descricao: String  read FDESCRICAO write FDESCRICAO;

  end;

implementation



end.
