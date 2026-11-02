unit TransportadoraPessoaVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils,
  PessoaFisicaJuridicaVO;

type
  [TEntity]
  [TTable('TRANSPORTADORA')]
  TTransportadoraVO = class(TVO)
  private
    FID: Integer;
    FID_PESSOA: Integer;
    FDATA_CADASTRO: TDateTime;
    FOBSERVACAO: String;

    FPessoaNome: String;

    FPessoaVO: TPessoaVO;

  public
    destructor Destroy; override;

    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;

    [TColumn('ID_PESSOA','Id Pessoa',80,[], False)]
    property IdPessoa: Integer  read FID_PESSOA write FID_PESSOA;
    [TColumn('PESSOA.NOME','Pessoa Nome',300,[ldGrid, ldLookup,ldComboBox],True,'PESSOA','ID_PESSOA','ID')]
    property PessoaNome: String read FPessoaNome write FPessoaNome;

    [TColumn('DATA_CADASTRO','Data Cadastro',80,[ldGrid, ldLookup, ldCombobox], False)]
    property DataCadastro: TDateTime  read FDATA_CADASTRO write FDATA_CADASTRO;
    [TColumn('OBSERVACAO','Observacao',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Observacao: String  read FOBSERVACAO write FOBSERVACAO;


    [TAssociation(True,'ID','ID_PESSOA','PESSOA')]
    property PessoaVO: TPessoaVO read FPessoaVO write FPessoaVO;

  end;

implementation

destructor TTransportadoraVO.Destroy;
begin
  if Assigned(FPessoaVO) then
    FPessoaVO.Free;
  inherited;
end;

end.
