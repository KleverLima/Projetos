unit EnderecoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('ENDERECO')]
  TEnderecoVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FID_PESSOA: Integer;
    FLOGRADOURO: String;
    FNUMERO: String;
    FCOMPLEMENTO: String;
    FBAIRRO: String;
    FCIDADE: String;
    FCEP: String;
    FMUNICIPIO_IBGE: Integer;
    FUF: String;
    FFONE: String;
    FFAX: String;
    FPRINCIPAL: String;
    FENTREGA: String;
    FCOBRANCA: String;
    FCORRESPONDENCIA: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_EMPRESA','Id Empresa',[ldGrid, ldLookup],False)]
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    [TColumn('ID_PESSOA','Id Pessoa',[ldGrid, ldLookup],False)]
    property IdPessoa: Integer  read FID_PESSOA write FID_PESSOA;
    [TColumn('LOGRADOURO','Logradouro',[ldGrid, ldLookup],False)]
    property Logradouro: String  read FLOGRADOURO write FLOGRADOURO;
    [TColumn('NUMERO','Número',[ldGrid, ldLookup],False)]
    property Numero: String  read FNUMERO write FNUMERO;
    [TColumn('COMPLEMENTO','Complemento',[ldGrid, ldLookup],False)]
    property Complemento: String  read FCOMPLEMENTO write FCOMPLEMENTO;
    [TColumn('BAIRRO','Bairro',[ldGrid, ldLookup],False)]
    property Bairro: String  read FBAIRRO write FBAIRRO;
    [TColumn('CIDADE','Cidade',[ldGrid, ldLookup],False)]
    property Cidade: String  read FCIDADE write FCIDADE;
    [TColumn('CEP','Cep',[ldGrid, ldLookup],False)]
    property Cep: String  read FCEP write FCEP;
    [TColumn('MUNICIPIO_IBGE','Município Ibge',[ldGrid, ldLookup],False)]
    property MunicipioIbge: Integer  read FMUNICIPIO_IBGE write FMUNICIPIO_IBGE;
    [TColumn('UF','Uf',[ldGrid, ldLookup],False)]
    property Uf: String  read FUF write FUF;
    [TColumn('FONE','Telefone',[ldGrid, ldLookup],False)]
    property Fone: String  read FFONE write FFONE;
    [TColumn('FAX','Fax',[ldGrid, ldLookup],False)]
    property Fax: String  read FFAX write FFAX;
    [TColumn('PRINCIPAL','Principal',[ldGrid, ldLookup],False)]
    property Principal: String  read FPRINCIPAL write FPRINCIPAL;
    [TColumn('ENTREGA','Entrega',[ldGrid, ldLookup],False)]
    property Entrega: String  read FENTREGA write FENTREGA;
    [TColumn('COBRANCA','Cobrança',[ldGrid, ldLookup],False)]
    property Cobranca: String  read FCOBRANCA write FCOBRANCA;
    [TColumn('CORRESPONDENCIA','Correspondência',[ldGrid, ldLookup],False)]
    property Correspondencia: String  read FCORRESPONDENCIA write FCORRESPONDENCIA;

  end;

implementation



end.
