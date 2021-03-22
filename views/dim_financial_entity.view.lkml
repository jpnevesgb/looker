view: dim_financial_entity {
  sql_table_name: layer3.dim_financial_entity ;;
  suggestions: no

  dimension_group: etl_load {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.etl_load_date ;;
  }

  dimension: financial_name {
    type: string
    sql: ${TABLE}.financial_name ;;
  }

  dimension: id_financial_entity {
    type: number
    sql: ${TABLE}.id_financial_entity ;;
  }

  dimension: is_white_label {
    type: number
    sql: ${TABLE}.is_white_label ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: partition_0 {
    type: string
    sql: ${TABLE}.partition_0 ;;
  }

  measure: count {
    type: count
    drill_fields: [name, financial_name]
  }
}
