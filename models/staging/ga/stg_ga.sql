SELECT
  ga_date AS date,
  LOWER(ga_sourceMedium) AS ga_sourceMedium,
  SUM (ga_sessions) AS sessions
FROM
  `{{ target.project }}.Renta_dataset.ga_Petrovich_STD_1013956598`
GROUP BY
  ga_date,
  ga_sourceMedium