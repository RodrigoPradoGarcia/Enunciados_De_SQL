
select
	distinct idade as idd,
	(
		select
			count(*)
		from
			perfil
		where
			idade = idd
	) as contagem
from
	perfil
order by
	idade
;

/*

Deseja-se fazer um levantamento das idades dos perfis de jogadores. Faça uma consulta que exiba, na primeira coluna,
o valor da idade e, na segunda coluna, a quantidade de perfis que possuem aquela idade para todas as
idades cadastradas no banco de dados. Os resultados devem estar ordenados pela idade. 
Nenhuma idade deverá ser exibida duas vezes

*/