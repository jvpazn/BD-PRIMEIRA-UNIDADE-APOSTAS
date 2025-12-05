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

IINSERT INTO usuario (nome_usuario, senha_hash, saldo_atual) 
VALUES ('Angela', 'OdeiovcAyin', 1200); 

INSERT INTO usuario (nome_usuario, senha_hash, saldo_atual) 
VALUES ('Roland', 'AngelicaMeuAmor', 75); 

INSERT INTO usuario (nome_usuario, senha_hash, saldo_atual) 
VALUES ('Malkuth', 'Malcute:3', 2100); 

INSERT INTO usuario (nome_usuario, senha_hash, saldo_atual) 
VALUES ('Yesod', 'Java>C++', 250); 

INSERT INTO usuario (nome_usuario, senha_hash, saldo_atual) 
VALUES ('Hod', 'ClubeLiteratura', 1800); 

INSERT INTO usuario (nome_usuario, senha_hash, saldo_atual) 
VALUES ('Netzach', 'BeberEapostar', 110000); 

INSERT INTO usuario (nome_usuario, senha_hash, saldo_atual) 
VALUES ('Tiphereth', 'GarotasMagicas', 22); 

INSERT INTO usuario (nome_usuario, senha_hash, saldo_atual) 
VALUES ('Gebura', 'DISCIPLINA2000', 850); 

INSERT INTO usuario (nome_usuario, senha_hash, saldo_atual) 
VALUES ('Chesed', 'Cafe3coracoes', 78000); 

INSERT INTO usuario (nome_usuario, senha_hash, saldo_atual) 
VALUES ('Binah', 'SouMelhorqueoAristoteles333', 9500); 

INSERT INTO usuario (nome_usuario, senha_hash, saldo_atual) 
VALUES ('Hokma', 'AmovcAyin', 120000); 

INSERT INTO usuario (nome_usuario, senha_hash, saldo_atual) 
VALUES ('Mirinae', 'HANAassocDirector', 14500); 

INSERT INTO usuario (nome_usuario, senha_hash, saldo_atual) 
VALUES ('Harold', 'Debuff3x00', 450); 

INSERT INTO usuario (nome_usuario, senha_hash, saldo_atual) 
VALUES ('Olivier', 'AmovcRoland', 9500); 

INSERT INTO usuario (nome_usuario, senha_hash, saldo_atual) 
VALUES ('Pete', 'GuiaDosRatosparaviverNaCidade', 10); 

INSERT INTO usuario (nome_usuario, senha_hash, saldo_atual) 
VALUES ('Lenny', 'GuiaDosRatosparaviverNaCidade', 8); 

INSERT INTO usuario (nome_usuario, senha_hash, saldo_atual) 
VALUES ('Mang-Chi', 'GuiaDosRatosparaviverNaCidade', 15); 

INSERT INTO usuario (nome_usuario, senha_hash, saldo_atual) 
VALUES ('Ricardo', 'FAMILIAEM1LUGAR1!!!!!!!!!!!', 12000000000); 

INSERT INTO usuario (nome_usuario, senha_hash, saldo_atual) 
VALUES ('Don Quixote', 'LosSangredeLosHermanos', 15000000); 

INSERT INTO usuario (nome_usuario, senha_hash, saldo_atual) 
VALUES ('Sinclair', 'KromerKromerKromer1!!!!!!!!!!', 150000); 

INSERT INTO usuario (nome_usuario, senha_hash, saldo_atual) 
VALUES ('Meursalt', 'Meursalt', 110000); 

INSERT INTO usuario (nome_usuario, senha_hash, saldo_atual) 
VALUES ('Jia Qiu', 'DigaMeJIABAOYU,OqueHonguyanPrecisa?', 1300000); 

INSERT INTO usuario (nome_usuario, senha_hash, saldo_atual) 
VALUES ('Zilu', 'AdeptoHeishou', 12000); 

INSERT INTO usuario (nome_usuario, senha_hash, saldo_atual) 
VALUES ('Sancho', 'UmsonhoIrrealizavel', 1234); 

INSERT INTO usuario (nome_usuario, senha_hash, saldo_atual) 
VALUES ('Dulcinea', 'ArainhaDaParada', 11000); 

INSERT INTO usuario (nome_usuario, senha_hash, saldo_atual) 
VALUES ('Nicolina', 'ManchalandComMascarasPraSempre', 2000); 

INSERT INTO usuario (nome_usuario, senha_hash, saldo_atual) 
VALUES ('Curiambro', 'IreiMorrerPelosSeusPecados', 3000); 

INSERT INTO usuario (nome_usuario, senha_hash, saldo_atual) 
VALUES ('Ahab', 'ACULPAÉTODASUAISHMAEL!', 100000000000000000000000000000000000000); 

INSERT INTO usuario (nome_usuario, senha_hash, saldo_atual) 
VALUES ('Queequeg', 'IshmaelTeAmo', 1500); 

INSERT INTO usuario (nome_usuario, senha_hash, saldo_atual) 
VALUES ('StarBuck', 'StarbucksEmployee', 2500); 

INSERT INTO usuario (nome_usuario, senha_hash, saldo_atual) 
VALUES ('Ishmael', 'EUTEODEIOAHAB!!!!!!!!!!!!!!!!!!!!!!!!!!!', 3000); 

