
  
    

  create  table "dw"."public"."sample__dbt_tmp"
  
  
    as
  
  (
    

SELECT 1 AS id, 'hello' AS message
UNION ALL
SELECT 2 AS id, 'world' AS message
  );
  