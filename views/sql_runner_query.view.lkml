#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines


view: sql_runner_query {
  derived_table: {
    sql: SELECT item_no_,
      current_date() AS current_date,
      qty___base_
      FROM iconic-fc.bc_dynamicsnav.v_c_dbo_the_iconic_live_warehouse_entry
      WHERE DATE(registering_date) BETWEEN current_date()-1 AND current_date()
      AND qty___base_ > 2000
      GROUP BY 1,2,3 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: item_no_ {
    type: string
    sql: ${TABLE}.item_no_ ;;
  }

  dimension: current_date {
    type: date
    datatype: date
    sql: ${TABLE}.current_date ;;
  }

  dimension: qty___base_ {
    type: number
    sql: ${TABLE}.qty___base_ ;;
  }

  set: detail {
    fields: [
        item_no_,
	current_date,
	qty___base_
    ]
  }
}
