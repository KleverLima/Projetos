unit ColaboradorPessoaVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections,
  SysUtils, PessoaFisicaJuridicaVO;

type
  [TEntity]
  [TTable('COLABORADOR')]
  TColaboradorVO = class(TVO)
  private
    FID: Integer;
    FID_PESSOA: Integer;
    FMATRICULA: String;
    FDATA_CADASTRO: TDateTime;
    FDATA_ADMISSAO: TDateTime;
    FDATA_DEMISSAO: TDateTime;
    FPIS_NUMERO: String;

    FPessoaNome: String;
    FPessoaVO: TPessoaVO;

  public
    destructor Destroy; override;

    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;

    [TColumn('ID_PESSOA','Id Pessoa',80,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdPessoa: Integer  read FID_PESSOA write FID_PESSOA;
    [TColumn('PESSOA.NOME', 'Nome', 250, [ldGrid, ldLookup, ldComboBox], True, 'PESSOA', 'ID_PESSOA', 'ID')]
    property PessoaNome: String read FPessoaNome write FPessoaNome;

    [TColumn('MATRICULA','Matricula',80,[ldGrid, ldLookup, ldCombobox], False)]
    property Matricula: String  read FMATRICULA write FMATRICULA;
    [TColumn('DATA_CADASTRO','Data Cadastro',80,[ldGrid, ldLookup, ldCombobox], False)]
    property DataCadastro: TDateTime  read FDATA_CADASTRO write FDATA_CADASTRO;
    [TColumn('DATA_ADMISSAO','Data Admissao',80,[ldGrid, ldLookup, ldCombobox], False)]
    property DataAdmissao: TDateTime  read FDATA_ADMISSAO write FDATA_ADMISSAO;
    [TColumn('DATA_DEMISSAO','Data Demissao',80,[ldGrid, ldLookup, ldCombobox], False)]
    property DataDemissao: TDateTime  read FDATA_DEMISSAO write FDATA_DEMISSAO;
    [TColumn('PIS_NUMERO','Pis Numero',80,[ldGrid, ldLookup, ldCombobox], False)]
    property PisNumero: String  read FPIS_NUMERO write FPIS_NUMERO;

    [TAssociation(False, 'ID', 'ID_PESSOA', 'PESSOA')]
    property PessoaVO: TPessoaVO read FPessoaVO write FPessoaVO;

  end;

implementation

destructor TColaboradorVO.Destroy;
begin
  if Assigned(FPessoaVO) then
    FPessoaVO.Free;
  inherited;
end;



end.
