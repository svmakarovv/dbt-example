WITH
  t1 AS (
  SELECT
    fact.date AS date,
    dim.source AS source,
    SUM (fact.sessions) AS sessions
  FROM
    {{ref('stg_ga')}} AS fact
  LEFT JOIN
    {{ref('dim_sessions_source')}} AS dim
  ON
    fact.ga_sourceMedium = dim.ga_sourceMedium
  GROUP BY
    1,
    2 )
    
SELECT
  *,
  TO_HEX(SHA1(CONCAT(CAST(date AS STRING), source))) AS id
  FROM
    t1