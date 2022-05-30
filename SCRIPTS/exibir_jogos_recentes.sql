select
    id_jogo,
    nome
from
    jogo
where
    id_jogo in(
        select
            distinct id_jogo
		from
			partida
		where
			id_perfil = 7
		order by
			data desc
	)
limit 5
offset 0
;
