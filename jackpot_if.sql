CREATE SCHEMA jackpot_if;
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

-- Um montão de coisas nesse BD foi pensado no projeto de pp2
-- Por isso tem vários Timestamps
-- Decidimos fazer vários para ficar mais facil no de fazer os Select_from :3

-- usuarios

INSERT INTO usuario (nome_usuario, senha_hash, saldo_atual) 
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
VALUES ('Ricardo', 'FAMILIAEM1LUGAR1!!!!!!!!!!!', 120000); 

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
VALUES ('Ahab', 'ACULPAÉTODASUAISHMAEL!', 10000000); 

INSERT INTO usuario (nome_usuario, senha_hash, saldo_atual) 
VALUES ('Queequeg', 'IshmaelTeAmo', 1500); 

INSERT INTO usuario (nome_usuario, senha_hash, saldo_atual) 
VALUES ('StarBuck', 'StarbucksEmployee', 2500); 

INSERT INTO usuario (nome_usuario, senha_hash, saldo_atual) 
VALUES ('Ishmael', 'EUTEODEIOAHAB!!!!!!!!!!!!!!!!!!!!!!!!!!!', 3000); 

-- Apostas

INSERT INTO aposta (userId, tipo, valor_apostado, valor_ganho) VALUES (1, 'roleta', 500, 0);
INSERT INTO aposta (userId, tipo, valor_apostado, valor_ganho) VALUES (1, 'esporte', 250, 600);

INSERT INTO aposta (userId, tipo, valor_apostado, valor_ganho) VALUES (2, 'esporte', 10.5, 21);

INSERT INTO aposta (userId, tipo, valor_apostado, valor_ganho) VALUES (3, 'tigrinho', 250, 1500);

INSERT INTO aposta (userId, tipo, valor_apostado, valor_ganho) VALUES (4, 'roleta', 15, 30);

INSERT INTO aposta (userId, tipo, valor_apostado, valor_ganho) VALUES (5, 'esporte', 80, 40);

INSERT INTO aposta (userId, tipo, valor_apostado, valor_ganho) VALUES (6, 'tigrinho', 1000, 10000);

INSERT INTO aposta (userId, tipo, valor_apostado, valor_ganho) VALUES (7, 'roleta', 2.5, 0);

INSERT INTO aposta (userId, tipo, valor_apostado, valor_ganho) VALUES (8, 'esporte', 150, 350);

INSERT INTO aposta (userId, tipo, valor_apostado, valor_ganho) VALUES (9, 'tigrinho', 5000, 0);

INSERT INTO aposta (userId, tipo, valor_apostado, valor_ganho) VALUES (10, 'roleta', 120, 480);

INSERT INTO aposta (userId, tipo, valor_apostado, valor_ganho) VALUES (11, 'esporte', 10000, 25000);

INSERT INTO aposta (userId, tipo, valor_apostado, valor_ganho) VALUES (12, 'tigrinho', 350, 700);

INSERT INTO aposta (userId, tipo, valor_apostado, valor_ganho) VALUES (13, 'roleta', 45, 0);

INSERT INTO aposta (userId, tipo, valor_apostado, valor_ganho) VALUES (14, 'esporte', 200, 50);

INSERT INTO aposta (userId, tipo, valor_apostado, valor_ganho) VALUES (15, 'tigrinho', 1, 5);

INSERT INTO aposta (userId, tipo, valor_apostado, valor_ganho) VALUES (16, 'roleta', 0.5, 0);

INSERT INTO aposta (userId, tipo, valor_apostado, valor_ganho) VALUES (17, 'esporte', 3, 15);

INSERT INTO aposta (userId, tipo, valor_apostado, valor_ganho) VALUES (18, 'tigrinho', 8000, 16000);

INSERT INTO aposta (userId, tipo, valor_apostado, valor_ganho) VALUES (19, 'roleta', 100000, 0);

INSERT INTO aposta (userId, tipo, valor_apostado, valor_ganho) VALUES (20, 'esporte', 500, 1500);

INSERT INTO aposta (userId, tipo, valor_apostado, valor_ganho) VALUES (21, 'tigrinho', 100, 200);

INSERT INTO aposta (userId, tipo, valor_apostado, valor_ganho) VALUES (22, 'roleta', 15000, 30000);

INSERT INTO aposta (userId, tipo, valor_apostado, valor_ganho) VALUES (23, 'esporte', 50, 10);

INSERT INTO aposta (userId, tipo, valor_apostado, valor_ganho) VALUES (24, 'tigrinho', 123.4, 493.6);

INSERT INTO aposta (userId, tipo, valor_apostado, valor_ganho) VALUES (25, 'roleta', 1100, 0);

