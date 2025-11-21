create database proximoPasso;
use proximoPasso;

CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(100) NOT NULL unique,
    idade INT NOT NULL,
    atividade varchar(45),
    senha VARCHAR(255) NOT NULl
); 

ALTER TABLE usuario
MODIFY senha VARCHAR(255) NOT NULL;

CREATE TABLE treino (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    dia_semana VARCHAR(20) NOT NULL,
    distancia VARCHAR(50) NOT NULL,
    data_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

select * from usuario;