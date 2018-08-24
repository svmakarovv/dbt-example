SELECT
  Date AS date,
  'Yandex Direct' AS source,
  SUM(Cost) AS cost
FROM
  `{{ target.project }}.Renta_dataset.yd_*`
GROUP BY
  date,
  source