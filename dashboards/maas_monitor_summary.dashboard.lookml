- dashboard: monitoramento_de_variveis__sumrio
  title: Maas Monitoramento de Variáveis - Sumário
  layout: newspaper
  elements:
  - name: Variáveis com possíveis problemas
    type: text
    title_text: Variáveis com possíveis problemas
    row: 7
    col: 0
    width: 24
    height: 2
  - name: "% sobre o total por variável"
    type: text
    title_text: "% sobre o total por variável"
    row: 27
    col: 0
    width: 24
    height: 2
  - title: Quantidade de variáveis
    name: Quantidade de variáveis
    model: gb_monitoring
    explore: statistics_univariate_maas
    type: looker_line
    fields: [statistics_univariate_maas.period, statistics_univariate_maas.count]
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
    show_x_axis_ticks: false
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Janela de Tempo: statistics_univariate_maas.time_window
      Variáveis: statistics_univariate_maas.var_key
      Somente GBConnect?: statistics_univariate_maas.is_gbconnect
      Banco: dim_bank.name
    row: 0
    col: 0
    width: 6
    height: 7
  - title: Média de PSI
    name: Média de PSI
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
    show_x_axis_ticks: false
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
    reference_lines: [{reference_type: range, margin_top: deviation, margin_value: mean,
        margin_bottom: deviation, label_position: left, color: "#00C1EB", label: mudança
          média, line_value: '0.2', range_start: '0.1', range_end: '0.2'}, {reference_type: range,
        line_value: mean, range_start: max, margin_top: deviation, margin_value: mean,
        margin_bottom: deviation, label_position: left, color: "#250048", range_end: '0.2',
        label: mudança alta}]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Janela de Tempo: statistics_univariate_maas.time_window
      Variáveis: statistics_univariate_maas.var_key
      Somente GBConnect?: statistics_univariate_maas.is_gbconnect
      Banco: dim_bank.name
    row: 0
    col: 6
    width: 6
    height: 7
  - title: Preenchidos x Nulos
    name: Preenchidos x Nulos
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
    show_x_axis_ticks: false
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
    color_application:
      collection_id: c3fe1b27-2cb9-4287-8855-d26b51125dad
      palette_id: 6a944f01-9235-454a-94ff-609a116cbaea
      options:
        steps: 5
    series_types: {}
    series_colors:
      statistics_univariate_maas.nulls_value: "#250048"
    ordering: none
    show_null_labels: false
    defaults_version: 1
    listen:
      Janela de Tempo: statistics_univariate_maas.time_window
      Variáveis: statistics_univariate_maas.var_key
      Somente GBConnect?: statistics_univariate_maas.is_gbconnect
      Banco: dim_bank.name
    row: 0
    col: 12
    width: 6
    height: 7
  - title: Diferença entre a taxa de Outlier do período x Período Anterior
    name: Diferença entre a taxa de Outlier do período x Período Anterior
    model: gb_monitoring
    explore: statistics_univariate_lag_metrics_maas
    type: looker_grid
    fields: [statistics_univariate_lag_metrics_maas.var_key, statistics_univariate_lag_metrics_maas.outlier_diff_last_period,
      statistics_univariate_lag_metrics_maas.outlier_diff_six_months]
    filters:
      statistics_univariate_lag_metrics_maas.outlier_percent: ">0.05"
    sorts: [statistics_univariate_lag_metrics_maas.diff_outlier_values_from_last_period
        desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      statistics_univariate_lag_metrics_maas.diff_empty_values_from_last_period:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#00C1EB",
        font_color: !!null '', color_application: {collection_id: c3fe1b27-2cb9-4287-8855-d26b51125dad,
          custom: {id: 1eab0460-78b3-77ad-fd28-e3365284a1ae, label: Custom, type: continuous,
            stops: [{color: "#faa3cf", offset: 0}, {color: "#9cd7eb", offset: 100}]},
          options: {steps: 5, reverse: true, constraints: {mid: {type: number, value: 0.3}},
            stepped: false, mirror: false}}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    defaults_version: 1
    listen:
      Janela de Tempo: statistics_univariate_lag_metrics_maas.time_window
      Variáveis: statistics_univariate_lag_metrics_maas.var_key
      Período mais recente?: statistics_univariate_lag_metrics_maas.fl_last_period
      Somente GBConnect?: statistics_univariate_lag_metrics_maas.is_gbconnect
      Banco: dim_bank.name
      Ano/Mês: statistics_univariate_lag_metrics_maas.period
    row: 9
    col: 0
    width: 12
    height: 9
  - title: "% de valores vazios ou zerados"
    name: "% de valores vazios ou zerados"
    model: gb_monitoring
    explore: statistics_univariate_maas
    type: looker_grid
    fields: [statistics_univariate_maas.var_key, statistics_univariate_maas.filled_empty_percent]
    filters: {}
    sorts: [statistics_univariate_maas.filled_empty_percent desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      statistics_univariate_maas.psi_value:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#00C1EB",
        font_color: !!null '', color_application: {collection_id: c3fe1b27-2cb9-4287-8855-d26b51125dad,
          custom: {id: 741cf6e6-6ad1-5b32-fb0a-45cb7ab847d6, label: Custom, type: continuous,
            stops: [{color: "#faa3cf", offset: 0}, {color: "#9cd7eb", offset: 100}]},
          options: {steps: 5, reverse: true}}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    defaults_version: 1
    series_types: {}
    listen:
      Janela de Tempo: statistics_univariate_maas.time_window
      Variáveis: statistics_univariate_maas.var_key
      Período mais recente?: statistics_univariate_maas.fl_last_period
      Somente GBConnect?: statistics_univariate_maas.is_gbconnect
      Banco: dim_bank.name
      Ano/Mês: statistics_univariate_maas.period
    row: 29
    col: 0
    width: 12
    height: 9
  - title: Preenchidos x Zeros
    name: Preenchidos x Zeros
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
    show_x_axis_ticks: false
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
    series_types: {}
    series_colors:
      statistics_univariate_maas.empty_value: "#250048"
    ordering: none
    show_null_labels: false
    defaults_version: 1
    listen:
      Janela de Tempo: statistics_univariate_maas.time_window
      Variáveis: statistics_univariate_maas.var_key
      Somente GBConnect?: statistics_univariate_maas.is_gbconnect
      Banco: dim_bank.name
    row: 0
    col: 18
    width: 6
    height: 7
  - title: Diferença entre a taxa de Nulos do período x Período Anterior
    name: Diferença entre a taxa de Nulos do período x Período Anterior
    model: gb_monitoring
    explore: statistics_univariate_lag_metrics_maas
    type: looker_grid
    fields: [statistics_univariate_lag_metrics_maas.var_key, statistics_univariate_lag_metrics_maas.nulls_diff_last_period,
      statistics_univariate_lag_metrics_maas.nulls_diff_six_months]
    filters:
      statistics_univariate_lag_metrics_maas.null_percent: ">0.05"
    sorts: [statistics_univariate_lag_metrics_maas.diff_nulls_values_from_last_period desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      statistics_univariate_lag_metrics_maas.diff_empty_values_from_last_period:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#00C1EB",
        font_color: !!null '', color_application: {collection_id: c3fe1b27-2cb9-4287-8855-d26b51125dad,
          custom: {id: 1eab0460-78b3-77ad-fd28-e3365284a1ae, label: Custom, type: continuous,
            stops: [{color: "#faa3cf", offset: 0}, {color: "#9cd7eb", offset: 100}]},
          options: {steps: 5, reverse: true, constraints: {mid: {type: number, value: 0.3}},
            stepped: false, mirror: false}}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    defaults_version: 1
    listen:
      Janela de Tempo: statistics_univariate_lag_metrics_maas.time_window
      Variáveis: statistics_univariate_lag_metrics_maas.var_key
      Período mais recente?: statistics_univariate_lag_metrics_maas.fl_last_period
      Somente GBConnect?: statistics_univariate_lag_metrics_maas.is_gbconnect
      Banco: dim_bank.name
      Ano/Mês: statistics_univariate_lag_metrics_maas.period
    row: 18
    col: 12
    width: 12
    height: 9
  - title: Diferença entre a taxa de Zeros do período x Período Anterior
    name: Diferença entre a taxa de Zeros do período x Período Anterior
    model: gb_monitoring
    explore: statistics_univariate_lag_metrics_maas
    type: looker_grid
    fields: [statistics_univariate_lag_metrics_maas.var_key, statistics_univariate_lag_metrics_maas.empty_diff_last_period,
      statistics_univariate_lag_metrics_maas.empty_diff_six_months]
    filters:
      statistics_univariate_lag_metrics_maas.empty_percent: ">0.05"
    sorts: [statistics_univariate_lag_metrics_maas.empty_diff_last_period desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      statistics_univariate_lag_metrics_maas.diff_empty_values_from_last_period:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#00C1EB",
        font_color: !!null '', color_application: {collection_id: c3fe1b27-2cb9-4287-8855-d26b51125dad,
          custom: {id: 1eab0460-78b3-77ad-fd28-e3365284a1ae, label: Custom, type: continuous,
            stops: [{color: "#faa3cf", offset: 0}, {color: "#9cd7eb", offset: 100}]},
          options: {steps: 5, reverse: true, constraints: {mid: {type: number, value: 0.3}},
            stepped: false, mirror: false}}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    defaults_version: 1
    listen:
      Janela de Tempo: statistics_univariate_lag_metrics_maas.time_window
      Variáveis: statistics_univariate_lag_metrics_maas.var_key
      Período mais recente?: statistics_univariate_lag_metrics_maas.fl_last_period
      Somente GBConnect?: statistics_univariate_lag_metrics_maas.is_gbconnect
      Banco: dim_bank.name
      Ano/Mês: statistics_univariate_lag_metrics_maas.period
    row: 18
    col: 0
    width: 12
    height: 9
  - title: "% de valores nulos (copy)"
    name: "% de valores nulos (copy)"
    model: gb_monitoring
    explore: statistics_univariate_maas
    type: looker_grid
    fields: [statistics_univariate_maas.var_key, statistics_univariate_maas.filled_different_zero_percent]
    filters: {}
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      statistics_univariate_maas.psi_value:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#00C1EB",
        font_color: !!null '', color_application: {collection_id: c3fe1b27-2cb9-4287-8855-d26b51125dad,
          custom: {id: 78f1e265-699f-f7f8-52cf-7c291c51be46, label: Custom, type: continuous,
            stops: [{color: "#faa3cf", offset: 0}, {color: "#9cd7eb", offset: 100}]},
          options: {steps: 5, reverse: true}}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    defaults_version: 1
    series_types: {}
    listen:
      Janela de Tempo: statistics_univariate_maas.time_window
      Variáveis: statistics_univariate_maas.var_key
      Período mais recente?: statistics_univariate_maas.fl_last_period
      Somente GBConnect?: statistics_univariate_maas.is_gbconnect
      Banco: dim_bank.name
      Ano/Mês: statistics_univariate_maas.period
    row: 38
    col: 0
    width: 12
    height: 9
  - title: "% de valores nulos"
    name: "% de valores nulos"
    model: gb_monitoring
    explore: statistics_univariate_maas
    type: looker_grid
    fields: [statistics_univariate_maas.var_key, statistics_univariate_maas.null_percent]
    filters: {}
    sorts: [statistics_univariate_maas.null_percent desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      statistics_univariate_maas.psi_value:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#00C1EB",
        font_color: !!null '', color_application: {collection_id: c3fe1b27-2cb9-4287-8855-d26b51125dad,
          custom: {id: 78f1e265-699f-f7f8-52cf-7c291c51be46, label: Custom, type: continuous,
            stops: [{color: "#faa3cf", offset: 0}, {color: "#9cd7eb", offset: 100}]},
          options: {steps: 5, reverse: true}}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    defaults_version: 1
    series_types: {}
    listen:
      Janela de Tempo: statistics_univariate_maas.time_window
      Variáveis: statistics_univariate_maas.var_key
      Período mais recente?: statistics_univariate_maas.fl_last_period
      Somente GBConnect?: statistics_univariate_maas.is_gbconnect
      Banco: dim_bank.name
      Ano/Mês: statistics_univariate_maas.period
    row: 29
    col: 12
    width: 12
    height: 9
  - title: Lista de Variáveis por PSI no período
    name: Lista de Variáveis por PSI no período
    model: gb_monitoring
    explore: statistics_univariate_maas
    type: looker_grid
    fields: [statistics_univariate_maas.var_key, statistics_univariate_maas.psi_value]
    filters: {}
    sorts: [statistics_univariate_maas.psi_value desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      statistics_univariate_maas.psi_value:
        is_active: false
    conditional_formatting: [{type: greater than, value: 0.25, background_color: "#faa3cf",
        font_color: !!null '', color_application: {collection_id: c3fe1b27-2cb9-4287-8855-d26b51125dad,
          palette_id: 78e2ff85-7f92-40c3-8510-ef3b4c3a4604}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: greater than, value: 0.1,
        background_color: "#9cd7eb", font_color: !!null '', color_application: {collection_id: c3fe1b27-2cb9-4287-8855-d26b51125dad,
          palette_id: 78e2ff85-7f92-40c3-8510-ef3b4c3a4604}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    defaults_version: 1
    series_types: {}
    listen:
      Janela de Tempo: statistics_univariate_maas.time_window
      Variáveis: statistics_univariate_maas.var_key
      Período mais recente?: statistics_univariate_maas.fl_last_period
      Somente GBConnect?: statistics_univariate_maas.is_gbconnect
      Banco: dim_bank.name
      Ano/Mês: statistics_univariate_maas.period
    row: 9
    col: 12
    width: 12
    height: 9
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
  - name: Variáveis
    title: Variáveis
    type: field_filter
    default_value: "%GUIABOLSO%"
    allow_multiple_values: true
    required: false
    model: gb_monitoring
    explore: statistics_univariate_maas
    listens_to_filters: ['Somente GBConnect?']
    field: statistics_univariate_maas.var_key
  - name: Período mais recente?
    title: Período mais recente?
    type: field_filter
    default_value: Y
    allow_multiple_values: true
    required: false
    model: gb_monitoring
    explore: statistics_univariate_maas
    listens_to_filters: []
    field: statistics_univariate_maas.fl_last_period
  - name: Somente GBConnect?
    title: Somente GBConnect?
    type: field_filter
    default_value: Y
    allow_multiple_values: true
    required: false
    model: gb_monitoring
    explore: statistics_univariate_maas
    listens_to_filters: []
    field: statistics_univariate_maas.is_gbconnect
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
  - name: Ano/Mês
    title: Ano/Mês
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: gb_monitoring
    explore: statistics_univariate_maas
    listens_to_filters: [Janela de Tempo]
    field: statistics_univariate_maas.period
