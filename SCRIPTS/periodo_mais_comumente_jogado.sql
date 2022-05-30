select
	login_usuario as log,
    (
		select
			periodo
		from
		(
			select
				usuario.login_usuario,
				partida.data,
				case 
					when hour(partida.data) < 6 then 'madrugada' 
					when hour(partida.data) < 12 then 'manhã' 
					when hour(partida.data) < 18 then 'tarde' 
					when hour(partida.data) < 24 then 'noite' 
				end as periodo,
				count(*) as numero_partidas
			from
				usuario inner join perfil
					on usuario.login_usuario = perfil.login_usuario
				inner join partida
					on perfil.id_perfil = partida.id_perfil
			group by
				login_usuario, periodo
		) as result
		where
			login_usuario = log
		order by
			numero_partidas desc, hour(data) asc
		limit 1
	) as periodo_favorito
from
	usuario