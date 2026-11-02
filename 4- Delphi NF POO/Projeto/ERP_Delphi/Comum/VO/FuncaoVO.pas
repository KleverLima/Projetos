unit FuncaoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('FUNCAO')]
  TFuncaoVO = class(TVO)
  private
    FID: Integer;
    FFORMULARIO: String;
    FNOME: String;
    FDescricao: String;
    FHabilitado: String;

  public
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    property Id: Integer  read FID write FID;
    [TColumn('NOME')]
    property Nome: String  read FNOME write FNOME;
    [TColumn('FORMULARIO')]
    property Formulario: String  read FFORMULARIO write FFORMULARIO;

    [TColumn('DESCRICAO','Descrição',[],True)]
    property Descricao: String  read FDescricao write FDescricao;
    [TColumn('HABILITADO','Habilitado',[],True)]
    property Habilitado: string  read FHabilitado write FHabilitado;
  end;

implementation

end.
