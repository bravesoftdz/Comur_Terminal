object dmDatabase_EBS: TdmDatabase_EBS
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 600
  Top = 214
  Height = 342
  Width = 398
  object ZConnection1: TZConnection
    Protocol = 'mysql-4.1'
    Port = 5002
    Database = 'ebs_cordilheira'
    User = 'sa'
    Password = 'S@geBr.2014'
    AutoCommit = False
    Left = 40
    Top = 24
  end
end
