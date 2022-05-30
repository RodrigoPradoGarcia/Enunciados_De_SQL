select
	perfil.id_perfil,
    perfil.apelido,
    max(partida.data) as ultima_partida
from
	perfil inner join partida
		on perfil.id_perfil = partida.id_perfil
group by
    perfil.id_perfil
;
/*

Faça uma consulta que exiba o id do perfil, o nome do perfil e a data da última partida realizada por aquele perfil para todos
os perfis cadastrados no banco de dados.

*/

