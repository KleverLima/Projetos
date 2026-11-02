unit FRelCheques;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Buttons, ExtCtrls, StdCtrls, Mask, FrmRelatorios, ISFEdit, ISFEditbtn,
  ISFdbEditbtn, IDBEdit, uEstSearchDialogZeos;

type
   TFrmRelCheques = class(TForm)
      Panel1: TPanel;
      GroupBox2: TGroupBox;
      Label3: TLabel;
      Label4: TLabel;
      MskDataIni: TMaskEdit;
      MskDataFim: TMaskEdit;
      Panel2: TPanel;
      BtnSair: TBitBtn;
      Btn_Imprimir: TBitBtn;
      RadioG: TRadioGroup;
      GroupBox1: TGroupBox;
      chkContas: TCheckBox;
      rAgrupar: TRadioGroup;
    FrameRelatorios1: TFrameRelatorios;
    EditContaCorrente: TIDBEditDialog;
    Edit2: TEdit;
      procedure FormCreate(Sender: TObject);
      procedure MskDataIniExit(Sender: TObject);
      procedure MskDataFimExit(Sender: TObject);
      procedure Btn_ImprimirClick(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure BtnSairClick(Sender: TObject);
      procedure chkContasClick(Sender: TObject);

   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmRelCheques: TFrmRelCheques;

implementation

uses FPrincipal, App.SQL, Biblioteca, Global,
  FRelChequesLancados;

{$R *.DFM}

procedure TFrmRelCheques.FormCreate(Sender: TObject);
begin
   MskDataIni.text := DateToStr(date - 30);
   MskDataFim.text := DateToStr(date);
end;

procedure TFrmRelCheques.FormClose(Sender: TObject; var Action: TCloseAction);
begin

   Action := cafree;
end;

procedure TFrmRelCheques.MskDataIniExit(Sender: TObject);
begin
   MskDataIni.text := fncDataValidar(MskDataIni.text);

end;

procedure TFrmRelCheques.MskDataFimExit(Sender: TObject);
begin
   MskDataFim.text := fncDataValidar(MskDataFim.text);

end;

procedure TFrmRelCheques.Btn_ImprimirClick(Sender: TObject);
begin
   // exibir relatório
   FrmRelChequesLancados := TFrmRelChequesLancados.create(self);

end;

procedure TFrmRelCheques.FormKeyPress(Sender: TObject; var Key: Char);
begin

   If Key = #27 then
      CLOSE;

end;

procedure TFrmRelCheques.BtnSairClick(Sender: TObject);
begin
   CLOSE;
end;

procedure TFrmRelCheques.chkContasClick(Sender: TObject);
begin

   If chkContas.Checked = true then
   begin
      EditContaCorrente.Enabled := False;
   end
   Else
   Begin
      EditContaCorrente.Enabled := true;
      EditContaCorrente.SetFocus;
   End;

end;

end.
