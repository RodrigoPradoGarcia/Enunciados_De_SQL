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
				case when hour(partida.data) < 6 then 'Madrugada' when hour(partida.data) < 12 then 'Manhã' when hour(partida.data) < 18 then 'Tarde' else 'Noite' end as periodo,
				count(*) as numero_partidas
			from
				usuario inner join perfil
					on usuario.login_usuario = perfil.login_usuario
				inner join partida
					on perfil.id_perfil = partida.id_perfil
			group by
				login_usuario, periodo
		)as tabela
		where
			login_usuario = log and numero_partidas = (
				select
					max(numero_partidas)
				from
				(
					select
						usuario.login_usuario,
						case when hour(partida.data) < 6 then 'Madrugada' when hour(partida.data) < 12 then 'Manhã' when hour(partida.data) < 18 then 'Tarde' else 'Noite' end as periodo,
						count(*) as numero_partidas
					from
						usuario inner join perfil
							on usuario.login_usuario = perfil.login_usuario
						inner join partida
							on perfil.id_perfil = partida.id_perfil
					group by
						login_usuario, periodo
				)as tabela
				where
					login_usuario = log
			)
		order by
			time(tabela.data)
		limit 1 offset 0
    ) as periodo_preferido
from
	usuario;
    
/*
	Deseja-se fazer um levantamento de qual período do dia os usuários mais gostam de jogar. Para isso, é necessário obter a hora de todas as partidas realizadas por aquele usuário
    (incluindo todos os seus perfis de jogadores), verificar a qual período essa hora corresponde ('Manhã', 'Tarde', 'Noite' ou 'Madrugada'),
    contar quantas partidas aquele usuário jogou em cada período (por exemplo: o usuário X jogou 2 partidas de Manhã, 3 partidas à Tarde e 1 partida à Noite)
    e obter o período em que aquele usuário jogou mais partidas (nesse exemplo, é operíodo da Tarde). Caso haja empate entre dois períodos, dê prioridade para o período da Manhã, seguido pelo período da Tarde.
    Faça isso para todos os usuários cadastrados no banco de dados.
*/