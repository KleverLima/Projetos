unit TributIcmsCustomCabVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, TributIcmsCustomDetVO;

type
  [TEntity]
  [TTable('TRIBUT_ICMS_CUSTOM_CAB')]
  TTributIcmsCustomCabVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FDESCRICAO: String;
    FORIGEM_MERCADORIA: String;

    FListaTributIcmsCustomDetVO: TObjectList<TTributIcmsCustomDetVO>; //0:N

  public 
    constructor Create; overload; override;
    destructor Destroy; override;

    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_EMPRESA','Id Empresa',80,[], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    [TColumn('DESCRICAO','Descricao',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    [TColumn('ORIGEM_MERCADORIA','Origem Mercadoria',8,[ldGrid, ldLookup, ldCombobox], False)]
    property OrigemMercadoria: String  read FORIGEM_MERCADORIA write FORIGEM_MERCADORIA;

    [TManyValuedAssociation(False, 'ID_TRIBUT_ICMS_CUSTOM_CAB','ID')]
    property ListaTributIcmsCustomDetVO: TObjectList<TTributIcmsCustomDetVO> read FListaTributIcmsCustomDetVO write FListaTributIcmsCustomDetVO;

  end;

implementation

constructor TTributIcmsCustomCabVO.Create;
begin
  inherited;
  FListaTributIcmsCustomDetVO := TObjectList<TTributIcmsCustomDetVO>.Create; //0:N
end;

destructor TTributIcmsCustomCabVO.Destroy;
begin
  FListaTributIcmsCustomDetVO.Free;

  inherited;
end;

end.
