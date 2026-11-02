unit CepVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('CEP')]
  TCepVO = class(TVO)
  private
    FID: Integer;
    FCEP: String;
    FLOGRADOURO: String;
    FCOMPLEMENTO: String;
    FBAIRRO: String;
    FMUNICIPIO: String;
    FUF: String;
    FCODIGO_IBGE_MUNICIPIO: Integer;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    property Id: Integer  read FID write FID;
    [TColumn('CEP','Cep',64,[ldGrid, ldLookup, ldComboBox], False)]
    property Cep: String  read FCEP write FCEP;
    [TColumn('LOGRADOURO','Logradouro',450,[ldGrid, ldLookup, ldComboBox], False)]
    property Logradouro: String  read FLOGRADOURO write FLOGRADOURO;
    [TColumn('COMPLEMENTO','Complemento',450,[ldGrid, ldLookup], False)]
    property Complemento: String  read FCOMPLEMENTO write FCOMPLEMENTO;
    [TColumn('BAIRRO','Bairro',450,[ldGrid, ldLookup], False)]
    property Bairro: String  read FBAIRRO write FBAIRRO;
    [TColumn('MUNICIPIO','Município',450,[ldGrid, ldLookup, ldComboBox], False)]
    property Municipio: String  read FMUNICIPIO write FMUNICIPIO;
    [TColumn('UF','Uf',16,[ldGrid, ldLookup], False)]
    property Uf: String  read FUF write FUF;
    [TColumn('CODIGO_IBGE_MUNICIPIO','Codigo Ibge Municipio',80,[ldGrid, ldLookup, ldComboBox], False)]
    property CodigoIbgeMunicipio: Integer  read FCODIGO_IBGE_MUNICIPIO write FCODIGO_IBGE_MUNICIPIO;

  end;

implementation



end.