INSERT INTO aposta (userId, tipo, valor_apostado, valor_ganho) VALUES (26, 'esporte', 20, 60);

INSERT INTO aposta (userId, tipo, valor_apostado, valor_ganho) VALUES (27, 'tigrinho', 300, 300);

INSERT INTO aposta (userId, tipo, valor_apostado, valor_ganho) VALUES (28, 'roleta', 500000, 1500000);

INSERT INTO aposta (userId, tipo, valor_apostado, valor_ganho) VALUES (29, 'esporte', 15, 0);

INSERT INTO aposta (userId, tipo, valor_apostado, valor_ganho) VALUES (30, 'tigrinho', 25, 125);

INSERT INTO aposta (userId, tipo, valor_apostado, valor_ganho) VALUES (31, 'roleta', 300, 600);

-- Sessoes_Usuario

INSERT INTO sessoes_usuario (userId, data_logout, duracao_minutos) VALUES (1, NULL, 45);

INSERT INTO sessoes_usuario (userId, data_logout, duracao_minutos) VALUES (2, NULL, 30);

INSERT INTO sessoes_usuario (userId, data_logout, duracao_minutos) VALUES (3, NULL, 60);

INSERT INTO sessoes_usuario (userId, data_logout, duracao_minutos) VALUES (4, NULL, 25);

INSERT INTO sessoes_usuario (userId, data_logout, duracao_minutos) VALUES (5, NULL, 40);

INSERT INTO sessoes_usuario (userId, data_logout, duracao_minutos) VALUES (6, NULL, 120);

INSERT INTO sessoes_usuario (userId, data_logout, duracao_minutos) VALUES (7, NULL, 10);

INSERT INTO sessoes_usuario (userId, data_logout, duracao_minutos) VALUES (8, NULL, 35);

INSERT INTO sessoes_usuario (userId, data_logout, duracao_minutos) VALUES (9, NULL, 90);

INSERT INTO sessoes_usuario (userId, data_logout, duracao_minutos) VALUES (10, NULL, 55);

INSERT INTO sessoes_usuario (userId, data_logout, duracao_minutos) VALUES (11, NULL, 150);

INSERT INTO sessoes_usuario (userId, data_logout, duracao_minutos) VALUES (12, NULL, 75);

INSERT INTO sessoes_usuario (userId, data_logout, duracao_minutos) VALUES (13, NULL, 20);

INSERT INTO sessoes_usuario (userId, data_logout, duracao_minutos) VALUES (14, NULL, 50);

INSERT INTO sessoes_usuario (userId, data_logout, duracao_minutos) VALUES (15, NULL, 12);

INSERT INTO sessoes_usuario (userId, data_logout, duracao_minutos) VALUES (16, NULL, 8);

INSERT INTO sessoes_usuario (userId, data_logout, duracao_minutos) VALUES (17, NULL, 18);

INSERT INTO sessoes_usuario (userId, data_logout, duracao_minutos) VALUES (18, NULL, 110);

INSERT INTO sessoes_usuario (userId, data_logout, duracao_minutos) VALUES (19, NULL, 45);

INSERT INTO sessoes_usuario (userId, data_logout, duracao_minutos) VALUES (20, NULL, 52);

INSERT INTO sessoes_usuario (userId, data_logout, duracao_minutos) VALUES (21, NULL, 33);

INSERT INTO sessoes_usuario (userId, data_logout, duracao_minutos) VALUES (22, NULL, 95);

INSERT INTO sessoes_usuario (userId, data_logout, duracao_minutos) VALUES (23, NULL, 16);

INSERT INTO sessoes_usuario (userId, data_logout, duracao_minutos) VALUES (24, NULL, 28);

INSERT INTO sessoes_usuario (userId, data_logout, duracao_minutos) VALUES (25, NULL, 40);

INSERT INTO sessoes_usuario (userId, data_logout, duracao_minutos) VALUES (26, NULL, 22);

INSERT INTO sessoes_usuario (userId, data_logout, duracao_minutos) VALUES (27, NULL, 27);

INSERT INTO sessoes_usuario (userId, data_logout, duracao_minutos) VALUES (28, NULL, 130);

INSERT INTO sessoes_usuario (userId, data_logout, duracao_minutos) VALUES (29, NULL, 14);

INSERT INTO sessoes_usuario (userId, data_logout, duracao_minutos) VALUES (30, NULL, 19);
INSERT INTO sessoes_usuario (userId, data_logout, duracao_minutos) VALUES (30, NULL, 80);

INSERT INTO sessoes_usuario (userId, data_logout, duracao_minutos) VALUES (31, NULL, 48);

