program Comur_Func;

uses
  Forms,
  DmdDatabase_EBS in 'DmdDatabase_EBS.pas' {dmDatabase_EBS: TDataModule},
  UDMLancamentos_EBS in 'UDMLancamentos_EBS.pas' {DMLancamentos_EBS: TDataModule},
  rsExcelExporta in '..\..\rslib\rsExcelExporta.pas',
  UConsulta in 'UConsulta.pas' {fConsulta},
  URelConsulta in 'URelConsulta.pas' {fRelConsulta};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Relatório dos Rendimentos dos Funcionários';
  Application.CreateForm(TdmDatabase_EBS, dmDatabase_EBS);
  Application.CreateForm(TDMLancamentos_EBS, DMLancamentos_EBS);
  Application.CreateForm(TfConsulta, fConsulta);
  Application.Run;
end.
