delete from jogo_dica
where 
	id_dica in
    (
		select 
			jogo_dica.id_dica
		from
			jogo_dica inner join jogo
				on jogo_dica.id_jogo = jogo.id_jogo
			inner join dica
				on jogo_dica.id_dica = dica.id_dica
		where
			dificuldade = 'Difícil' and mod( length(dica.descricao) , 2) = 1
			
    )
;

/*

	Remova todos os registros da tabela 'jogo_dicas' em que a dica contenha um número ímpar de caracteres(incluindo espaços em branco) e o jogo possui a dificuldade igual a  'Difícil'.

*/