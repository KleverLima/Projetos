unit PaisVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('PAIS')]
  TPaisVO = class(TVO)
  private
    FID: Integer;
    FCODIGO: Integer;
    FNOME_EN: String;
    FNOME_PTBR: String;
    FSIGLA2: String;
    FSIGLA3: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter('000',taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('CODIGO','Código',[ldGrid, ldLookup, ldComboBox],False)]
    property Codigo: Integer  read FCODIGO write FCODIGO;
    [TColumn('NOME_PTBR','Nome',[ldGrid, ldLookup, ldComboBox],False)]
    property NomePtbr: String  read FNOME_PTBR write FNOME_PTBR;
    [TColumn('NOME_EN','Nome Inglês',400,[ldGrid],False)]
    property NomeEn: String  read FNOME_EN write FNOME_EN;
    [TColumn('SIGLA2','Sigla',45,[ldGrid, ldLookup],False)]
    [TFormatter(taCenter)]
    property Sigla2: String  read FSIGLA2 write FSIGLA2;
    [TColumn('SIGLA3')]
    property Sigla3: String  read FSIGLA3 write FSIGLA3;

  end;

implementation



end.
