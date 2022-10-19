SELECT
    name_user AS usuario,
    IF (
        MAX(YEAR(date_history)) >= 2021,
        'Usuário ativo',
        'Usuário inativo'
    ) AS status_usuario
FROM
    SpotifyClone.user
    INNER JOIN SpotifyClone.history ON history.id_user = user.id_user
GROUP BY
    name_user
ORDER BY
    name_user;