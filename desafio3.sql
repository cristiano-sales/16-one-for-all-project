SELECT usuario.name AS usuario, COUNT(*) AS qtde_musicas_ouvidas, ROUND((SUM(duration_seconds) / 60), 2) AS total_minutos
FROM SpotifyClone.user AS usuario
INNER JOIN SpotifyClone.playback_history AS qtde_musicas_ouvidas
INNER JOIN SpotifyClone.song AS total_minutos
ON usuario.id = qtde_musicas_ouvidas.user_id AND qtde_musicas_ouvidas.song_id = total_minutos.id
GROUP BY user_id
ORDER BY usuario.name;
