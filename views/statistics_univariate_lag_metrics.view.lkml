view: statistics_univariate_lag_metrics {
  derived_table: {
    sql:
    SELECT
        statistics_univariate.var_key,
        statistics_univariate.period,
        statistics_univariate.time_window,
        empty_value,
        total_value,
        nulls_value,
        abs_frequency as outlier_value,
        rel_frequency,
        avg_empty_percent,
        avg_nulls_percent,
        avg_outlier_percent,

    FROM monitoring.statistics_univariate  AS statistics_univariate
    left join monitoring.statistics_bucket_outlier  AS statistics_bucket_outlier
      on statistics_univariate.var_key = statistics_bucket_outlier.var_key
      and statistics_univariate.period = statistics_bucket_outlier.period
      and statistics_univariate.time_window = statistics_bucket_outlier.time_window
      and statistics_bucket_outlier.category = 'OUTLIER'

    left join(
        select
            var_key
            ,time_window
            ,avg(empty_percent) as avg_empty_percent
            ,avg(null_percent) as avg_nulls_percent
            ,avg(outlier_percent) as avg_outlier_percent

            from (

              select  t1.var_key, t1.period, t1.time_window,
                  empty_value / cast(total_value as double) as empty_percent,
                  nulls_value / cast(total_value as double) as null_percent,
                  rel_frequency as outlier_percent

              from "monitoring"."statistics_univariate" as t1

              left join monitoring.statistics_bucket_outlier  AS t2
               on t1.var_key = t2.var_key
              and t1.period = t2.period
              and t1.time_window = t2.time_window
              and t2.category = 'OUTLIER'

              where t1.period >=
                case when t1.time_window = 'MONTH'
                    then  date_format( current_date - interval '6' month, '%Y%m')
                    else  date_format( current_date- interval '6' month, '%Y%v')
                end
            )
            group by 1,2
      ) as historic
            on statistics_univariate.var_key = historic.var_key
            and statistics_univariate.time_window = historic.time_window


    ;;
  }

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

  dimension: period {
    type: string
    sql: ${TABLE}.period ;;
  }


  dimension: time_window {
    type: string
    sql: ${TABLE}.time_window ;;
  }

  measure: empty_value {
    type: sum
    sql: ${TABLE}.empty_value ;;
  }

  measure: outlier_value {
    type: sum
    sql: ${TABLE}.outlier_value ;;
  }

  measure: nulls_value {
    type: sum
    sql: ${TABLE}.nulls_value ;;
  }

  measure: total_value {
    type: sum
    sql: ${TABLE}.total_value ;;
  }

  measure: null_percent {
    type: average
    sql:${TABLE}.nulls_value / cast(${TABLE}.total_value as double) ;;
  }

  measure: empty_percent {
    type: average
    sql: ${TABLE}.empty_value / cast(${TABLE}.total_value as double) ;;
  }

  measure: outlier_percent {
    type: average
    sql: ${TABLE}.outlier_value / cast(${TABLE}.total_value as double) ;;
  }


  measure: diff_empty_values_from_last_period {
    type: average
    value_format_name: percent_2
    sql: case when empty_value = 0
           then 0
        when (LAG(empty_value) OVER (PARTITION BY statistics_univariate.var_key,
                                   statistics_univariate.time_window
                                   ORDER BY statistics_univariate.period ASC)) = 0
           then 1
        else
           coalesce((empty_value / cast(total_value as double)),1)
           /
           (LAG(empty_value) OVER (PARTITION BY statistics_univariate.var_key,
                                   statistics_univariate.time_window
                                   ORDER BY statistics_univariate.period ASC)
              /
              CAST(LAG(total_value) OVER (PARTITION BY statistics_univariate.var_key,
                                          statistics_univariate.time_window
                                          ORDER BY statistics_univariate.period ASC) as double)) -1
        end ;;
  }

  measure: diff_nulls_values_from_last_period {
    type: average
    value_format_name: percent_2
    sql: case when nulls_value = 0
           then 0
        when (LAG(nulls_value) OVER (PARTITION BY statistics_univariate.var_key,
                                     statistics_univariate.time_window
                                     ORDER BY statistics_univariate.period ASC)) = 0
           then 1
        else
            coalesce((nulls_value / cast(total_value as double)),1)
            /
             (LAG(nulls_value) OVER (PARTITION BY statistics_univariate.var_key,
                                     statistics_univariate.time_window
                                     ORDER BY statistics_univariate.period ASC)
              /
              CAST(LAG(total_value) OVER (PARTITION BY statistics_univariate.var_key,
                                          statistics_univariate.time_window
                                          ORDER BY statistics_univariate.period ASC) as double)) -1
        end;;
  }

  measure: diff_outlier_values_from_last_period {
      type: average
      value_format_name: percent_2
      sql: case when rel_frequency = 0
           then 0
        when (LAG(rel_frequency) OVER (PARTITION BY statistics_univariate.var_key,
                                     statistics_univariate.time_window
                                     ORDER BY statistics_univariate.period ASC)) = 0
           then 1
        else
           (rel_frequency
           /
           (LAG(rel_frequency) OVER (PARTITION BY statistics_univariate.var_key,
                                     statistics_univariate.time_window
                                     ORDER BY statistics_univariate.period ASC))
            )-1
        end;;
  }

  measure: diff_empty_values_from_six_months_period {
    type: average
    value_format_name: percent_2
    sql: case when empty_value = 0
           then 0
        when avg_empty_percent = 0
           then 1
        else
           coalesce((empty_value / cast(total_value as double)),1)
           /
           avg_empty_percent  -1
        end ;;
  }

  measure: diff_nulls_values_from_six_months_period {
    type: average
    value_format_name: percent_2
    sql: case when nulls_value = 0
           then 0
        when avg_nulls_percent = 0
           then 1
        else
           coalesce((nulls_value / cast(total_value as double)),1)
           /
           avg_nulls_percent  -1
        end ;;
  }

  measure: diff_outlier_values_from_six_months_period {
    type: average
    value_format_name: percent_2
    sql: case when outlier_value = 0
           then 0
        when avg_outlier_percent = 0
           then 1
        else
           coalesce((outlier_value / cast(total_value as double)),1)
           /
           avg_outlier_percent  -1
        end ;;
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
,'GUIABOLSO.SALDO_MAIS_BAIXO.1'
,'GUIABOLSO.SALDO_MAIS_BAIXO.2'
,'GUIABOLSO.SALDO_MAIS_BAIXO.3'
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
}
