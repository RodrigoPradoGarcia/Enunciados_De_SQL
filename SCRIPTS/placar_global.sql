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