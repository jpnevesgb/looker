view: statistics_bucket_outlier {
  sql_table_name: monitoring.statistics_bucket_outlier ;;
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
  'GUIABOLSO.SAQUE.1'
,'GUIABOLSO.SAQUE.2'
,'GUIABOLSO.SAQUE.3'
,'GUIABOLSO.SALDO.1'
,'GUIABOLSO.SALDO.2'
,'GUIABOLSO.SALDO.3'
,'GUIABOLSO.GASTOS_COM_CARTAO.1'
,'GUIABOLSO.GASTOS_COM_CARTAO.2'
,'GUIABOLSO.GASTOS_COM_CARTAO.3'
,'GUIABOLSO.V3.FLUXO_DE_CAIXA.1'
,'GUIABOLSO.V3.FLUXO_DE_CAIXA.2'
,'GUIABOLSO.V3.FLUXO_DE_CAIXA.3'
,'GUIABOLSO.V3.PARCELAMENTO_FATURA.1'
,'GUIABOLSO.V3.PARCELAMENTO_FATURA.2'
,'GUIABOLSO.V3.PARCELAMENTO_FATURA.3'
,'GUIABOLSO.NUMERO_DE_DIAS_COM_SALDO_NEGATIVO.1#'
,'GUIABOLSO.NUMERO_DE_DIAS_COM_SALDO_NEGATIVO.2#'
,'GUIABOLSO.NUMERO_DE_DIAS_COM_SALDO_NEGATIVO.3#'
,'GUIABOLSO.V3.NUMERO_DE_DIAS_COM_SALDO_NEGATIVO.1#'
,'GUIABOLSO.V3.NUMERO_DE_DIAS_COM_SALDO_NEGATIVO.2#'
,'GUIABOLSO.V3.NUMERO_DE_DIAS_COM_SALDO_NEGATIVO.3#'
,'GUIABOLSO.V2.DESPESAS_FINANCEIRAS.1'
,'GUIABOLSO.V2.DESPESAS_FINANCEIRAS.2'
,'GUIABOLSO.V2.DESPESAS_FINANCEIRAS.3'
,'GUIABOLSO.V3.SAIDAS_BRUTA.1'
,'GUIABOLSO.V3.SAIDAS_BRUTA.2'
,'GUIABOLSO.V3.SAIDAS_BRUTA.3'
,'GUIABOLSO.TEM_CARTAO_CREDITO.1?'
,'GUIABOLSO.TEM_CARTAO_CREDITO.2?'
,'GUIABOLSO.TEM_CARTAO_CREDITO.3?'
,'GUIABOLSO.V2.INSS.1'
,'GUIABOLSO.V2.INSS.2'
,'GUIABOLSO.V2.INSS.3'
,'GUIABOLSO.DEMITIDO.1?'
,'GUIABOLSO.DEMITIDO.2?'
,'GUIABOLSO.DEMITIDO.3?'
,'GUIABOLSO.V3.ENTRADA_POR_EMPRESTIMO.1'
,'GUIABOLSO.V3.ENTRADA_POR_EMPRESTIMO.2'
,'GUIABOLSO.V3.ENTRADA_POR_EMPRESTIMO.3'
,'GUIABOLSO.V3.SAIDAS_POR_EMPRESTIMO.1'
,'GUIABOLSO.V3.SAIDAS_POR_EMPRESTIMO.2'
,'GUIABOLSO.V3.SAIDAS_POR_EMPRESTIMO.3'
,'GUIABOLSO.V2.SALDO_MAIS_BAIXO.1'
,'GUIABOLSO.V2.SALDO_MAIS_BAIXO.2'
,'GUIABOLSO.V2.SALDO_MAIS_BAIXO.3'
,'GUIABOLSO.V2.SALDO_MAIS_BAIXO.MES_1'
,'GUIABOLSO.V2.SALDO_MAIS_BAIXO.MES_2'
,'GUIABOLSO.V2.SALDO_MAIS_BAIXO.MES_3'
,'GUIABOLSO.V2.SALDO_MAIS_BAIXO.MES_4'
,'GUIABOLSO.V2.SALDO_MAIS_ALTO.1'
,'GUIABOLSO.V2.SALDO_MAIS_ALTO.2'
,'GUIABOLSO.V2.SALDO_MAIS_ALTO.3'
,'GUIABOLSO.V2.SALDO_MAIS_ALTO.MES_1'
,'GUIABOLSO.V2.SALDO_MAIS_ALTO.MES_2'
,'GUIABOLSO.V2.SALDO_MAIS_ALTO.MES_3'
,'GUIABOLSO.V2.SALDO_MAIS_ALTO.MES_4'
,'GUIABOLSO.TRANSACOES_POR_PERIODO#.1'
,'GUIABOLSO.TRANSACOES_POR_PERIODO#.2'
,'GUIABOLSO.TRANSACOES_POR_PERIODO#.3'
,'GUIABOLSO.ESTOURO_CHEQUE_ESPECIAL.1'
,'GUIABOLSO.ESTOURO_CHEQUE_ESPECIAL.2'
,'GUIABOLSO.ESTOURO_CHEQUE_ESPECIAL.3'
,'GUIABOLSO.V2.USO_CHEQUE_ESPECIAL.1'
,'GUIABOLSO.V2.USO_CHEQUE_ESPECIAL.2'
,'GUIABOLSO.V2.USO_CHEQUE_ESPECIAL.3'
,'GUIABOLSO.DATA_DE_REFERENCIA'
,'USER.ACCOUNTS.LENGTH'
,'USER.ACCOUNTS[?].ACCOUNTDIGIT'
,'USER.ACCOUNTS[?].ACCOUNTNUMBER'
,'USER.ACCOUNTS[?].AGENCY'
,'USER.ACCOUNTS[?].BANK'
,'USER.ACCOUNTS[?].CPF'
,'USER.ACCOUNTS[?].FULLNAME'
,'GUIABOLSO.DIAS_DESDE_PRIMEIRA_CONEXAO'
,'USER.EMAIL'
,'GUIABOLSO.USER.TYPE'
,'GUIABOLSO.V3.ENTRADA_BRUTA.1'
,'GUIABOLSO.V3.ENTRADA_BRUTA.2'
,'GUIABOLSO.V3.ENTRADA_BRUTA.3'
,'GUIABOLSO.V3.ENTRADA_REAL.1'
,'GUIABOLSO.V3.ENTRADA_REAL.2'
,'GUIABOLSO.V3.ENTRADA_REAL.3'
,'GUIABOLSO.V3.ENTRADAS_RECORRENTES.1'
,'GUIABOLSO.V3.ENTRADAS_RECORRENTES.2'
,'GUIABOLSO.V3.ENTRADAS_RECORRENTES.3'
,'GUIABOLSO.V2.DIA_DO_SALARIO#'
,'GUIABOLSO.V4.SALARIO.1'
,'GUIABOLSO.V4.SALARIO.2'
,'GUIABOLSO.V4.SALARIO.3'
,'GUIABOLSO.V5.SALARIO.1'
,'GUIABOLSO.V5.SALARIO.2'
,'GUIABOLSO.V5.SALARIO.3'
,'GUIABOLSO.V5.SALARIO.MES_1'
,'GUIABOLSO.V5.SALARIO.MES_2'
,'GUIABOLSO.V5.SALARIO.MES_3'
,'GUIABOLSO.V5.SALARIO.MES_4'
,'GUIABOLSO.V4.ENTRADAS_RECORRENTES.1'
,'GUIABOLSO.V4.ENTRADAS_RECORRENTES.2'
,'GUIABOLSO.V4.ENTRADAS_RECORRENTES.3'
,'GUIABOLSO.V4.ENTRADAS_RECORRENTES.MES_1'
,'GUIABOLSO.V4.ENTRADAS_RECORRENTES.MES_2'
,'GUIABOLSO.V4.ENTRADAS_RECORRENTES.MES_3'
,'GUIABOLSO.V4.ENTRADAS_RECORRENTES.MES_4'
,'GUIABOLSO.SAIDAS_RECORRENTES.1'
,'GUIABOLSO.SAIDAS_RECORRENTES.2'
,'GUIABOLSO.SAIDAS_RECORRENTES.3'
,'GUIABOLSO.SAIDAS_RECORRENTES.MES_1'
,'GUIABOLSO.SAIDAS_RECORRENTES.MES_2'
,'GUIABOLSO.SAIDAS_RECORRENTES.MES_3'
,'GUIABOLSO.SAIDAS_RECORRENTES.MES_4'
,'GUIABOLSO.SEGURO.1'
,'GUIABOLSO.SEGURO.2'
,'GUIABOLSO.SEGURO.3'
,'GUIABOLSO.ENTRADA_SEGURO.1'
,'GUIABOLSO.ENTRADA_SEGURO.2'
,'GUIABOLSO.ENTRADA_SEGURO.3'
,'GUIABOLSO.CHEQUE_DEVOLVIDO.1'
,'GUIABOLSO.CHEQUE_DEVOLVIDO.2'
,'GUIABOLSO.CHEQUE_DEVOLVIDO.3'
,'GUIABOLSO.V2.JUROS_DE_CARTAO.1'
,'GUIABOLSO.V2.JUROS_DE_CARTAO.2'
,'GUIABOLSO.V2.JUROS_DE_CARTAO.3'
,'GUIABOLSO.PAGAMENTO_DE_CARTAO_NA_CC.1'
,'GUIABOLSO.PAGAMENTO_DE_CARTAO_NA_CC.2'
,'GUIABOLSO.PAGAMENTO_DE_CARTAO_NA_CC.3'
,'GUIABOLSO.V2.PAGAMENTO_DE_CARTAO.1'
,'GUIABOLSO.V2.PAGAMENTO_DE_CARTAO.2'
,'GUIABOLSO.V2.PAGAMENTO_DE_CARTAO.3'
,'GUIABOLSO.GASTOS_POSTO_GASOLINA.1'
,'GUIABOLSO.GASTOS_POSTO_GASOLINA.2'
,'GUIABOLSO.GASTOS_POSTO_GASOLINA.3'
,'GUIABOLSO.NUMERO_TRANSACOES_GASTOS_POSTO_GASOLINA.1'
,'GUIABOLSO.NUMERO_TRANSACOES_GASTOS_POSTO_GASOLINA.2'
,'GUIABOLSO.NUMERO_TRANSACOES_GASTOS_POSTO_GASOLINA.3'
,'GUIABOLSO.TEM_CARRO?'
,'GUIABOLSO.SALDO_CDB'
,'GUIABOLSO.SALDO_FUNDOS'
,'GUIABOLSO.SALDO_PREVIDENCIA'
,'GUIABOLSO.V2.SALDO_POUPANCA'
,'GUIABOLSO.V2.INVESTIMENTOS_CORRETORAS_INDEPENDENTES_APLICACAO.1'
,'GUIABOLSO.V2.INVESTIMENTOS_CORRETORAS_INDEPENDENTES_APLICACAO.2'
,'GUIABOLSO.V2.INVESTIMENTOS_CORRETORAS_INDEPENDENTES_APLICACAO.3'
,'GUIABOLSO.V2.INVESTIMENTOS_CORRETORAS_INDEPENDENTES_RESGATE.1'
,'GUIABOLSO.V2.INVESTIMENTOS_CORRETORAS_INDEPENDENTES_RESGATE.2'
,'GUIABOLSO.V2.INVESTIMENTOS_CORRETORAS_INDEPENDENTES_RESGATE.3'
,'GUIABOLSO.V4.INVESTIMENTOS_APLICACAO.1'
,'GUIABOLSO.V4.INVESTIMENTOS_APLICACAO.2'
,'GUIABOLSO.V4.INVESTIMENTOS_APLICACAO.3'
,'GUIABOLSO.V4.INVESTIMENTOS_RESGATE.1'
,'GUIABOLSO.V4.INVESTIMENTOS_RESGATE.2'
,'GUIABOLSO.V4.INVESTIMENTOS_RESGATE.3'
,'GUIABOLSO.V2.IOF_INTERNACIONAL.1'
,'GUIABOLSO.V2.IOF_INTERNACIONAL.2'
,'GUIABOLSO.V2.IOF_INTERNACIONAL.3'
,'GUIABOLSO.V2.IOF_INTERNACIONAL_COUNT.1'
,'GUIABOLSO.V2.IOF_INTERNACIONAL_COUNT.2'
,'GUIABOLSO.V2.IOF_INTERNACIONAL_COUNT.3'
,'GUIABOLSO.PAGAMENTO_IPVA.1'
,'GUIABOLSO.PAGAMENTO_IPVA.2'
,'GUIABOLSO.PAGAMENTO_IPVA.3'
,'GUIABOLSO.DATA_DA_TRANSACAO_MAIS_RECENTE'
,'GUIABOLSO.CARTOES_CREDITO_CONECTADOS#'
,'GUIABOLSO.NUMERO_DE_CARTOES#'
,'GUIABOLSO.V3.FINANCIAMENTO_IMOVEL.1'
,'GUIABOLSO.V3.FINANCIAMENTO_IMOVEL.2'
,'GUIABOLSO.V3.FINANCIAMENTO_IMOVEL.3'
,'GUIABOLSO.PRAZO_SUGERIDO_PARA_EMPRESTIMO'
,'GUIABOLSO.VALOR_MAXIMO_SUGERIDO_PARA_EMPRESTIMO'
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
