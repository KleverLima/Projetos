unit ViewTributacaoIssVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('VIEW_TRIBUTACAO_ISS')]
  TViewTributacaoIssVO = class(TVO)
  private
    FID: Integer;
    FDESCRICAO: String;
    FDESCRICAO_NA_NF: String;
    FCFOP: Integer;
    FMODALIDADE_BASE_CALCULO: String;
    FPORCENTO_BASE_CALCULO: Extended;
    FALIQUOTA_PORCENTO: Extended;
    FALIQUOTA_UNIDADE: Extended;
    FVALOR_PRECO_MAXIMO: Extended;
    FVALOR_PAUTA_FISCAL: Extended;
    FITEM_LISTA_SERVICO: Integer;
    FCODIGO_TRIBUTACAO: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('DESCRICAO','Descricao',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    [TColumn('DESCRICAO_NA_NF','Descricao Na Nf',450,[ldGrid, ldLookup, ldCombobox], False)]
    property DescricaoNaNf: String  read FDESCRICAO_NA_NF write FDESCRICAO_NA_NF;
    [TColumn('CFOP','Cfop',80,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Cfop: Integer  read FCFOP write FCFOP;
    [TColumn('MODALIDADE_BASE_CALCULO','Modalidade Base Calculo',8,[ldGrid, ldLookup, ldCombobox], False)]
    property ModalidadeBaseCalculo: String  read FMODALIDADE_BASE_CALCULO write FMODALIDADE_BASE_CALCULO;
    [TColumn('PORCENTO_BASE_CALCULO','Porcento Base Calculo',168,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PorcentoBaseCalculo: Extended  read FPORCENTO_BASE_CALCULO write FPORCENTO_BASE_CALCULO;
    [TColumn('ALIQUOTA_PORCENTO','Aliquota Porcento',168,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaPorcento: Extended  read FALIQUOTA_PORCENTO write FALIQUOTA_PORCENTO;
    [TColumn('ALIQUOTA_UNIDADE','Aliquota Unidade',168,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaUnidade: Extended  read FALIQUOTA_UNIDADE write FALIQUOTA_UNIDADE;
    [TColumn('VALOR_PRECO_MAXIMO','Valor Preco Maximo',168,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorPrecoMaximo: Extended  read FVALOR_PRECO_MAXIMO write FVALOR_PRECO_MAXIMO;
    [TColumn('VALOR_PAUTA_FISCAL','Valor Pauta Fiscal',168,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorPautaFiscal: Extended  read FVALOR_PAUTA_FISCAL write FVALOR_PAUTA_FISCAL;
    [TColumn('ITEM_LISTA_SERVICO','Item Lista Servico',80,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property ItemListaServico: Integer  read FITEM_LISTA_SERVICO write FITEM_LISTA_SERVICO;
    [TColumn('CODIGO_TRIBUTACAO','Codigo Tributacao',8,[ldGrid, ldLookup, ldCombobox], False)]
    property CodigoTributacao: String  read FCODIGO_TRIBUTACAO write FCODIGO_TRIBUTACAO;

  end;

implementation



end.
