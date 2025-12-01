CREATE SCHEMA IF NOT EXISTS jackpot_if;
USE jackpot_if;

CREATE TABLE usuario (
    id INT AUTO_INCREMENT, 
    PRIMARY KEY (id),
    nome_usuario VARCHAR(99) NOT NULL UNIQUE,
    senha_hash VARCHAR(255) NOT NULL,
    saldo_atual DECIMAL(10, 2) NOT NULL DEFAULT 0.00 
);

CREATE TABLE aposta (
    id_aposta INT AUTO_INCREMENT,
    PRIMARY KEY (id_aposta),
    userId INT NOT NULL,
    FOREIGN KEY (userId) REFERENCES usuario(id),
    tipo ENUM('esporte', 'roleta', 'tigrinho') NOT NULL, 
    valor_apostado DECIMAL(10, 2) NOT NULL,
    valor_ganho DECIMAL(10, 2) NOT NULL DEFAULT 0.00, 
    data_aposta TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE sessoes_usuario (
    id_sessao INT AUTO_INCREMENT,
    PRIMARY KEY (id_sessao),
    userId INT NOT NULL,
    FOREIGN KEY (userId) REFERENCES usuario(id),
    data_login TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_logout TIMESTAMP NULL,
    duracao_minutos INT
);

CREATE TABLE log_depositos (
    id_deposito INT AUTO_INCREMENT,
    PRIMARY KEY (id_deposito),
    id_sessao INT NOT NULL, 
    FOREIGN KEY (id_sessao) REFERENCES sessoes_usuario(id_sessao),
    valor_adicionado DECIMAL(10, 2) NOT NULL,
    data_deposito TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE grupo_comunidade (
    id INT AUTO_INCREMENT,
    PRIMARY KEY (id),
    nome VARCHAR(100) NOT NULL UNIQUE,
    responsavel_id INT NOT NULL,
    FOREIGN KEY (responsavel_id) REFERENCES usuario(id) 
);

CREATE TABLE usuario_grupo (
    usuario_id INT NOT NULL,
    grupo_id INT NOT NULL,
    PRIMARY KEY (usuario_id, grupo_id), 
    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    FOREIGN KEY (grupo_id) REFERENCES grupo_comunidade(id),
    data_adesao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
