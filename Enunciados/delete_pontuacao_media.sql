drop view if exists teste;
create view teste as (
	select 
		partida.id_partida
	from
		usuario inner join perfil on usuario.login_usuario = perfil.login_usuario
				inner join partida on perfil.id_perfil = partida.id_perfil
	where
		usuario.login_usuario in 
		(
			select
				usuario.login_usuario
			from
				usuario inner join perfil 
					on usuario.login_usuario = perfil.login_usuario
				inner join partida
					on perfil.id_perfil = partida.id_perfil
			group by
				usuario.login_usuario
			having
				avg(partida.pontuacao) < 40 and partida.pontuacao < 50
		)
);

delete from partida where id_partida in ( select * from teste );

drop view if exists teste;

/*

Remova todas as partidas que possuem uma pontuação menor que 50 e que pertencem a usuarios que
possuem uma pontuação média abaixo de 40

*/