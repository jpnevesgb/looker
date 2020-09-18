view: statistics_bucket_outlier {
  sql_table_name: monitoring.statistics_bucket_outlier ;;
  suggestions: no


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

  measure: upper_limit {
    type: number
    value_format_name: percent_2
    sql: ${TABLE}.upper_limit;;
  }

  measure: lower_limit {
    type: number
    sql: ${TABLE}.lower_limit ;;
  }

  measure: abs_frequency {
    type: number
    sql: ${TABLE}.abs_frequency;;
  }


  measure: rel_frequency {
    type: number
    value_format_name: percent_2
    sql: ${TABLE}.rel_frequency;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
