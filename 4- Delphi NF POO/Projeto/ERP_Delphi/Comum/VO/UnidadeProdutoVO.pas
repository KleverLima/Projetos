unit UnidadeProdutoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('UNIDADE_PRODUTO')]
  TUnidadeProdutoVO = class(TVO)
  private
    FID: Integer;
    FSIGLA: String;
    FDESCRICAO: String;
    FPODE_FRACIONAR: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    property Id: Integer  read FID write FID;
    [TColumn('SIGLA','Sigla',[ldGrid, ldLookup, ldComboBox],False)]
    property Sigla: String  read FSIGLA write FSIGLA;
    [TColumn('DESCRICAO','Descrição',[ldGrid, ldLookup, ldComboBox],False)]
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    [TColumn('PODE_FRACIONAR','Pode Fracionar?',[ldGrid, ldLookup],False)]
    property PodeFracionar: String  read FPODE_FRACIONAR write FPODE_FRACIONAR;
  end;

implementation



end.
