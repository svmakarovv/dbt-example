SELECT
  Day AS date,
  'Google Adwords' AS source,
  SUM(Cost)/1000000 AS cost
FROM
  `{{ target.project }}.Renta_dataset.g_adw_*`
GROUP BY
  date,
  source