SELECT
    U.`name` AS usuario, IF(YEAR(MAX(H.`when`)) = "2021", "Usuário ativo", "Usuário inativo") AS condicao_usuario
FROM
    SpotifyClone.user AS U
        INNER JOIN
    SpotifyClone.playback_history AS H
		ON U.id = H.user_id
        GROUP BY H.user_id
        ORDER BY usuario;
