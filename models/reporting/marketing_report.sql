SELECT
  sessions.date AS date,
  sessions.source AS source,
  sessions.sessions AS sessions,
  cost.cost AS cost
FROM
  {{ref('join_sessions')}} AS sessions
LEFT JOIN
  {{ref('cost_all')}} AS cost
ON
  sessions.id = cost.id