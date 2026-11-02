unit ContatoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('CONTATO')]
  TContatoVO = class(TVO)
  private
    FID: Integer;
    FID_PESSOA: Integer;
    FID_EMPRESA: Integer;
    FNOME: String;
    FEMAIL: String;
    FFONE_COMERCIAL: String;
    FFONE_RESIDENCIAL: String;
    FFONE_CELULAR: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_PESSOA','Id Pessoa',80,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdPessoa: Integer  read FID_PESSOA write FID_PESSOA;
    [TColumn('ID_EMPRESA','Id Empresa',80,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    [TColumn('NOME','Nome',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Nome: String  read FNOME write FNOME;
    [TColumn('EMAIL','Email',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Email: String  read FEMAIL write FEMAIL;
    [TColumn('FONE_COMERCIAL','Fone Comercial',112,[ldGrid, ldLookup, ldCombobox], False)]
    property FoneComercial: String  read FFONE_COMERCIAL write FFONE_COMERCIAL;
    [TColumn('FONE_RESIDENCIAL','Fone Residencial',112,[ldGrid, ldLookup, ldCombobox], False)]
    property FoneResidencial: String  read FFONE_RESIDENCIAL write FFONE_RESIDENCIAL;
    [TColumn('FONE_CELULAR','Fone Celular',112,[ldGrid, ldLookup, ldCombobox], False)]
    property FoneCelular: String  read FFONE_CELULAR write FFONE_CELULAR;

  end;

implementation



end.
