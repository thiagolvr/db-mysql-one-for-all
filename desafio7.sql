SELECT
    artist.name_artist AS artista,
    album.name_album AS album,
    COUNT(following.id_artist) AS seguidores
FROM
    SpotifyClone.artist
    JOIN SpotifyClone.album ON album.id_artist = artist.id_artist
    JOIN SpotifyClone.following ON following.id_artist = artist.id_artist
GROUP BY
    artista,
    album
ORDER BY
    seguidores DESC,
    artista,
    album;