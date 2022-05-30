set @cont = 0;
drop table if exists cabelo;
create table cabelo as
(
	select
		@cont := @cont + 1 as num_linha,
		tabela.cor_cabelo
	from
	(
		select distinct cor_cabelo from perfil
	) as tabela
);

set @cont = 0;
drop table if exists camisa;
create table camisa as
(
	select
		@cont := @cont + 1 as num_linha,
		tabela.cor_camisa
	from
	(
		select distinct cor_camisa from perfil
	) as tabela
);

set @cont = 0;
drop table if exists olhos;
create table olhos as
(
	select
		@cont := @cont + 1 as num_linha,
		tabela.cor_olhos
	from
	(
		select distinct cor_olhos from perfil
	) as tabela
);

set @cont = 0;
drop table if exists pele;
create table pele as
(
	select
		@cont := @cont + 1 as num_linha,
		tabela.cor_pele
	from
	(
		select distinct cor_pele from perfil
	) as tabela
);

drop view if exists cabelo_camisa;
create view cabelo_camisa as
(
	select
		cabelo.num_linha,
		cabelo.cor_cabelo,
        camisa.cor_camisa
	from
		cabelo left join camisa
			on cabelo.num_linha = camisa.num_linha
	union distinct
    (
		select
			camisa.num_linha,
			cabelo.cor_cabelo,
			camisa.cor_camisa
		from
			cabelo right join camisa
				on cabelo.num_linha = camisa.num_linha
    )
);

select * from cabelo_camisa;

drop view if exists cabelo_camisa_olhos;
create view cabelo_camisa_olhos as
(
	select
		cabelo_camisa.num_linha,
        cabelo_camisa.cor_cabelo,
        cabelo_camisa.cor_camisa,
        olhos.cor_olhos
	from
		cabelo_camisa left join olhos
			on cabelo_camisa.num_linha = olhos.num_linha
	union distinct
    (
		select
			olhos.num_linha,
			cabelo_camisa.cor_cabelo,
			cabelo_camisa.cor_camisa,
			olhos.cor_olhos
		from
			cabelo_camisa right join olhos
				on cabelo_camisa.num_linha = olhos.num_linha
    )
);

select * from cabelo_camisa_olhos;

drop view if exists cabelo_camisa_olhos_pele;
create view cabelo_camisa_olhos_pele as
(
	select
        cabelo_camisa_olhos.cor_cabelo,
        cabelo_camisa_olhos.cor_camisa,
        cabelo_camisa_olhos.cor_olhos,
        pele.cor_pele
	from
		cabelo_camisa_olhos left join pele
			on cabelo_camisa_olhos.num_linha = pele.num_linha
	union distinct
    (
		select
			cabelo_camisa_olhos.cor_cabelo,
			cabelo_camisa_olhos.cor_camisa,
			cabelo_camisa_olhos.cor_olhos,
			pele.cor_pele
		from
			cabelo_camisa_olhos right join pele
				on cabelo_camisa_olhos.num_linha = pele.num_linha
    )
);

select * from cabelo_camisa_olhos_pele;