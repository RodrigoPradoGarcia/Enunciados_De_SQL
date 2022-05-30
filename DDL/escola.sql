create database if not exists escola;
use escola;

drop table if exists aula;
drop table if exists disciplina;
drop table if exists professor;
drop table if exists aluno;
drop table if exists turma;
drop table if exists sala;

create table if not exists sala(
	id_sala integer auto_increment,
    numero_sala integer(3) unsigned zerofill not null,
    bloco char(1) not null,
    andar integer(1) unsigned not null,
    constraint PK_SALA primary key (id_sala)
);

create table if not exists turma(
	id_turma integer auto_increment,
    id_sala integer,
    serie integer(1) unsigned not null,
    periodo char(5) not null,
    constraint PK_TURMA primary key (id_turma),
    constraint FK_TURMA_ID_SALA foreign key (id_sala) references sala(id_sala)
);

create table if not exists aluno(
	registro_aluno char(8),
    nome varchar(50) not null,
    id_turma integer,
    constraint PK_ALUNO primary key (registro_aluno),
    constraint FK_ALUNO_TURMA foreign key (id_turma) references turma(id_turma)
);

create table if not exists professor(
	registro_professor char(8),
    nome varchar(50) not null,
    constraint PK_PROFESSOR primary key(registro_professor)
);

create table if not exists disciplina(
	id_disciplina integer auto_increment,
    nome varchar(50) not null,
    constraint PK_DISCIPLINA primary key(id_disciplina)
);

create table if not exists aula(
	id_turma integer,
    dia_semana varchar(7),
    horario time,
    registro_professor char(8),
    id_disciplina integer,
    constraint FK_AULA_ID_TURMA foreign key (id_turma) references turma(id_turma),
    constraint FK_AULA_REGISTRO_PROFESSOR foreign key (registro_professor) references professor(registro_professor),
    constraint FK_AULA_ID_DISCIPLINA foreign key (id_disciplina) references disciplina(id_disciplina),
    constraint PK_AULA primary key (id_turma,dia_semana,horario),
    constraint PROFESSOR_NAO_PODE_ESTAR_EM_DOIS_LUGARES_AO_MESMO_TEMPO unique(dia_semana,horario,registro_professor)
);

