-- one row for each resource in the graph



with unioned as (

    

        (
            select
                cast('"dw"."public"."stg_nodes"' as TEXT) as _dbt_source_relation,

                
                    cast("unique_id" as text) as "unique_id" ,
                    cast("name" as text) as "name" ,
                    cast("resource_type" as text) as "resource_type" ,
                    cast("file_path" as text) as "file_path" ,
                    cast("is_enabled" as boolean) as "is_enabled" ,
                    cast("materialized" as text) as "materialized" ,
                    cast("on_schema_change" as text) as "on_schema_change" ,
                    cast("model_group" as text) as "model_group" ,
                    cast("access" as text) as "access" ,
                    cast("latest_version" as text) as "latest_version" ,
                    cast("version" as text) as "version" ,
                    cast("deprecation_date" as text) as "deprecation_date" ,
                    cast("is_contract_enforced" as boolean) as "is_contract_enforced" ,
                    cast("total_defined_columns" as integer) as "total_defined_columns" ,
                    cast("total_described_columns" as integer) as "total_described_columns" ,
                    cast("database" as text) as "database" ,
                    cast("schema" as text) as "schema" ,
                    cast("package_name" as text) as "package_name" ,
                    cast("alias" as text) as "alias" ,
                    cast("is_described" as boolean) as "is_described" ,
                    cast("column_name" as text) as "column_name" ,
                    cast("meta" as text) as "meta" ,
                    cast("hard_coded_references" as text) as "hard_coded_references" ,
                    cast("number_lines" as integer) as "number_lines" ,
                    cast("sql_complexity" as double precision) as "sql_complexity" ,
                    cast("macro_dependencies" as text) as "macro_dependencies" ,
                    cast("is_generic_test" as boolean) as "is_generic_test" ,
                    cast("is_excluded" as boolean) as "is_excluded" ,
                    cast(null as text) as "exposure_type" ,
                    cast(null as text) as "maturity" ,
                    cast(null as text) as "url" ,
                    cast(null as text) as "owner_name" ,
                    cast(null as text) as "owner_email" ,
                    cast(null as text) as "metric_type" ,
                    cast(null as text) as "label" ,
                    cast(null as text) as "metric_filter" ,
                    cast(null as text) as "metric_measure" ,
                    cast(null as text) as "metric_measure_alias" ,
                    cast(null as text) as "numerator" ,
                    cast(null as text) as "denominator" ,
                    cast(null as text) as "expr" ,
                    cast(null as text) as "metric_window" ,
                    cast(null as text) as "grain_to_date" ,
                    cast(null as text) as "source_name" ,
                    cast(null as boolean) as "is_source_described" ,
                    cast(null as text) as "loaded_at_field" ,
                    cast(null as boolean) as "is_freshness_enabled" ,
                    cast(null as text) as "loader" ,
                    cast(null as text) as "identifier" 

            from "dw"."public"."stg_nodes"

            
        )

        union all
        

        (
            select
                cast('"dw"."public"."stg_exposures"' as TEXT) as _dbt_source_relation,

                
                    cast("unique_id" as text) as "unique_id" ,
                    cast("name" as text) as "name" ,
                    cast("resource_type" as text) as "resource_type" ,
                    cast("file_path" as text) as "file_path" ,
                    cast(null as boolean) as "is_enabled" ,
                    cast(null as text) as "materialized" ,
                    cast(null as text) as "on_schema_change" ,
                    cast(null as text) as "model_group" ,
                    cast(null as text) as "access" ,
                    cast(null as text) as "latest_version" ,
                    cast(null as text) as "version" ,
                    cast(null as text) as "deprecation_date" ,
                    cast(null as boolean) as "is_contract_enforced" ,
                    cast(null as integer) as "total_defined_columns" ,
                    cast(null as integer) as "total_described_columns" ,
                    cast(null as text) as "database" ,
                    cast(null as text) as "schema" ,
                    cast("package_name" as text) as "package_name" ,
                    cast(null as text) as "alias" ,
                    cast("is_described" as boolean) as "is_described" ,
                    cast(null as text) as "column_name" ,
                    cast("meta" as text) as "meta" ,
                    cast(null as text) as "hard_coded_references" ,
                    cast(null as integer) as "number_lines" ,
                    cast(null as double precision) as "sql_complexity" ,
                    cast(null as text) as "macro_dependencies" ,
                    cast(null as boolean) as "is_generic_test" ,
                    cast(null as boolean) as "is_excluded" ,
                    cast("exposure_type" as text) as "exposure_type" ,
                    cast("maturity" as text) as "maturity" ,
                    cast("url" as text) as "url" ,
                    cast("owner_name" as text) as "owner_name" ,
                    cast("owner_email" as text) as "owner_email" ,
                    cast(null as text) as "metric_type" ,
                    cast(null as text) as "label" ,
                    cast(null as text) as "metric_filter" ,
                    cast(null as text) as "metric_measure" ,
                    cast(null as text) as "metric_measure_alias" ,
                    cast(null as text) as "numerator" ,
                    cast(null as text) as "denominator" ,
                    cast(null as text) as "expr" ,
                    cast(null as text) as "metric_window" ,
                    cast(null as text) as "grain_to_date" ,
                    cast(null as text) as "source_name" ,
                    cast(null as boolean) as "is_source_described" ,
                    cast(null as text) as "loaded_at_field" ,
                    cast(null as boolean) as "is_freshness_enabled" ,
                    cast(null as text) as "loader" ,
                    cast(null as text) as "identifier" 

            from "dw"."public"."stg_exposures"

            
        )

        union all
        

        (
            select
                cast('"dw"."public"."stg_metrics"' as TEXT) as _dbt_source_relation,

                
                    cast("unique_id" as text) as "unique_id" ,
                    cast("name" as text) as "name" ,
                    cast("resource_type" as text) as "resource_type" ,
                    cast("file_path" as text) as "file_path" ,
                    cast(null as boolean) as "is_enabled" ,
                    cast(null as text) as "materialized" ,
                    cast(null as text) as "on_schema_change" ,
                    cast(null as text) as "model_group" ,
                    cast(null as text) as "access" ,
                    cast(null as text) as "latest_version" ,
                    cast(null as text) as "version" ,
                    cast(null as text) as "deprecation_date" ,
                    cast(null as boolean) as "is_contract_enforced" ,
                    cast(null as integer) as "total_defined_columns" ,
                    cast(null as integer) as "total_described_columns" ,
                    cast(null as text) as "database" ,
                    cast(null as text) as "schema" ,
                    cast("package_name" as text) as "package_name" ,
                    cast(null as text) as "alias" ,
                    cast("is_described" as boolean) as "is_described" ,
                    cast(null as text) as "column_name" ,
                    cast("meta" as text) as "meta" ,
                    cast(null as text) as "hard_coded_references" ,
                    cast(null as integer) as "number_lines" ,
                    cast(null as double precision) as "sql_complexity" ,
                    cast(null as text) as "macro_dependencies" ,
                    cast(null as boolean) as "is_generic_test" ,
                    cast(null as boolean) as "is_excluded" ,
                    cast(null as text) as "exposure_type" ,
                    cast(null as text) as "maturity" ,
                    cast(null as text) as "url" ,
                    cast(null as text) as "owner_name" ,
                    cast(null as text) as "owner_email" ,
                    cast("metric_type" as text) as "metric_type" ,
                    cast("label" as text) as "label" ,
                    cast("metric_filter" as text) as "metric_filter" ,
                    cast("metric_measure" as text) as "metric_measure" ,
                    cast("metric_measure_alias" as text) as "metric_measure_alias" ,
                    cast("numerator" as text) as "numerator" ,
                    cast("denominator" as text) as "denominator" ,
                    cast("expr" as text) as "expr" ,
                    cast("metric_window" as text) as "metric_window" ,
                    cast("grain_to_date" as text) as "grain_to_date" ,
                    cast(null as text) as "source_name" ,
                    cast(null as boolean) as "is_source_described" ,
                    cast(null as text) as "loaded_at_field" ,
                    cast(null as boolean) as "is_freshness_enabled" ,
                    cast(null as text) as "loader" ,
                    cast(null as text) as "identifier" 

            from "dw"."public"."stg_metrics"

            
        )

        union all
        

        (
            select
                cast('"dw"."public"."stg_sources"' as TEXT) as _dbt_source_relation,

                
                    cast("unique_id" as text) as "unique_id" ,
                    cast("name" as text) as "name" ,
                    cast("resource_type" as text) as "resource_type" ,
                    cast("file_path" as text) as "file_path" ,
                    cast("is_enabled" as boolean) as "is_enabled" ,
                    cast(null as text) as "materialized" ,
                    cast(null as text) as "on_schema_change" ,
                    cast(null as text) as "model_group" ,
                    cast(null as text) as "access" ,
                    cast(null as text) as "latest_version" ,
                    cast(null as text) as "version" ,
                    cast(null as text) as "deprecation_date" ,
                    cast(null as boolean) as "is_contract_enforced" ,
                    cast(null as integer) as "total_defined_columns" ,
                    cast(null as integer) as "total_described_columns" ,
                    cast("database" as text) as "database" ,
                    cast("schema" as text) as "schema" ,
                    cast("package_name" as text) as "package_name" ,
                    cast("alias" as text) as "alias" ,
                    cast("is_described" as boolean) as "is_described" ,
                    cast(null as text) as "column_name" ,
                    cast("meta" as text) as "meta" ,
                    cast(null as text) as "hard_coded_references" ,
                    cast(null as integer) as "number_lines" ,
                    cast(null as double precision) as "sql_complexity" ,
                    cast(null as text) as "macro_dependencies" ,
                    cast(null as boolean) as "is_generic_test" ,
                    cast("is_excluded" as boolean) as "is_excluded" ,
                    cast(null as text) as "exposure_type" ,
                    cast(null as text) as "maturity" ,
                    cast(null as text) as "url" ,
                    cast(null as text) as "owner_name" ,
                    cast(null as text) as "owner_email" ,
                    cast(null as text) as "metric_type" ,
                    cast(null as text) as "label" ,
                    cast(null as text) as "metric_filter" ,
                    cast(null as text) as "metric_measure" ,
                    cast(null as text) as "metric_measure_alias" ,
                    cast(null as text) as "numerator" ,
                    cast(null as text) as "denominator" ,
                    cast(null as text) as "expr" ,
                    cast(null as text) as "metric_window" ,
                    cast(null as text) as "grain_to_date" ,
                    cast("source_name" as text) as "source_name" ,
                    cast("is_source_described" as boolean) as "is_source_described" ,
                    cast("loaded_at_field" as text) as "loaded_at_field" ,
                    cast("is_freshness_enabled" as boolean) as "is_freshness_enabled" ,
                    cast("loader" as text) as "loader" ,
                    cast("identifier" as text) as "identifier" 

            from "dw"."public"."stg_sources"

            
        )

        

),

