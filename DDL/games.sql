create database if not exists games;
use games;

drop table if exists jogo_dica;
drop table if exists dica;
drop table if exists partida;
drop table if exists perfil_jogo;
drop table if exists jogo;
drop table if exists perfil;
drop table if exists usuario;

create table if not exists usuario(
	  login_usuario varchar(50),
    senha varchar(20) not null,
    email varchar(30) not null,
    constraint PK_USUARIO primary key (login_usuario)
);

create table if not exists perfil(
	  id_perfil integer,
    login_usuario varchar(50),
    idade integer(2) unsigned not null,
    apelido varchar(50) not null,
    sexo varchar(9) not null,
    cor_pele char(7) not null,
    cor_cabelo char(7) not null,
    cor_olhos char(7) not null,
    cor_camisa char(7) not null,
    constraint PK_PERFIL primary key (id_perfil),
    constraint FK_PERFIL_LOGIN_USUARIO foreign key(login_usuario) references usuario(login_usuario)
);

create table if not exists jogo(
	id_jogo integer auto_increment,
    nome varchar(50) not null,
    categoria varchar(50) not null,
    dificuldade varchar(10) not null,
    constraint PK_JOGO primary key (id_jogo)
);

create table if not exists perfil_jogo(
	id_jogo integer,
    id_perfil integer,
    constraint FK_PERFIL_JOGO_ID_JOGO foreign key (id_jogo) references jogo(id_jogo),
    constraint FK_PERFIL_JOGO_ID_PERFIL foreign key (id_perfil) references perfil(id_perfil),
    constraint PK_PERFIL_JOGO primary key (id_jogo,id_perfil)
);

create table if not exists partida(
	id_partida integer auto_increment,
	id_perfil integer,
    id_jogo integer,
    data datetime,
    pontuacao integer(3) unsigned zerofill not null,
    constraint PK_PARTIDA primary key (id_partida),
    constraint FK_PARTIDA_ID_PERFIL foreign key(id_perfil) references perfil(id_perfil),
    constraint FK_PARTIDA_ID_JOGO foreign key (id_jogo) references jogo(id_jogo)
);

create table if not exists dica(
	id_dica integer auto_increment,
    descricao varchar(50) not null,
    constraint PK_DICA primary key(id_dica)
);

create table if not exists jogo_dica(
	id_dica integer,
    id_jogo integer,
    constraint FK_JOGO_DICA foreign key (id_dica) references dica(id_dica),
    constraint FK_JOGO_DICA_ID_JOGO foreign key(id_jogo) references jogo(id_jogo),
    constraint PK_JOGO_DICA primary key(id_dica,id_jogo)
);

insert into usuario values ('elisabete', '512478','elisabete@gmail.com');
insert into usuario values ('elias', '123456','elias@email.com');
insert into usuario values ('leandro', '457815','leandro@outlook.com');
insert into usuario values ('rogerio', '102478','rogerio@email.com');
insert into usuario values ('ulisses', '021478','ulisses@outlook.com');
insert into usuario values ('henrique', '456178','henrique@gmail.com');

insert into perfil values (1,'elisabete','25','elisa','feminino','#446789','#000000','#00ff00','#8877cd');
insert into perfil values (2,'elias','14','elias','masculino','#9987ff','#ffff00','#00ff00','#973456');
insert into perfil values (3,'leandro','12','leandro','masculino','#9987ff','#ff0000','#00ff00','#098765');
insert into perfil values (4,'rogerio','17','rogerio','masculino','#9987ff','#000000','#00ff00','#567789');
insert into perfil values (5,'ulisses','15','ulisses','masculino','#446789','#000000','#ffff00','#098645');
insert into perfil values (6,'elisabete','25','elisa','feminino','#446789','#000000','#00ff00','#8877cd');
insert into perfil values (7,'henrique','7','henrique','masculino','#446789','#000000','#00ff00','#8877cd');
insert into perfil values (8,'henrique','7','henrique','masculino','#446789','#000000','#00ff00','#8877cd');
insert into perfil values (9,'leandro','7','leandro2','masculino','#446789','#000000','#00ff00','#8877cd');
insert into perfil values (10,'elisabete','7','elisabete2','feminino','#446789','#000000','#00ff00','#8877cd');
insert into perfil values (11,'ulisses','7','ulisses2','masculino','#446789','#000000','#00ff00','#8877cd');

insert into jogo values (1,'Determinante de Matriz', 'Álgebra Linear','Médio');
insert into jogo values (2,'Área de triângulos', 'Geometria','Facil');
insert into jogo values (3,'Área de Polígonos', 'Geometria','Médio');
insert into jogo values (4,'Derivadas Parciais', 'Álgebra Linear','Difícil');

