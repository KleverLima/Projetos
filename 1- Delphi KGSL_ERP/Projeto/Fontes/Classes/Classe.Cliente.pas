unit Classe.Cliente;

interface

uses Winapi.Windows, Winapi.Messages, SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.IniFiles, FireDAC.Comp.Client, Data.DB;

type
  TEndereco = Class
  private
    { Private declarations }
    FID          : Integer;
    FNome        : String;
  public
    { Public declarations }
    constructor Create;
    property ID          : Integer        read FID         Write FID;
    property Nome        : String         read FNome       Write FNome;
  end;

implementation

{ TEndereco }

uses App.SQL, Classe.CEP;

constructor TEndereco.Create;
begin
  FID    :=0;
  FNome  :='';
end;

end.

