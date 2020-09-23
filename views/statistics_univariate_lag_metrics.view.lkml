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
        filled_values - empty_value,
        rel_frequency,
        case when empty_value = 0
           then 0
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
        end AS diff_empty_values_from_last_period,
        case when nulls_value = 0
           then 0
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
        end AS diff_nulls_values_from_last_period,
        case when rel_frequency = 0
           then 0
        else
           (rel_frequency
           /
           (LAG(rel_frequency) OVER (PARTITION BY statistics_univariate.var_key,
                                     statistics_univariate.time_window
                                     ORDER BY statistics_univariate.period ASC))
            )-1
        end AS diff_outlier_values_from_last_period
    FROM monitoring.statistics_univariate  AS statistics_univariate
    left join monitoring.statistics_bucket_outlier  AS statistics_bucket_outlier
      on statistics_univariate.var_key = statistics_bucket_outlier.var_key
      and statistics_univariate.period = statistics_bucket_outlier.period
      and statistics_univariate.time_window = statistics_bucket_outlier.time_window
      and statistics_bucket_outlier.category = 'OUTLIER'
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

  measure: nulls_value {
    type: sum
    sql: ${TABLE}.nulls_value ;;
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

  measure: diff_nulls_values_from_last_period {
    type: average
    value_format_name: percent_2
    sql: ${TABLE}.diff_nulls_values_from_last_period;;
  }
    measure: diff_outlier_values_from_last_period {
      type: average
      value_format_name: percent_2
      sql: ${TABLE}.diff_outlier_values_from_last_period;;
  }
}
