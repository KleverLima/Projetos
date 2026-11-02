unit PapelFuncaoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, PapelVO;

type
  [TEntity]
  [TTable('PAPEL_FUNCAO')]
  TPapelFuncaoVO = class(TVO)
  private
    FID: Integer;
    FID_PAPEL: Integer;
    FID_FUNCAO: Integer;
    FHABILITADO: String;
    FFuncao: String;
    FFormulario: String;
    FNodeAlterado: Boolean;
  public
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_PAPEL')]
    property IdPapel: Integer  read FID_PAPEL write FID_PAPEL;
    [TColumn('ID_FUNCAO')]
    property IdFuncao: Integer  read FID_FUNCAO write FID_FUNCAO;
    [TColumn('HABILITADO')]
    property Habilitado: String  read FHABILITADO write FHABILITADO;

    [TColumn('FUNCAO','Função',[],True)]
    property Funcao: String read FFuncao write FFuncao;
    [TColumn('FORMULARIO','Formulário',[],True)]
    property Formulario: String read FFormulario write FFormulario;
    [TColumn('NODE_ALTERADO','Node Alterado',[],True)]
    property NodeAlterado: Boolean read FNodeAlterado write FNodeAlterado;
  end;

implementation

end.
