update
	dica
set
	descricao = upper(descricao)
where
	not id_dica in
    (
		select
			dica.id_dica
		from
			jogo_dica inner join jogo
				on jogo_dica.id_jogo = jogo.id_jogo
			inner join dica
				on jogo_dica.id_dica = dica.id_dica
    )
;