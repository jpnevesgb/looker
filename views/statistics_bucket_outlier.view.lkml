view: statistics_bucket_outlier {
  sql_table_name: monitoring.statistics_bucket_outlier ;;
  suggestions: yes


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

  dimension: limits {
    type: string
    sql: case when ${TABLE}.category = 'BUCKET'
    then cast(${lower_limit} as varchar(20)) || ' to ' || cast(${upper_limit} as varchar(20))
    else ' < ' || cast(${lower_limit} as varchar(20)) || ' or > ' || cast(${upper_limit} as varchar(20))
    end ;;
    }

  dimension: upper_limit {
    type: number
    value_format_name: decimal_2
    sql: ${TABLE}.upper_limit;;
  }

  dimension: lower_limit {
    type: number
    value_format_name: decimal_2
    sql: ${TABLE}.lower_limit ;;
  }


  measure: rel_frequency {
    type: average
    value_format_name: percent_2
    sql: ${TABLE}.rel_frequency;;
  }


  measure: abs_frequency {
    type: sum
    sql: ${TABLE}.abs_frequency;;
  }


  measure: count {
    type: count
    drill_fields: []
  }
}
