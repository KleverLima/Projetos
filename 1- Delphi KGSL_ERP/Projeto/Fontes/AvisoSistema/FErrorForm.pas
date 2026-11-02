unit FErrorForm;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, ExtCtrls, ActnList, pngimage, jpeg;

type
   TFrmErrorForm = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    MemoAviso: TMemo;
    ModuloID: TMemo;
    Panel2: TPanel;
    Button1: TButton;
      procedure Button1Click(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmErrorForm: TFrmErrorForm;

implementation

{$R *.dfm}

procedure TFrmErrorForm.Button1Click(Sender: TObject);
begin
   close;
end;

procedure TFrmErrorForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = vk_escape then
      close;
end;

end.
