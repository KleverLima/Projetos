unit AlmoxarifadoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils,
  EmpresaVO;

type
  [TEntity]
  [TTable('ALMOXARIFADO')]
  TAlmoxarifadoVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FNOME: String;

    FEmpresaRazaoSocial: String;
    FEmpresaVO: TEmpresaVO;

  public
    constructor Create; overload; override;
    destructor Destroy; override;

    [TId('ID')]
    [TGeneratedValue(sAuto)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_EMPRESA','Id Empresa',[] ,False)]
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    [TColumn('EMPRESA.RAZAO_SOCIAL','Razão Social',250,[],True,'EMPRESA','ID_EMPRESA','ID')]
    property EmpresaRazaoSocial: string read FEmpresaRazaoSocial write FEmpresaRazaoSocial;

    [TColumn('NOME','Nome',700,[ldGrid, ldLookup,ldComboBox] ,False)]
    property Nome: String  read FNOME write FNOME;

    [TAssociation(False,'ID','ID_EMPRESA','EMPRESA')]
    property EmpresaVO: TEmpresaVO read FEmpresaVO write FEmpresaVO;
  end;

implementation

constructor TAlmoxarifadoVO.Create;
begin
  inherited;
end;

destructor TAlmoxarifadoVO.Destroy;
begin
  if Assigned(FEmpresaVO) then
    FEmpresaVO.Free;

  inherited;
end;


end.

