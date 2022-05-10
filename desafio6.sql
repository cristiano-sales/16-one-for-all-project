SELECT
    MIN(P.cost) AS "faturamento_minimo",
    MAX(P.cost) AS "faturamento_maximo",
    round(AVG(P.cost), 2) AS "faturamento_medio",
    SUM(P.cost)  AS "faturamento_total"
FROM SpotifyClone.plan AS P
INNER JOIN SpotifyClone.user AS U
ON U.plan_id = P.id;
