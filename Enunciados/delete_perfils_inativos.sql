use games;

delete from partida
where
	id_perfil in
    (
		select
			id_perfil
		from
			perfil
		where
			id_perfil in
			(
				select
					tabela2.id_perfil
				from
				(
					select
						tabela.id_perfil,
						datediff( curdate() , tabela.ultima_partida) as diferenca
					from
					(
						select
							id_perfil,
							max(data) as ultima_partida
						from
							partida
						group by
							id_perfil
					) as tabela	
				) as tabela2
				where
					tabela2.diferenca > 180
			)
    )
;

/*

	Remova todos as partidas de perfis jogadores que não jogam nenhuma partida há mais de 6 meses (180 dias).

*/