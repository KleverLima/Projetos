unit FRelDemonstrativo;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Buttons, ExtCtrls, StdCtrls, Mask, DB,
     FrmRelatorios,
   ISFEdit, ISFEditbtn, ISFdbEditbtn, IDBEdit, uEstSearchDialogZeos,
   FFrameBarra;

type
   TFrmRelDemonstrativo = class(TForm)
      Panel1: TPanel;
      Panel2: TPanel;
      BtnSair: TBitBtn;
      Btn_Imprimir: TBitBtn;
      GroupBox3: TGroupBox;
      chkPlanos: TCheckBox;
      GroupBox2: TGroupBox;
      Label3: TLabel;
      Label4: TLabel;
      MskDataIni: TMaskEdit;
      MskDataFim: TMaskEdit;
      RadioMovimentacao: TRadioGroup;
      RadioStatus: TRadioGroup;
      DCodPlano: TIDBEditDialog;
      EditNomePlanoContas: TEdit;
    FrameRelatorios1: TFrameRelatorios;
      procedure Btn_ImprimirClick(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure BtnSairClick(Sender: TObject);
      procedure chkPlanosClick(Sender: TObject);
      procedure MskDataIniExit(Sender: TObject);
      procedure MskDataFimExit(Sender: TObject);

   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmRelDemonstrativo: TFrmRelDemonstrativo;

implementation

uses FPrincipal, App.SQL, Biblioteca, Global,
  FRelDemonstrativoAnalitico;

{$R *.DFM}

procedure TFrmRelDemonstrativo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

   Action := cafree;
end;

procedure TFrmRelDemonstrativo.Btn_ImprimirClick(Sender: TObject);
begin
   FrmRelDemonstrativoAnalitico := TFrmRelDemonstrativoAnalitico.create(self);
End;

procedure TFrmRelDemonstrativo.FormKeyPress(Sender: TObject; var Key: Char);
begin

   If Key = #27 then
      CLOSE;

end;

procedure TFrmRelDemonstrativo.BtnSairClick(Sender: TObject);
begin
   CLOSE;
end;

procedure TFrmRelDemonstrativo.chkPlanosClick(Sender: TObject);
begin

   if chkPlanos.Checked = true then
   Begin
      DCodPlano.Enabled := False;
      EditNomePlanoContas.Enabled := False;
   End
   Else
   Begin
      DCodPlano.Enabled := true;
      EditNomePlanoContas.Enabled := true;
   End;

end;

procedure TFrmRelDemonstrativo.MskDataIniExit(Sender: TObject);
begin
   MskDataIni.text := fncDataValidar(MskDataIni.text);
end;

procedure TFrmRelDemonstrativo.MskDataFimExit(Sender: TObject);
begin
   MskDataFim.text := fncDataValidar(MskDataFim.text);

end;

end.
