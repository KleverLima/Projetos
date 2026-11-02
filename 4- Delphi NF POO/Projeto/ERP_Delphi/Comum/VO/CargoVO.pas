unit CargoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('CARGO')]
  TCargoVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FNOME: String;
    FDESCRICAO: String;
    FSALARIO: Extended;
    FCBO_1994: String;
    FCBO_2002: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_EMPRESA','Id Empresa',80,[ldGrid, ldLookup], False)]
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    [TColumn('NOME','Nome',400,[ldGrid, ldLookup, ldComboBox], False)]
    property Nome: String  read FNOME write FNOME;
    [TColumn('DESCRICAO','Descrição',450,[ldGrid, ldLookup, ldComboBox], False)]
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    [TColumn('SALARIO','Salário',128,[ldGrid, ldLookup], False)]
    [TFormatter(ftFloatComSeparador)]
    property Salario: Extended  read FSALARIO write FSALARIO;
    [TColumn('CBO_1994','Cbo 1994',80,[ldGrid, ldLookup], False)]
    property Cbo1994: String  read FCBO_1994 write FCBO_1994;
    [TColumn('CBO_2002','Cbo 2002',80,[ldGrid, ldLookup], False)]
    property Cbo2002: String  read FCBO_2002 write FCBO_2002;



  end;

implementation



end.
