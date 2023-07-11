view: stock_qty {
  derived_table: {
    sql: SELECT item_no_,
          current_date() AS current_date,
          qty___base_
        FROM iconic-fc.bc_dynamicsnav.v_c_dbo_the_iconic_live_warehouse_entry
        WHERE DATE(registering_date) BETWEEN current_date()-1 AND current_date()
        AND qty___base_ > 2000
        GROUP BY 1,2,3;;
  }
}
