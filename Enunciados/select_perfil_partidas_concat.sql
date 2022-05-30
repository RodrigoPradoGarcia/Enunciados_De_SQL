select
	concat(
		perfil.apelido,
        ' jogou ',
        count(*),
        case when count(*) = 1 then ' partida' else ' partidas' end,
        ' no jogo: ',
        jogo.nome
    ) as resposta
from
	partida inner join perfil
		on partida.id_perfil = perfil.id_perfil
	inner join jogo
		on partida.id_jogo = jogo.id_jogo
group by
	perfil.id_perfil,
    jogo.id_jogo
;