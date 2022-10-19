DROP database
    IF EXISTS SpotifyClone;

CREATE database
    IF NOT EXISTS SpotifyClone;

CREATE TABLE
    IF NOT EXISTS SpotifyClone.plan (
        id_plan INT AUTO_INCREMENT PRIMARY KEY,
        name_plan VARCHAR(50) NOT NULL,
        price DECIMAL(4, 2) NOT NULL
    ) engine = InnoDB;

INSERT INTO
    SpotifyClone.plan (name_plan, price)
VALUES
    ('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);

CREATE TABLE
    IF NOT EXISTS SpotifyClone.artist (
        id_artist INT AUTO_INCREMENT PRIMARY KEY,
        name_artist VARCHAR(100) NOT NULL
    ) engine = InnoDB;

INSERT INTO
    SpotifyClone.artist (name_artist)
VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

CREATE TABLE
    IF NOT EXISTS SpotifyClone.album (
        id_album INT AUTO_INCREMENT PRIMARY KEY,
        name_album VARCHAR(100) NOT NULL,
        release_album INT NOT NULL,
        id_artist INT,
        FOREIGN KEY (id_artist) REFERENCES artist (id_artist)
    ) engine = InnoDB;

INSERT INTO
    SpotifyClone.album (name_album, release_album, id_artist)
VALUES
    ('Renaissance', 2022, 1),
    ('Jazz', 1978, 2),
    ('Hot Space', 1982, 2),
    ('Falso Brilhante', 1998, 3),
    ('Vento de Maio', 2001, 3),
    ('QVVJFA?', 2003, 4),
    ('Somewhere Far Beyond', 2007, 5),
    ('I Put A Spell On You', 2012, 6);

CREATE TABLE
    SpotifyClone.song(
        id_song INT AUTO_INCREMENT PRIMARY KEY,
        name_song VARCHAR(100) NOT NULL,
        duration_song INT NOT NULL,
        id_album INT NOT NULL,
        id_artist INT NOT NULL,
        FOREIGN KEY (id_artist) REFERENCES artist (id_artist),
        FOREIGN KEY (id_album) REFERENCES album (id_album)
    ) engine = InnoDB;

INSERT INTO
    SpotifyClone.song (name_song, duration_song, id_album, id_artist)
VALUES
    ('BREAK MY SOUL', 279, 1, 1),
    ("VIRGO’S GROOVE", 369, 1, 1),
    ('ALIEN SUPERSTAR', 116, 1, 1),
    ("Don’t Stop Me Now", 203, 2, 2),
    ('Under Pressure', 152, 3, 2),
    ('Como Nossos Pais', 105, 4, 3),
    ('O Medo de Amar é o Medo de Ser Livre', 207, 5, 3),
    ('Samba em Paris', 267, 6, 4),
    ("The Bard’s Song", 244, 7, 5),
    ('Feeling Good', 100, 8, 6);

CREATE TABLE
    IF NOT EXISTS SpotifyClone.user (
        id_user INT AUTO_INCREMENT PRIMARY KEY,
        name_user VARCHAR(100) NOT NULL,
        age_user INT NOT NULL,
        subscription VARCHAR(50) NOT NULL,
        id_plan INT,
        FOREIGN KEY (id_plan) REFERENCES plan (id_plan)
    ) engine = InnoDB;

INSERT INTO
    SpotifyClone.user (name_user, age_user, subscription, id_plan)
VALUES
    ('Barbara Liskov', 82, '2019-10-20', 1),
    ('Robert Cecil Martin', 58, '2017-01-06', 1),
    ('Ada Lovelace', 37, '2017-12-30', 4),
    ('Martin Fowler', 46, '2017-01-17', 4),
    ('Sandi Metz', 58, '2018-04-29', 4),
    ('Paulo Freire', 19, '2018-02-14', 2),
    ('Bell Hooks', 26, '2018-01-05', 2),
    ('Christopher Alexander', 85, '2019-06-05', 3),
    ('Judith Butler', 45, '2020-05-13', 3),
    ('Jorge Amado', 58, '2017-02-17', 3);

CREATE TABLE
    IF NOT EXISTS SpotifyClone.history (
        date_history DATETIME NOT NULL,
        id_song INT,
        id_user INT,
        FOREIGN KEY (id_song) REFERENCES song (id_song),
        FOREIGN KEY (id_user) REFERENCES user (id_user),
        PRIMARY KEY(id_song, id_user)
    ) engine = InnoDB;

INSERT INTO
    SpotifyClone.history (date_history, id_song, id_user)
VALUES
    ('2022-02-28 10:45:55', 8, 1),
    ('2020-05-02 05:30:35', 2, 1),
    ('2020-03-06 11:22:33', 10, 1),
    ('2022-08-05 08:05:17', 10, 2),
    ('2020-01-02 07:40:33', 7, 2),
    ('2020-11-13 16:55:13', 10, 3),
    ('2020-12-05 18:38:30', 2, 3),
    ('2021-08-15 17:10:10', 8, 4),
    ('2022-01-09 01:44:33', 8, 5),
    ('2020-08-06 15:23:43', 5, 5),
    ('2017-01-24 00:31:17', 7, 6),
    ('2017-10-12 12:35:20', 1, 6),
    ('2011-12-15 22:30:49', 4, 7),
    ('2012-03-17 14:56:41', 4, 8),
    ('2022-02-24 21:14:22', 9, 9),
    ('2015-12-13 08:30:22', 3, 10);

CREATE TABLE
    SpotifyClone.following(
        id_artist INT,
        id_user INT,
        FOREIGN KEY (id_artist) REFERENCES artist (id_artist),
        FOREIGN KEY (id_user) REFERENCES user (id_user),
        PRIMARY KEY(id_artist, id_user)
    ) engine = InnoDB;

INSERT INTO
    SpotifyClone.following(id_artist, id_user)
VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (1, 2),
    (3, 2),
    (2, 3),
    (4, 4),
    (5, 5),
    (6, 5),
    (6, 6),
    (1, 6),
    (6, 7),
    (3, 9),
    (2, 10)
