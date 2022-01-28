- dashboard: MaaS_monitoramento_by_bank
  title: MaaS - Matriz de Preenchimento das Variáveis por Banco maas
  layout: newspaper
  elements:
  - name: Observações
    type: text
    title_text: Observações
    body_text: |-
      **% filled:** Porcentagem de preenchidos diferentes de zero sobre o total de ocorrências

      **% filled - % total:** Diferença entre a porcentagem de preenchidos de cada banco e a porcentagem geral (todos os bancos).

      Arraste o scroll horizontal para a direita, para visualizar esta métrica
    row: 34
    col: 0
    width: 24
    height: 4
  - title: Total de UTS por Banco
    name: Total de UTS por Banco
    model: gb_monitoring
    explore: statistics_univariate_maas
    type: looker_line
    fields: [dim_bank.name, statistics_univariate_maas.period, statistics_univariate_maas.total_occurances]
    pivots: [dim_bank.name]
    filters:
      dim_bank.name: ""
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
    color_application:
      collection_id: c3fe1b27-2cb9-4287-8855-d26b51125dad
      palette_id: 6a944f01-9235-454a-94ff-609a116cbaea
      options:
        steps: 5
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
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
      Variáveis: statistics_univariate_maas.var_key
      Bancos: dim_bank.name
    row: 25
    col: 0
    width: 24
    height: 9
  - title: Matriz de Preenchimento de Variáveis por Banco
    name: Matriz de Preenchimento de Variáveis por Banco
    model: gb_monitoring
    explore: statistics_univariate_maas
    type: looker_grid
    fields: [statistics_univariate_maas.var_key, statistics_univariate_maas.filled_different_zero_percent,
      dim_bank.name]
    pivots: [dim_bank.name]
    filters:
      statistics_univariate_maas.time_window: MONTH
      dim_bank.name: ''
    sorts: [dim_bank.name desc, statistics_univariate_maas.filled_different_zero_percent
        desc 0]
    limit: 500
    total: true
    row_total: right
    dynamic_fields: [{table_calculation: diff_not_zero_between_bank_x_total_percent,
        label: Diff not Zero between bank x total percent, expression: "${statistics_univariate_maas.filled_different_zero_percent}\
          \ / ${statistics_univariate_maas.filled_different_zero_percent:row_total} -1",
        value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        _type_hint: number}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
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
    pinned_columns:
      statistics_univariate_maas.var_key: left
    column_order: ["$$$_row_numbers_$$$", statistics_univariate_maas.var_key, BANCO ITAÚ
        UNIBANCO S.A._statistics_univariate_maas.filled_different_zero_percent, BANCO BRADESCO
        S/A_statistics_univariate_maas.filled_different_zero_percent, BANCO SANTANDER S.A._statistics_univariate_maas.filled_different_zero_percent,
      BANCO DO BRASIL S/A_statistics_univariate_maas.filled_different_zero_percent, CAIXA
        ECONÔMICA FEDERAL_statistics_univariate_maas.filled_different_zero_percent, NUBANK_statistics_univariate_maas.filled_different_zero_percent,
      BANCO INTER S.A._statistics_univariate_maas.filled_different_zero_percent, BANCO
        ORIGINAL S.A._statistics_univariate_maas.filled_different_zero_percent, MULTIPLE
        BANKS_statistics_univariate_maas.filled_different_zero_percent, CONTA MANUAL_statistics_univariate_maas.filled_different_zero_percent,
      "$$$_row_total_$$$_statistics_univariate_maas.filled_different_zero_percent", BANCO
        ITAÚ UNIBANCO S.A._diff_not_zero_between_bank_x_total_percent, BANCO BRADESCO
        S/A_diff_not_zero_between_bank_x_total_percent, BANCO SANTANDER S.A._diff_not_zero_between_bank_x_total_percent,
      BANCO DO BRASIL S/A_diff_not_zero_between_bank_x_total_percent, CAIXA ECONÔMICA
        FEDERAL_diff_not_zero_between_bank_x_total_percent, NUBANK_diff_not_zero_between_bank_x_total_percent,
      BANCO INTER S.A._diff_not_zero_between_bank_x_total_percent, BANCO ORIGINAL
        S.A._diff_not_zero_between_bank_x_total_percent, MULTIPLE BANKS_diff_not_zero_between_bank_x_total_percent,
      CONTA MANUAL_diff_not_zero_between_bank_x_total_percent]
    show_totals: true
    show_row_totals: true
    series_labels:
      diff_not_zero_between_bank_x_total_percent: "% filled / % total"
      statistics_univariate_maas.filled_different_zero_percent: "% filled"
    series_column_widths:
      statistics_univariate_maas.var_key: 360
      statistics_univariate_maas.percentile1_value: 109
      diff_not_zero_between_bank_x_total_percent: 140
      statistics_univariate_maas.filled_different_zero_percent: 140
      dim_bank.name: 160
    series_cell_visualizations:
      statistics_univariate_maas.filled_different_zero_percent:
        is_active: false
      diff_not_zero_between_bank_x_total_percent:
        is_active: false
    series_text_format:
      statistics_univariate_maas.filled_different_zero_percent:
        fg_color: "#1c1c1c"
        align: center
      statistics_univariate_maas.var_key:
        fg_color: "#000000"
      diff_not_zero_between_bank_x_total_percent:
        align: center
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#00C1EB",
        font_color: !!null '', color_application: {collection_id: c3fe1b27-2cb9-4287-8855-d26b51125dad,
          palette_id: 49730def-2ec9-46c3-8765-65bb7a88f267, options: {steps: 7, constraints: {
              min: {type: number, value: -0.5}, mid: {type: number, value: -0.15},
              max: {type: number, value: 0.1}}, mirror: false, reverse: false, stepped: true}},
        bold: false, italic: false, strikethrough: false, fields: [diff_not_zero_between_bank_x_total_percent]},
      {type: along a scale..., value: !!null '', background_color: "#00C1EB", font_color: !!null '',
        color_application: {collection_id: c3fe1b27-2cb9-4287-8855-d26b51125dad, palette_id: 49730def-2ec9-46c3-8765-65bb7a88f267,
          options: {steps: 7, constraints: {min: {type: number, value: 0}, mid: {
                type: number, value: 0.5}, max: {type: number, value: 1}}, mirror: false,
            reverse: false, stepped: true}}, bold: false, italic: false, strikethrough: false,
        fields: [statistics_univariate_maas.filled_different_zero_percent]}, {type: 'null',
        value: !!null '', background_color: "#f23d23", font_color: !!null '', color_application: {
          collection_id: c3fe1b27-2cb9-4287-8855-d26b51125dad, palette_id: 49730def-2ec9-46c3-8765-65bb7a88f267,
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: number,
                value: -4}, max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
      Ano/Mês: statistics_univariate_maas.period
      Variáveis: statistics_univariate_maas.var_key
      Bancos: dim_bank.name
    row: 0
    col: 0
    width: 24
    height: 25
  filters:
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
  - name: Variáveis
    title: Variáveis
    type: field_filter
    default_value: "%GUIABOLSO%"
    allow_multiple_values: true
    required: false
    model: gb_monitoring
    explore: statistics_univariate_maas
    listens_to_filters: []
    field: statistics_univariate_maas.var_key
  - name: Bancos
    title: Bancos
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: gb_monitoring
    explore: statistics_univariate_maas
    listens_to_filters: []
    field: dim_bank.name
