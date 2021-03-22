view: lcs1_performance {
  sql_table_name: monitoring.lcs1_performance ;;
  suggestions: no

  dimension: fk_financial_entity {
    type: number
    sql: ${TABLE}.fk_financial_entity ;;
  }

  dimension: metric {
    type: string
    sql: ${TABLE}.metric ;;
  }

  dimension: metric_id {
    type: string
    sql: ${TABLE}.metric_id ;;
  }

  dimension: metric_value {
    type: number
    sql: ${TABLE}.metric_value ;;
  }

  dimension: period {
    type: string
    sql: ${TABLE}.period ;;
  }

  dimension: time_window {
    type: string
    sql: ${TABLE}.time_window ;;
  }

  dimension: entity_name {
    type: string
    sql: case when ${fk_financial_entity} = 1
          then 'BANKFACIL'
           when ${fk_financial_entity} = 1
          then 'BB'
           when ${fk_financial_entity} = 1
          then 'BCREDI'
           when ${fk_financial_entity} = 1
          then 'BRADESCO'
           when ${fk_financial_entity} = 1
          then 'CAIXA'
           when ${fk_financial_entity} = 1
          then 'CBSS'
           when ${fk_financial_entity} = 1
          then 'CREDITAS'
           when ${fk_financial_entity} = 1
          then 'EMPRESTIMO_SIM'
           when ${fk_financial_entity} = 1
          then 'FOCUS'
           when ${fk_financial_entity} = 1
          then 'GERU'
           when ${fk_financial_entity} = 1
          then 'GUIABOLSO'
           when ${fk_financial_entity} = 1
          then 'IBI'
           when ${fk_financial_entity} = 1
          then 'ITAU'
           when ${fk_financial_entity} = 1
          then 'LENDICO'
           when ${fk_financial_entity} = 1
          then 'PORTOCRED'
           when ${fk_financial_entity} = 1
          then 'SANTANDER'
           when ${fk_financial_entity} = 1
          then 'SEMEAR'
           when ${fk_financial_entity} = 1
          then 'SIMPLIC'
           when ${fk_financial_entity} = 1
          then 'VOTORANTIM'
          else 'ALL'
        end ;;
  }

  measure: metric_value_tratado {
    type: sum
    sql: ${TABLE}.metric_value ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
