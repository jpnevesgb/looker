view: dim_date {
  sql_table_name: layer4.dim_date ;;
  suggestions: no

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."date" ;;
  }

  dimension: day_name {
    type: string
    sql: ${TABLE}.day_name ;;
  }

  dimension: day_of_month {
    type: string
    sql: ${TABLE}.day_of_month ;;
  }

  dimension: day_of_week {
    type: number
    sql: ${TABLE}.day_of_week ;;
  }

  dimension: id_date {
    type: string
    sql: ${TABLE}.id_date ;;
  }

  dimension: is_working_day {
    type: number
    sql: ${TABLE}.is_working_day ;;
  }

  dimension: month {
    type: string
    sql: ${TABLE}."month" ;;
  }

  dimension: month_name {
    type: string
    sql: ${TABLE}.month_name ;;
  }

  dimension: partition_0 {
    type: string
    sql: ${TABLE}.partition_0 ;;
  }

  dimension: quarter {
    type: number
    sql: ${TABLE}.quarter ;;
  }

  dimension: quarter_name {
    type: string
    sql: ${TABLE}.quarter_name ;;
  }

  dimension: week_of_year {
    type: number
    sql: ${TABLE}.week_of_year ;;
  }

  dimension: working_day_in_month {
    type: number
    sql: ${TABLE}.working_day_in_month ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}."year" ;;
  }

  dimension: year_month {
    type: string
    sql: ${TABLE}.year_month ;;
  }

  measure: count {
    type: count
    drill_fields: [month_name, day_name, quarter_name]
  }
}
