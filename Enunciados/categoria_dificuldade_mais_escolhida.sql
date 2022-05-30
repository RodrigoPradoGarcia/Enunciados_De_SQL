select
(
	select
		tabela.categoria
	from
	(
		select jogo.categoria as categoria, count(*) as numero from jogo inner join perfil_jogo on jogo.id_jogo = perfil_jogo.id_jogo group by jogo.categoria
	) as tabela
	where
		numero =
		(
			select
				max(tabela.numero)
			from
			(
				select jogo.categoria, count(*) as numero from jogo inner join perfil_jogo on jogo.id_jogo = perfil_jogo.id_jogo group by jogo.categoria
			) as tabela
	)
    order by
		tabela.categoria asc
    limit 1
) as categoria,
(
	select
		tabela.dificuldade
	from
	(
		select jogo.dificuldade as dificuldade, count(*) as numero from jogo inner join perfil_jogo on jogo.id_jogo = perfil_jogo.id_jogo group by jogo.dificuldade
	) as tabela
	where
		numero =
		(
			select
				max(tabela.numero)
			from
			(
				select jogo.dificuldade, count(*) as numero from jogo inner join perfil_jogo on jogo.id_jogo = perfil_jogo.id_jogo group by jogo.dificuldade
			) as tabela
		)
	order by
		tabela.dificuldade asc
	limit 1
) as dificuldade

/*

Um novo jogo será adicionado ao game de matemática. Foi decidido que a categoria desse novo jogo deve ser
a categoria mais escolhida entre os jogadores e que a dificuldade deve ser a dificuldade mais escolhida entre
os jogadores. Faça uma consulta no banco de dados que exiba, na primeira coluna, a categoria mais escolhida e, na segunda coluna, a dificuldade mais escolhida entre os jogadores.
Caso houver empate entre duas categorias ou duas dificuldades, exibir o resultado que vier primeiro em ordem alfabética

*/