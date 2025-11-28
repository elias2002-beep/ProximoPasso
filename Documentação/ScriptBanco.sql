create database proximoPasso;
use proximoPasso;

CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(100) NOT NULL unique,
    idade INT NOT NULL,
    senha VARCHAR(255) NOT NULL
); 

CREATE TABLE treino (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    dia_semana VARCHAR(45) NOT NULL,
    distancia decimal(10,3),
    data_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

INSERT INTO usuario (usuario, idade, senha)
VALUES 
('Roger Elias', 23, '12345'),
('Usuário Teste', 30, '12345');

INSERT INTO treino (dia_semana, distancia, data_registro, usuario_id)
VALUES
('Segunda', 5.0, '2025-11-21 08:43:50', 1),
('Quarta', 4.2, '2025-11-21 08:43:50', 1),
('Sexta', 6.5, '2025-11-21 08:43:50', 1),
('Terça', 3.8, '2025-11-21 08:43:50', 2),
('Quinta', 5.0, '2025-11-21 08:43:50', 2);

select usuario, idade, dia_semana as dia_da_semana, distancia, data_registro 
	from usuario left join treino on usuario.id = treino.usuario_id; 