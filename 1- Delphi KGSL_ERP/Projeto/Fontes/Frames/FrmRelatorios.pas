unit FrmRelatorios;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Buttons, StdCtrls, ExtCtrls, Mask, ComCtrls, FDatas, pngimage,
  dxGDIPlusClasses;

type
   TFrameRelatorios = class(TFrame)
    Image3: TImage;
    Image1: TImage;
    Image2: TImage;
    LblBarraTitulo: TLabel;
   private
      { Private declarations }
   public
      { Public declarations }
   end;

implementation

{$R *.dfm}

end.
