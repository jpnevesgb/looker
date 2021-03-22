view: lcs1_performance {
  sql_table_name: monitoring.lcs1_performance ;;
  suggestions: no

  dimension: fk_financial_entity {
    type: string
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

  measure: metric_value_tratado {
    type: sum
    sql: ${TABLE}.metric_value ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
