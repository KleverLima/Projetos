unit FEtiquetacaixa;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, StdCtrls, Buttons,
    Grids, DBGrids,
    frxClass, frxDBSet, FFrameBarra, ISFEdit, ISFEditbtn, ISFdbEditbtn,
  IDBEdit, uEstSearchDialogZeos, Classe.Global, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
   TFrmEtiquetacaixa = class(TForm)
    db_notasfiscais: TFDQuery;
    ds_notasfiscais: TDataSource;
    db_clientes: TFDQuery;
    dbfp_notasfiscais: TfrxDBDataset;
    dbfp_clientes: TfrxDBDataset;
    frx_Romeio: TfrxReport;
    DBGrid1: TDBGrid;
    FrmFrameBarra1: TFrmFrameBarra;
    Panel1: TPanel;
    Panel2: TPanel;
    EditQtde: TLabeledEdit;
    BtnImprimir: TBitBtn;
    BtnProcurar: TBitBtn;
    BtnSair: TBitBtn;
    dbProcurarNFe: TIDBEditDialog;
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnProcurarClick(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure db_notasfiscaisAfterScroll(DataSet: TDataSet);
    procedure BtnSairClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure db_notasfiscaisAfterOpen(DataSet: TDataSet);

   private
    procedure CarregarDados;
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmEtiquetacaixa: TFrmEtiquetacaixa;

implementation

uses FPrincipal, App.SQL, Global, Biblioteca, App.Funcoes;


{$R *.dfm}

procedure TFrmEtiquetacaixa.FormCreate(Sender: TObject);
begin
   CarregarDados;
   FrmFrameBarra1.Height := 1;
end;

procedure TFrmEtiquetacaixa.FormDestroy(Sender: TObject);
begin
  FrmEtiquetacaixa := Nil;
end;

procedure TFrmEtiquetacaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   db_notasfiscais.Close;
   Action := Cafree;
end;

procedure TFrmEtiquetacaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   If Key = VK_F8 then
   begin
      BtnProcurar.Click;
   End;


end;

procedure TFrmEtiquetacaixa.BtnImprimirClick(Sender: TObject);
begin
     db_clientes.Close;
     db_clientes.Close;
     db_clientes.ParamByName('EMPRESA').AsInteger      := FSistema.Empresa;
     db_clientes.ParamByName('NOTAFISCAL').AsInteger   := db_notasfiscais.Fieldbyname('NOTAFISCAL').AsInteger;
     frx_Romeio.ShowReport;
     db_clientes.Close;
end;

procedure TFrmEtiquetacaixa.BtnProcurarClick(Sender: TObject);
begin
   if dbProcurarNFe.Execute then
   begin
      db_notasfiscais.Locate('NOTAFISCAL',dbProcurarNFe.ResultFieldAsInteger('NOTAFISCAL'),[]);
   end;
end;

procedure TFrmEtiquetacaixa.BtnSairClick(Sender: TObject);
begin
   close;
end;

procedure TFrmEtiquetacaixa.CarregarDados;
begin
   db_notasfiscais.close;
   db_notasfiscais.ParamByName('EMPRESA').AsInteger := FSistema.Empresa;
   db_notasfiscais.open;
end;



procedure TFrmEtiquetacaixa.db_notasfiscaisAfterOpen(DataSet: TDataSet);
begin
  FormataCampo(db_notasfiscais);
  TFloatField(db_notasfiscais.FieldByName('TRANSPORTADORA_VOLUME')).DisplayFormat := '###,##0';
end;

procedure TFrmEtiquetacaixa.db_notasfiscaisAfterScroll(DataSet: TDataSet);
begin
   EditQtde.Text := db_notasfiscais.FieldByname('TRANSPORTADORA_VOLUME').AsString;
end;

end.
