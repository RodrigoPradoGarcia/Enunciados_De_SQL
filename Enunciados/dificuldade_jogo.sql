select
	*
from
(
	select
		jogo.id_jogo,
		jogo.nome,
		jogo.dificuldade,
		avg(partida.pontuacao) as pontuacao_media,
		case when avg(partida.pontuacao) < 40 then 'Difícil' when avg(partida.pontuacao) > 40 and avg(partida.pontuacao) <= 70 then 'Médio' else 'Fácil' end as dificuldade_estimada
	from
		jogo inner join partida
			on jogo.id_jogo = partida.id_jogo
	group by
		jogo.id_jogo
) as tabela
where
	tabela.dificuldade != tabela.dificuldade_estimada
;
/*

Uma forma de avaliar a dificuldade de um jogo é obtendo a pontuação média de todas as partidas realizadas nesse jogo.
Faça uma consulta no banco de dados que exiba o id do jogo, o nome do jogo, a dificuldade do jogo(que está na tabela de jogo), a pontuação média de todas as partidas realizadas naquele jogo e 
a dificuldade estimada(que será calculada a partir da pontuação média).
Se a pontuação média for menor que 40, a dificuldade estimada deverá exibir 'Difícil', se a média estiver entre 40 e 70, exibir 'Médio' e se a média for maior que 70, exibir 'Fácil'.
Exiba apenas os resultados em que a dificuldade é diferente da dificuldade estimada

*/