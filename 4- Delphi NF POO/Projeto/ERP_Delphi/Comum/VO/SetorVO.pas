unit SetorVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, EmpresaVO;


type
  [TEntity]
  [TTable('SETOR')]
  TSetorVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FNOME: String;
    FDESCRICAO: String;

    FEmpresaRazaoSocial: String;
    FEmpresaVO: TEmpresaVO;

  public
    constructor Create; overload; override;
    destructor Destroy; override;


    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter('0000', taCenter)]
    property Id: Integer  read FID write FID;
    [TFormatter('0000', taCenter)]
    [TColumn('ID_EMPRESA','Id Empresa',[ldGrid], False)]
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    [TColumn('EMPRESA.RAZAO_SOCIAL','Razão Social',250,[],True,'EMPRESA','ID_EMPRESA','ID')]
    property EmpresaRazaoSocial: string read FEmpresaRazaoSocial write FEmpresaRazaoSocial;

    [TColumn('NOME','Nome',650,[ldGrid, ldLookup, ldComboBox], False)]
    property Nome: String  read FNOME write FNOME;
    [TColumn('DESCRICAO','Descrição',550,[ldGrid, ldLookup, ldComboBox], False)]
    property Descricao: String  read FDESCRICAO write FDESCRICAO;

    [TAssociation(False,'ID','ID_EMPRESA','EMPRESA')]
    property EmpresaVO: TEmpresaVO read FEmpresaVO write FEmpresaVO;

  end;

implementation

constructor TSetorVO.Create;
begin
  inherited;
end;

destructor TSetorVO.Destroy;
begin
  if Assigned(FEmpresaVO) then
    FEmpresaVO.Free;

  inherited;
end;

end.
