SELECT
    song.name_song AS nome,
    COUNT(history.id_song) AS reproducoes
FROM
    SpotifyClone.history
    JOIN SpotifyClone.song ON song.id_song = history.id_song
    JOIN SpotifyClone.user ON history.id_user = user.id_user
WHERE
    user.id_plan IN(1, 3)
GROUP BY
    song.name_song
ORDER BY
    song.name_song;