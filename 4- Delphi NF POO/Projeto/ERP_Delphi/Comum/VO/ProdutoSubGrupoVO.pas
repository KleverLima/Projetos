unit ProdutoSubGrupoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, ProdutoGrupoVO;

type
  [TEntity]
  [TTable('PRODUTO_SUB_GRUPO')]
  TProdutoSubGrupoVO = class(TVO)
  private
    FID: Integer;
    FID_GRUPO: Integer;
    FNOME: String;
    FDESCRICAO: String;

    FProdutoGrupoNome: String;
    FProdutoGrupoVO: TProdutoGrupoVO;

  public
    destructor Destroy; override;

  public
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;

    [TColumn('ID_GRUPO','Id Grupo',[ldGrid, ldLookup] ,False)]
    property IdGrupo: Integer  read FID_GRUPO write FID_GRUPO;
    [TColumn('PRODUTO_GRUPO.NOME','Grupo Produto',250,[ldGrid, ldLookup,ldComboBox],True,'PRODUTO_GRUPO','ID_GRUPO','ID')]
    property ProdutoGrupoNome: String read FProdutoGrupoNome write FProdutoGrupoNome;

    [TColumn('NOME','Nome',[ldGrid, ldLookup] ,False)]
    property Nome: String  read FNOME write FNOME;
    [TColumn('DESCRICAO','Descrição',[ldGrid, ldLookup] ,False)]
    property Descricao: String  read FDESCRICAO write FDESCRICAO;

    [TAssociation(False,'ID','ID_GRUPO','PRODUTO_GRUPO' )]
    property ProdutoGrupoVO: TProdutoGrupoVO read FProdutoGrupoVO write FProdutoGrupoVO;


  end;

implementation

destructor TProdutoSubGrupoVO.Destroy;
begin
  if Assigned(FProdutoGrupoVO) then
    FProdutoGrupoVO.Free;
  inherited;
end;

end.