-- Log_depositos

INSERT INTO log_depositos (id_sessao, valor_adicionado) VALUES (1, 200);

INSERT INTO log_depositos (id_sessao, valor_adicionado) VALUES (2, 50);
INSERT INTO log_depositos (id_sessao, valor_adicionado) VALUES (2, 900);

INSERT INTO log_depositos (id_sessao, valor_adicionado) VALUES (3, 500);

INSERT INTO log_depositos (id_sessao, valor_adicionado) VALUES (4, 80);

INSERT INTO log_depositos (id_sessao, valor_adicionado) VALUES (5, 150);

INSERT INTO log_depositos (id_sessao, valor_adicionado) VALUES (6, 5000);

INSERT INTO log_depositos (id_sessao, valor_adicionado) VALUES (7, 20);

INSERT INTO log_depositos (id_sessao, valor_adicionado) VALUES (8, 300);

INSERT INTO log_depositos (id_sessao, valor_adicionado) VALUES (9, 2500);

INSERT INTO log_depositos (id_sessao, valor_adicionado) VALUES (10, 400);

INSERT INTO log_depositos (id_sessao, valor_adicionado) VALUES (11, 8000);

INSERT INTO log_depositos (id_sessao, valor_adicionado) VALUES (12, 1200);

INSERT INTO log_depositos (id_sessao, valor_adicionado) VALUES (13, 60);

INSERT INTO log_depositos (id_sessao, valor_adicionado) VALUES (14, 200);

INSERT INTO log_depositos (id_sessao, valor_adicionado) VALUES (15, 5);

INSERT INTO log_depositos (id_sessao, valor_adicionado) VALUES (16, 3);

INSERT INTO log_depositos (id_sessao, valor_adicionado) VALUES (17, 10);

INSERT INTO log_depositos (id_sessao, valor_adicionado) VALUES (18, 7000);

INSERT INTO log_depositos (id_sessao, valor_adicionado) VALUES (19, 300000);

INSERT INTO log_depositos (id_sessao, valor_adicionado) VALUES (20, 800);

INSERT INTO log_depositos (id_sessao, valor_adicionado) VALUES (21, 150);

INSERT INTO log_depositos (id_sessao, valor_adicionado) VALUES (22, 50000);

INSERT INTO log_depositos (id_sessao, valor_adicionado) VALUES (23, 40);

INSERT INTO log_depositos (id_sessao, valor_adicionado) VALUES (24, 200);

INSERT INTO log_depositos (id_sessao, valor_adicionado) VALUES (25, 900);

INSERT INTO log_depositos (id_sessao, valor_adicionado) VALUES (26, 75);

INSERT INTO log_depositos (id_sessao, valor_adicionado) VALUES (27, 120);

INSERT INTO log_depositos (id_sessao, valor_adicionado) VALUES (28, 200000);

INSERT INTO log_depositos (id_sessao, valor_adicionado) VALUES (29, 30);

INSERT INTO log_depositos (id_sessao, valor_adicionado) VALUES (30, 60);

INSERT INTO log_depositos (id_sessao, valor_adicionado) VALUES (31, 500);

-- Grupos

INSERT INTO grupo_comunidade (nome, responsavel_id) VALUES ('Bibliotecarios Principais', 1);

INSERT INTO grupo_comunidade (nome, responsavel_id) VALUES ('Bibliotecarios Asiyah', 1);

INSERT INTO grupo_comunidade (nome, responsavel_id) VALUES ('Bibliotecarios Briah', 1);

INSERT INTO grupo_comunidade (nome, responsavel_id) VALUES ('Bibliotecarios Atziluth', 1);

INSERT INTO grupo_comunidade (nome, responsavel_id) VALUES ('Associação Hana', 12);

INSERT INTO grupo_comunidade (nome, responsavel_id) VALUES ('Ratos', 15);

INSERT INTO grupo_comunidade (nome, responsavel_id) VALUES ('O MEIO', 18);

INSERT INTO grupo_comunidade (nome, responsavel_id) VALUES ('O mindinho', 22);

INSERT INTO grupo_comunidade (nome, responsavel_id) VALUES ('La manchaland', 24);

INSERT INTO grupo_comunidade (nome, responsavel_id) VALUES ('O pequod', 28);

-- usuario_grupo

INSERT INTO usuario_grupo (usuario_id, grupo_id) VALUES (1, 1);
INSERT INTO usuario_grupo (usuario_id, grupo_id) VALUES (2, 1);

