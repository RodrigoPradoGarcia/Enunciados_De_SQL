create database if not exists floricultura; 
use floricultura; 
 

drop table if exists item_pedido; 
drop table if exists produto; 
drop table if exists pedido; 
drop table if exists telefone; 
drop table if exists cliente; 

create table if not exists cliente( 
    rg_cliente char(7), 
    nome varchar(50) not null, 
    endereco varchar(150) not null, 
    constraint PK_CLIENTE primary key (rg_cliente) 
); 

create table if not exists telefone( 
  id_telefone integer, 
  rg_cliente char(7), 
  numero char(11), 
  constraint PK_TELEFONE primary key (id_telefone), 
  constraint FK_TELEFONE_RG_CLIENTE foreign key (rg_cliente) references cliente (rg_cliente) 
); 

create table if not exists pedido( 
    id_pedido integer auto_increment, 
    rg_cliente char(7), 
    data datetime not null, 
    constraint PK_PEDIDO primary key (id_pedido), 
    constraint FK_PEDIDO_CLIENTE foreign key (rg_cliente) references cliente(rg_cliente) 
); 
 
create table if not exists produto( 
    id_produto integer auto_increment, 
    nome varchar(50) not null, 
    tipo varchar(30) not null, 
    preco float(6,2) not null, 
    em_estoque integer unsigned not null, 
    constraint PK_PRODUTO primary key (id_produto) 
); 

create table if not exists item_pedido( 
    id_pedido integer, 
    id_produto integer, 
    quantidade integer unsigned not null, 
    constraint FK_ITEM_PEDIDO_ID_PEDIDO foreign key (id_pedido) references pedido(id_pedido), 
    constraint FK_ITEM_PEDIDO_ID_PRODUTO foreign key (id_produto) references produto(id_produto), 
    constraint PK_ITEM_PEDIDO primary key (id_pedido, id_produto)
); 