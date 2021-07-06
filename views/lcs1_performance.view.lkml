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

  dimension: entity_name_teste {
    type:  string
    sql:
          CASE WHEN A.fk_financial_entity = 'ALL' then 'ALL' else B.financial_entity_name end
          FROM
          monitoring.lcs1_performance A
          LEFT JOIN layer3.dim_financial_entity B
          on A.fk_financial_entity = B.id_financial_entity
    ;;

  }

  dimension: entity_name {
    type: string
    sql: case when ${fk_financial_entity} = '1'
          then 'BANKFACIL'
           when ${fk_financial_entity} = '2'
          then 'BB'
           when ${fk_financial_entity} = '3'
          then 'BCREDI'
           when ${fk_financial_entity} = '4'
          then 'BRADESCO'
           when ${fk_financial_entity} = '5'
          then 'CAIXA'
           when ${fk_financial_entity} = '6'
          then 'CBSS'
           when ${fk_financial_entity} = '7'
          then 'CREDITAS'
           when ${fk_financial_entity} = '8'
          then 'EMPRESTIMO_SIM'
           when ${fk_financial_entity} = '9'
          then 'FOCUS'
           when ${fk_financial_entity} = '10'
          then 'GERU'
           when ${fk_financial_entity} = '11'
          then 'GUIABOLSO'
           when ${fk_financial_entity} = '12'
          then 'IBI'
           when ${fk_financial_entity} = '13'
          then 'ITAU'
           when ${fk_financial_entity} = '14'
          then 'LENDICO'
           when ${fk_financial_entity} = '15'
          then 'PORTOCRED'
           when ${fk_financial_entity} = '16'
          then 'SANTANDER'
           when ${fk_financial_entity} = '17'
          then 'SEMEAR'
           when ${fk_financial_entity} = '18'
          then 'SIMPLIC'
           when ${fk_financial_entity} = '19'
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
