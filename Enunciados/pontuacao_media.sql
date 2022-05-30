select
	usuario.login_usuario,
    avg(partida.pontuacao) as pontuacao_media
from
	usuario inner join perfil 
		on usuario.login_usuario = perfil.login_usuario
	inner join partida
		on perfil.id_perfil = partida.id_perfil
group by
	usuario.login_usuario
;

/*

Deseja-se saber como anda o desempenho dos jogadores. Para isso, você precisará fazer uma consulta no banco de dados
que exiba, na primeira coluna, o login do usuário e , na segunda coluna, a pontuação média de todas as 
partidas realizadas pelos perfis de jogadores que estão associados àquele login de usuário.

*/