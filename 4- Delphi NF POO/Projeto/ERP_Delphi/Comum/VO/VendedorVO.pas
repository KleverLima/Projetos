unit VendedorVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils,
  ColaboradorPessoaVO;

type
  [TEntity]
  [TTable('VENDEDOR')]
  TVendedorVO = class(TVO)
  private
    FID: Integer;
    FID_COLABORADOR: Integer;
    FCOMISSAO: Extended;
    FMETA_VENDAS: Extended;
    FTIPO_COMISSAO: String;

    FColaboradorPessoaNome: String;

    FColaboradorVO: TColaboradorVO;


  public
    destructor Destroy; override;

    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_COLABORADOR','Id Colaborador',80,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdColaborador: Integer  read FID_COLABORADOR write FID_COLABORADOR;
    [TColumn('COLABORADORPESSOA.NOME', 'Nome Vendedor', 250, [ldGrid, ldLookup, ldComboBox], True, 'COLABORADOR', 'ID_COLABORADOR', 'ID')]
    property ColaboradorPessoaNome: String read FColaboradorPessoaNome write FColaboradorPessoaNome;


    [TColumn('COMISSAO','Comissao',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Comissao: Extended  read FCOMISSAO write FCOMISSAO;
    [TColumn('META_VENDAS','Meta Vendas',128,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property MetaVendas: Extended  read FMETA_VENDAS write FMETA_VENDAS;
    [TColumn('TIPO_COMISSAO','Tipo Comissao',8,[ldGrid, ldLookup, ldCombobox], False)]
    property TipoComissao: String  read FTIPO_COMISSAO write FTIPO_COMISSAO;

    [TAssociation(True, 'ID', 'ID_COLABORADOR')]
    property ColaboradorVO: TColaboradorVO read FColaboradorVO write FColaboradorVO;

  end;

implementation

destructor TVendedorVO.Destroy;
begin
  if Assigned(FColaboradorVO) then
    FColaboradorVO.Free;

  inherited;
end;

end.