INSERT INTO usuario_grupo (usuario_id, grupo_id) VALUES (3, 2);
INSERT INTO usuario_grupo (usuario_id, grupo_id) VALUES (4, 2);
INSERT INTO usuario_grupo (usuario_id, grupo_id) VALUES (5, 2);
INSERT INTO usuario_grupo (usuario_id, grupo_id) VALUES (6, 2);

INSERT INTO usuario_grupo (usuario_id, grupo_id) VALUES (7, 3);
INSERT INTO usuario_grupo (usuario_id, grupo_id) VALUES (8, 3);
INSERT INTO usuario_grupo (usuario_id, grupo_id) VALUES (9, 3);

INSERT INTO usuario_grupo (usuario_id, grupo_id) VALUES (10, 4);
INSERT INTO usuario_grupo (usuario_id, grupo_id) VALUES (11, 4);

INSERT INTO usuario_grupo (usuario_id, grupo_id) VALUES (12, 5);
INSERT INTO usuario_grupo (usuario_id, grupo_id) VALUES (13, 5);
INSERT INTO usuario_grupo (usuario_id, grupo_id) VALUES (14, 5);

INSERT INTO usuario_grupo (usuario_id, grupo_id) VALUES (15, 6);
INSERT INTO usuario_grupo (usuario_id, grupo_id) VALUES (16, 6);
INSERT INTO usuario_grupo (usuario_id, grupo_id) VALUES (17, 6);

INSERT INTO usuario_grupo (usuario_id, grupo_id) VALUES (18, 7);
INSERT INTO usuario_grupo (usuario_id, grupo_id) VALUES (19, 7);
INSERT INTO usuario_grupo (usuario_id, grupo_id) VALUES (20, 7);
INSERT INTO usuario_grupo (usuario_id, grupo_id) VALUES (21, 7);

INSERT INTO usuario_grupo (usuario_id, grupo_id) VALUES (18, 8);
INSERT INTO usuario_grupo (usuario_id, grupo_id) VALUES (22, 8);
INSERT INTO usuario_grupo (usuario_id, grupo_id) VALUES (23, 8);

INSERT INTO usuario_grupo (usuario_id, grupo_id) VALUES (24, 9);
INSERT INTO usuario_grupo (usuario_id, grupo_id) VALUES (25, 9);
INSERT INTO usuario_grupo (usuario_id, grupo_id) VALUES (26, 9);
INSERT INTO usuario_grupo (usuario_id, grupo_id) VALUES (27, 9);


INSERT INTO usuario_grupo (usuario_id, grupo_id) VALUES (28, 10);
INSERT INTO usuario_grupo (usuario_id, grupo_id) VALUES (29, 10);
INSERT INTO usuario_grupo (usuario_id, grupo_id) VALUES (30, 10);
INSERT INTO usuario_grupo (usuario_id, grupo_id) VALUES (31, 10);

-- CONSULTAS PROPOSTAS (3 ENTREGA) [SCRIPT SQL AINDA A SER ADICIONADO]

-- 1. Selecione o nome, saldo das três pessoas que não possuam a Vogal "A" mas que possuam a vogal "E" no nome e que possuem o maior saldo atual com o nome da tabela de retorno sendo "MAIORES APOSTADORES" e "RIQUEZA" (NOT, AND, LIKE, NOT LIKE, ORDER BY, LIMIT, ALIAS)
-- 2. Selecione o grupo comunidade onde a soma do saldo de todos os participantes seja maior que o resto. (SUM, GROUP BY, HAVING, Subselect, MAX, = (Igual), INNER JOIN)
-- 3. Selecione todas as comunidades que possuam pelo menos um participante cujo id seja diferente de 3 e retorne apenas aquelas em que o id do responsável é menor que 10 ou maior que 20. (<> (Diferente), OR, < (menor que), >(Maior que), Subselect, IN)
-- 4. Selecione o id da sessão de todos os log depositos que o id da sessão NÃO esteja entre 10 e 20 e que o valor depositado distinto seja maior ou igual que a média de todos os valores depositados (AVG, NOT BETWEEN, >= (maior ou igual), DISTINCT)
-- 5. Selecione os 5 ids de log depositos que estão entre 15 e 30 que não sejam 13, 15 e 16 que depositaram os menores valores se houver algum nulo, retorne ele tambem. (NOT IN, BETWEEN, IS NULL)
-- 6. Selecione o nome dos usuários e retorne o número total de depósitos feitos por esses usuários e o menor valor de aposta que eles já fizeram filtre o resultado para mostrar apenas os usuários cujo saldo_atual é menor ou igual a R$ 50,00 e cujo id não é nulo. (MIN, COUNT, <= (menor que), IS NOT NULL, Subselect, GROUP BY)
