unit NfeImportacaoDetalheVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_IMPORTACAO_DETALHE')]
  TNfeImportacaoDetalheVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_DECLARACAO_IMPORTACAO: Integer;
    FNUMERO_ADICAO: Integer;
    FNUMERO_SEQUENCIAL: Integer;
    FCODIGO_FABRICANTE_ESTRANGEIRO: String;
    FVALOR_DESCONTO: Extended;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_DECLARACAO_IMPORTACAO','Id Nfe Declaracao Importacao',80,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeDeclaracaoImportacao: Integer  read FID_NFE_DECLARACAO_IMPORTACAO write FID_NFE_DECLARACAO_IMPORTACAO;
    [TColumn('NUMERO_ADICAO','Numero Adicao',80,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property NumeroAdicao: Integer  read FNUMERO_ADICAO write FNUMERO_ADICAO;
    [TColumn('NUMERO_SEQUENCIAL','Numero Sequencial',80,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property NumeroSequencial: Integer  read FNUMERO_SEQUENCIAL write FNUMERO_SEQUENCIAL;
    [TColumn('CODIGO_FABRICANTE_ESTRANGEIRO','Codigo Fabricante Estrangeiro',450,[ldGrid, ldLookup, ldCombobox], False)]
    property CodigoFabricanteEstrangeiro: String  read FCODIGO_FABRICANTE_ESTRANGEIRO write FCODIGO_FABRICANTE_ESTRANGEIRO;
    [TColumn('VALOR_DESCONTO','Valor Desconto',168,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorDesconto: Extended  read FVALOR_DESCONTO write FVALOR_DESCONTO;

  end;

implementation



end.
