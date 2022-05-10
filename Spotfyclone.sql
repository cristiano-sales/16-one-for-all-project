DROP DATABASE IF EXISTS SpotifyClone ;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

-- -----------------------------------------------------
-- Table SpotifyClone.plan
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS SpotifyClone.plan (
	id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL,
    cost DECIMAL(4,2) NOT NULL
);

-- -----------------------------------------------------
-- Table SpotifyClone.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS SpotifyClone.`user` (
	id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    plan VARCHAR(15) NOT NULL,
    signature_date DATE NOT NULL,
    plan_id INT NOT NULL,
	FOREIGN KEY (plan_id) REFERENCES SpotifyClone.plan(id)
);

-- -----------------------------------------------------
-- Table SpotifyClone.artist
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS SpotifyClone.artist (
	id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL
    
);

-- -----------------------------------------------------
-- Table SpotifyClone.follower
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS SpotifyClone.follower (
    user_id INT NOT NULL,
    artist_id INT NOT NULL,
    artist_name VARCHAR(50) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES `user`(id),
    FOREIGN KEY (artist_id) REFERENCES artist(id),
    CONSTRAINT pk_user_follow_artist PRIMARY KEY(user_id, artist_id)
);

-- -----------------------------------------------------
-- Table SpotifyClone.album
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS SpotifyClone.album (
	id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    release_year INT(4) NOT NULL,
    artist VARCHAR(50) NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artist(id)    
);

-- -----------------------------------------------------
-- Table SpotifyClone.song
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS SpotifyClone.song (
	id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL, 
    duration_seconds INT NOT NULL,
    album VARCHAR(50) NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES album(id)
);

-- -----------------------------------------------------
-- Table SpotifyClone.playback_history
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS SpotifyClone.playback_history (
    user_id INT NOT NULL,
    song_id INT NOT NULL,
    `when` DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES `user`(id),
    FOREIGN KEY (song_id) REFERENCES song(id),
    CONSTRAINT pk_user_song PRIMARY KEY(user_id, song_id)
);

-- -----------------------------------------------------
-- inserting data
-- -----------------------------------------------------

-- -----------------------------------------------------
-- inserting data into the table SpotfyClone.plan
-- -----------------------------------------------------
INSERT INTO `plan` (`name`, `cost`) VALUES ('gratuito', 0);
INSERT INTO `plan` (`name`, `cost`) VALUES ('universitário', 5.99);
INSERT INTO `plan` (`name`, `cost`) VALUES ('pessoal', 6.99);
INSERT INTO `plan` (`name`, `cost`) VALUES ('familiar', 7.99);

-- -----------------------------------------------------
-- inserting data into the table SpotfyClone.user
-- -----------------------------------------------------
INSERT INTO `user` (`name`, `age`, `plan`, `signature_date`, `plan_id`) VALUES ('Thati', 23, 'gratuito', '2019-10-20', 1);
INSERT INTO `user` (`name`, `age`, `plan`, `signature_date`, `plan_id`) VALUES ('Cintia', 35, 'familiar', '2017-12-30', 4);
INSERT INTO `user` (`name`, `age`, `plan`, `signature_date`, `plan_id`) VALUES ('Bill', 20, 'universitário', '2019-06-05', 2);
INSERT INTO `user` (`name`, `age`, `plan`, `signature_date`, `plan_id`) VALUES ('Roger', 45, 'pessoal', '2020-05-13', 3);
INSERT INTO `user` (`name`, `age`, `plan`, `signature_date`, `plan_id`) VALUES ('Norman', 58, 'pessoal', '2017-02-17', 3);
INSERT INTO `user` (`name`, `age`, `plan`, `signature_date`, `plan_id`) VALUES ('Patrick', 33, 'familiar', '2017-01-06', 4);
INSERT INTO `user` (`name`, `age`, `plan`, `signature_date`, `plan_id`) VALUES ('Vivian', 26, 'universitário', '2018-01-05', 2);
INSERT INTO `user` (`name`, `age`, `plan`, `signature_date`, `plan_id`) VALUES ('Carol', 19,'universitário', '2018-02-14', 2);
INSERT INTO `user` (`name`, `age`, `plan`, `signature_date`, `plan_id`) VALUES ('Angelina', 42, 'familiar', '2018-04-29', 4);
INSERT INTO `user` (`name`, `age`, `plan`, `signature_date`, `plan_id`) VALUES ('Paul', 46, 'familiar', '2017-01-17', 4);

-- -----------------------------------------------------
-- inserting data into the table SpotfyClone.artist
-- -----------------------------------------------------
INSERT INTO artist (`name`) VALUES ('Walter Phoenix');
INSERT INTO artist (`name`) VALUES ('Peter Strong');
INSERT INTO artist (`name`) VALUES ('Lance Day');
INSERT INTO artist (`name`) VALUES ('Freedie Shannon');
INSERT INTO artist (`name`) VALUES ('Tyler Isle');
INSERT INTO artist (`name`) VALUES ('Fog');

