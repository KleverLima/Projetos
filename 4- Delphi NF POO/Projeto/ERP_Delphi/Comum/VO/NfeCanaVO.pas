unit NfeCanaVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections,
  SysUtils, NfeCanaFornecimentoDiarioVO, NfeCanaDeducoesSafraVO;

type
  [TEntity]
  [TTable('NFE_CANA')]
  TNfeCanaVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_CABECALHO: Integer;
    FSAFRA: String;
    FMES_ANO_REFERENCIA: String;

    FListaNfeCanaFornecimentoDiarioVO: TObjectList<TNfeCanaFornecimentoDiarioVO>; //1:31
    FListaNfeCanaDeducoesSafraVO: TObjectList<TNfeCanaDeducoesSafraVO>; //0:10

  public
    constructor Create; overload; override;
    destructor Destroy; override;

    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_CABECALHO','Id Nfe Cabecalho',80,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeCabecalho: Integer  read FID_NFE_CABECALHO write FID_NFE_CABECALHO;
    [TColumn('SAFRA','Safra',72,[ldGrid, ldLookup, ldCombobox], False)]
    property Safra: String  read FSAFRA write FSAFRA;
    [TColumn('MES_ANO_REFERENCIA','Mes Ano Referencia',72,[ldGrid, ldLookup, ldCombobox], False)]
    property MesAnoReferencia: String  read FMES_ANO_REFERENCIA write FMES_ANO_REFERENCIA;

    [TManyValuedAssociation(True,'ID_NFE_CANA','ID')]
    property ListaNfeCanaFornecimentoDiarioVO: TObjectList<TNfeCanaFornecimentoDiarioVO> read FListaNfeCanaFornecimentoDiarioVO write FListaNfeCanaFornecimentoDiarioVO;

    [TManyValuedAssociation(True,'ID_NFE_CANA','ID')]
    property ListaNfeCanaDeducoesSafraVO: TObjectList<TNfeCanaDeducoesSafraVO> read FListaNfeCanaDeducoesSafraVO write FListaNfeCanaDeducoesSafraVO;

  end;

implementation

constructor TNfeCanaVO.Create;
begin
  inherited;
  ListaNfeCanaFornecimentoDiarioVO := TObjectList<TNfeCanaFornecimentoDiarioVO>.Create;
  ListaNfeCanaDeducoesSafraVO := TObjectList<TNfeCanaDeducoesSafraVO>.Create;
end;

destructor TNfeCanaVO.Destroy;
begin
  ListaNfeCanaFornecimentoDiarioVO.Free;
  ListaNfeCanaDeducoesSafraVO.Free;
  inherited;
end;

end.
