unit NfeProcessoReferenciadoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_PROCESSO_REFERENCIADO')]
  TNfeProcessoReferenciadoVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_CABECALHO: Integer;
    FIDENTIFICADOR: String;
    FORIGEM: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_CABECALHO','Id Nfe Cabecalho',80,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeCabecalho: Integer  read FID_NFE_CABECALHO write FID_NFE_CABECALHO;
    [TColumn('IDENTIFICADOR','Identificador',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Identificador: String  read FIDENTIFICADOR write FIDENTIFICADOR;
    [TColumn('ORIGEM','Origem',8,[ldGrid, ldLookup, ldCombobox], False)]
    property Origem: String  read FORIGEM write FORIGEM;

  end;

implementation



end.
