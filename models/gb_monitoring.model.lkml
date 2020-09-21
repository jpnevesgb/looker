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
}

explore: statistics_bucket_outlier {
  hidden: no
}
