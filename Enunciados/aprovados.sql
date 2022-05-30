select
	usuario.login_usuario as login,
    (
		select
			count(*)
		from
			partida inner join perfil
				on partida.id_perfil = perfil.id_perfil
			inner join usuario
				on perfil.login_usuario = usuario.login_usuario
		where
			usuario.login_usuario = login and pontuacao >= 50
    ) as vitorias,
    (
		select
			count(*)
		from
			partida inner join perfil
				on partida.id_perfil = perfil.id_perfil
			inner join usuario
				on perfil.login_usuario = usuario.login_usuario
		where
				usuario.login_usuario = login and pontuacao < 50
    )as derrotas
from
	usuario
;

/*

Uma partida é considerada como vitória quando a pontuação é maior ou igual a 50 e considerada derrota
quando a pontuação é menor que 50. Faça uma consulta que exiba o login do usuário, o número de vitórias
e o número de derrotas de 
todas as partidas realizadas por perfis de jogadores criados por aquele usuário

*/