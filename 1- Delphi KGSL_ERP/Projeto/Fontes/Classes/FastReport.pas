unit FastReport;
interface
uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, DB,
   frxExportPDF, frxDMPExport, frxOLE, frxDesgn, frxCross,
   frxRich, frxBarcode, frxExportText, frxExportImage, frxExportHTML,
   frxExportXLS, frxExportMail, frxClass, frxExportRTF,
   Classe.Global;
   Procedure prcFastReportEmailConfigurar(Destinatario: String);
   
implementation

uses fBaseComponentes, Global, App.SQL, Biblioteca;

Procedure prcFastReportEmailConfigurar(Destinatario: String);
Begin
   dmBaseComponentes.frxMailExport1.Address     := LowerCase(Destinatario);
   dmBaseComponentes.frxMailExport1.FromCompany :=FParametros.Empresa.NomeFantasia;
End;
end.
