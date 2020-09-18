view: statistics_univariate {
  sql_table_name: monitoring.statistics_univariate ;;
  suggestions: no

  dimension: var_key {
    type: string
    sql: ${TABLE}.var_key ;;
  }

  dimension: bank {
    type: string
    sql: ${TABLE}.bank ;;
  }

  dimension: inference {
    type: string
    sql: ${TABLE}.inference ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
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

  dimension: partner {
    type: string
    sql: ${TABLE}.partner ;;
  }

  measure: cv_value {
    type: number
    sql: ${TABLE}.cv_value ;;
  }

  measure: empty_value {
    type: number
    sql: ${TABLE}.empty_value ;;
  }

  measure: filled_value {
    type: number
    sql: ${TABLE}.filled_value ;;
  }

  measure: kurtosis_value {
    type: number
    sql: ${TABLE}.kurtosis_value ;;
  }

  measure: max_value {
    type: number
    sql: ${TABLE}.max_value ;;
  }

  measure: min_value {
    type: number
    sql: ${TABLE}.min_value ;;
  }

  measure: nulls_value {
    type: number
    sql: ${TABLE}.nulls_value ;;
  }

  measure: percentile1_value {
    type: number
    sql: ${TABLE}.percentile1_value ;;
  }


  measure: percentile5_value {
    type: number
    sql: ${TABLE}.percentile5_value ;;
  }

  measure: percentile25_value {
    type: number
    sql: ${TABLE}.percentile25_value ;;
  }

  measure: percentile50_value {
    type: number
    sql: ${TABLE}.percentile50_value ;;
  }

  measure: percentile75_value {
    type: number
    sql: ${TABLE}.percentile75_value ;;
  }

  measure: percentile95_value {
    type: number
    sql: ${TABLE}.percentile95_value ;;
  }

  measure: percentile99_value {
    type: number
    sql: ${TABLE}.percentile99_value ;;
  }

  measure: psi_value {
    type: number
    sql: ${TABLE}.psi_value ;;
  }

  measure: skewness_value {
    type: number
    sql: ${TABLE}.skewness_value ;;
  }

  measure: stddev_value {
    type: number
    sql: ${TABLE}.stddev_value ;;
  }

  measure: total_value {
    type: number
    sql: ${TABLE}.total_value ;;
  }


  measure: avg_value {
    type: number
    sql: ${TABLE}.avg_value ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
