set @cont = 0;
select
	@cont := @cont + 1 as colocacao,
    tabela.apelido,
    tabela.pontuacao_total
from
	(select id_perfil as idp, apelido, (select sum(pontuacao) from partida where id_perfil = idp) as pontuacao_total from perfil) as tabela
order by
	tabela.pontuacao_total desc
limit 5
offset 0

/*

Nos games, é muito comum a presença de placares. Você foi solicitado(a) a exibir
o placar dos top 5 perfis de jogadores. Para isso, você deve realizar uma consulta que exiba a colocação,
o apelido e o somatório das pontuações de todas as partidas realizadas por aquele perfil.
Apenas os 5 perfis com a maior somatória deverão ser exibidos e os resultados devem estar ordenados em ordem
descenente de pontuação.

*/
