SELECT
    name_user AS usuario,
    COUNT(history.id_song) AS qt_de_musicas_ouvidas,
    ROUND(SUM(song.duration_song / 60), 2) AS total_minutos
FROM
    SpotifyClone.user
    JOIN SpotifyClone.history ON user.id_user = history.id_user
    JOIN SpotifyClone.song ON song.id_song = history.id_song
GROUP BY
    user.name_user
ORDER BY
    user.name_user;