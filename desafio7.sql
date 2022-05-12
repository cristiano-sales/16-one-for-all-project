SELECT
	art.`name` AS artista,
    alb.`name` AS album,
    COUNT(*) AS seguidores
FROM SpotifyClone.artist AS art
INNER JOIN SpotifyClone.album AS alb
INNER JOIN SpotifyClone.follower AS fol
ON art.id = alb.artist_id AND art.id = fol.artist_id
GROUP BY art.`name`, alb.`name`
ORDER BY seguidores DESC, artista, album;
