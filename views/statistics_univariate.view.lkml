view: statistics_univariate {
  sql_table_name: monitoring.statistics_univariate ;;
  suggestions: yes

  dimension: var_key {
    type: string
    sql: ${TABLE}.var_key ;;
  }

  dimension: bank {
    type: string
    sql: ${TABLE}.bank ;;
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


  measure: empty_value {
    type: sum
    sql: ${TABLE}.empty_value ;;
  }

  measure: filled_value {
    type: sum
    sql: ${TABLE}.filled_value ;;
  }

  measure: cv_value {
    type: average
    sql: ${TABLE}.cv_value ;;
  }

  measure: kurtosis_value {
    type: average
    sql: ${TABLE}.kurtosis_value ;;
  }

  measure: max_value {
    type: sum
    sql: ${TABLE}.max_value ;;
  }

  measure: min_value {
    type: sum
    sql: ${TABLE}.min_value ;;
  }

  measure: nulls_value {
    type: sum
    sql:case when  ${TABLE}.nulls_value < 0 then 0 else  ${TABLE}.nulls_value end  ;;
  }

  measure: percentile1_value {
    type: average
    sql: ${TABLE}.percentile1_value ;;
  }


  measure: percentile5_value {
    type: average
    sql: ${TABLE}.percentile5_value ;;
  }

  measure: percentile25_value {
    type: average
    sql: ${TABLE}.percentile25_value ;;
  }

  measure: percentile50_value {
    type: average
    sql: ${TABLE}.percentile50_value ;;
  }

  measure: percentile75_value {
    type: average
    sql: ${TABLE}.percentile75_value ;;
  }

  measure: percentile95_value {
    type: average
    sql: ${TABLE}.percentile95_value ;;
  }

  measure: percentile99_value {
    type: average
    sql: ${TABLE}.percentile99_value ;;
  }

  measure: psi_value {
    type: average
    value_format_name: decimal_2
    sql: ${TABLE}.psi_value ;;
  }

  measure: skewness_value {
    type: average
    sql: ${TABLE}.skewness_value ;;
  }

  measure: stddev_value {
    type: average
    sql: ${TABLE}.stddev_value ;;
  }

  measure: total_value {
    type: sum
    sql: ${TABLE}.total_value ;;
  }


  measure: avg_value {
    type: average
    sql: ${TABLE}.avg_value ;;
  }

  measure: filled_different_zero_value {
    type: sum
    sql: ${TABLE}.filled_value -${TABLE}.empty_value ;;
  }


  measure: filled_different_zero_percent {
    type: number
    value_format_name: percent_2
    sql:  (${filled_different_zero_value}) /  cast(${total_value} as double) ;;
  }


  dimension: diff_empty_values_from_last_period{
    type: number
    value_format_name: percent_2
    sql:  case when empty_value = 0 then 0 else
        abs(
            (LAG(${TABLE}.empty_value) OVER (PARTITION BY ${TABLE}.var_key ORDER BY ${TABLE}.period ASC)
              /
              CAST(LAG(${TABLE}.total_value) OVER (PARTITION BY ${TABLE}.var_key ORDER BY ${TABLE}.period ASC) as double))
            /
              (${TABLE}.empty_value / cast(${TABLE}.total_value as double))-1
            )
         end
    ;;
  }



  measure: count {
    type: count
    drill_fields: []
  }
}
