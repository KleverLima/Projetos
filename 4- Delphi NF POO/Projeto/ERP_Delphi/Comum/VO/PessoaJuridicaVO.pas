unit PessoaJuridicaVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('PESSOA_JURIDICA')]
  TPessoaJuridicaVO = class(TVO)
  private
    FID: Integer;
    FID_PESSOA: Integer;
    FCNPJ: String;
    FFANTASIA: String;
    FINSCRICAO_MUNICIPAL: String;
    FINSCRICAO_ESTADUAL: String;
    FDATA_CONSTITUICAO: TDateTime;
    FTIPO_REGIME: String;
    FCRT: String;
    FSUFRAMA: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_PESSOA','Id Pessoa',[ldGrid, ldLookup],False)]
    property IdPessoa: Integer  read FID_PESSOA write FID_PESSOA;
    [TColumn('CNPJ','Cnpj',[ldGrid, ldLookup],False)]
    property Cnpj: String  read FCNPJ write FCNPJ;
    [TColumn('FANTASIA','Fantasia',[ldGrid, ldLookup],False)]
    property Fantasia: String  read FFANTASIA write FFANTASIA;
    [TColumn('INSCRICAO_MUNICIPAL','Inscrição Municipal',[ldGrid, ldLookup],False)]
    property InscricaoMunicipal: String  read FINSCRICAO_MUNICIPAL write FINSCRICAO_MUNICIPAL;
    [TColumn('INSCRICAO_ESTADUAL','Inscrição Estadual',[ldGrid, ldLookup],False)]
    property InscricaoEstadual: String  read FINSCRICAO_ESTADUAL write FINSCRICAO_ESTADUAL;
    [TColumn('DATA_CONSTITUICAO','Data Constituição',[ldGrid, ldLookup],False)]
    property DataConstituicao: TDateTime  read FDATA_CONSTITUICAO write FDATA_CONSTITUICAO;
    [TColumn('TIPO_REGIME','Tipo Regime',[ldGrid, ldLookup],False)]
    property TipoRegime: String  read FTIPO_REGIME write FTIPO_REGIME;
    [TColumn('CRT','Crt',[ldGrid, ldLookup],False)]
    property Crt: String  read FCRT write FCRT;
    [TColumn('SUFRAMA','Suframa',[ldGrid, ldLookup],False)]
    property Suframa: String  read FSUFRAMA write FSUFRAMA;

  end;

implementation

{ TPessoaJuridicaVO }

end.
