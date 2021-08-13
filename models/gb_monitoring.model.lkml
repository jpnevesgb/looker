connection: "athena"

# include all the views
include: "/views/*.view"

datagroup: gb_monitoring_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: gb_monitoring_default_datagroup


explore: statistics_univariate {
  hidden: no
  join: dim_bank {
    type: inner
    relationship: many_to_one
    sql_on: ${statistics_univariate.bank} = ${dim_bank.id_bank} ;;
  }

}

explore: statistics_bucket_outlier {
  hidden: no
  join: dim_bank {
    type: inner
    relationship: many_to_one
    sql_on: ${statistics_bucket_outlier.bank} = ${dim_bank.id_bank} ;;
  }

}

explore: statistics_univariate_lag_metrics {
  hidden: no
  join: dim_bank {
    type: inner
    relationship: many_to_one
    sql_on: ${statistics_univariate_lag_metrics.bank} = ${dim_bank.id_bank} ;;
  }

}

explore: lcs1_performance {
  hidden: no
  join: dim_financial_entity {
    type: left_outer
    relationship: many_to_one
    sql_on: ${lcs1_performance.fk_financial_entity} = ${lcs1_performance.fk_financial_entity} ;;
  }

}


explore: lcs1_stability_gbc {
  hidden: no
  join: dim_date {
    type: inner
    relationship: many_to_one
    sql_on: ${lcs1_stability_gbc.period} = ${dim_date.id_date} ;;
  }

}

explore: lcs1_stability_mau {
  hidden: no
  join: dim_date {
    type: inner
    relationship: many_to_one
    sql_on: ${lcs1_stability_mau.period} = ${dim_date.id_date} ;;
  }

}

explore: result {
  hidden: no
}
