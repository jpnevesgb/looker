view: statistics_bucket_outlier_maas {
  sql_table_name: monitoring_maas.statistics_bucket_outlier ;;
  suggestions: yes


  dimension: last_period {
    type: string
    sql: case when time_window = 'MONTH'
          then date_format(current_date - interval '1' day, '%Y%m')
          else date_format(current_date - interval '1' day, '%Y%v')
        end ;;
  }


  dimension: fl_last_period {
    type: string
    sql: case when ${last_period} = ${period} then 'Y' else 'N' end;;
  }


  dimension: var_key {
    type: string
    sql: ${TABLE}.var_key ;;
  }


  dimension: bank {
    type: string
    sql: ${TABLE}.bank ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: partner {
    type: string
    sql: ${TABLE}.partner ;;
  }

  dimension: period {
    type: string
    sql: ${TABLE}.period ;;
  }

  dimension: profile {
    type: string
    sql: ${TABLE}.profile ;;
  }

  dimension: time_window {
    type: string
    sql: ${TABLE}.time_window ;;
  }

  dimension: limits {
    type: string
    sql: case when ${TABLE}.category = 'BUCKET'
          then cast(round(${lower_limit},2) as varchar(20)) || ' to ' || cast(${upper_limit} as varchar(20))
          else ' < ' || cast(round(${lower_limit},2) as varchar(20)) || ' or > ' || cast(${upper_limit} as varchar(20))
          end ;;
  }

  dimension: upper_limit {
    type: number
    value_format_name: decimal_2
    sql: ${TABLE}.upper_limit;;
  }

  dimension: lower_limit {
    type: number
    value_format_name: decimal_2
    sql: ${TABLE}.lower_limit ;;
  }


  dimension: is_gbconnect {
    type: string
    sql: case when ${var_key} in (
      'GUIABOLSO.V3.SAIDAS_BRUTA.MES_1',
      'GUIABOLSO.V3.SAIDAS_BRUTA.MES_2',
      'GUIABOLSO.V3.SAIDAS_BRUTA.MES_3',
      'GUIABOLSO.V3.SAIDAS_BRUTA.MES_4',
      'GUIABOLSO.V2.SALDO_POUPANCA',
      'GUIABOLSO.V3.ENTRADA_REAL.MES_1',
      'GUIABOLSO.V3.ENTRADA_REAL.MES_2',
      'GUIABOLSO.V3.ENTRADA_REAL.MES_3',
      'GUIABOLSO.V3.ENTRADA_REAL.MES_4',
      'USER.ACCOUNTS[?].ACCOUNTDIGIT',
      'USER.ACCOUNTS[?].FULLNAME',
      'USER.ACCOUNTS[?].ACCOUNTNUMBER',
      'GUIABOLSO.DATA_DA_TRANSACAO_MAIS_RECENTE',
      'USER.ACCOUNTS.LENGTH',
      'GUIABOLSO.GB0018-APPLICATION-SCORE-PREQUALIFY',
      'GUIABOLSO.GB0006-APPLICATION-SCORE-PREQUALIFY',
      'GUIABOLSO.GB0007-PROPENSITY-SCORE',
      'USER.EMAIL',
      'GUIABOLSO.USER.TYPE',
      'GUIABOLSO.V3.ENTRADA_BRUTA.MES_1',
      'GUIABOLSO.V3.ENTRADA_BRUTA.MES_2',
      'GUIABOLSO.V3.ENTRADA_BRUTA.MES_3',
      'GUIABOLSO.V3.ENTRADA_BRUTA.MES_4',
      'USER.ACCOUNTS[0].CPF',
      'USER.ACCOUNTS[1].CPF',
      'USER.ACCOUNTS[2].CPF',
      'USER.ACCOUNTS[3].CPF',
      'USER.ACCOUNTS[0].AGENCY',
      'USER.ACCOUNTS[1].AGENCY',
      'USER.ACCOUNTS[2].AGENCY',
      'USER.ACCOUNTS[3].AGENCY',
      'GUIABOLSO.ENTRADA_SEGURO.1',
      'GUIABOLSO.ENTRADA_SEGURO.2',
      'GUIABOLSO.ENTRADA_SEGURO.3',
      'GUIABOLSO.SEGURO.1',
      'GUIABOLSO.SEGURO.2',
      'GUIABOLSO.SEGURO.3',
      'GUIABOLSO.SAQUE.1',
      'GUIABOLSO.SAQUE.2',
      'GUIABOLSO.SAQUE.3',
      'GUIABOLSO.V2.SALDO.1',
      'GUIABOLSO.V2.SALDO.2',
      'GUIABOLSO.V2.SALDO.3',
      'GUIABOLSO.V2.SALDO.MES_FECHADO_1',
      'GUIABOLSO.V2.SALDO.MES_FECHADO_2',
      'GUIABOLSO.V2.SALDO.MES_FECHADO_3',
      'GUIABOLSO.V2.SALDO.MES_FECHADO_4',
      'USER.ACCOUNTS[0].BANK',
      'USER.ACCOUNTS[1].BANK',
      'USER.ACCOUNTS[2].BANK',
      'USER.ACCOUNTS[3].BANK',
      'GUIABOLSO.GASTOS_COM_CARTAO.1',
      'GUIABOLSO.GASTOS_COM_CARTAO.2',
      'GUIABOLSO.GASTOS_COM_CARTAO.3',
      'GUIABOLSO.V3.FLUXO_DE_CAIXA.1',
      'GUIABOLSO.V3.FLUXO_DE_CAIXA.2',
      'GUIABOLSO.V3.FLUXO_DE_CAIXA.3',
      'GUIABOLSO.V3.PARCELAMENTO_FATURA.1',
      'GUIABOLSO.V3.PARCELAMENTO_FATURA.2',
      'GUIABOLSO.V3.PARCELAMENTO_FATURA.3',
      'GUIABOLSO.V2.JUROS_DE_CARTAO.1',
      'GUIABOLSO.V2.JUROS_DE_CARTAO.2',
      'GUIABOLSO.V2.JUROS_DE_CARTAO.3',
      'GUIABOLSO.PAGAMENTO_DE_CARTAO_NA_CC.1',
      'GUIABOLSO.PAGAMENTO_DE_CARTAO_NA_CC.2',
      'GUIABOLSO.PAGAMENTO_DE_CARTAO_NA_CC.3',
      'GUIABOLSO.V2.PAGAMENTO_DE_CARTAO.1',
      'GUIABOLSO.V2.PAGAMENTO_DE_CARTAO.2',
      'GUIABOLSO.V2.PAGAMENTO_DE_CARTAO.3',
      'GUIABOLSO.DATA_DE_REFERENCIA',
      'GUIABOLSO.DIAS_DESDE_PRIMEIRA_CONEXAO',
      'GUIABOLSO.NUMERO_DE_DIAS_COM_SALDO_NEGATIVO.1#',
      'GUIABOLSO.NUMERO_DE_DIAS_COM_SALDO_NEGATIVO.2#',
      'GUIABOLSO.NUMERO_DE_DIAS_COM_SALDO_NEGATIVO.3#',
      'GUIABOLSO.V2.DESPESAS_FINANCEIRAS.1',
      'GUIABOLSO.V2.DESPESAS_FINANCEIRAS.2',
      'GUIABOLSO.V2.DESPESAS_FINANCEIRAS.3',
      'GUIABOLSO.GASTOS_POSTO_GASOLINA.1',
      'GUIABOLSO.GASTOS_POSTO_GASOLINA.2',
      'GUIABOLSO.GASTOS_POSTO_GASOLINA.3',
      'GUIABOLSO.NUMERO_TRANSACOES_GASTOS_POSTO_GASOLINA.1',
      'GUIABOLSO.NUMERO_TRANSACOES_GASTOS_POSTO_GASOLINA.2',
      'GUIABOLSO.NUMERO_TRANSACOES_GASTOS_POSTO_GASOLINA.3',
      'GUIABOLSO.V3.ENTRADA_BRUTA.1',
      'GUIABOLSO.V3.ENTRADA_BRUTA.2',
      'GUIABOLSO.V3.ENTRADA_BRUTA.3',
      'GUIABOLSO.V3.SAIDAS_BRUTA.1',
      'GUIABOLSO.V3.SAIDAS_BRUTA.2',
      'GUIABOLSO.V3.SAIDAS_BRUTA.3',
      'GUIABOLSO.TEM_CARTAO_CREDITO.1?',
      'GUIABOLSO.TEM_CARTAO_CREDITO.2?',
      'GUIABOLSO.TEM_CARTAO_CREDITO.3?',
      'GUIABOLSO.TEM_CARRO?',
      'GUIABOLSO.V3.INSS.1',
      'GUIABOLSO.V3.INSS.2',
      'GUIABOLSO.V3.INSS.3',
      'GUIABOLSO.SALDO_CDB',
      'GUIABOLSO.SALDO_FUNDOS',
      'GUIABOLSO.SALDO_PREVIDENCIA',
      'GUIABOLSO.V2.INVESTIMENTOS_CORRETORAS_INDEPENDENTES_APLICACAO.1',
      'GUIABOLSO.V2.INVESTIMENTOS_CORRETORAS_INDEPENDENTES_APLICACAO.2',
      'GUIABOLSO.V2.INVESTIMENTOS_CORRETORAS_INDEPENDENTES_APLICACAO.3',
      'GUIABOLSO.V2.INVESTIMENTOS_CORRETORAS_INDEPENDENTES_RESGATE.1',
      'GUIABOLSO.V2.INVESTIMENTOS_CORRETORAS_INDEPENDENTES_RESGATE.2',
      'GUIABOLSO.V2.INVESTIMENTOS_CORRETORAS_INDEPENDENTES_RESGATE.3',
      'GUIABOLSO.V4.INVESTIMENTOS_APLICACAO.1',
      'GUIABOLSO.V4.INVESTIMENTOS_APLICACAO.2',
      'GUIABOLSO.V4.INVESTIMENTOS_APLICACAO.3',
      'GUIABOLSO.V4.INVESTIMENTOS_RESGATE.1',
      'GUIABOLSO.V4.INVESTIMENTOS_RESGATE.2',
      'GUIABOLSO.V4.INVESTIMENTOS_RESGATE.3',
      'GUIABOLSO.V2.IOF_INTERNACIONAL.1',
      'GUIABOLSO.V2.IOF_INTERNACIONAL.2',
      'GUIABOLSO.V2.IOF_INTERNACIONAL.3',
      'GUIABOLSO.V2.IOF_INTERNACIONAL_COUNT.1',
      'GUIABOLSO.V2.IOF_INTERNACIONAL_COUNT.2',
      'GUIABOLSO.V2.IOF_INTERNACIONAL_COUNT.3',
      'GUIABOLSO.PAGAMENTO_IPVA.1',
      'GUIABOLSO.PAGAMENTO_IPVA.2',
      'GUIABOLSO.PAGAMENTO_IPVA.3',
      'GUIABOLSO.DEMITIDO.1?',
      'GUIABOLSO.DEMITIDO.2?',
      'GUIABOLSO.DEMITIDO.3?',
      'GUIABOLSO.V3.ENTRADA_POR_EMPRESTIMO.1',
      'GUIABOLSO.V3.ENTRADA_POR_EMPRESTIMO.2',
      'GUIABOLSO.V3.ENTRADA_POR_EMPRESTIMO.3',
      'GUIABOLSO.V3.SAIDAS_POR_EMPRESTIMO.1',
      'GUIABOLSO.V3.SAIDAS_POR_EMPRESTIMO.2',
      'GUIABOLSO.V3.SAIDAS_POR_EMPRESTIMO.3',
      'GUIABOLSO.V2.SALDO_MAIS_BAIXO.1',
      'GUIABOLSO.V2.SALDO_MAIS_BAIXO.2',
      'GUIABOLSO.V2.SALDO_MAIS_BAIXO.3',
      'GUIABOLSO.V2.SALDO_MAIS_BAIXO.MES_1',
      'GUIABOLSO.V2.SALDO_MAIS_BAIXO.MES_2',
      'GUIABOLSO.V2.SALDO_MAIS_BAIXO.MES_3',
      'GUIABOLSO.V2.SALDO_MAIS_BAIXO.MES_4',
      'GUIABOLSO.V2.SALDO_MAIS_ALTO.1',
      'GUIABOLSO.V2.SALDO_MAIS_ALTO.2',
      'GUIABOLSO.V2.SALDO_MAIS_ALTO.3',
      'GUIABOLSO.V2.SALDO_MAIS_ALTO.MES_1',
      'GUIABOLSO.V2.SALDO_MAIS_ALTO.MES_2',
      'GUIABOLSO.V2.SALDO_MAIS_ALTO.MES_3',
      'GUIABOLSO.V2.SALDO_MAIS_ALTO.MES_4',
      'GUIABOLSO.CARTOES_CREDITO_CONECTADOS#',
      'GUIABOLSO.NUMERO_DE_CARTOES#',
      'GUIABOLSO.TRANSACOES_POR_PERIODO#.1',
      'GUIABOLSO.TRANSACOES_POR_PERIODO#.2',
      'GUIABOLSO.TRANSACOES_POR_PERIODO#.3',
      'GUIABOLSO.ESTOURO_CHEQUE_ESPECIAL.1',
      'GUIABOLSO.ESTOURO_CHEQUE_ESPECIAL.2',
      'GUIABOLSO.ESTOURO_CHEQUE_ESPECIAL.3',
      'GUIABOLSO.V2.USO_CHEQUE_ESPECIAL.1',
      'GUIABOLSO.V2.USO_CHEQUE_ESPECIAL.2',
      'GUIABOLSO.V2.USO_CHEQUE_ESPECIAL.3',
      'GUIABOLSO.V3.FINANCIAMENTO_IMOVEL.1',
      'GUIABOLSO.V3.FINANCIAMENTO_IMOVEL.2',
      'GUIABOLSO.V3.FINANCIAMENTO_IMOVEL.3',
      'GUIABOLSO.V3.ENTRADA_REAL.1',
      'GUIABOLSO.V3.ENTRADA_REAL.2',
      'GUIABOLSO.V3.ENTRADA_REAL.3',
      'GUIABOLSO.V4.ENTRADAS_RECORRENTES.1',
      'GUIABOLSO.V4.ENTRADAS_RECORRENTES.2',
      'GUIABOLSO.V4.ENTRADAS_RECORRENTES.3',
      'GUIABOLSO.V4.ENTRADAS_RECORRENTES.MES_1',
      'GUIABOLSO.V4.ENTRADAS_RECORRENTES.MES_2',
      'GUIABOLSO.V4.ENTRADAS_RECORRENTES.MES_3',
      'GUIABOLSO.V4.ENTRADAS_RECORRENTES.MES_4',
      'GUIABOLSO.SAIDAS_RECORRENTES.1',
      'GUIABOLSO.SAIDAS_RECORRENTES.2',
      'GUIABOLSO.SAIDAS_RECORRENTES.3',
      'GUIABOLSO.SAIDAS_RECORRENTES.MES_1',
      'GUIABOLSO.SAIDAS_RECORRENTES.MES_2',
      'GUIABOLSO.SAIDAS_RECORRENTES.MES_3',
      'GUIABOLSO.SAIDAS_RECORRENTES.MES_4',
      'GUIABOLSO.CHEQUE_DEVOLVIDO.1',
      'GUIABOLSO.CHEQUE_DEVOLVIDO.2',
      'GUIABOLSO.CHEQUE_DEVOLVIDO.3',
      'GUIABOLSO.V2.DIA_DO_SALARIO#',
      'GUIABOLSO.DATASCIENCE.MODEL.LCS_1',
      'GUIABOLSO.DATASCIENCE.MODEL.LCS_1_GH',
      'GUIABOLSO.RENDA_PRESUMIDA_V2.NUM_SOURCES',
      'GUIABOLSO.RENDA_PRESUMIDA_V2.SOURCES',
      'GUIABOLSO.RENDA_PRESUMIDA_V2.MAIN_SOURCE',
      'GUIABOLSO..RENDA_PRESUMIDA_V2.PRESUMED_INCOME',
      'GUIABOLSO.RENDA_PRESUMIDA_V2.MAIN_SOURCE_PRESUMED_INCOME_RATIO',
      'GUIABOLSO.RENDA_PRESUMIDA_V2.CONFIDENCE_LEVEL',
      'GUIABOLSO.V5.SALARIO.1',
      'GUIABOLSO.V5.SALARIO.2',
      'GUIABOLSO.V5.SALARIO.3',
      'GUIABOLSO.V5.SALARIO.MES_1',
      'GUIABOLSO.V5.SALARIO.MES_2',
      'GUIABOLSO.V5.SALARIO.MES_3',
      'GUIABOLSO.V5.SALARIO.MES_4',
      'GUIABOLSO.DATASCIENCE.FEATURIZE.EVENT=CREDIT-CARD-LIMIT.RECENCY=1M.LIMIT_TYPE=ALL.MEASURE=LIMIT.GROUPING=MAX',
      'GUIABOLSO.DATASCIENCE.FEATURIZE.EVENT=CREDIT-CARD-LIMIT.RECENCY=2M.LIMIT_TYPE=ALL.MEASURE=LIMIT.GROUPING=MAX',
      'GUIABOLSO.DATASCIENCE.FEATURIZE.EVENT=CREDIT-CARD-LIMIT.RECENCY=3M.LIMIT_TYPE=ALL.MEASURE=LIMIT.GROUPING=MAX',
      'GUIABOLSO.DATASCIENCE.FEATURIZE.EVENT=CREDIT-CARD-LIMIT.RECENCY=1M.LIMIT_TYPE=ALL.MEASURE=LIMIT.GROUPING=MIN',
      'GUIABOLSO.DATASCIENCE.FEATURIZE.EVENT=CREDIT-CARD-LIMIT.RECENCY=2M.LIMIT_TYPE=ALL.MEASURE=LIMIT.GROUPING=MIN',
      'GUIABOLSO.DATASCIENCE.FEATURIZE.EVENT=CREDIT-CARD-LIMIT.RECENCY=3M.LIMIT_TYPE=ALL.MEASURE=LIMIT.GROUPING=MIN'
      ,'GUIABOLSO.GB0018-APPLICATION-SCORE-PREQUALIFY'
      ,'GUIABOLSO.GB0006-APPLICATION-SCORE-PREQUALIFY'
      ,'GUIABOLSO.GB0007-PROPENSITY-SCORE'
              ) then 'Y' else 'N' end
                  ;;
  }
  measure: rel_frequency {
    type: average
    value_format_name: percent_2
    sql: ${TABLE}.rel_frequency;;
  }


  measure: abs_frequency {
    type: sum
    sql: ${TABLE}.abs_frequency;;
  }


  measure: count {
    type: count
    drill_fields: []
  }


  measure: distinct_count_var_key {
    type: count_distinct
    sql:  ${TABLE}.var_key;;
  }
}