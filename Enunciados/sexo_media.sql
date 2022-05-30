select
	tabela.sexo,
	tabela.numero_de_partidas / tabela.numero_de_perfis as media_de_partidas
from
(
	select
		perfil.sexo,
		count(distinct perfil.id_perfil) as numero_de_perfis,
		count(*) as numero_de_partidas
	from
		perfil inner join partida
			on perfil.id_perfil = partida.id_perfil
	group by
		perfil.sexo
) as tabela
;

/*

Deseja-se saber o número médio de partidas realizadas por cada sexo. A média pode ser obtida calculando
o número total de partidas realizadas por perfis desse sexo e dividindo pelo número de perfis com aquele sexo.

*/