insert into perfil_jogo values (1,1);
insert into perfil_jogo values (1,3);
insert into perfil_jogo values (1,5);
insert into perfil_jogo values (2,2);
insert into perfil_jogo values (2,4);
insert into perfil_jogo values (2,5);
insert into perfil_jogo values (3,3);
insert into perfil_jogo values (3,4);
insert into perfil_jogo values (3,5);
insert into perfil_jogo values (4,1);
insert into perfil_jogo values (4,3);
insert into perfil_jogo values (4,5);
insert into perfil_jogo values (2,8);
insert into perfil_jogo values (2,9);
insert into perfil_jogo values (3,10);
insert into perfil_jogo values (1,11);
insert into perfil_jogo values (1,7);
insert into perfil_jogo values (1,6);

insert into partida values (null,1,4,'2022-03-06 15:22:14',52);
insert into partida values (null,1,4,'2022-03-06 18:01:15',20);
insert into partida values (null,2,2,'2022-03-06 09:42:33',60);
insert into partida values (null,2,2,'2022-03-06 10:15:14',45);
insert into partida values (null,3,4,'2022-03-06 22:01:12',84);
insert into partida values (null,4,2,'2022-03-06 08:30:25',47);
insert into partida values (null,4,3,'2022-03-06 15:14:14',65);
insert into partida values (65,5,4,'2022-03-06 20:21:24',80);
insert into partida values (69,2,2,'2022-03-06 09:45:14',12);
insert into partida values (71,1,4,'2022-03-06 12:25:00',75);
insert into partida values (77,3,4,'2022-03-06 12:5:36',50);
insert into partida values (83,4,2,'2022-03-06 13:14:28',40);
insert into partida values (null,1,1,'2022-03-06 13:45:45',0);
insert into partida values (null,3,4,'2022-03-06 13:59:01',98);
insert into partida values (null,5,3,'2022-03-06 13:45:41',60);
insert into partida values (null,7,1,'2022-03-14 20:22:38',98);
insert into partida values (null,6,1,'2022-03-14 20:59:52',0);
insert into partida values (null,8,2,'2021-02-14 21:45:07',20);
insert into partida values (null,9,2,'2021-07-16 15:26:14',64);
insert into partida values (null,10,3,'2021-06-09 23:15:50',74);
insert into partida values (null,11,1,'2021-03-01 11:45:47',60);
insert into partida values (null,11,1,'2021-03-01 11:45:47',60);
insert into partida values (null,11,1,'2021-03-01 11:45:47',60);
insert into partida values (null,7,1,'0000-00-00 00:00:00',50);
insert into partida values (null,6,1,'0000-00-00 00:00:00',15);
insert into partida values (null,6,4,'2022-01-01 14:14:14',20);
insert into partida values (null,7,4,'2022-01-01 15:15:15',15);

insert into dica values (1707,'games');
insert into dica values (1708,'Utilize o teorema de pitágoras');
insert into dica values (1709,'Utilize a regra de chió');
insert into dica values (1710,'Utilize a lei dos cossenos');
insert into dica values (1712,'Utilize a regra do expoente');
insert into dica values (1713,'Calcular o gradiente da função');

insert into jogo_dica (id_jogo, id_dica) values (1,1709);
insert into jogo_dica (id_jogo, id_dica) values (2,1708);
insert into jogo_dica (id_jogo, id_dica) values (3,1710);
insert into jogo_dica (id_jogo, id_dica) values (4,1712);
insert into jogo_dica (id_jogo, id_dica) values (4,1713);

update dica set descricao = upper(descricao) where not id_dica in(
select id_dica from jogo_dica
);

update partida set pontuacao = 100 where pontuacao = 0;

update perfil set apelido = 'elisabete' where id_perfil in ( 
select id_perfil from partida where pontuacao = 100
);

update dica set descricao = 'Utilize a lei dos senos' where descricao = 'Utilize a lei dos cossenos';

update usuario set email =  concat( left(email, length(email) - length('email.com')) , 'gmail.com' ) where email like '%@email.com%';

delete from partida
where
  id_perfil in
    (
    select
      id_perfil
    from
      perfil
    where
      id_perfil in
      (
        select
          tabela2.id_perfil
        from
        (
          select
            tabela.id_perfil,
            datediff( curdate() , tabela.ultima_partida) as diferenca
          from
          (
            select
              id_perfil,
              max(data) as ultima_partida
            from
              partida
            group by
              id_perfil
          ) as tabela 
        ) as tabela2
        where
          tabela2.diferenca > 180
      )
    )
;

drop view if exists teste;
create view teste as (
  select 
    partida.id_partida
  from
    usuario inner join perfil on usuario.login_usuario = perfil.login_usuario
        inner join partida on perfil.id_perfil = partida.id_perfil
  where
    usuario.login_usuario in 
    (
      select
        usuario.login_usuario
      from
        usuario inner join perfil 
          on usuario.login_usuario = perfil.login_usuario
        inner join partida
          on perfil.id_perfil = partida.id_perfil
      group by
        usuario.login_usuario
      having
        avg(partida.pontuacao) < 40 and partida.pontuacao < 50
    )
);
delete from partida where id_partida in ( select * from teste );
drop view if exists teste;

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
    );
    
delete from partida where data = '0000-00-00 00:00:00';