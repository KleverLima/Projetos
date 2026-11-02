unit NfeDetalheImpostoIssqnVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_DETALHE_IMPOSTO_ISSQN')]
  TNfeDetalheImpostoIssqnVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_DETALHE: Integer;
    FBASE_CALCULO_ISSQN: Extended;
    FALIQUOTA_ISSQN: Extended;
    FVALOR_ISSQN: Extended;
    FMUNICIPIO_ISSQN: Integer;
    FITEM_LISTA_SERVICOS: Integer;
    FTRIBUTACAO_ISSQN: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_DETALHE','Id Nfe Detalhe',80,[], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeDetalhe: Integer  read FID_NFE_DETALHE write FID_NFE_DETALHE;
    [TColumn('BASE_CALCULO_ISSQN','Base Calculo Issqn',168,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property BaseCalculoIssqn: Extended  read FBASE_CALCULO_ISSQN write FBASE_CALCULO_ISSQN;
    [TColumn('ALIQUOTA_ISSQN','Aliquota Issqn',168,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaIssqn: Extended  read FALIQUOTA_ISSQN write FALIQUOTA_ISSQN;
    [TColumn('VALOR_ISSQN','Valor Issqn',168,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIssqn: Extended  read FVALOR_ISSQN write FVALOR_ISSQN;
    [TColumn('MUNICIPIO_ISSQN','Municipio Issqn',80,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property MunicipioIssqn: Integer  read FMUNICIPIO_ISSQN write FMUNICIPIO_ISSQN;
    [TColumn('ITEM_LISTA_SERVICOS','Item Lista Servicos',80,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property ItemListaServicos: Integer  read FITEM_LISTA_SERVICOS write FITEM_LISTA_SERVICOS;
    [TColumn('TRIBUTACAO_ISSQN','Tributacao Issqn',8,[ldGrid, ldLookup, ldCombobox], False)]
    property TributacaoIssqn: String  read FTRIBUTACAO_ISSQN write FTRIBUTACAO_ISSQN;

  end;

implementation



end.
