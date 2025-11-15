create database proximo_passo;
use proximo_passo;
drop database proximo_passo;

create table cadastro (
id int primary key auto_increment,
usuario varchar(45) not null,
idade int check (idade >= 15), 
nivelAtividade varchar(45) not null,
senha varchar(45) not null,
confirmarSenha varchar(45) not null,
constraint chnivel check (nivelAtividade in ('Baixo', 'Médio', 'Alta'))
);

create table registro_atividade (
id int primary key auto_increment,
datas date, 
tempo time,
quantidadekm decimal(7, 2),
fkcadastro int,
constraint fhkcadastro foreign key (fkcadastro) references cadastro (id)
);

create table atividade (
id int primary key auto_increment,
treinos varchar(45),
fkcadastro int,
constraint fkatividade foreign key (fkcadastro) references cadastro(id)
);

insert into cadastro (usuario, idade, nivelAtividade, senha, confirmarSenha) values
('Roger', 23, 'Alta', 'Roger123', 'Roger123'),
('elias', 43, 'Baixo', 'Roger123', 'Roger123'),
('Santos', 15, 'Médio', 'Roger123', 'Roger123');

insert into registro_atividade (datas, tempo, quantidadekm, fkcadastro) values
('2025-11-13', '00:45:35', 700.00, 2),
('2025-11-13', '01:10:00', 1500.00, 1),
('2025-11-13', '00:20:35', 800.00, 3);

insert into atividade (treinos, fkcadastro) values
('Corra 2000kms ou 01:30:00', 1),
('Corra/Caminhe 1000kms ou 01:00:00', 2),
('Corra/Caminhe 1000kms ou 01:00:00', 3);

select c.usuario, c.idade, c.nivelAtividade, r.datas, r.tempo, r.quantidadekm, av.treinos from cadastro c join registro_atividade r on c.id = r.fkcadastro
	join atividade av on c.id = av.fkcadastro
    order by c.idade asc;