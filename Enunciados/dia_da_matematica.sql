select
	tabela.idp,
	tabela.apelido,
	max(tabela.pontuacao_total) as pontuacao_total
from
(
	select
		id_perfil as idp,
		apelido,
		(select sum(pontuacao) from partida where id_perfil = idp and data like '%-03-06%') as pontuacao_total
	from
		perfil
) as tabela

/*

O dia 6 de maio é o dia nacional da matemática.
Para comemorar este dia, decidiu-se premiar o jogador que obtivesse a maior somatória das pontuações de suas partidas 
realizadas naquele dia. 
Deseja-se obter o id do perfil, o apelido e a soma das pontuações das partidas realizadas naquele dia por aquele jogador e, 
caso haja empate entre dois ou mais jogadores, exibir os dados de todos esses jogadores. 

*/