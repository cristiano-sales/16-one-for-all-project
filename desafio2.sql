SELECT
	(SELECT COUNT(song.`name`) FROM SpotifyClone.song) AS cancoes,
	(SELECT COUNT(artist.`name`) FROM SpotifyClone.artist) AS artistas,
	(SELECT COUNT(`user`.`name`) FROM SpotifyClone.`user`) AS albuns;
