select
	tabela.id_partida,
	tabela.idp,
    tabela.id_jogo
from
(
	select
		id_partida,
		id_perfil as idp,
		id_jogo,
		(
			select
				not id_jogo in (
					select
						id_jogo
					from
						perfil_jogo
					where
						id_perfil = idp
				)
		) as nao_foi_escolhido
	from
		partida
) as tabela
where
	tabela.nao_foi_escolhido = 1;

drop view if exists registros_a_apagar;
create view registros_a_apagar as (
	select
		tabela.id_partida
	from
	(
		select
			id_partida,
			id_perfil as idp,
			id_jogo,
			(
				select
					not id_jogo in (
						select
							id_jogo
						from
							perfil_jogo
						where
							id_perfil = idp
					)
			) as nao_foi_escolhido
		from
			partida
	) as tabela
	where
		tabela.nao_foi_escolhido = 1
);

delete from partida where id_partida in (select * from registros_a_apagar);

drop view registros_a_apagar;
