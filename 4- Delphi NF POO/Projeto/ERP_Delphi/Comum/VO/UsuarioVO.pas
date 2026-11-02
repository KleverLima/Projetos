unit UsuarioVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils,
  ColaboradorVO, PapelVO;

type
  [TEntity]
  [TTable('USUARIO')]
  TUsuarioVO = class(TVO)
  private
    FID: Integer;
    FID_COLABORADOR: Integer;
    FID_PAPEL: Integer;
    FLOGIN: String;
    FSENHA: String;
    FDATA_CADASTRO: TDateTime;
    FADMINISTRADOR: String;

    FColaboradorNome: String;
    FPapelNome: String;

    FColaboradorVO: TColaboradorVO;
    FPapelVO: TPapelVO;

  public
    destructor Destroy; override;

    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;

    [TColumn('ID_COLABORADOR', 'Id Colaborador', 80, [ldGrid, ldComboBox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]    property IdColaborador: Integer  read FID_COLABORADOR write FID_COLABORADOR;
    [TColumn('COLABORADOR.NOME', 'Nome Colaborador', 350, [ldGrid], True)]
    property ColaboradorNome: String read FColaboradorNome write FColaboradorNome;

    [TColumn('ID_PAPEL', 'Id Papel', 80, [ldGrid, ldComboBox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdPapel: Integer  read FID_PAPEL write FID_PAPEL;
    [TColumn('PAPEL.NOME', 'Nome Papel', 250, [ldGrid, ldLookup, ldComboBox], True)]
    property PapelNome: String read FPapelNome write FPapelNome;

    [TColumn('LOGIN','Login',[ldGrid, ldLookup],False)]
    property Login: String  read FLOGIN write FLOGIN;
    [TColumn('SENHA')]
    property Senha: String  read FSENHA write FSENHA;
    [TColumn('DATA_CADASTRO','Data do Cadastro',[ldGrid],False)]
    property DataCadastro: TDateTime  read FDATA_CADASTRO write FDATA_CADASTRO;
    [TColumn('ADMINISTRADOR')]
    property Administrador: String read FADMINISTRADOR write FADMINISTRADOR;

    [TAssociation(True, 'ID', 'ID_COLABORADOR')]
    property ColaboradorVO: TColaboradorVO read FColaboradorVO write FColaboradorVO;

    [TAssociation(False, 'ID', 'ID_PAPEL')]
    property PapelVO: TPapelVO read FPapelVO write FPapelVO;
  end;

implementation

destructor TUsuarioVO.Destroy;
begin
  if Assigned(FColaboradorVO) then
    FColaboradorVO.Free;
  if Assigned(FPapelVO) then
    FPapelVO.Free;
  inherited;
end;


end.
