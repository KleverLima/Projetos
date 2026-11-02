unit NfeProdRuralReferenciadaVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_PROD_RURAL_REFERENCIADA')]
  TNfeProdRuralReferenciadaVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_CABECALHO: Integer;
    FCODIGO_UF: Integer;
    FANO_MES: String;
    FCNPJ: String;
    FCPF: String;
    FINSCRICAO_ESTADUAL: String;
    FMODELO: String;
    FSERIE: String;
    FNUMERO_NF: String;

  public
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_CABECALHO','Id Nfe Referenciada',80,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeCabecalho: Integer  read FID_NFE_CABECALHO write FID_NFE_CABECALHO;
    [TColumn('CODIGO_UF','Codigo Uf',16,[ldGrid, ldLookup, ldCombobox], False)]
    property CodigoUf: Integer  read FCODIGO_UF write FCODIGO_UF;
    [TColumn('ANO_MES','Ano Mes',32,[ldGrid, ldLookup, ldCombobox], False)]
    property AnoMes: String  read FANO_MES write FANO_MES;
    [TColumn('CNPJ','Cnpj',112,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftCnpj, taLeftJustify)]
    property Cnpj: String  read FCNPJ write FCNPJ;
    [TColumn('CPF','Cpf',88,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftCpf, taLeftJustify)]
    property Cpf: String  read FCPF write FCPF;
    [TColumn('INSCRICAO_ESTADUAL','Inscricao Estadual',112,[ldGrid, ldLookup, ldCombobox], False)]
    property InscricaoEstadual: String  read FINSCRICAO_ESTADUAL write FINSCRICAO_ESTADUAL;
    [TColumn('MODELO','Modelo',16,[ldGrid, ldLookup, ldCombobox], False)]
    property Modelo: String  read FMODELO write FMODELO;
    [TColumn('SERIE','Serie',24,[ldGrid, ldLookup, ldCombobox], False)]
    property Serie: String  read FSERIE write FSERIE;
    [TColumn('NUMERO_NF','Numero Nf',72,[ldGrid, ldLookup, ldCombobox], False)]
    property NumeroNf: String  read FNUMERO_NF write FNUMERO_NF;

  end;

implementation



end.