-- -----------------------------------------------------
-- inserting data into the table SpotfyClone.album
-- -----------------------------------------------------
INSERT INTO album (`name`, `release_year`, `artist`, `artist_id`) VALUES ('Envious', '1990', 'Walter Phoenix', 1);
INSERT INTO album (`name`, `release_year`, `artist`, `artist_id`) VALUES ('Exuberant', '1993', 'Walter Phoenix', 1);
INSERT INTO album (`name`, `release_year`, `artist`, `artist_id`) VALUES ('Hallowed Steam', '1995', 'Peter Strong', 2);
INSERT INTO album (`name`, `release_year`, `artist`, `artist_id`) VALUES ('Incandescent', '1998', 'Lance Day', 3);
INSERT INTO album (`name`, `release_year`, `artist`, `artist_id`) VALUES ('Temporary Culture', '2001', 'Freedie Shannon', 4);
INSERT INTO album (`name`, `release_year`, `artist`, `artist_id`) VALUES ('Library of liberty', '2003', 'Freedie Shannon', 4);
INSERT INTO album (`name`, `release_year`, `artist`, `artist_id`) VALUES ('Chained Down', '2007', 'Tyler Isle', 5);
INSERT INTO album (`name`, `release_year`, `artist`, `artist_id`) VALUES ('Cabinet of fools', '2012', 'Tyler Isle', 5);
INSERT INTO album (`name`, `release_year`, `artist`, `artist_id`) VALUES ('No guarantees', '2015', 'Tyler Isle', 5);
INSERT INTO album (`name`, `release_year`, `artist`, `artist_id`) VALUES ('Apparatus', '2015', 'Fog', 6);

-- -----------------------------------------------------
-- inserting data into the table SpotfyClone.song
-- -----------------------------------------------------
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ('Soul For Us', 200, 'Envious', 1);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ('Reflections Of Magic', 163, 'Envious', 1);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ('Dance With Her Own', 116, 'Envious', 1);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ('Troubles Of My Inner Fire', 203, 'Exuberant', 2);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ('Time Fireworks', 152, 'Exuberant', 2);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ('Magic Circus', 105, 'Hallowed Steam', 3);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ('Honey, So Do I', 207, 'Hallowed Steam', 3);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ("Sweetie, Let's Go Wild", 139, 'Hallowed Steam', 3);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ('She Knows', 244, 'Hallowed Steam', 3);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ('Fantasy For Me', 100, 'Incandescent', 4);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ('Celebration Of More', 146, 'Incandescent', 4);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ('Rock His Everything', 223, 'Incandescent', 4);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ('Home Forever', 231, 'Incandescent', 4);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ('Diamond Power', 241, 'Incandescent', 4);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ("Let's Be Silly", 132, 'Incandescent', 4);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ('Thang Of Thunder', 240, 'Temporary Culture', 5);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ('Words Of Her Life', 185, 'Temporary Culture', 5);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ('Without My Streets', 176, 'Temporary Culture', 5);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ('Need Of The Evening', 190, 'Library of liberty', 6);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ('History Of My Roses', 222, 'Library of liberty', 6);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ('Without My Love', 111, 'Library of liberty', 6);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ('Walking And Game', 123, 'Library of liberty', 6);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ('Young And Father', 197, 'Library of liberty', 6);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ('Finding My Traditions', 179, 'Chained Down', 7);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ('Walking And Man', 229, 'Chained Down', 7);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ("Hard And Time", 135, 'Chained Down', 7);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ("Honey, I'm A Lone Wolf", 150, 'Chained Down', 7);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ("She Thinks I Won't Stay Tonight", 166, 'Cabinet of fools', 8);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ("He Heard You're Bad For Me", 154, 'Cabinet of fools', 8);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ("He Hopes We Can't Stay", 210, 'Cabinet of fools', 8);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ('I Know I Know', 117, 'Cabinet of fools', 8);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ("He's Walking Away", 159, 'No guarantees', 9);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ("He's Trouble", 138, 'No guarantees', 9);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ("I Heard I Want To Bo Alone", 120, 'No guarantees', 9);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ('I Ride Alone', 151, 'No guarantees', 9);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ("Honey", 79, 'Fog', 10);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ('You Cheated On Me', 95, 'Fog', 10);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ("Wouldn't It Be Nice", 213, 'Fog', 10);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ('Baby', 136, 'Fog', 10);
INSERT INTO song (`name`, `duration_seconds`, `album`, `album_id`) VALUES ('You Make Me Feel So..', 83, 'Fog', 10);

