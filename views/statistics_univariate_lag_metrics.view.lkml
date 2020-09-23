view: statistics_univariate_lag_metrics {
  derived_table: {
    sql:
    SELECT
        var_key,
        period,
        time_window,
        empty_value,
        total_value,
        case when empty_value = 0
           then 0
        else
           abs(
             (LAG(empty_value) OVER (PARTITION BY var_key,time_window ORDER BY period ASC)
              /
              CAST(LAG(total_value) OVER (PARTITION BY var_key,time_window ORDER BY period ASC) as double))
             /
             coalesce((empty_value / cast(total_value as double))
                      ,1)-1
        )
        end AS diff_empty_values_from_last_period
    FROM monitoring.statistics_univariate  AS statistics_univariate

    ;;
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

  measure: total_value {
    type: sum
    sql: ${TABLE}.total_value ;;
  }
  measure: diff_empty_values_from_last_period {
    type: average
    value_format_name: percent_2
    sql: ${TABLE}.diff_empty_values_from_last_period ;;
  }
}
