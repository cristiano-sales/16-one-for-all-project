SELECT
	art.`name` AS artista,
	alb.`name` AS album
FROM SpotifyClone.artist AS art
INNER JOIN SpotifyClone.album AS alb
ON art.id = alb.artist_id
WHERE art.`name` = "Walter Phoenix";