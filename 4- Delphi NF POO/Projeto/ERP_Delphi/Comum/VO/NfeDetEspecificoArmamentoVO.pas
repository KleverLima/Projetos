unit NfeDetEspecificoArmamentoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_DET_ESPECIFICO_ARMAMENTO')]
  TNfeDetEspecificoArmamentoVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_DETALHE: Integer;
    FTIPO_ARMA: String;
    FNUMERO_SERIE_ARMA: String;
    FNUMERO_SERIE_CANO: String;
    FDESCRICAO: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_DETALHE','Id Nfe Detalhe',80,[], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeDetalhe: Integer  read FID_NFE_DETALHE write FID_NFE_DETALHE;
    [TColumn('TIPO_ARMA','Tipo Arma',8,[ldGrid, ldLookup, ldCombobox], False)]
    property TipoArma: String  read FTIPO_ARMA write FTIPO_ARMA;
    [TColumn('NUMERO_SERIE_ARMA','Numero Serie Arma',72,[ldGrid, ldLookup, ldCombobox], False)]
    property NumeroSerieArma: String  read FNUMERO_SERIE_ARMA write FNUMERO_SERIE_ARMA;
    [TColumn('NUMERO_SERIE_CANO','Numero Serie Cano',72,[ldGrid, ldLookup, ldCombobox], False)]
    property NumeroSerieCano: String  read FNUMERO_SERIE_CANO write FNUMERO_SERIE_CANO;
    [TColumn('DESCRICAO','Descricao',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Descricao: String  read FDESCRICAO write FDESCRICAO;

  end;

implementation



end.
