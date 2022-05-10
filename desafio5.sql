SELECT
	song.`name` AS cancao,
    COUNT(playback_history.song_id) AS reproducoes
FROM SpotifyClone.playback_history AS playback_history
INNER JOIN SpotifyClone.song AS song
ON playback_history.song_id = song.id
GROUP BY playback_history.song_id
ORDER BY reproducoes DESC, cancao
LIMIT 2;
