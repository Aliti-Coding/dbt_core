with

final as (

    

        (
            select
                cast('"dw"."public"."base_node_columns"' as TEXT) as _dbt_source_relation,

                
                    cast("node_unique_id" as text) as "node_unique_id" ,
                    cast("name" as text) as "name" ,
                    cast("description" as text) as "description" ,
                    cast("data_type" as text) as "data_type" ,
                    cast("constraints" as text) as "constraints" ,
                    cast("has_not_null_constraint" as boolean) as "has_not_null_constraint" ,
                    cast("constraints_count" as integer) as "constraints_count" ,
                    cast("quote" as text) as "quote" 

            from "dw"."public"."base_node_columns"

            
        )

        union all
        

        (
            select
                cast('"dw"."public"."base_source_columns"' as TEXT) as _dbt_source_relation,

                
                    cast("node_unique_id" as text) as "node_unique_id" ,
                    cast("name" as text) as "name" ,
                    cast("description" as text) as "description" ,
                    cast("data_type" as text) as "data_type" ,
                    cast("constraints" as text) as "constraints" ,
                    cast("has_not_null_constraint" as boolean) as "has_not_null_constraint" ,
                    cast("constraints_count" as integer) as "constraints_count" ,
                    cast("quote" as text) as "quote" 

            from "dw"."public"."base_source_columns"

            
        )

        
)

select * from final