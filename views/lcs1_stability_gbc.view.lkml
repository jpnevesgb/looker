view: lcs1_stability_gbc {
  sql_table_name: monitoring.lcs1_stability_gbc ;;
  suggestions: no

  dimension: context {
    type: string
    sql: ${TABLE}.context ;;
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

  measure: count {
    type: count
    drill_fields: []
  }
}
