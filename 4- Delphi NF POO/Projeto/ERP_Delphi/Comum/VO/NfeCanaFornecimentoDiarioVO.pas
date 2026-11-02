unit NfeCanaFornecimentoDiarioVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_CANA_FORNECIMENTO_DIARIO')]
  TNfeCanaFornecimentoDiarioVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_CANA: Integer;
    FDIA: String;
    FQUANTIDADE: Extended;
    FQUANTIDADE_TOTAL_MES: Extended;
    FQUANTIDADE_TOTAL_ANTERIOR: Extended;
    FQUANTIDADE_TOTAL_GERAL: Extended;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_CANA','Id Nfe Cana',80,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeCana: Integer  read FID_NFE_CANA write FID_NFE_CANA;
    [TColumn('DIA','Dia',16,[ldGrid, ldLookup, ldCombobox], False)]
    property Dia: String  read FDIA write FDIA;
    [TColumn('QUANTIDADE','Quantidade',168,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Quantidade: Extended  read FQUANTIDADE write FQUANTIDADE;
    [TColumn('QUANTIDADE_TOTAL_MES','Quantidade Total Mes',168,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property QuantidadeTotalMes: Extended  read FQUANTIDADE_TOTAL_MES write FQUANTIDADE_TOTAL_MES;
    [TColumn('QUANTIDADE_TOTAL_ANTERIOR','Quantidade Total Anterior',168,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property QuantidadeTotalAnterior: Extended  read FQUANTIDADE_TOTAL_ANTERIOR write FQUANTIDADE_TOTAL_ANTERIOR;
    [TColumn('QUANTIDADE_TOTAL_GERAL','Quantidade Total Geral',168,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property QuantidadeTotalGeral: Extended  read FQUANTIDADE_TOTAL_GERAL write FQUANTIDADE_TOTAL_GERAL;

  end;

implementation



end.
