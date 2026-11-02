unit Classe.CEP;

interface

uses System.Generics.Collections, Vcl.Graphics,  System.SysUtils;

type
  TCEP = Class
  private
    { Private declarations }
    FCEP             : String;
    FTipo            : String;
    FEndereco        : String;
    FNumero          : String;
    FComplemento     : String;
    FBairro          : String;
    FIDCidade        : Integer;
    FCidade          : String;
    FIDUF            : Integer;
    FUF              : String;
  public
    { Public declarations }
    constructor Create;

    property CEP            : String         read FCEP           Write FCEP;
    property Tipo           : String         read FTipo          Write FTipo;
    property Endereco       : String         read FEndereco      Write FEndereco;
    property Numero         : String         read FNumero        Write FNumero;
    property Complemento    : String         read FComplemento   Write FComplemento;
    property Bairro         : String         read FBairro        write FBairro;
    property IDCidade       : Integer        read FIDCidade      write FIDCidade;
    property Cidade         : String         read FCidade        write FCidade;
    property IDUF           : Integer        read FIDUF          write FIDUF;
    property UF             : String         read FUF            write FUF;
  end;

implementation

{ TCEP }

constructor TCEP.Create;
begin
    FCEP             :='';
    FEndereco        :='';
    FNumero          :='';
    FComplemento     :='';
    FBairro          :='';
    FIDCidade        :=0;
    FCidade          :='';
    FIDUF            :=0;
    FUF              :='';
end;

end.

