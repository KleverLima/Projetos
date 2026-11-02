unit NfeDetalheImpostoPisVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_DETALHE_IMPOSTO_PIS')]
  TNfeDetalheImpostoPisVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_DETALHE: Integer;
    FCST_PIS: String;
    FQUANTIDADE_VENDIDA: Extended;
    FVALOR_BASE_CALCULO_PIS: Extended;
    FALIQUOTA_PIS_PERCENTUAL: Extended;
    FALIQUOTA_PIS_REAIS: Extended;
    FVALOR_PIS: Extended;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_DETALHE','Id Nfe Detalhe',80,[], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeDetalhe: Integer  read FID_NFE_DETALHE write FID_NFE_DETALHE;
    [TColumn('CST_PIS','Cst Pis',16,[ldGrid, ldLookup, ldCombobox], False)]
    property CstPis: String  read FCST_PIS write FCST_PIS;
    [TColumn('QUANTIDADE_VENDIDA','Quantidade Vendida',168,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property QuantidadeVendida: Extended  read FQUANTIDADE_VENDIDA write FQUANTIDADE_VENDIDA;
    [TColumn('VALOR_BASE_CALCULO_PIS','Valor Base Calculo Pis',168,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorBaseCalculoPis: Extended  read FVALOR_BASE_CALCULO_PIS write FVALOR_BASE_CALCULO_PIS;
    [TColumn('ALIQUOTA_PIS_PERCENTUAL','Aliquota Pis Percentual',168,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaPisPercentual: Extended  read FALIQUOTA_PIS_PERCENTUAL write FALIQUOTA_PIS_PERCENTUAL;
    [TColumn('ALIQUOTA_PIS_REAIS','Aliquota Pis Reais',168,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaPisReais: Extended  read FALIQUOTA_PIS_REAIS write FALIQUOTA_PIS_REAIS;
    [TColumn('VALOR_PIS','Valor Pis',168,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorPis: Extended  read FVALOR_PIS write FVALOR_PIS;

  end;

implementation



end.
