unit FUsuariosOnLine;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Buttons, ExtCtrls, FFrameBarra, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
   TFrmUsuariosOnLine = class(TForm)
      Panel1: TPanel;
      BtnSair: TBitBtn;
      ListBoxUserName: TListBox;
    FrmFrameBarra1: TFrmFrameBarra;
    db_UsuarioLog: TFDQuery;
    QryUsuario: TFDQuery;
      procedure BtnSairClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormShow(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmUsuariosOnLine: TFrmUsuariosOnLine;

implementation


{$R *.dfm}

uses FUsuarios;

procedure TFrmUsuariosOnLine.BtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmUsuariosOnLine.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  QryUsuario.Close;
  Action := cafree;
end;

procedure TFrmUsuariosOnLine.FormShow(Sender: TObject);
begin
   QryUsuario.Open;
   ListBoxUserName.Items.Clear;
   QryUsuario.First;
   While not QryUsuario.eof do
   begin
      // se o usuário estiver ativo, então adicioná-lo na lista
      If QryUsuario.FieldByName('ONLINE').AsString = 'S' then
      begin
         ListBoxUserName.Items.Add(QryUsuario.FieldByName('UserName').AsString);
      end;
      QryUsuario.next;
   end;
   QryUsuario.First;

end;

procedure TFrmUsuariosOnLine.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   If (Key = VK_ESCAPE) or (Key = VK_RETURN) then
      close;

end;

end.
