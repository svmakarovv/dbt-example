WITH
  t1 AS (
  SELECT
    DISTINCT ga_sourceMedium
  FROM
    {{ref('stg_ga')}}
  GROUP BY
    1 )
    
SELECT
  ga_sourceMedium,
  CASE
    WHEN REGEXP_CONTAINS (ga_sourceMedium, 'google / cpc|google_adwords') THEN 'Google Adwords'
    WHEN REGEXP_CONTAINS (ga_sourceMedium, 'yandex / cpc|yandex_direct') THEN 'Yandex Direct'
    ELSE 'Others'
  END AS source
FROM
  t1