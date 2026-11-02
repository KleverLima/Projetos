unit NcmVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NCM')]
  TNcmVO = class(TVO)
  private
    FID: Integer;
    FCODIGO: String;
    FDESCRICAO: String;
    FOBSERVACAO: String;

  public
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    property Id: Integer  read FID write FID;
    [TColumn('CODIGO','Código',80,[ldGrid, ldLookup, ldComboBox] ,False)]
    property Codigo: String  read FCODIGO write FCODIGO;
    [TColumn('DESCRICAO','Descrição',750,[ldGrid, ldLookup, ldComboBox] ,False)]
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    [TColumn('OBSERVACAO','Observação',[] ,False)]
    property Observacao: String  read FOBSERVACAO write FOBSERVACAO;

  end;

implementation



end.

