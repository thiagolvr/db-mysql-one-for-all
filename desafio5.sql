SELECT
    song.name_song AS cancao,
    COUNT(history.id_song) AS reproducoes
FROM
    SpotifyClone.song AS song
    INNER JOIN SpotifyClone.history ON song.id_song = history.id_song
GROUP BY
    song.id_song
ORDER BY
    reproducoes DESC,
    cancao ASC
LIMIT
    2