-- -----------------------------------------------------
-- inserting data into the table SpotfyClone.follower
-- -----------------------------------------------------
INSERT INTO follower (`user_id`, `artist_id`, `artist_name`) VALUES (1, 1, "Walter Phoenix");
INSERT INTO follower (`user_id`, `artist_id`, `artist_name`) VALUES (1, 3, "Lance Day");
INSERT INTO follower (`user_id`, `artist_id`, `artist_name`) VALUES (1, 4, "Freedie Shannon");
INSERT INTO follower (`user_id`, `artist_id`, `artist_name`) VALUES (2, 1, "Walter Phoenix");
INSERT INTO follower (`user_id`, `artist_id`, `artist_name`) VALUES (2, 3, "Lance Day");
INSERT INTO follower (`user_id`, `artist_id`, `artist_name`) VALUES (3, 1, "Walter Phoenix");
INSERT INTO follower (`user_id`, `artist_id`, `artist_name`) VALUES (3, 2, "Peter Strong");
INSERT INTO follower (`user_id`, `artist_id`, `artist_name`) VALUES (4, 4, "Freedie Shannon");
INSERT INTO follower (`user_id`, `artist_id`, `artist_name`) VALUES (5, 5, "Tyler Isle");
INSERT INTO follower (`user_id`, `artist_id`, `artist_name`) VALUES (5, 6, "Fog");
INSERT INTO follower (`user_id`, `artist_id`, `artist_name`) VALUES (6, 1, "Walter Phoenix");
INSERT INTO follower (`user_id`, `artist_id`, `artist_name`) VALUES (6, 3, "Lance Day");
INSERT INTO follower (`user_id`, `artist_id`, `artist_name`) VALUES (6, 6, "Fog");
INSERT INTO follower (`user_id`, `artist_id`, `artist_name`) VALUES (7, 2, "Peter Strong");
INSERT INTO follower (`user_id`, `artist_id`, `artist_name`) VALUES (7, 5, "Tyler Isle");
INSERT INTO follower (`user_id`, `artist_id`, `artist_name`) VALUES (8, 1, "Walter Phoenix");
INSERT INTO follower (`user_id`, `artist_id`, `artist_name`) VALUES (8, 5, "Tyler Isle");
INSERT INTO follower (`user_id`, `artist_id`, `artist_name`) VALUES (9, 3, "Lance Day");
INSERT INTO follower (`user_id`, `artist_id`, `artist_name`) VALUES (9, 4, "Freedie Shannon");
INSERT INTO follower (`user_id`, `artist_id`, `artist_name`) VALUES (9, 6, "Fog");
INSERT INTO follower (`user_id`, `artist_id`, `artist_name`) VALUES (10, 2, "Peter Strong");
INSERT INTO follower (`user_id`, `artist_id`, `artist_name`) VALUES (10, 6, "Fog");

-- -----------------------------------------------------
-- inserting data into the table SpotifyClone.playback_history
-- -----------------------------------------------------
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (1, 36, "2020-02-28 10:45:55");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (1, 25, "2020-05-02 05:30:35");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (1, 23, "2020-03-06 11:22:33");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (1, 14, "2020-08-05 08:05:17");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (1, 15, "2020-09-14 16:32:22");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (2, 34, "2020-01-02 07:40:33");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (2, 24, "2020-05-16 06:16:22");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (2, 21, "2020-10-09 12:27:48");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (2, 39, "2020-09-21 13:14:46");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (3, 6, "2020-11-13 16:55:13");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (3, 3, "2020-12-05 18:38:30");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (3, 26, "2020-07-30 10:00:00");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (4, 2, "2021-08-15 17:10:10");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (4, 35, "2021-07-10 15:20:30");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (4, 27, "2021-01-09 01:44:33");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (5, 7, "2020-07-03 19:33:28");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (5, 12, "2017-02-24 21:14:22");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (5, 14, "2020-08-06 15:23:43");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (5, 1, "2020-11-10 13:52:27");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (6, 38, "2019-02-07 20:33:48");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (6, 29, "2017-01-24 00:31:17");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (6, 30, "2017-10-12 12:35:20");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (6, 22, "2018-05-29 14:56:41");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (7, 5, "2018-05-09 22:30:49");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (7, 4, "2020-07-27 12:52:58");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (7, 11, "2018-01-16 18:40:43");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (8, 39, "2018-03-21 16:56:40");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (8, 40, "2020-10-18 13:38:05");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (8, 32, "2019-05-25 08:14:03");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (8, 33, "2021-08-15 21:37:09");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (9, 16, "2021-05-24 17:23:45");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (9, 17, "2018-12-07 22:48:52");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (9, 8, "2021-03-14 06:14:26");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (9, 9, "2020-04-01 03:36:00");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (10, 20, "2017-02-06 08:21:34");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (10, 21, "2017-12-04 05:33:43");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (10, 12, "2017-07-27 05:24:49");
INSERT INTO playback_history (`user_id`, `song_id`, `when`) VALUES (10, 13, "2017-12-25 01:03:57");
