unit UDMLancamentos_EBS;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider,
  ZAbstractRODataset, ZDataset;

type
  TDMLancamentos_EBS = class(TDataModule)
    dspFuncionario: TDataSetProvider;
    cdsFuncionario: TClientDataSet;
    dsFuncionario: TDataSource;
    dspEmpresa: TDataSetProvider;
    cdsEmpresa: TClientDataSet;
    dsEmpresa: TDataSource;
    sdsFuncionario: TZReadOnlyQuery;
    cdsFuncionariocd_empresa: TSmallintField;
    cdsFuncionariocd_funcionario: TIntegerField;
    cdsFuncionarionome: TStringField;
    cdsFuncionarioendereco: TStringField;
    cdsFuncionarionr_endereco: TIntegerField;
    cdsFuncionariocompl_endereco: TStringField;
    cdsFuncionariobairro: TStringField;
    cdsFuncionariocidade: TStringField;
    cdsFuncionarioestado: TStringField;
    cdsFuncionariocep: TIntegerField;
    cdsFuncionariopai: TStringField;
    cdsFuncionariomae: TStringField;
    cdsFuncionariosexo: TStringField;
    cdsFuncionarioestado_civil: TSmallintField;
    cdsFuncionarionacionalidade: TSmallintField;
    cdsFuncionarioano_chegada: TSmallintField;
    cdsFuncionariograu_instrucao: TSmallintField;
    cdsFuncionariodt_nascimento: TDateTimeField;
    cdsFuncionarioddd_fone: TSmallintField;
    cdsFuncionariotelefone: TIntegerField;
    cdsFuncionarioapelido: TStringField;
    cdsFuncionariochave_acesso: TStringField;
    cdsFuncionariosenha_acesso: TStringField;
    cdsFuncionarioraca: TStringField;
    cdsFuncionariodeficiente: TStringField;
    cdsFuncionariocidade_nascimento: TStringField;
    cdsFuncionarioestado_nascimento: TStringField;
    cdsFuncionarioddd_celular: TSmallintField;
    cdsFuncionariocelular: TIntegerField;
    cdsFuncionarionomecompleto: TStringField;
    cdsFuncionarioemail: TStringField;
    cdsFuncionariodata_chegada: TDateTimeField;
    cdsFuncionariotipo_logradouro: TStringField;
    cdsFuncionariocd_municipio: TIntegerField;
    cdsFuncionariocd_municipio_nascimento: TIntegerField;
    cdsFuncionariofuncionario_aposentado: TStringField;
    cdsFuncionariodata_hora_alteracao: TDateTimeField;
    cdsFuncionarioid: TStringField;
    cdsFuncionarioid_endereco: TStringField;
    cdsFuncionariodt_funcao: TDateTimeField;
    cdsFuncionariocd_funcao: TSmallintField;
    cdsFuncionarionomefuncao: TStringField;
    cdsFuncionarionomeccusto: TStringField;
    cdsFuncionariocd_ccusto: TIntegerField;
    cdsFuncionarionr_carteira: TStringField;
    cdsFuncionarioserie_carteira: TStringField;
    cdsFuncionariodv_serie_carteira: TStringField;
    cdsFuncionariodt_admissao: TDateTimeField;
    cdsFuncionariodt_inicio_aviso: TDateTimeField;
    cdsFuncionarionr_registro: TIntegerField;
    cdsFuncionariotipo_movimentacao: TSmallintField;
    cdsFuncionariodescricaonivel: TStringField;
    sdsEmpresa: TZReadOnlyQuery;
    cdsEmpresacd_empresa: TIntegerField;
    cdsEmpresarazao: TStringField;
    dspProcEvento: TDataSetProvider;
    cdsProcEvento: TClientDataSet;
    dsProcEvento: TDataSource;
    sdsProcEvento: TZReadOnlyQuery;
    mAuxiliar: TClientDataSet;
    mAuxiliarcd_Funcionario: TIntegerField;
    mAuxiliarNomeFuncionario: TStringField;
    mAuxiliarNomeFuncao: TStringField;
    dsmAuxiliar: TDataSource;
    sdsPagamentoAutonomo: TZReadOnlyQuery;
    dspPagamentoAutonomo: TDataSetProvider;
    cdsPagamentoAutonomo: TClientDataSet;
    cdsPagamentoAutonomocd_empresa: TIntegerField;
    cdsPagamentoAutonomocd_autonomo: TIntegerField;
    cdsPagamentoAutonomodt_emissao: TDateTimeField;
    cdsPagamentoAutonomotipo_servico: TSmallintField;
    cdsPagamentoAutonomodescricao_servico: TStringField;
    cdsPagamentoAutonomovl_servico: TFloatField;
    cdsPagamentoAutonomovl_irrf: TFloatField;
    cdsPagamentoAutonomovl_inss_retido: TFloatField;
    dsPagamentoAutonomo: TDataSource;
    mAuxiliarContaCorrente: TStringField;
    mAuxiliarAgencia: TIntegerField;
    cdsProcEventoANO: TSmallintField;
    cdsProcEventoMES: TSmallintField;
    cdsProcEventoVALOR: TFloatField;
    cdsProcEventoTIPO_EVENTO: TStringField;
    cdsProcEventoCOD_FUNCIONARIO: TIntegerField;
    cdsProcEventoNOME: TStringField;
    cdsProcEventoCOD_EVENTO: TIntegerField;
    cdsProcEventoNOME_EVENTO: TStringField;
    cdsProcEventoAGENCIA: TSmallintField;
    cdsProcEventoCONTA_CORRENTE: TStringField;
    cdsProcEventoNOME_FUNCAO: TStringField;
    cdsEmpresacnpj_cpf: TStringField;
    cdsProcEventoDATA_ADMISSAO: TDateTimeField;
    mAuxiliarData_Admissao: TDateField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  DMLancamentos_EBS: TDMLancamentos_EBS;
  ctFuncionario : String;
  ctEstabelecimento : String;
  ctFunLotacao : String;
  ctFunFuncao : String;
  ctFunHorario : String;
  ctEstrutura_1 : String;
  ctEstrutura_2 : String;
  ctEstrutura_3 : String;

implementation

uses DmdDatabase_EBS, DateUtils;

{$R *.dfm}

procedure TDMLancamentos_EBS.DataModuleCreate(Sender: TObject);
begin
  ctFuncionario := sdsFuncionario.SQL.Text;
  cdsEmpresa.Open;
end;

end.
