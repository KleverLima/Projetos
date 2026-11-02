unit CfopVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('CFOP')]
  TCfopVO = class(TVO)
  private
    FID: Integer;
    FCFOP: Integer;
    FDESCRICAO: String;
    FAPLICACAO: String;

  public
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    property Id: Integer  read FID write FID;
    [TColumn('CFOP','Cfop',80,[ldGrid, ldLookup, ldComboBox], False)]
    property Cfop: Integer  read FCFOP write FCFOP;
    [TColumn('DESCRICAO','Descrição',450,[ldGrid, ldLookup, ldComboBox], False)]
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    [TColumn('APLICACAO','Aplicação',450,[ldGrid, ldLookup], False)]
    property Aplicacao: String  read FAPLICACAO write FAPLICACAO;

  end;

implementation



end.
