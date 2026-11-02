unit AdministrativoformularioVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, FuncaoVO;

type
  TAdministrativoFormularioVO = class(TVO)
  private
    FMODULO: String;
    FDESCRICAO: String;
    FNOME_FORMULARIO: String;

    FListaFuncaoVO: TObjectList<TFuncaoVO>;

  public
    constructor Create; overload; override;
    destructor Destroy; override;

    property Modulo: String  read FMODULO write FMODULO;
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    property NomeFormulario: String  read FNOME_FORMULARIO write FNOME_FORMULARIO;

    property ListaFuncaoVO: TObjectList<TFuncaoVO> read FListaFuncaoVO write FListaFuncaoVO;
  end;

implementation

constructor TAdministrativoFormularioVO.Create;
begin
  inherited;
  ListaFuncaoVO := TObjectList<TFuncaoVO>.Create;
end;

destructor TAdministrativoFormularioVO.Destroy;
begin
  ListaFuncaoVO.Free;
  inherited;
end;

end.
