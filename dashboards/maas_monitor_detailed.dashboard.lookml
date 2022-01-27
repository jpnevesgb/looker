- dashboard: monitoramento_de_varivel__detalhado
  title: Maas Monitoramento de Variável - Detalhado
  layout: newspaper
  elements:
  - name: Por banco
    type: text
    title_text: Por banco
    row: 26
    col: 0
    width: 24
    height: 2
  - title: Buckets por período
    name: Buckets por período
    model: gb_monitoring
    explore: statistics_bucket_outlier_maas
    type: looker_area
    fields: [statistics_bucket_outlier_maas.period, statistics_bucket_outlier_maas.abs_frequency,
      statistics_bucket_outlier_maas.limits]
    pivots: [statistics_bucket_outlier_maas.limits]
    filters:
      statistics_bucket_outlier_maas.category: BUCKET
    sorts: [statistics_bucket_outlier_maas.limits 0, statistics_bucket_outlier_maas.period]
    limit: 500
    query_timezone: America/Sao_Paulo
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: right
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: statistics_bucket_outlier_maas.abs_frequency,
            id: statistics_bucket_outlier_maas.abs_frequency, name: Abs Frequency}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    hide_legend: false
    series_types: {}
    reference_lines: []
    x_axis_label_rotation: -45
    ordering: none
    show_null_labels: false
    defaults_version: 1
    hidden_fields: []
    listen:
      Janela de Tempo: statistics_bucket_outlier_maas.time_window
      Variável: statistics_bucket_outlier_maas.var_key
      Banco: dim_bank.name
    row: 0
    col: 0
    width: 14
    height: 9
  - title: PSI
    name: PSI
    model: gb_monitoring
    explore: statistics_univariate_maas
    type: looker_line
    fields: [statistics_univariate_maas.psi_value, statistics_univariate_maas.period]
    filters: {}
    sorts: [statistics_univariate_maas.period]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: statistics_univariate_maas.psi_value,
            id: statistics_univariate_maas.psi_value, name: Psi Value}], showLabels: true,
        showValues: true, maxValue: !!null '', minValue: 0, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: ''
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    series_types: {}
    reference_lines: [{reference_type: range, line_value: mean, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: left, color: "#00C1EB",
        range_start: '0.10', range_end: '0.20', value_format: '', label: mudança média},
      {reference_type: range, line_value: mean, margin_top: deviation, margin_value: mean,
        margin_bottom: deviation, label_position: left, color: "#250048", range_start: '0.2',
        range_end: '10', label: mudança alta}]
    x_axis_label_rotation: -45
    swap_axes: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Janela de Tempo: statistics_univariate_maas.time_window
      Variável: statistics_univariate_maas.var_key
      Banco: dim_bank.name
    row: 0
    col: 14
    width: 10
    height: 9
  - title: Variável preenchida x Nulos
    name: Variável preenchida x Nulos
    model: gb_monitoring
    explore: statistics_univariate_maas
    type: looker_area
    fields: [statistics_univariate_maas.period, statistics_univariate_maas.filled_value, statistics_univariate_maas.nulls_value]
    filters: {}
    sorts: [statistics_univariate_maas.period]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: statistics_univariate_maas.filled_value,
            id: statistics_univariate_maas.filled_value, name: Filled Value}, {axisId: statistics_univariate_maas.nulls_value,
            id: statistics_univariate_maas.nulls_value, name: Nulls Value}], showLabels: true,
        showValues: true, maxValue: !!null '', minValue: 0, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: ''
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    series_types:
      statistics_univariate_maas.filled_value: column
    series_colors:
      statistics_univariate_maas.nulls_value: "#250048"
      statistics_univariate_maas.filled_value: "#00C1EB"
    reference_lines: []
    x_axis_label_rotation: -45
    swap_axes: false
    ordering: none
    show_null_labels: false
    defaults_version: 1
    listen:
      Janela de Tempo: statistics_univariate_maas.time_window
      Variável: statistics_univariate_maas.var_key
      Banco: dim_bank.name
    row: 9
    col: 0
    width: 8
    height: 9
  - title: Variável preenchida x Zeros
    name: Variável preenchida x Zeros
    model: gb_monitoring
    explore: statistics_univariate_maas
    type: looker_area
    fields: [statistics_univariate_maas.period, statistics_univariate_maas.filled_different_zero_value,
      statistics_univariate_maas.empty_value]
    filters: {}
    sorts: [statistics_univariate_maas.period]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: statistics_univariate_maas.psi_value,
            id: statistics_univariate_maas.psi_value, name: Psi Value}], showLabels: true,
        showValues: true, maxValue: !!null '', minValue: 0, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: ''
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    series_types: {}
    series_colors:
      statistics_univariate_maas.empty_value: "#250048"
    reference_lines: []
    x_axis_label_rotation: -45
    swap_axes: false
    ordering: none
    show_null_labels: false
    defaults_version: 1
    listen:
      Janela de Tempo: statistics_univariate_maas.time_window
      Variável: statistics_univariate_maas.var_key
      Banco: dim_bank.name
    row: 9
    col: 8
    width: 8
    height: 9
  - title: Outliers (IQR)
    name: Outliers (IQR)
    model: gb_monitoring
    explore: statistics_bucket_outlier_maas
    type: looker_column
    fields: [statistics_bucket_outlier_maas.rel_frequency, statistics_bucket_outlier_maas.period,
      statistics_bucket_outlier_maas.abs_frequency]
    filters:
      statistics_bucket_outlier_maas.category: OUTLIER
    sorts: [statistics_bucket_outlier_maas.period]
    limit: 500
    query_timezone: America/Sao_Paulo
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: statistics_bucket_outlier_maas.abs_frequency,
            id: statistics_bucket_outlier_maas.abs_frequency, name: Abs Frequency}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: '', orientation: right, series: [{axisId: statistics_bucket_outlier_maas.rel_frequency,
            id: statistics_bucket_outlier_maas.rel_frequency, name: Rel Frequency}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    hidden_series: []
    hide_legend: false
    series_types:
      "-8973.43 to 6046.17 - statistics_bucket_outlier_maas.rel_frequency": line
      "-4517.85 to 5189.83 - statistics_bucket_outlier_maas.rel_frequency": line
      " < -4517.85 or > 5189.83 - statistics_bucket_outlier_maas.rel_frequency": line
      " < -8973.43 or > 6046.17 - statistics_bucket_outlier_maas.abs_frequency": line
      " < -3182.1199999999994 or > 3314.9999999999995 - statistics_bucket_outlier_maas.abs_frequency": line
      statistics_bucket_outlier_maas.rel_frequency: line
      statistics_bucket_outlier_maas.abs_frequency: area
    series_colors:
      " < -4517.85 or > 5189.83 - statistics_bucket_outlier_maas.abs_frequency": "#9bdfeb"
      " < -8973.43 or > 6046.17 - statistics_bucket_outlier_maas.rel_frequency": "#8bd7eb"
      statistics_bucket_outlier_maas.rel_frequency: "#F9386A"
      statistics_bucket_outlier_maas.abs_frequency: "#00C1EB"
    series_labels: {}
    reference_lines: []
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: []
    listen:
      Janela de Tempo: statistics_bucket_outlier_maas.time_window
      Variável: statistics_bucket_outlier_maas.var_key
      Banco: dim_bank.name
    row: 9
    col: 16
    width: 8
    height: 9
  - title: Percentis
    name: Percentis
    model: gb_monitoring
    explore: statistics_univariate_maas
    type: looker_line
    fields: [statistics_univariate_maas.period, statistics_univariate_maas.percentile1_value,
      statistics_univariate_maas.percentile25_value, statistics_univariate_maas.percentile5_value,
      statistics_univariate_maas.percentile50_value, statistics_univariate_maas.percentile75_value,
      statistics_univariate_maas.percentile95_value, statistics_univariate_maas.percentile99_value]
    filters: {}
    sorts: [statistics_univariate_maas.period]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: statistics_univariate_maas.percentile1_value,
            id: statistics_univariate_maas.percentile1_value, name: Percentile1 Value},
          {axisId: statistics_univariate_maas.percentile25_value, id: statistics_univariate_maas.percentile25_value,
            name: Percentile25 Value}, {axisId: statistics_univariate_maas.percentile5_value,
            id: statistics_univariate_maas.percentile5_value, name: Percentile5 Value},
          {axisId: statistics_univariate_maas.percentile50_value, id: statistics_univariate_maas.percentile50_value,
            name: Percentile50 Value}, {axisId: statistics_univariate_maas.percentile75_value,
            id: statistics_univariate_maas.percentile75_value, name: Percentile75 Value},
          {axisId: statistics_univariate_maas.percentile95_value, id: statistics_univariate_maas.percentile95_value,
            name: Percentile95 Value}, {axisId: statistics_univariate_maas.percentile99_value,
            id: statistics_univariate_maas.percentile99_value, name: Percentile99 Value}],
        showLabels: true, showValues: true, maxValue: !!null '', minValue: !!null '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: ''
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    series_types: {}
    reference_lines: []
    x_axis_label_rotation: -45
    swap_axes: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    defaults_version: 1
    listen:
      Janela de Tempo: statistics_univariate_maas.time_window
      Variável: statistics_univariate_maas.var_key
      Banco: dim_bank.name
    row: 18
    col: 0
    width: 9
    height: 8
  - title: CV e Skewness
    name: CV e Skewness
    model: gb_monitoring
    explore: statistics_univariate_maas
    type: looker_line
    fields: [statistics_univariate_maas.period, statistics_univariate_maas.skewness_value, statistics_univariate_maas.cv_value]
    filters: {}
    sorts: [statistics_univariate_maas.period]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: statistics_univariate_maas.percentile1_value,
            id: statistics_univariate_maas.percentile1_value, name: Percentile1 Value},
          {axisId: statistics_univariate_maas.percentile25_value, id: statistics_univariate_maas.percentile25_value,
            name: Percentile25 Value}, {axisId: statistics_univariate_maas.percentile5_value,
            id: statistics_univariate_maas.percentile5_value, name: Percentile5 Value},
          {axisId: statistics_univariate_maas.percentile50_value, id: statistics_univariate_maas.percentile50_value,
            name: Percentile50 Value}, {axisId: statistics_univariate_maas.percentile75_value,
            id: statistics_univariate_maas.percentile75_value, name: Percentile75 Value},
          {axisId: statistics_univariate_maas.percentile95_value, id: statistics_univariate_maas.percentile95_value,
            name: Percentile95 Value}, {axisId: statistics_univariate_maas.percentile99_value,
            id: statistics_univariate_maas.percentile99_value, name: Percentile99 Value}],
        showLabels: true, showValues: true, maxValue: !!null '', minValue: !!null '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: ''
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    series_types: {}
    reference_lines: []
    x_axis_label_rotation: -45
    swap_axes: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    defaults_version: 1
    listen:
      Janela de Tempo: statistics_univariate_maas.time_window
      Variável: statistics_univariate_maas.var_key
      Banco: dim_bank.name
    row: 18
    col: 9
    width: 5
    height: 8
  - title: Desvio Padrão
    name: Desvio Padrão
    model: gb_monitoring
    explore: statistics_univariate_maas
    type: looker_line
    fields: [statistics_univariate_maas.period, statistics_univariate_maas.stddev_value]
    filters: {}
    sorts: [statistics_univariate_maas.period]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: statistics_univariate_maas.kurtosis_value,
            id: statistics_univariate_maas.kurtosis_value, name: Kurtosis Value}, {axisId: statistics_univariate_maas.stddev_value,
            id: statistics_univariate_maas.stddev_value, name: Stddev Value}], showLabels: true,
        showValues: true, maxValue: !!null '', minValue: !!null '', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 0, type: linear}]
    x_axis_label: ''
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    series_types: {}
    reference_lines: []
    x_axis_label_rotation: -45
    swap_axes: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    defaults_version: 1
    listen:
      Janela de Tempo: statistics_univariate_maas.time_window
      Variável: statistics_univariate_maas.var_key
      Banco: dim_bank.name
    row: 18
    col: 19
    width: 5
    height: 8
  - title: Kurtosis
    name: Kurtosis
    model: gb_monitoring
    explore: statistics_univariate_maas
    type: looker_line
    fields: [statistics_univariate_maas.period, statistics_univariate_maas.kurtosis_value]
    filters: {}
    sorts: [statistics_univariate_maas.period]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: statistics_univariate_maas.kurtosis_value,
            id: statistics_univariate_maas.kurtosis_value, name: Kurtosis Value}, {axisId: statistics_univariate_maas.stddev_value,
            id: statistics_univariate_maas.stddev_value, name: Stddev Value}], showLabels: true,
        showValues: true, maxValue: !!null '', minValue: !!null '', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 0, type: linear}]
    x_axis_label: ''
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    series_types: {}
    series_colors:
      statistics_univariate_maas.kurtosis_value: "#F9386A"
    reference_lines: []
    x_axis_label_rotation: -45
    swap_axes: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    defaults_version: 1
    listen:
      Janela de Tempo: statistics_univariate_maas.time_window
      Variável: statistics_univariate_maas.var_key
      Banco: dim_bank.name
    row: 18
    col: 14
    width: 5
    height: 8
  - title: Média por Banco
    name: Média por Banco
    model: gb_monitoring
    explore: statistics_univariate_maas
    type: looker_line
    fields: [dim_bank.name, statistics_univariate_maas.period, statistics_univariate_maas.avg_value]
    pivots: [dim_bank.name]
    filters:
      dim_bank.name: "-ALL BANKS"
    sorts: [dim_bank.name 0, statistics_univariate_maas.period]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Janela de Tempo: statistics_univariate_maas.time_window
      Variável: statistics_univariate_maas.var_key
    row: 28
    col: 12
    width: 12
    height: 12
  - title: "% de preenchimento por Banco"
    name: "% de preenchimento por Banco"
    model: gb_monitoring
    explore: statistics_univariate_maas
    type: looker_line
    fields: [statistics_univariate_maas.filled_different_zero_percent, dim_bank.name,
      statistics_univariate_maas.period]
    pivots: [dim_bank.name]
    filters:
      dim_bank.name: "-ALL BANKS"
    sorts: [dim_bank.name 0, statistics_univariate_maas.period]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Janela de Tempo: statistics_univariate_maas.time_window
      Variável: statistics_univariate_maas.var_key
    row: 28
    col: 0
    width: 12
    height: 12
  filters:
  - name: Janela de Tempo
    title: Janela de Tempo
    type: field_filter
    default_value: MONTH
    allow_multiple_values: false
    required: true
    model: gb_monitoring
    explore: statistics_univariate_maas
    listens_to_filters: []
    field: statistics_univariate_maas.time_window
  - name: Variável
    title: Variável
    type: field_filter
    default_value: '"GUIABOLSO.DIAS_COM_TRANSACAO_90_DIAS"'
    allow_multiple_values: false
    required: true
    model: gb_monitoring
    explore: statistics_univariate_maas
    listens_to_filters: []
    field: statistics_univariate_maas.var_key
  - name: Banco
    title: Banco
    type: field_filter
    default_value: ALL BANKS
    allow_multiple_values: false
    required: true
    model: gb_monitoring
    explore: statistics_univariate_maas
    listens_to_filters: []
    field: dim_bank.name
