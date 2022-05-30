create database if not exists bercario; 
use bercario; 
 
drop table if exists telefone_medico; 
drop table if exists telefone_mae; 
drop table if exists bebe; 
drop table if exists medico; 
drop table if exists mae; 
create table if not exists mae( 
    cpf_mae char(11), 
    nome varchar(50) not null, 
    data_nascimento date not null, 
    constraint PK_MAE primary key (cpf_mae) 
); 

create table if not exists medico( 
    crm_medico char(7), 
    nome varchar(50) not null, 
    especialidade varchar(30) not null, 
    constraint PK_MEDICO primary key (crm_medico) 
); 

create table if not exists bebe( 
    cpf_bebe char(11), 
    cpf_mae char(11), 
    crm_medico char(7), 
    nome varchar(50) not null, 
    data_nascimento date not null, 
    peso float(4,2) unsigned not null, 
    altura float(4,2) unsigned not null, 
    constraint PK_BEBE primary key (cpf_bebe), 
    constraint FK_BEBE_CPF_MAE foreign key (cpf_mae) references mae(cpf_mae), 
    constraint FK_BEBE_CRM_MEDICO foreign key (crm_medico) references medico(crm_medico) 
); 

create table if not exists telefone_mae( 
    id_telefone integer auto_increment, 
    numero char(11) not null, 
    cpf_mae char(11), 
    constraint PK_TELEFONE_MEDICO primary key (id_telefone), 
    constraint FK_TELEFONE_MAE_CPF_MAE foreign key (cpf_mae) references mae (cpf_mae) 
); 

create table if not exists telefone_medico( 
    id_telefone integer auto_increment, 
    numero char(11) not null, 
	crm_medico char(7), 
    constraint PK_TELEFONE_MEDICO primary key (id_telefone), 
    constraint FK_TELEFONE_MEDICO_CPF_MEDICO foreign key (crm_medico) references medico(crm_medico)	 
); 