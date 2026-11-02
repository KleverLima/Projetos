unit FRelCompras;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Buttons, ExtCtrls, StdCtrls, Mask, ComCtrls, FrmRelatorios, ISFEdit,
  ISFEditbtn, ISFdbEditbtn, IDBEdit, uEstSearchDialogZeos, FFrameBarra;

type
   TFrmRelCompras = class(TForm)
      Panel1: TPanel;
      PageControl1: TPageControl;
      Tab_Compras: TTabSheet;
      GroupBox2: TGroupBox;
      Label3: TLabel;
      Label4: TLabel;
      MskDataIni: TMaskEdit;
      MskDataFim: TMaskEdit;
      Panel2: TPanel;
      BtnSair: TBitBtn;
      Btn_Imprimir: TBitBtn;
      GroupBox5: TGroupBox;
      chkFornecedor: TCheckBox;
    FrameRelatorios1: TFrameRelatorios;
    EditFornecedor: TIDBEditDialog;
    EditNomeCliente: TEdit;
    FrmFrameBarra1: TFrmFrameBarra;
      procedure FormCreate(Sender: TObject);
      procedure MskDataIniExit(Sender: TObject);
      procedure MskDataFimExit(Sender: TObject);
      procedure Btn_ImprimirClick(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure BtnSairClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
    procedure chkFornecedorClick(Sender: TObject);

   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmRelCompras: TFrmRelCompras;

implementation

uses FPrincipal, App.SQL, Biblioteca, Global,
  FRelComprasFornecedor;

{$R *.DFM}

procedure TFrmRelCompras.FormCreate(Sender: TObject);
begin
   PageControl1.activepage := Tab_Compras;
   MskDataIni.text := DateToStr(date - 30);
   MskDataFim.text := DateToStr(date);
   FrmFrameBarra1.Height := 1;
end;

procedure TFrmRelCompras.FormClose(Sender: TObject; var Action: TCloseAction);
begin

   Action := cafree;
end;

procedure TFrmRelCompras.MskDataIniExit(Sender: TObject);
begin
   MskDataIni.text := fncDataValidar(MskDataIni.text);

end;

procedure TFrmRelCompras.MskDataFimExit(Sender: TObject);
begin
   MskDataFim.text := fncDataValidar(MskDataFim.text);

end;

procedure TFrmRelCompras.Btn_ImprimirClick(Sender: TObject);
begin
   dtDataIni := StrToDate(MskDataIni.text);
   dtDataFim := StrToDate(MskDataFim.text);
   strFornecedor := Trim(EditFornecedor.text);
   try
     FrmRelComprasFornecedor := TFrmRelComprasFornecedor.create(self);
   finally
     if FrmRelComprasFornecedor <> Nil then
       FrmRelComprasFornecedor := Nil;
   end;
end;

procedure TFrmRelCompras.FormKeyPress(Sender: TObject; var Key: Char);
begin

   If Key = #27 then
      CLOSE;

end;

procedure TFrmRelCompras.BtnSairClick(Sender: TObject);
begin
   CLOSE;
end;

procedure TFrmRelCompras.chkFornecedorClick(Sender: TObject);
begin
   if chkFornecedor.Checked = true then
   Begin
      EditFornecedor.Enabled := False;
   End
   Else
   Begin
      EditFornecedor.Enabled := true;
      EditFornecedor.SelectAll;
      EditFornecedor.SetFocus;
   End;

end;

procedure TFrmRelCompras.FormShow(Sender: TObject);
begin
   MskDataIni.SetFocus;
end;

end.
