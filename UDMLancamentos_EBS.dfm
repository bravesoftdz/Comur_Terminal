object DMLancamentos_EBS: TDMLancamentos_EBS
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 282
  Top = 66
  Height = 624
  Width = 1084
  object dspFuncionario: TDataSetProvider
    DataSet = sdsFuncionario
    Left = 152
    Top = 48
  end
  object cdsFuncionario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFuncionario'
    Left = 216
    Top = 48
    object cdsFuncionariocd_empresa: TSmallintField
      FieldName = 'cd_empresa'
      Required = True
    end
    object cdsFuncionariocd_funcionario: TIntegerField
      FieldName = 'cd_funcionario'
      Required = True
    end
    object cdsFuncionarionome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object cdsFuncionarioendereco: TStringField
      FieldName = 'endereco'
      Size = 40
    end
    object cdsFuncionarionr_endereco: TIntegerField
      FieldName = 'nr_endereco'
    end
    object cdsFuncionariocompl_endereco: TStringField
      FieldName = 'compl_endereco'
      Size = 15
    end
    object cdsFuncionariobairro: TStringField
      FieldName = 'bairro'
    end
    object cdsFuncionariocidade: TStringField
      FieldName = 'cidade'
    end
    object cdsFuncionarioestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object cdsFuncionariocep: TIntegerField
      FieldName = 'cep'
    end
    object cdsFuncionariopai: TStringField
      FieldName = 'pai'
      Size = 50
    end
    object cdsFuncionariomae: TStringField
      FieldName = 'mae'
      Size = 50
    end
    object cdsFuncionariosexo: TStringField
      FieldName = 'sexo'
      Size = 1
    end
    object cdsFuncionarioestado_civil: TSmallintField
      FieldName = 'estado_civil'
    end
    object cdsFuncionarionacionalidade: TSmallintField
      FieldName = 'nacionalidade'
    end
    object cdsFuncionarioano_chegada: TSmallintField
      FieldName = 'ano_chegada'
    end
    object cdsFuncionariograu_instrucao: TSmallintField
      FieldName = 'grau_instrucao'
    end
    object cdsFuncionariodt_nascimento: TDateTimeField
      FieldName = 'dt_nascimento'
    end
    object cdsFuncionarioddd_fone: TSmallintField
      FieldName = 'ddd_fone'
    end
    object cdsFuncionariotelefone: TIntegerField
      FieldName = 'telefone'
    end
    object cdsFuncionarioapelido: TStringField
      FieldName = 'apelido'
      Size = 15
    end
    object cdsFuncionariochave_acesso: TStringField
      FieldName = 'chave_acesso'
      Size = 10
    end
    object cdsFuncionariosenha_acesso: TStringField
      FieldName = 'senha_acesso'
      Size = 10
    end
    object cdsFuncionarioraca: TStringField
      FieldName = 'raca'
      Size = 1
    end
    object cdsFuncionariodeficiente: TStringField
      FieldName = 'deficiente'
      Size = 1
    end
    object cdsFuncionariocidade_nascimento: TStringField
      FieldName = 'cidade_nascimento'
    end
    object cdsFuncionarioestado_nascimento: TStringField
      FieldName = 'estado_nascimento'
      Size = 2
    end
    object cdsFuncionarioddd_celular: TSmallintField
      FieldName = 'ddd_celular'
    end
    object cdsFuncionariocelular: TIntegerField
      FieldName = 'celular'
    end
    object cdsFuncionarionomecompleto: TStringField
      FieldName = 'nomecompleto'
      Size = 70
    end
    object cdsFuncionarioemail: TStringField
      FieldName = 'email'
      Size = 100
    end
    object cdsFuncionariodata_chegada: TDateTimeField
      FieldName = 'data_chegada'
    end
    object cdsFuncionariotipo_logradouro: TStringField
      FieldName = 'tipo_logradouro'
      Size = 5
    end
    object cdsFuncionariocd_municipio: TIntegerField
      FieldName = 'cd_municipio'
    end
    object cdsFuncionariocd_municipio_nascimento: TIntegerField
      FieldName = 'cd_municipio_nascimento'
    end
    object cdsFuncionariofuncionario_aposentado: TStringField
      FieldName = 'funcionario_aposentado'
      Size = 1
    end
    object cdsFuncionariodata_hora_alteracao: TDateTimeField
      FieldName = 'data_hora_alteracao'
    end
    object cdsFuncionarioid: TStringField
      FieldName = 'id'
      Size = 32
    end
    object cdsFuncionarioid_endereco: TStringField
      FieldName = 'id_endereco'
      Size = 32
    end
    object cdsFuncionariodt_funcao: TDateTimeField
      FieldName = 'dt_funcao'
      Required = True
    end
    object cdsFuncionariocd_funcao: TSmallintField
      FieldName = 'cd_funcao'
    end
    object cdsFuncionarionomefuncao: TStringField
      FieldName = 'nomefuncao'
    end
    object cdsFuncionarionomeccusto: TStringField
      FieldName = 'nomeccusto'
      Size = 100
    end
    object cdsFuncionariocd_ccusto: TIntegerField
      FieldName = 'cd_ccusto'
    end
    object cdsFuncionarionr_carteira: TStringField
      FieldName = 'nr_carteira'
      Size = 8
    end
    object cdsFuncionarioserie_carteira: TStringField
      FieldName = 'serie_carteira'
      Size = 5
    end
    object cdsFuncionariodv_serie_carteira: TStringField
      FieldName = 'dv_serie_carteira'
      Size = 2
    end
    object cdsFuncionariodt_admissao: TDateTimeField
      FieldName = 'dt_admissao'
    end
    object cdsFuncionariodt_inicio_aviso: TDateTimeField
      FieldName = 'dt_inicio_aviso'
    end
    object cdsFuncionarionr_registro: TIntegerField
      FieldName = 'nr_registro'
    end
    object cdsFuncionariotipo_movimentacao: TSmallintField
      FieldName = 'tipo_movimentacao'
      ReadOnly = True
    end
    object cdsFuncionariodescricaonivel: TStringField
      FieldName = 'descricaonivel'
      Size = 50
    end
  end
  object dsFuncionario: TDataSource
    DataSet = cdsFuncionario
    Left = 280
    Top = 48
  end
  object dspEmpresa: TDataSetProvider
    DataSet = sdsEmpresa
    Left = 536
    Top = 56
  end
  object cdsEmpresa: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'razao'
    Params = <>
    ProviderName = 'dspEmpresa'
    Left = 600
    Top = 56
    object cdsEmpresacd_empresa: TIntegerField
      FieldName = 'cd_empresa'
      Required = True
    end
    object cdsEmpresarazao: TStringField
      FieldName = 'razao'
      Size = 40
    end
    object cdsEmpresacnpj_cpf: TStringField
      FieldName = 'cnpj_cpf'
      Size = 18
    end
  end
  object dsEmpresa: TDataSource
    DataSet = cdsEmpresa
    Left = 664
    Top = 56
  end
  object sdsFuncionario: TZReadOnlyQuery
    Connection = dmDatabase_EBS.ZConnection1
    AutoCalcFields = False
    SQL.Strings = (
      
        'select f.*, ff.dt_funcao, ffun.cd_funcao, fcad.descricao nomefun' +
        'cao,'
      ' ccusto.descricao nomeccusto, flot.cd_ccusto, fd.nr_carteira, '
      
        ' fd.serie_carteira, fd.dv_serie_carteira, FunFuncional.dt_admiss' +
        'ao,'
      
        'FunFuncional.dt_inicio_aviso, FunFuncional.nr_registro, fm.tipo_' +
        'movimentacao, es2.descricao descricaonivel'
      ' '
      ' from funcionario f'
      
        ' inner join (select max(dt_funcao) dt_funcao, cd_empresa, cd_fun' +
        'cionario               '
      '               from FunFuncao'
      '               group by cd_empresa, cd_funcionario) ff'
      '     on f.cd_empresa = ff.cd_empresa'
      '     and f.cd_funcionario = ff.cd_funcionario'
      ' inner join FunFuncao ffun '
      '     on f.cd_empresa = ffun.cd_empresa'
      '     and f.cd_funcionario = ffun.cd_funcionario'
      '     and ff.dt_funcao = ffun.dt_funcao'
      ''
      ' inner join Funcao fcad'
      '     on ffun.cd_empresa = fcad.enterprise_id'
      '     and ffun.cd_funcao = fcad.cd_funcao'
      ''
      
        ' inner join (select max(dt_lotacao) dt_lotacao, cd_empresa, cd_f' +
        'uncionario  '
      '              from FunLotacao'
      '              group by cd_empresa, cd_funcionario) fl'
      '     on f.cd_empresa = fl.cd_empresa'
      '     and f.cd_funcionario = fl.cd_funcionario'
      ''
      ' inner join funlotacao flot'
      '     on f.cd_empresa = flot.cd_empresa'
      '     and f.cd_funcionario = flot.cd_funcionario'
      '     and fl.dt_lotacao = flot.dt_lotacao'
      ''
      ' inner join ccusto '
      '     on flot.cd_empresa = ccusto.enterprise_id'
      '     and flot.cd_ccusto = CCusto.cd_ccusto '
      ''
      'inner join FunFuncional '
      '    on f.cd_empresa = FunFuncional.cd_empresa'
      '    and f.cd_funcionario = FunFuncional.cd_funcionario'
      ''
      'left join Rescisao rec'
      '   on f.cd_empresa = rec.cd_empresa'
      '    and f.cd_funcionario = rec.cd_funcionario'
      '    and rec.tp_rescisao = '#39'N'#39
      '   '
      ''
      
        'left join  (select max(fm1.dt_retorno) dt_retorno, fm1.cd_empres' +
        'a, fm1.cd_funcionario, fm1.tipo_movimentacao  '
      '                   from FunMovimentacao fm1'
      
        '                     where  ((fm1.tipo_movimentacao <> 2) or (fm' +
        '1.tipo_movimentacao is null))'
      
        '                       group by fm1.cd_empresa, fm1.cd_funcionar' +
        'io, fm1.tipo_movimentacao) fm'
      '   on f.cd_empresa = fm.cd_empresa'
      '   and f.cd_funcionario = fm.cd_funcionario'
      ''
      'left join Estrutura es2'
      '  on flot.cd_empresa = es2.cd_empresa'
      '  and flot.cd_nivel1 = es2.cd_nivel1'
      '  and flot.cd_nivel2 = es2.cd_nivel2'
      '  and flot.cd_nivel3 = es2.cd_nivel3'
      ' '
      'left join fundocumento fd'
      '   on f.cd_empresa = fd.cd_empresa'
      '   and f.cd_funcionario = fd.cd_funcionario'
      
        '   where  ((fm.tipo_movimentacao <> 2) or (fm.tipo_movimentacao ' +
        'is null))')
    Params = <>
    Left = 74
    Top = 49
  end
  object sdsEmpresa: TZReadOnlyQuery
    Connection = dmDatabase_EBS.ZConnection1
    SQL.Strings = (
      'select cd_empresa, razao, cnpj_cpf '#10'from CRDEmpresa')
    Params = <>
    Left = 480
    Top = 56
  end
  object dspProcEvento: TDataSetProvider
    DataSet = sdsProcEvento
    Left = 160
    Top = 144
  end
  object cdsProcEvento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProcEvento'
    Left = 224
    Top = 143
    object cdsProcEventoANO: TSmallintField
      FieldName = 'ANO'
      Required = True
    end
    object cdsProcEventoMES: TSmallintField
      FieldName = 'MES'
      Required = True
    end
    object cdsProcEventoVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object cdsProcEventoTIPO_EVENTO: TStringField
      FieldName = 'TIPO_EVENTO'
      ReadOnly = True
      Size = 1
    end
    object cdsProcEventoCOD_FUNCIONARIO: TIntegerField
      FieldName = 'COD_FUNCIONARIO'
      Required = True
    end
    object cdsProcEventoNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsProcEventoCOD_EVENTO: TIntegerField
      FieldName = 'COD_EVENTO'
      Required = True
    end
    object cdsProcEventoNOME_EVENTO: TStringField
      FieldName = 'NOME_EVENTO'
      Size = 30
    end
    object cdsProcEventoAGENCIA: TSmallintField
      FieldName = 'AGENCIA'
    end
    object cdsProcEventoCONTA_CORRENTE: TStringField
      FieldName = 'CONTA_CORRENTE'
      ReadOnly = True
      Size = 11
    end
    object cdsProcEventoNOME_FUNCAO: TStringField
      FieldName = 'NOME_FUNCAO'
      ReadOnly = True
    end
    object cdsProcEventoDATA_ADMISSAO: TDateTimeField
      FieldName = 'DATA_ADMISSAO'
    end
  end
  object dsProcEvento: TDataSource
    DataSet = cdsProcEvento
    Left = 288
    Top = 144
  end
  object sdsProcEvento: TZReadOnlyQuery
    Connection = dmDatabase_EBS.ZConnection1
    AutoCalcFields = False
    SQL.Strings = (
      'SELECT '
      '    pro.ano ANO,'
      '    pro.mes MES,'
      '    pro.valor VALOR,'
      '    CASE'
      '      WHEN eve.tp_evento = '#39'V'#39' THEN '#39'1'#39
      '      WHEN eve.tp_evento = '#39'D'#39' THEN '#39'2'#39
      '    END TIPO_EVENTO,'
      '    fun.cd_funcionario COD_FUNCIONARIO,'
      '    fun.nome NOME,'
      '    pro.cd_evento COD_EVENTO,'
      '    eve.descricao NOME_EVENTO,'
      '    ffun.nr_agencia_deposito AGENCIA,'
      '    ffun.dt_admissao DATA_ADMISSAO,'
      
        '    concat(cast(ffun.nr_conta_deposito  as char(10)),ffun.dv_con' +
        'ta_deposito) as CONTA_CORRENTE,'
      '    (SELECT '
      '            f.descricao'
      '        FROM'
      '            funfuncao b'
      '                INNER JOIN'
      '            funcao f ON b.cd_funcao = f.cd_funcao'
      '        WHERE'
      '            b.dt_final >= '#39'2016/01/01'#39
      '                AND b.cd_empresa = 1'
      '                AND b.cd_funcionario = fun.cd_funcionario'
      '        LIMIT 1) NOME_FUNCAO'
      'FROM'
      '    procevento pro'
      '        INNER JOIN'
      '    funcionario fun ON fun.cd_funcionario = pro.cd_funcionario'
      '        INNER JOIN'
      '    eventog eve ON eve.cd_evento = pro.cd_evento'
      '        LEFT JOIN'
      
        '    funfuncional ffun ON ffun.cd_funcionario = fun.cd_funcionari' +
        'o'
      'WHERE'
      
        '    pro.mes = 1 AND pro.ano = 2016 AND ffun.nr_agencia_deposito ' +
        'is not null and ffun.cd_banco_deposito = 1'
      '        AND pro.cd_empresa = 1'
      '        AND pro.tipo <> '#39'1'#39
      '        AND ((eve.tp_evento = '#39'V'#39')'
      '        OR ((eve.tp_evento = '#39'D'#39')))'
      
        'order by ffun.nr_agencia_deposito,fun.cd_funcionario,Tipo_Evento' +
        ', eve.cd_evento'
      ' '
      ' ')
    Params = <>
    Left = 72
    Top = 143
  end
  object mAuxiliar: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'cd_Funcionario'
        DataType = ftInteger
      end
      item
        Name = 'NomeFuncionario'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NomeFuncao'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Agencia'
        DataType = ftInteger
      end
      item
        Name = 'ContaCorrente'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Data_Admissao'
        DataType = ftDate
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    Params = <>
    StoreDefs = True
    Left = 505
    Top = 325
    Data = {
      D20000009619E0BD010000001800000006000000000003000000D2000E63645F
      46756E63696F6E6172696F04000100000000000F4E6F6D6546756E63696F6E61
      72696F0100490000000100055749445448020002003C000A4E6F6D6546756E63
      616F0100490000000100055749445448020002003C00074167656E6369610400
      0100000000000D436F6E7461436F7272656E7465010049000000010005574944
      5448020002000A000D446174615F41646D697373616F04000600000000000100
      0D44454641554C545F4F524445520200820000000000}
    object mAuxiliarcd_Funcionario: TIntegerField
      FieldName = 'cd_Funcionario'
    end
    object mAuxiliarNomeFuncionario: TStringField
      FieldName = 'NomeFuncionario'
      Size = 60
    end
    object mAuxiliarNomeFuncao: TStringField
      FieldName = 'NomeFuncao'
      Size = 60
    end
    object mAuxiliarAgencia: TIntegerField
      FieldName = 'Agencia'
    end
    object mAuxiliarContaCorrente: TStringField
      FieldName = 'ContaCorrente'
      Size = 10
    end
    object mAuxiliarData_Admissao: TDateField
      FieldName = 'Data_Admissao'
    end
  end
  object dsmAuxiliar: TDataSource
    DataSet = mAuxiliar
    Left = 537
    Top = 325
  end
  object sdsPagamentoAutonomo: TZReadOnlyQuery
    Connection = dmDatabase_EBS.ZConnection1
    SQL.Strings = (
      
        #10'select p.cd_empresa, p.cd_autonomo, p.dt_emissao, p.tipo_servic' +
        'o, p.descricao_servico, p.vl_servico,'#10'p.vl_irrf, vl_inss_retido'#10
      'from pagamentoautonomo p')
    Params = <>
    Left = 58
    Top = 208
  end
  object dspPagamentoAutonomo: TDataSetProvider
    DataSet = sdsPagamentoAutonomo
    Left = 160
    Top = 200
  end
  object cdsPagamentoAutonomo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPagamentoAutonomo'
    Left = 216
    Top = 208
    object cdsPagamentoAutonomocd_empresa: TIntegerField
      FieldName = 'cd_empresa'
      Required = True
    end
    object cdsPagamentoAutonomocd_autonomo: TIntegerField
      FieldName = 'cd_autonomo'
      Required = True
    end
    object cdsPagamentoAutonomodt_emissao: TDateTimeField
      FieldName = 'dt_emissao'
      Required = True
    end
    object cdsPagamentoAutonomotipo_servico: TSmallintField
      FieldName = 'tipo_servico'
    end
    object cdsPagamentoAutonomodescricao_servico: TStringField
      FieldName = 'descricao_servico'
      Size = 150
    end
    object cdsPagamentoAutonomovl_servico: TFloatField
      FieldName = 'vl_servico'
    end
    object cdsPagamentoAutonomovl_irrf: TFloatField
      FieldName = 'vl_irrf'
    end
    object cdsPagamentoAutonomovl_inss_retido: TFloatField
      FieldName = 'vl_inss_retido'
    end
  end
  object dsPagamentoAutonomo: TDataSource
    DataSet = cdsPagamentoAutonomo
    Left = 288
    Top = 200
  end
end
