unit FImprimirTabela;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, QRExport, QRPDFFilt, QRCtrls, QuickRpt;

type
   TFrmImprimirTabela = class(TForm)
      QuickRep1: TQuickRep;
      Band_Titulos: TQRBand;
      QRDBText9: TQRDBText;
      TabelaDescontos: TQRBand;
      QRBand1: TQRBand;
      QRLabel3: TQRLabel;
      QRLabel4: TQRLabel;
      QRLabel11: TQRLabel;
      QRLabel13: TQRLabel;
      QRSysData3: TQRSysData;
      QRSysData4: TQRSysData;
      QRSysData6: TQRSysData;
      QRShape4: TQRShape;
      QRDBText6: TQRDBText;
      QRDBText7: TQRDBText;
      LblData: TQRLabel;
      LblGrupo: TQRLabel;
      LblSubGrupo: TQRLabel;
      PageFooterBand1: TQRBand;
      LblNomeSistema: TQRDBText;
      QRLabel19: TQRLabel;
      QRLabel23: TQRLabel;
      QRLabel24: TQRLabel;
      QRDBText11: TQRDBText;
      QRDBText10: TQRDBText;
      QRDBText15: TQRDBText;
      QRLabel18: TQRLabel;
      QRLabel17: TQRLabel;
      QRLabel35: TQRLabel;
      QRLabel32: TQRLabel;
      QRDBText8: TQRDBText;
      QRDBText17: TQRDBText;
      QRDBText18: TQRDBText;
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmImprimirTabela: TFrmImprimirTabela;

implementation

uses FTabelaPreco, FPrincipal, Global, Biblioteca;

{$R *.dfm}

procedure TFrmImprimirTabela.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

   Action := cafree;
end;

procedure TFrmImprimirTabela.FormCreate(Sender: TObject);
begin

   LblData.Caption := 'DATA: ' + FrmTabelaPreco.db_TabelaPreco.FieldByName('DATA').AsString;

   if FrmTabelaPreco.BoxGrupo.ItemIndex = 1 then
      LblGrupo.Caption := 'GRUPO: ' + FrmTabelaPreco.EditGrupoNome.Text;

   if FrmTabelaPreco.BoxSubGrupo.ItemIndex = 1 then
      LblSubGrupo.Caption := 'SUBGRUPO: ' +
        FrmTabelaPreco.EditSubGrupoNome.Text;

   QuickRep1.Preview;
   close;

end;

end.
