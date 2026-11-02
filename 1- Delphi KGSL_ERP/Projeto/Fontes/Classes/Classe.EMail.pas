Unit Classe.EMail;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;
type
   { TMailConfig }
   TEmail = Class(TPersistent)
   Private
     { Private declarations }
     FPOPHost            : String;
     FPOPPorta           : Integer;
     FSMTPHost           : String;
     FSMTPPorta          : Integer;
     FUsuario            : String;
     FSenha              : String;
     FSSLTSL             : Boolean;
     FNome               : String;
   Public
     { Public declarations }
     constructor Create;
     property POPHost            : String      read  FPOPHost      write FPOPHost;
     property POPPorta           : Integer     read  FPOPPorta     write FPOPPorta;
     property SMTPHost           : String      read  FSMTPHost     write FSMTPHost;
     property SMTPPorta          : Integer     read  FSMTPPorta    write FSMTPPorta;
     property Usuario            : String      read  FUsuario      write FUsuario;
     property Senha              : String      read  FSenha        write FSenha;
     property SSLTSL             : Boolean     read  FSSLTSL       write FSSLTSL;
     property Nome               : String      read  FNome         write FNome;
   End;
implementation
{ TEmail }
constructor TEmail.Create;
begin
  FPOPHost     := '';
  FPOPPorta    := 0;
  FSMTPHost    := '';
  FSMTPPorta   := 0;
  FUsuario     := '';
  FSenha       := '';
  FSSLTSL      := False;
  FNome        := '';
end;
end.

