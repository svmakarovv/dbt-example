WITH
  t1 AS (
  SELECT
    *
  FROM
    {{ref('stg_direct')}}
  UNION ALL
  SELECT
    *
  FROM
    {{ref('stg_adwords')}} )
    
SELECT
  *,
  TO_HEX(SHA1(CONCAT(CAST(date AS STRING), source))) AS id
FROM
  t1
