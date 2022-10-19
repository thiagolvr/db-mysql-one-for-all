SELECT
    COUNT(*) AS quantidade_musicas_no_historico
FROM
    SpotifyClone.history
    JOIN SpotifyClone.user ON user.id_user = history.id_user
WHERE
    name_user = "Barbara Liskov";