naming_convention_prefixes as (
    select * from "dw"."public"."stg_naming_convention_prefixes"
), 

naming_convention_folders as (
    select * from "dw"."public"."stg_naming_convention_folders"
), 

unioned_with_calc as (
    select 
        *,
        case 
            when resource_type = 'source' then  source_name || '.' || name
            when coalesce(version, '') != '' then name || '.v' || version 
            else name 
        end as resource_name,
        case
            when resource_type = 'source' then null
            else 

  
    

    split_part(
        name,
        '_',
        1
        )


  

||'_' 
        end as prefix,
        
  

    replace(
        file_path,
        regexp_replace(file_path,'.*/',''),
        ''
    )



    
  
 as directory_path,
        regexp_replace(file_path,'.*/','') as file_name
    from unioned
    where coalesce(is_enabled, True) = True and package_name != 'dbt_project_evaluator'
), 

joined as (

    select
        unioned_with_calc.unique_id as resource_id, 
        unioned_with_calc.resource_name, 
        unioned_with_calc.prefix, 
        unioned_with_calc.resource_type, 
        unioned_with_calc.file_path, 
        unioned_with_calc.directory_path,
        unioned_with_calc.is_generic_test,
        unioned_with_calc.file_name,
        case 
            when unioned_with_calc.resource_type in ('test', 'source', 'metric', 'exposure', 'seed') then null
            else nullif(naming_convention_prefixes.model_type, '')
        end as model_type_prefix,
        case 
            when unioned_with_calc.resource_type in ('test', 'source', 'metric', 'exposure', 'seed') then null
            when 

    position(
        
  
    '/'
  
 || naming_convention_folders.folder_name_value || 
  
    '/'
  
 in unioned_with_calc.directory_path
    ) = 0 then null
            else naming_convention_folders.model_type 
        end as model_type_folder,
        

    position(
        
  
    '/'
  
 || naming_convention_folders.folder_name_value || 
  
    '/'
  
 in unioned_with_calc.directory_path
    ) as position_folder,  
        nullif(unioned_with_calc.column_name, '') as column_name,
        
        unioned_with_calc.macro_dependencies like '%macro.dbt.test_not_null%' and unioned_with_calc.resource_type = 'test' as is_test_not_null,  
        
        unioned_with_calc.macro_dependencies like '%macro.dbt_utils.test_unique_combination_of_columns%' and unioned_with_calc.resource_type = 'test' as is_test_unique_combination_of_columns,  
        
        unioned_with_calc.macro_dependencies like '%macro.dbt.test_unique%' and unioned_with_calc.resource_type = 'test' as is_test_unique,  
        
        unioned_with_calc.is_enabled, 
        unioned_with_calc.materialized, 
        unioned_with_calc.on_schema_change, 
        unioned_with_calc.database, 
        unioned_with_calc.schema, 
        unioned_with_calc.package_name, 
        unioned_with_calc.alias, 
        unioned_with_calc.is_described, 
        unioned_with_calc.model_group, 
        unioned_with_calc.access, 
        unioned_with_calc.access = 'public' as is_public, 
        unioned_with_calc.latest_version, 
        unioned_with_calc.version, 
        unioned_with_calc.deprecation_date, 
        unioned_with_calc.is_contract_enforced, 
        unioned_with_calc.total_defined_columns, 
        unioned_with_calc.total_described_columns, 
        unioned_with_calc.exposure_type, 
        unioned_with_calc.maturity, 
        unioned_with_calc.url, 
        unioned_with_calc.owner_name,
        unioned_with_calc.owner_email,
        unioned_with_calc.meta,
        unioned_with_calc.macro_dependencies,
        unioned_with_calc.metric_type, 
        unioned_with_calc.label, 
        unioned_with_calc.metric_filter,
        unioned_with_calc.metric_measure,
        unioned_with_calc.metric_measure_alias,
        unioned_with_calc.numerator,
        unioned_with_calc.denominator,
        unioned_with_calc.expr,
        unioned_with_calc.metric_window,
        unioned_with_calc.grain_to_date,
        unioned_with_calc.source_name, -- NULL for non-source resources
        unioned_with_calc.is_source_described, 
        unioned_with_calc.loaded_at_field, 
        unioned_with_calc.is_freshness_enabled, 
        unioned_with_calc.loader, 
        unioned_with_calc.identifier,
        unioned_with_calc.hard_coded_references, -- NULL for non-model resources
        unioned_with_calc.number_lines, -- NULL for non-model resources
        unioned_with_calc.sql_complexity, -- NULL for non-model resources
        unioned_with_calc.is_excluded -- NULL for metrics and exposures

    from unioned_with_calc
    left join naming_convention_prefixes
        on unioned_with_calc.prefix = naming_convention_prefixes.prefix_value

    cross join naming_convention_folders   

), 

calculate_model_type as (
    select 
        *, 
        case 
            when resource_type in ('test', 'source', 'metric', 'exposure', 'seed') then null
            -- by default we will define the model type based on its prefix in the case prefix and folder types are different
            else coalesce(model_type_prefix, model_type_folder, 'other') 
        end as model_type,
        row_number() over (partition by resource_id order by position_folder desc) as folder_name_rank
    from joined
),

final as (
    select
        *
    from calculate_model_type
    where folder_name_rank = 1
)

select 
    *
from final