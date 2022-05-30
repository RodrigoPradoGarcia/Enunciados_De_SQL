drop table if exists cor_cabelo;
drop table if exists cor_camisa;
drop table if exists cor_olhos;
drop table if exists cor_pele;

set @cont = 0;
create table cor_cabelo as select @cont := @cont + 1 as num_linha, tabela.cor_cabelo from (select distinct cor_cabelo from perfil)as tabela;

set @cont = 0;
create table cor_camisa as select @cont := @cont + 1 as num_linha, tabela.cor_camisa from (select distinct cor_camisa from perfil)as tabela;

set @cont = 0;
create table cor_olhos as select @cont := @cont + 1 as num_linha, tabela.cor_olhos from (select distinct cor_olhos from perfil)as tabela;

set @cont = 0;
create table cor_pele as select @cont := @cont + 1 as num_linha, tabela.cor_pele from (select distinct cor_pele from perfil)as tabela;

select
	tabela.cor_cabelo, tabela.cor_camisa, tabela.cor_olhos, tabela.cor_pele
from
(
	select juncao2.num_linha, juncao2.cor_cabelo, juncao2.cor_camisa, juncao2.cor_olhos, pele.cor_pele from (
		select juncao1.num_linha, juncao1.cor_cabelo, juncao1.cor_camisa, olhos.cor_olhos from (
			select cabelo.num_linha, cabelo.cor_cabelo, camisa.cor_camisa from cor_cabelo as cabelo left join cor_camisa as camisa on cabelo.num_linha = camisa.num_linha union distinct
			(
				select camisa.num_linha, cabelo.cor_cabelo, camisa.cor_camisa from (select * from cor_cabelo) as cabelo right join (select * from cor_camisa) as camisa on cabelo.num_linha = camisa.num_linha
			)
		) as juncao1 left join cor_olhos as olhos on juncao1.num_linha  = olhos.num_linha union distinct
		(
			select olhos.num_linha, juncao1.cor_cabelo, juncao1.cor_camisa, olhos.cor_olhos from (
				select cabelo.num_linha, cabelo.cor_cabelo, camisa.cor_camisa from cor_cabelo as cabelo left join cor_camisa as camisa on cabelo.num_linha = camisa.num_linha union distinct
				(
					select camisa.num_linha, cabelo.cor_cabelo, camisa.cor_camisa from (select * from cor_cabelo) as cabelo right join (select * from cor_camisa) as camisa on cabelo.num_linha = camisa.num_linha
				)
			) as juncao1 right join cor_olhos as olhos on juncao1.num_linha  = olhos.num_linha
		)
	) as juncao2 left join cor_pele as pele on juncao2.num_linha = pele.num_linha union distinct
	(
			select pele.num_linha, juncao2.cor_cabelo, juncao2.cor_camisa, juncao2.cor_olhos, pele.cor_pele from (
			select juncao1.num_linha, juncao1.cor_cabelo, juncao1.cor_camisa, olhos.cor_olhos from (
				select cabelo.num_linha, cabelo.cor_cabelo, camisa.cor_camisa from cor_cabelo as cabelo left join cor_camisa as camisa on cabelo.num_linha = camisa.num_linha union distinct
				(
					select camisa.num_linha, cabelo.cor_cabelo, camisa.cor_camisa from (select * from cor_cabelo) as cabelo right join (select * from cor_camisa) as camisa on cabelo.num_linha = camisa.num_linha
				)
			) as juncao1 left join cor_olhos as olhos on juncao1.num_linha  = olhos.num_linha union distinct
			(
				select olhos.num_linha, juncao1.cor_cabelo, juncao1.cor_camisa, olhos.cor_olhos from (
					select cabelo.num_linha, cabelo.cor_cabelo, camisa.cor_camisa from cor_cabelo as cabelo left join cor_camisa as camisa on cabelo.num_linha = camisa.num_linha union distinct
					(
						select camisa.num_linha, cabelo.cor_cabelo, camisa.cor_camisa from (select * from cor_cabelo) as cabelo right join (select * from cor_camisa) as camisa on cabelo.num_linha = camisa.num_linha
					)
				) as juncao1 right join cor_olhos as olhos on juncao1.num_linha  = olhos.num_linha
			)
		) as juncao2 right join cor_pele as pele on juncao2.num_linha = pele.num_linha
	)
) as tabela;


drop table if exists cor_cabelo;
drop table if exists cor_camisa;
drop table if exists cor_olhos;
drop table if exists cor_pele;

/*
	Obtenha a lista de todas as cores distintas dos perfis de jogadores para a cor do cabelo, cor da camisa, cor dos olhos e cor da pele, uma em cada coluna. Para que todas as colunas tenham o mesmo número de linhas, preenha os espaços que faltem com NULL
*/