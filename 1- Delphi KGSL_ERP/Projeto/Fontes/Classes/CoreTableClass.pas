unit CoreTableClass;

interface

uses Winapi.Windows, Winapi.Messages, SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.IniFiles, FireDAC.Comp.Client, Data.DB;

Type
  TCoreTables = Class
  private
  public
    class procedure  Abrir(aTabelas    : TArray<TFDQuery>);
    class procedure  Cancelar(aTabelas : TArray<TFDQuery>);
    class procedure  Fechar(aTabelas   : TArray<TFDQuery>);
    class procedure  Gravar(aTabelas   : TArray<TFDQuery>);
    Class function   ExecSQL(mSQL : WideString) : Boolean;
  End;

implementation

{ TCoreTables }
uses App.Constantes, Classe.Global;
class procedure TCoreTables.Abrir(aTabelas: TArray<TFDQuery>);
var
  I: Integer;
begin
  for I := Low(aTabelas) to High(aTabelas) do
  begin
    if Assigned(aTabelas[i].Connection) then
    begin
      aTabelas[i].Close;
      aTabelas[i].Open;
    end;
  end;
end;

class procedure TCoreTables.Fechar(aTabelas: TArray<TFDQuery>);
var
  I: Integer;
begin
  for I := Low(aTabelas) to High(aTabelas) do
  begin
    if Assigned(aTabelas[i].Connection) then
      aTabelas[i].Close;
  end;
end;

class procedure TCoreTables.Gravar(aTabelas: TArray<TFDQuery>);
var
  I: Integer;
begin
  // percorrer lista de tabelas
  for I := Low(aTabelas) to High(aTabelas) do
  begin
    // verificar se há conexão atribuida
    if Assigned(aTabelas[i].Connection) then
    Begin
      // verificar estado (se está em modo edição ou inserção)
      if (aTabelas[i].State in [dsedit,dsinsert]) then
      begin
        // Gravar
        aTabelas[i].Post;
      end;
    End;
  end;
end;

class procedure TCoreTables.Cancelar(aTabelas: TArray<TFDQuery>);
var
  I: Integer;
begin
  // percorrer lista de tabelas
  for I := Low(aTabelas) to High(aTabelas) do
  begin
    // verificar se há conexão atribuida
    if Assigned(aTabelas[i].Connection) then
    Begin
      // verificar estado (se está em modo edição ou inserção)
      if (aTabelas[i].State in [dsedit,dsinsert]) then
      begin
        // Gravar
        aTabelas[i].Cancel;
      end;
    End;
  end;
end;

class function TCoreTables.ExecSQL(mSQL: WideString): Boolean;
begin
  Result := False;
  try
    FConexao.Transaction.StartTransaction;
    FConexao.ExecSQL(mSQL);
    FConexao.Transaction.Commit;
    Result :=True;
  except
    on E: EDatabaseError do
    begin
      FConexao.Transaction.Rollback;
    end;
  end;
end;

end.
