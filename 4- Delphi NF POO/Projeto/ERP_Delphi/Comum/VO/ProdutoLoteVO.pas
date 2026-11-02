unit ProdutoLoteVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('PRODUTO_LOTE')]
  TProdutoLoteVO = class(TVO)
  private
    FID: Integer;
    FID_PRODUTO: Integer;
    FCODIGO: String;
    FDATA_CADASTRO: TDateTime;
    FDATA_COMPRA: TDateTime;
    FDATA_FABRICACAO: TDateTime;
    FDATA_VALIDADE: TDateTime;
    FQUANTIDADE: Extended;
    FPRECO_MAXIMO_CONSUMIDOR: Extended;
    FOBSERVACAO: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_PRODUTO','Id Produto',80,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdProduto: Integer  read FID_PRODUTO write FID_PRODUTO;
    [TColumn('CODIGO','Codigo',400,[ldGrid, ldLookup, ldCombobox], False)]
    property Codigo: String  read FCODIGO write FCODIGO;
    [TColumn('DATA_CADASTRO','Data Cadastro',80,[ldGrid, ldLookup, ldCombobox], False)]
    property DataCadastro: TDateTime  read FDATA_CADASTRO write FDATA_CADASTRO;
    [TColumn('DATA_COMPRA','Data Compra',80,[ldGrid, ldLookup, ldCombobox], False)]
    property DataCompra: TDateTime  read FDATA_COMPRA write FDATA_COMPRA;
    [TColumn('DATA_FABRICACAO','Data Fabricacao',80,[ldGrid, ldLookup, ldCombobox], False)]
    property DataFabricacao: TDateTime  read FDATA_FABRICACAO write FDATA_FABRICACAO;
    [TColumn('DATA_VALIDADE','Data Validade',80,[ldGrid, ldLookup, ldCombobox], False)]
    property DataValidade: TDateTime  read FDATA_VALIDADE write FDATA_VALIDADE;
    [TColumn('QUANTIDADE','Quantidade',168,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Quantidade: Extended  read FQUANTIDADE write FQUANTIDADE;
    [TColumn('PRECO_MAXIMO_CONSUMIDOR','Preco Maximo Consumidor',168,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PrecoMaximoConsumidor: Extended  read FPRECO_MAXIMO_CONSUMIDOR write FPRECO_MAXIMO_CONSUMIDOR;
    [TColumn('OBSERVACAO','Observacao',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Observacao: String  read FOBSERVACAO write FOBSERVACAO;

  end;

implementation



end.
