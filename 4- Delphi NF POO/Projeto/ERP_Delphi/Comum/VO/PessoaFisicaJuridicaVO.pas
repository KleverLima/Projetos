unit PessoaFisicaJuridicaVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils,
  PessoaFisicaVO, PessoaJuridicaVO;

type
  [TEntity]
  [TTable('PESSOA')]
  TPessoaVO = class(TVO)
  private
    FID: Integer;
    FNOME: String;
    FTIPO: String;
    FEMAIL: String;
    FSITE: String;
    FCLIENTE: String;
    FFORNECEDOR: String;
    FCOLABORADOR: String;
    FCONVENIO: String;
    FCONTADOR: String;
    FTRANSPORTADORA: String;

    FPessoaFisicaVO: TPessoaFisicaVO;
    FPessoaJuridicaVO: TPessoaJuridicaVO;
  public
    destructor Destroy; override;

    [TId('ID')]
    [TGeneratedValue(sAuto)]
    property Id: Integer  read FID write FID;
    [TColumn('NOME','Nome',[ldGrid, ldLookup,ldComboBox] ,False)]
    property Nome: String  read FNOME write FNOME;
    [TColumn('TIPO','Tipo',40,[ldGrid, ldLookup] ,False)]
    property Tipo: String  read FTIPO write FTIPO;
    [TColumn('EMAIL','Email',[ldGrid, ldLookup] ,False)]
    property Email: String  read FEMAIL write FEMAIL;
    [TColumn('SITE','Site',[ldGrid, ldLookup] ,False)]
    property Site: String  read FSITE write FSITE;
    [TColumn('CLIENTE','Cliente',50,[],False)]
    property Cliente: String  read FCLIENTE write FCLIENTE;
    [TColumn('FORNECEDOR','Fornecedor',60,[],False)]
    property Fornecedor: String  read FFORNECEDOR write FFORNECEDOR;
    [TColumn('COLABORADOR','Colaborador',70,[],False)]
    property Colaborador: String  read FCOLABORADOR write FCOLABORADOR;
    [TColumn('CONVENIO','Convênio',50,[],False)]
    property Convenio: String  read FCONVENIO write FCONVENIO;
    [TColumn('CONTADOR','Contador',50,[],False)]
    property Contador: String  read FCONTADOR write FCONTADOR;
    [TColumn('TRANSPORTADORA','Transportadora',80,[],False)]
    property Transportadora: String  read FTRANSPORTADORA write FTRANSPORTADORA;

    [TAssociation(False,'ID_PESSOA','ID')]
    property PessoaFisicaVO: TPessoaFisicaVO read FPessoaFisicaVO write FPessoaFisicaVO;

    [TAssociation(False,'ID_PESSOA','ID')]
    property PessoaJuridicaVO: TPessoaJuridicaVO read FPessoaJuridicaVO write FPessoaJuridicaVO;
  end;

implementation

{ TPessoaVO }

destructor TPessoaVO.Destroy;
begin
  if Assigned(FPessoaFisicaVO) then
    FPessoaFisicaVO.Free;

  if Assigned(FPessoaJuridicaVO) then
    FPessoaJuridicaVO.Free;

  inherited;
end;

end.
