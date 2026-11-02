unit ClasseCompra;

interface

uses
  System.Generics.Collections;
type
  TCompraItemFiscal = Class
  private
    { Private declarations }
    FID               : Integer;
    FCodFabricante    : String;
    FDescricao        : String;
    FQTDE              : Currency;
    FPICMS            : Currency;
    FVICMS            : Currency;
    FPREDBCST         : Currency;
    FVBCST            : Currency;
    FPICMSST          : Currency;
    FVICMSST          : Currency;
    FPST              : Currency;
    FVBCSTRet         : Currency;
    FVICMSSTRet       : Currency;
    FVICMSSubstituto  : Currency;
    FPREDBCEfet       : Currency;
    FVBCEfet          : Currency;
    FPICMSEfet        : Currency;
    FVICMSEfet        : Currency;

  public
    { Public declarations }
    constructor Create;

    property ID               : Integer     read FID                write FID;
    property CodFabricante    : String      read FCodFabricante     write FCodFabricante;
    property Descricao        : String      read FDescricao         write FDescricao;
    property QTDE             : Currency      read FQTDE              write FQTDE;
    property PICMS            : Currency      read FPICMS             write FPICMS;
    property VICMS            : Currency      read FVICMS             write FVICMS;
    property PREDBCST         : Currency      read FPREDBCST          write FPREDBCST;
    property VBCST            : Currency      read FVBCST             write FVBCST;
    property PICMSST          : Currency      read FPICMSST           write FPICMSST;
    property VICMSST          : Currency      read FVICMSST           write FVICMSST;
    property PST              : Currency      read FPST               write FPST;
    property VBCSTRet         : Currency      read FVBCSTRet          write FVBCSTRet;
    property VICMSSTRet       : Currency      read FVICMSSTRet        write FVICMSSTRet;
    property VICMSSubstituto  : Currency      read FVICMSSubstituto   write FVICMSSubstituto;
    property PREDBCEfet       : Currency      read FPREDBCEfet        write FPREDBCEfet;
    property VBCEfet          : Currency      read FVBCEfet           write FVBCEfet;
    property PICMSEfet        : Currency      read FPICMSEfet         write FPICMSEfet;
    property VICMSEfet        : Currency      read FVICMSEfet         write FVICMSEfet;
  end;

implementation

{ TCompraItemFiscal }

constructor TCompraItemFiscal.Create;
begin
  FID               := 0;
  FCodFabricante    := '';
  FDescricao        := '';
  FQTDE             := 0;
  FPICMS            := 0;
  FVICMS            := 0;
  FPREDBCST         := 0;
  FVBCST            := 0;
  FPICMSST          := 0;
  FVICMSST          := 0;
  FPST              := 0;
  FVBCSTRet         := 0;
  FVICMSSTRet       := 0;
  FVICMSSubstituto  := 0;
  FPREDBCEfet       := 0;
  FVBCEfet          := 0;
  FPICMSEfet        := 0;
  FVICMSEfet        := 0;
end;

end.

