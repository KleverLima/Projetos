unit UfVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, PaisVO;

type
  [TEntity]
  [TTable('UF')]
  TUfVO = class(TVO)
  private
    FID: Integer;
    FID_PAIS: Integer;
    FSIGLA: String;
    FNOME: String;
    FCODIGO_IBGE: Integer;

    FPaisNomePtbr: String;
    FPaisVO: TPaisVO;

  public

    destructor Destroy; override;

    [TId('ID')]
    [TGeneratedValue(sAuto)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_PAIS','Id País',[ldGrid,ldLookup],False)]
    property IdPais: Integer  read FID_PAIS write FID_PAIS;
    [TColumn('PAIS','Pais',350,[ldGrid,ldLookup],True,'PAIS','ID_PAIS','ID')]
    property PaisNomePtbr: string read FPaisNomePtbr write FPaisNomePtbr;

    [TColumn('SIGLA','Sigla',35,[ldGrid,ldLookup, ldComboBox],False)]
    property Sigla: String  read FSIGLA write FSIGLA;
    [TColumn('NOME','Nome',[ldGrid,ldLookup, ldComboBox],False)]
    property Nome: String  read FNOME write FNOME;
    [TColumn('CODIGO_IBGE','Código Ibge',[ldGrid,ldLookup],False)]
    property CodigoIbge: Integer  read FCODIGO_IBGE write FCODIGO_IBGE;

    [TAssociation(False,'ID','ID_PAIS','PAIS')]
    property PaisVO: TPaisVO read FPaisVO write FPaisVO;


  end;

implementation

destructor TUfVO.Destroy;
begin
  if Assigned(FPaisVO) then
    FPaisVO.Free;
  inherited;
end;


end.
