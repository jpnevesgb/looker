view: result {
  sql_table_name: monitoring.result ;;
  suggestions: no

  dimension: analytic_key {
    type: string
    sql: ${TABLE}.analytic_key ;;
  }

  dimension: analytic_value {
    type: number
    sql: ${TABLE}.analytic_value ;;
  }

  dimension: diff_value {
    type: number
    sql: ${TABLE}.diff_value ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: uts_variables_key {
    type: string
    sql: ${TABLE}.uts_variables_key ;;
  }

  dimension: variable_numeric_value {
    type: number
    sql: ${TABLE}.variable_numeric_value ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
