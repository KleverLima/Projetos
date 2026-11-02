unit FFramePadrao;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, FFrameBotoes, FFrameBarra, ExtCtrls, StdCtrls;

type
   TFrmFramePadrao = class(TFrame)
      PNPainelPrincipal: TPanel;
      FrmFrameBarra1: TFrmFrameBarra;
   private
      { Private declarations }
   public
      { Public declarations }
   end;

implementation

{$R *.dfm}

end.
