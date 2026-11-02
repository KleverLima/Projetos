unit NfeCanaDeducoesSafraVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_CANA_DEDUCOES_SAFRA')]
  TNfeCanaDeducoesSafraVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_CANA: Integer;
    FDECRICAO: String;
    FVALOR_DEDUCAO: Extended;
    FVALOR_FORNECIMENTO: Extended;
    FVALOR_TOTAL_DEDUCAO: Extended;
    FVALOR_LIQUIDO_FORNECIMENTO: Extended;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_CANA','Id Nfe Cana',80,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeCana: Integer  read FID_NFE_CANA write FID_NFE_CANA;
    [TColumn('DECRICAO','Decricao',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Decricao: String  read FDECRICAO write FDECRICAO;
    [TColumn('VALOR_DEDUCAO','Valor Deducao',168,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorDeducao: Extended  read FVALOR_DEDUCAO write FVALOR_DEDUCAO;
    [TColumn('VALOR_FORNECIMENTO','Valor Fornecimento',168,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorFornecimento: Extended  read FVALOR_FORNECIMENTO write FVALOR_FORNECIMENTO;
    [TColumn('VALOR_TOTAL_DEDUCAO','Valor Total Deducao',168,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorTotalDeducao: Extended  read FVALOR_TOTAL_DEDUCAO write FVALOR_TOTAL_DEDUCAO;
    [TColumn('VALOR_LIQUIDO_FORNECIMENTO','Valor Liquido Fornecimento',168,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorLiquidoFornecimento: Extended  read FVALOR_LIQUIDO_FORNECIMENTO write FVALOR_LIQUIDO_FORNECIMENTO;

  end;

implementation



end.
