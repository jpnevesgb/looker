view: dim_bank {

  derived_table: {
    sql:
          SELECT
            cast(id_bank as varchar(10)) as id_bank,
            name as bank_name
          FROM layer4.dim_bank
          WHERE id_bank in(1,2,3,4,5,6,11,12,13)
          UNION ALL
          SELECT
            '99' as id_bank,
            'MULTIPLE BANKS' as bank_name
          UNION ALL
          SELECT
            'ALL' as id_bank,
            'ALL BANKS' as bank_name;;
    }

    dimension: name {
      type: string
      alias: [bank_name]
      sql: ${TABLE}.name ;;
    }

    dimension: id_bank {
      type: number
      sql: ${TABLE}.id_bank ;;
    }


    measure: count {
      type: count
      drill_fields: [name]
    }
  }
