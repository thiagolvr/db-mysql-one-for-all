SELECT
    MIN(plan.price) AS faturamento_minimo,
    MAX(plan.price) AS faturamento_maximo,
    ROUND(AVG(plan.price + 0.20), 2) AS faturamento_medio,
    SUM(plan.price + 0.20) AS faturamento_total
FROM
    SpotifyClone.plan
    JOIN SpotifyClone.user ON plan.id_plan = user.id_plan;