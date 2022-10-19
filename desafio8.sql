SELECT
    artist.name_artist AS artista,
    album.name_album AS album
FROM
    SpotifyClone.artist
    JOIN SpotifyClone.album ON album.id_artist = artist.id_artist
WHERE
    artist.name_artist = "Elis Regina";