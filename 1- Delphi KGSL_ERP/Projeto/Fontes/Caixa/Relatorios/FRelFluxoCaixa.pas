unit FRelFluxoCaixa;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Mask, StdCtrls, ISFEdit, ISFEditbtn, ISFdbEditbtn, IDBEdit,
   uEstSearchDialogZeos, ExtCtrls, frxClass, frxDBSet, DB,
    FrmRelatoriosBotoes, Grids,   DBGrids, FFrameBarra, Buttons, CheckLst,
     StrUtils, Menus, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
   TFrmRelFluxoCaixa = class(TForm)
      PainelPrincipal: TPanel;
      PainelParametros: TPanel;
      FrameRelatoriosBotoes1: TFrameRelatoriosBotoes;
      FrmFrameBarra1: TFrmFrameBarra;
      db_FluxoCaixa: TFDQuery;
      fx_FluxoCaixa: TfrxDBDataset;
    frxReport_Analitico: TfrxReport;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label3: TLabel;
    MskDataFim: TMaskEdit;
    MskDataIni: TMaskEdit;
      procedure MskDataIniExit(Sender: TObject);
      procedure MskDataFimExit(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FrameRelatoriosBotoes1SpbSairClick(Sender: TObject);
      procedure FrameRelatoriosBotoes1SpbImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
   private
      { Private declarations }

   public
      { Public declarations }
   end;

var
   FrmRelFluxoCaixa: TFrmRelFluxoCaixa;

implementation

uses FPrincipal, App.SQL, Biblioteca, Global;

{$R *.dfm}

procedure TFrmRelFluxoCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TFrmRelFluxoCaixa.FormCreate(Sender: TObject);
Var
   i: integer;
begin
   MskDataIni.text := DateToStr(date);
   MskDataFim.text := DateToStr(date + 30);

   FrmFrameBarra1.Height := 1;
end;

procedure TFrmRelFluxoCaixa.FormDestroy(Sender: TObject);
begin
  FrmRelFluxoCaixa := Nil;
end;

procedure TFrmRelFluxoCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key=VK_ESCAPE then
      close;

end;

procedure TFrmRelFluxoCaixa.FrameRelatoriosBotoes1SpbImprimirClick(Sender: TObject);
begin
   try
     db_FluxoCaixa.close;
     db_FluxoCaixa.ParamByName('DTINICIAL').AsDateTime  := StrToDateTime(MskDataIni.text);
     db_FluxoCaixa.ParamByName('DTFINAL').AsDateTime  := StrToDateTime(MskDataFim.text);
     db_FluxoCaixa.Open;

     frxReport_Analitico.ShowReport;
   finally
     db_FluxoCaixa.Close;
   end;
end;

procedure TFrmRelFluxoCaixa.FrameRelatoriosBotoes1SpbSairClick(Sender: TObject);
begin
   FrameRelatoriosBotoes1.SpbSairClick(Sender);
end;

procedure TFrmRelFluxoCaixa.MskDataFimExit(Sender: TObject);
begin
   MskDataFim.text := fncDataValidar(MskDataFim.text);
end;

procedure TFrmRelFluxoCaixa.MskDataIniExit(Sender: TObject);
begin
   MskDataIni.text := fncDataValidar(MskDataIni.text);
end;

end.
