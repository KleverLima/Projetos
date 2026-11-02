unit NfeDeclaracaoImportacaoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections,
  SysUtils, NfeImportacaoDetalheVO;

type
  [TEntity]
  [TTable('NFE_DECLARACAO_IMPORTACAO')]
  TNfeDeclaracaoImportacaoVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_DETALHE: Integer;
    FNUMERO_DOCUMENTO: String;
    FDATA_REGISTRO: TDateTime;
    FLOCAL_DESEMBARACO: String;
    FUF_DESEMBARACO: String;
    FDATA_DESEMBARACO: TDateTime;
    FCODIGO_EXPORTADOR: String;

    FListaNfeImportacaoDetalheVO: TObjectList<TNfeImportacaoDetalheVO>; //1:100

  public
    constructor Create; overload; override;
    destructor Destroy; override;

    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_DETALHE','Id Nfe Detalhe',80,[], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeDetalhe: Integer  read FID_NFE_DETALHE write FID_NFE_DETALHE;
    [TColumn('NUMERO_DOCUMENTO','Numero Documento',96,[ldGrid, ldLookup, ldCombobox], False)]
    property NumeroDocumento: String  read FNUMERO_DOCUMENTO write FNUMERO_DOCUMENTO;
    [TColumn('DATA_REGISTRO','Data Registro',80,[ldGrid, ldLookup, ldCombobox], False)]
    property DataRegistro: TDateTime  read FDATA_REGISTRO write FDATA_REGISTRO;
    [TColumn('LOCAL_DESEMBARACO','Local Desembaraco',450,[ldGrid, ldLookup, ldCombobox], False)]
    property LocalDesembaraco: String  read FLOCAL_DESEMBARACO write FLOCAL_DESEMBARACO;
    [TColumn('UF_DESEMBARACO','Uf Desembaraco',16,[ldGrid, ldLookup, ldCombobox], False)]
    property UfDesembaraco: String  read FUF_DESEMBARACO write FUF_DESEMBARACO;
    [TColumn('DATA_DESEMBARACO','Data Desembaraco',80,[ldGrid, ldLookup, ldCombobox], False)]
    property DataDesembaraco: TDateTime  read FDATA_DESEMBARACO write FDATA_DESEMBARACO;
    [TColumn('CODIGO_EXPORTADOR','Codigo Exportador',450,[ldGrid, ldLookup, ldCombobox], False)]
    property CodigoExportador: String  read FCODIGO_EXPORTADOR write FCODIGO_EXPORTADOR;

    [TManyValuedAssociation(True,'ID_NFE_DECLARACAO_IMPORTACAO','ID')]
    property ListaNfeImportacaoDetalheVO: TObjectList<TNfeImportacaoDetalheVO> read FListaNfeImportacaoDetalheVO write FListaNfeImportacaoDetalheVO;

  end;

implementation

constructor TNfeDeclaracaoImportacaoVO.Create;
begin
  inherited;
  ListaNfeImportacaoDetalheVO := TObjectList<TNfeImportacaoDetalheVO>.Create;
end;

destructor TNfeDeclaracaoImportacaoVO.Destroy;
begin
  ListaNfeImportacaoDetalheVO.Free;
  inherited;
end;


end.
