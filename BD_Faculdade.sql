create database loja;

use loja;

create table clientes(
 cod_cliente int auto_increment primary key not null, 
 nome varchar (130) not null, 
 endereco  varchar (160) not null,
 cidade  varchar (90) not null,
 cep integer (9) not null
);

create table pedidos(
num_pedido int auto_increment not null primary key,
data_pedido date not null,
item  varchar (130) not null,
valor varchar (30) not null,
cod_cliente int,
foreign key (cod_cliente) references clientes(cod_cliente)
);

alter table clientes modify cep varchar (10) not null;

insert into clientes(nome, endereco, cidade, cep) values 

("João Franscisco", "Rua Bejamin", "São Paulo", "05200-346"), 
("Fernando Cross", "Rua dos imigrantes", "Rio de Janeiro", "07900-456"),
("Italo Emanoel", "Av. gato laranja", "Piaui", "09800-765");

insert into pedidos(data_pedido, item, valor, cod_cliente) values 
('2025/03/16', "Guarda-roupa", "R$500,00", null),
('2025/03/12', "Aliança de casamento", "R&10.000,00", null);


select * from pedidos

Select * from clientes where nome = "João Franscisco";

select distinct data_pedido from pedidos
  where data_pedido < '2025/03/15' ;
  
  
  drop table pedidos;
  


