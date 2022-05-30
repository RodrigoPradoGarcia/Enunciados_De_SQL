set @nomes = "";

drop table if exists consulta;
create table consulta as (
	select
		@nomes := concat(@nomes, ", " ,apelido)
	from
		perfil
);
drop table if exists consulta;

select right(@nomes,length(@nomes) - 2) as nomes;