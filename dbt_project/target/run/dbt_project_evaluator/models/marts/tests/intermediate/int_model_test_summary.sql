
  create view "dw"."public"."int_model_test_summary__dbt_tmp"
    
    
  as (
    with 

all_graph_resources as (
    select * from "dw"."public"."int_all_graph_resources"
    where not is_excluded
),

relationships as (
    select * from "dw"."public"."int_direct_relationships"
),

count_column_tests as (
    
    select 
        relationships.direct_parent_id, 
        all_graph_resources.column_name,
        sum(case
                when all_graph_resources.is_test_unique
                then 1
                else 0
            end
         ) as test_unique_count,count(distinct case when 
                all_graph_resources.is_test_unique or  
                all_graph_resources.is_test_not_null
            then relationships.resource_id else null end
        ) as primary_key_method_1_count,count(distinct case when 
                all_graph_resources.is_test_unique_combination_of_columns
            then relationships.resource_id else null end
        ) as primary_key_method_2_count,
        count(distinct relationships.resource_id) as tests_count
    from all_graph_resources
    left join relationships
        on all_graph_resources.resource_id = relationships.resource_id
    where all_graph_resources.resource_type = 'test'
    and relationships.is_primary_test_relationship
    group by 1,2
),

count_column_constraints as (

    select
        node_unique_id as direct_parent_id,
        name as column_name,
        case
            when has_not_null_constraint
            then 1
            else 0
        end as constraint_not_null_count,
        constraints_count
    from "dw"."public"."base_node_columns"

),

combine_column_counts as (

    select
        count_column_tests.*,
        count_column_tests.test_unique_count + count_column_constraints.constraint_not_null_count as primary_key_mixed_method_count,
        count_column_constraints.constraints_count
    from count_column_tests
    left join count_column_constraints
        on count_column_tests.direct_parent_id = count_column_constraints.direct_parent_id
        and count_column_tests.column_name = count_column_constraints.column_name

),

agg_test_relationships as (

    select 
        direct_parent_id, 
        cast(sum(case 
                when (
                    primary_key_method_1_count >= 2
                        or
                    primary_key_method_2_count >= 1
                        or
                    primary_key_mixed_method_count >= 2
                ) then 1 
                else 0 
            end
        ) >= 1 as boolean) as is_primary_key_tested,
        cast(sum(tests_count) as integer) as number_of_tests_on_model,
        cast(sum(constraints_count) as integer) as number_of_constraints_on_model
    from combine_column_counts
    group by 1

),

final as (
    select 
        all_graph_resources.resource_name,
        all_graph_resources.resource_type,
        all_graph_resources.model_type,
        cast(coalesce(agg_test_relationships.is_primary_key_tested, FALSE) as boolean) as is_primary_key_tested,
        cast(coalesce(agg_test_relationships.number_of_tests_on_model, 0) as integer) as number_of_tests_on_model,
        cast(coalesce(agg_test_relationships.number_of_constraints_on_model, 0) as integer) as number_of_constraints_on_model
    from all_graph_resources
    left join agg_test_relationships
        on all_graph_resources.resource_id = agg_test_relationships.direct_parent_id
    where
        all_graph_resources.resource_type in ('model', 'seed', 'source', 'snapshot')
)

select * from final
  );