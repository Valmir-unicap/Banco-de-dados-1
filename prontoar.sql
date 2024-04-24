-- criação das tabelas
CREATE DATABASE prontoar;
USE prontoar;

-- unidade_saude
CREATE TABLE unidade_saude (

id INT AUTO_INCREMENT PRIMARY KEY,

cnpj VARCHAR(14) NOT NULL,
tipo_unidade ENUM('clinica', 'hospital', 'consultorio') NOT NULL
);

-- endereco
CREATE TABLE endereco (

id INT AUTO_INCREMENT PRIMARY KEY,
bairro VARCHAR(50) NOT NULL,
cep VARCHAR(10) NOT NULL,
cidade VARCHAR(50) NOT NULL,
numero VARCHAR(6) NOT NULL,
complemento VARCHAR(100) 
);

-- prontuario
CREATE TABLE prontuario (

id INT AUTO_INCREMENT PRIMARY KEY,        
temperatura FLOAT(10) NOT NULL,
queixas TEXT NOT NULL,
prescicoes TEXT NOT NULL,
pressao_arterial FLOAT(10) NOT NULL,
ocorrencias TEXT NOT NULL,
portador_deficiencia ENUM('sim','nao'),
estado_clinico ENUM('grave', 'estavel', 'normal'),
portador_doenca_transmissivel ENUM('sim','nao')
);


-- administrador
CREATE TABLE administrador(

id INT AUTO_INCREMENT PRIMARY KEY,
login VARCHAR(50) NOT NULL,
senha VARCHAR(50) NOT NULL,
cargo VARCHAR(50) NOT NULL,
salario DECIMAL(5,2) NOT NULL,
contato VARCHAR(15) NOT NULL,
id_endereco INT(11) NOT NULL,

CONSTRAINT fk_id_endereco FOREIGN KEY (id_endereco) REFERENCES
endereco(id)
);

-- paciente
CREATE TABLE paciente (

id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
idade INT(3) NOT NULL,
sexo ENUM('M', 'F', 'Outro') NOT NULL,
login VARCHAR(50) NOT NULL,
senha VARCHAR(50) NOT NULL,
cpf VARCHAR(15) NOT NULL UNIQUE,
id_endereco INT(11) NOT NULL,
CONSTRAINT fk_id_endereco_2 FOREIGN KEY (id_endereco) REFERENCES
endereco(id),
id_administrador INT(11) NOT NULL,
CONSTRAINT fk_id_administrador FOREIGN KEY (id_administrador)
REFERENCES administrador(id)
);

-- medico
CREATE TABLE medico(

id INT AUTO_INCREMENT PRIMARY KEY,
crm VARCHAR(8) NOT NULL,
login VARCHAR(50) NOT NULL,
senha VARCHAR(50) NOT NULL,
nome VARCHAR(255) NOT NULL,
idade INT(3) NOT NULL,
contato VARCHAR(15) NOT NULL,
cargo VARCHAR(50) NOT NULL,
salario DECIMAL(5,2) NOT NULL,
id_endereco INT(11) NOT NULL,
CONSTRAINT fk_id_endereco3 FOREIGN KEY (id_endereco) REFERENCES
endereco(id),
id_administrador INT(11) NOT NULL,
CONSTRAINT fk_id_administrador2 FOREIGN KEY (id_administrador)
REFERENCES administrador(id)
);

-- consulta
CREATE TABLE consulta (
id INT AUTO_INCREMENT PRIMARY KEY,
data_consulta DATETIME NOT NULL,
id_paciente INT(11) NOT NULL,
CONSTRAINT fk_id_paciente FOREIGN KEY (id_paciente) REFERENCES
paciente(id),
id_medico INT(11) NOT NULL,
CONSTRAINT fk_id_medico FOREIGN KEY (id_medico) REFERENCES
medico(id),
id_prontuario INT(11) NOT NULL,
CONSTRAINT fk_id_prontuario_2 FOREIGN KEY (id_prontuario)
REFERENCES prontuario(id)
);

-- unidade_promove_consulta
CREATE TABLE unidade_promove_consulta(

id_unidade_saude INT(11) NOT NULL,
CONSTRAINT fk_id_unidade_saude FOREIGN KEY (id_unidade_saude)
REFERENCES unidade_saude(id),
id_consulta INT(11) NOT NULL,
CONSTRAINT fk_id_consulta FOREIGN KEY (id_consulta)
REFERENCES consulta(id)
);

-- admin_utiliza_unidade
CREATE TABLE admin_utiliza_unidade (
id INT AUTO_INCREMENT PRIMARY KEY,
id_administrador INT(11) NOT NULL,
CONSTRAINT fk_id_administrador_3 FOREIGN KEY
(id_administrador) REFERENCES administrador(id),
id_unidade INT(11) NOT NULL,
CONSTRAINT fk_id_unidade_2 FOREIGN KEY
(id_unidade) REFERENCES unidade_saude(id)
);

-- paciente_utiliza_unidade
CREATE TABLE paciente_utiliza_unidade(
id INT AUTO_INCREMENT PRIMARY KEY,
id_paciente INT(11) NOT NULL,
CONSTRAINT fk_id_paciente_2 FOREIGN KEY
(id_paciente) REFERENCES paciente(id),
id_unidade INT(11) NOT NULL,
CONSTRAINT fk_id_unidade_3 FOREIGN KEY
(id_unidade) REFERENCES unidade_saude(id)
);

-- medico_utiliza_unidade
CREATE TABLE medico_utiliza_unidade(
id INT AUTO_INCREMENT PRIMARY KEY,
id_medico INT(11) NOT NULL,
CONSTRAINT fk_id_medico_2 FOREIGN KEY (id_medico) REFERENCES
medico(id),
id_unidade INT(11) NOT NULL,
CONSTRAINT fk_unidade_saude_2 FOREIGN KEY (id_unidade)
REFERENCES unidade_saude(id)
);

-- Inserção dos dados no Prontoar

-- 10-Endereço

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES( 'Vila Mariana', '04117-091', 'São Paulo', '1234', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Botafogo', '22250-040', 'Rio de Janeiro', '567', 'Apto. 501');

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Savassi', '30130-170', 'Belo Horizonte', '999', 'Sala 302');

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Trindade', '88036-001', 'Florianópolis', '456', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Asa Norte', '70760-700', 'Brasília', '1111', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Moinhos de Vento', '90570-050', 'Porto Alegre', '789', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Batel', '80420-000', 'Curitiba', '246', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Barra', '40140-130', 'Salvador', '555', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Cambuí', '13024-003', 'Campinas', '987', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Aldeota', '60150-160', 'Fortaleza', '432', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Setor Bueno', '74223-030', 'Goiânia', '567', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Boa Viagem', '51021-060', 'Recife', '345', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Lourdes', '30140-093', 'Belo Horizonte', '123', 'Apto. 405');

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Bom Fim', '90035-003', 'Porto Alegre', '234', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Jardim Paulista', '01425-001', 'São Paulo', '678', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Centro Cívico', '80530-010', 'Curitiba', '901', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Barra', '40140-110', 'Salvador', '234', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Asa Norte', '70800-200', 'Brasília', '456', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Trindade', '88040-970', 'Florianópolis', '789', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Pina', '51010-390', 'Recife', '567', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES( 'Vila Mariana', '04117-091', 'São Paulo', '456', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Botafogo', '22250-040', 'Rio de Janeiro', '5672', 'Apto. 501');

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Savassi', '30130-170', 'Belo Horizonte', '111', 'Sala 302');

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Trindade', '88036-001', 'Florianópolis', '445', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Asa Norte', '70760-700', 'Brasília', '389', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Moinhos de Vento', '90570-050', 'Porto Alegre', '689', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Batel', '80420-000', 'Curitiba', '223', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Barra', '40140-130', 'Salvador', '535', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Cambuí', '13024-003', 'Campinas', '9567', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Aldeota', '60150-160', 'Fortaleza', '423', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Setor Bueno', '74223-030', 'Goiânia', '566', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Boa Viagem', '51021-060', 'Recife', '398', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Lourdes', '30140-093', 'Belo Horizonte', '673', 'Apto. 405');

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Bom Fim', '90035-003', 'Porto Alegre', '3434', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Jardim Paulista', '01425-001', 'São Paulo', '658', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Centro Cívico', '80530-010', 'Curitiba', '921', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Barra', '40140-110', 'Salvador', '2454', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Asa Norte', '70800-200', 'Brasília', '126', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Trindade', '88040-970', 'Florianópolis', '129', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Pina', '51010-390', 'Recife', '557', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Lourdes', '30140-093', 'Belo Horizonte', '123', 'Apto. 405');

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Bom Fim', '90035-003', 'Porto Alegre', '12', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Jardim Paulista', '01425-001', 'São Paulo', '165', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Centro Cívico', '80530-010', 'Curitiba', '1235', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Barra', '40140-110', 'Salvador', '2324', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Asa Norte', '70800-200', 'Brasília', '1256', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Trindade', '88040-970', 'Florianópolis', '3129', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Pina', '51010-390', 'Recife', '55', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Pina', '53010-394', 'Recife', '545', NULL);

INSERT INTO endereco(bairro, cep, cidade, numero, complemento) VALUES('Iputinga', '51110-890', 'Recife', '490', NULL);

-- 8-administrador

INSERT INTO administrador ( login, senha, cargo, salario, contato, id_endereco) VALUES ('alan01@prontoar', 'alan2568', 'recepcionista', 2.568, 81111111111, 1);

INSERT INTO administrador ( login, senha, cargo, salario, contato, id_endereco) VALUES ( 'bianca02@prontoar', 'bianca965', 'faxineira', 5.568, 81222222222, 1);

INSERT INTO administrador (login, senha, cargo, salario, contato, id_endereco) VALUES ('carla03@prontoar', 'carlaabonita2568', 'contabilidade', 6.518, 81333333333, 1);

INSERT INTO administrador (login, senha, cargo, salario, contato, id_endereco) VALUES ( 'domitila04@prontoar', 'miss2569', 'recepcionista', 2.568, 81444444444, 1);

INSERT INTO administrador ( login, senha, cargo, salario, contato, id_endereco) VALUES ( 'eduardo05@prontoar', 'edu2568', 'segurança', 3.568, 81555555555, 1);

INSERT INTO administrador ( login, senha, cargo, salario, contato, id_endereco) VALUES ( 'felipe06@prontoar', 'fe5847', 'supervisor', 3.951, 81666666666, 1);

INSERT INTO administrador (login, senha, cargo, salario, contato, id_endereco) VALUES ( 'gilberto07@prontoar', 'gilbert36251', 'contabilidade', 6.568, 81777777777, 1);

INSERT INTO administrador (login, senha, cargo, salario, contato, id_endereco) VALUES ('henrique08@prontoar', 'henri6314', 'contabilidade', 6.568, 81888888888, 1);

INSERT INTO administrador (login, senha, cargo, salario, contato, id_endereco) VALUES ( 'ingrid09@prontoar', 'poxaingrid9584', 'supervisora', 2.568, 81999999999, 1);

INSERT INTO administrador ( login, senha, cargo, salario, contato, id_endereco) VALUES ( 'João10@prontoar', 'jo569', 'fisioterapeuta', 3.288, 81210101010, 1);

INSERT INTO administrador (login, senha, cargo, salario, contato, id_endereco) VALUES ( 'Leandro11@prontoar', 'leo147,psicologo', 'fisioterapeuta' ,9.715, 81101010101, 1);

INSERT INTO administrador ( login, senha, cargo, salario, contato, id_endereco) VALUES ( 'marcelo12@prontoar', 'marcelojunior6598', 'supervisor', 2.169, 8112121212, 1);

INSERT INTO administrador ( login, senha, cargo, salario, contato, id_endereco) VALUES ( 'natanael13@prontoar', 'natal2828', 'psicologo', 6.794, 81213131313, 1);

INSERT INTO administrador (login, senha, cargo, salario, contato, id_endereco) VALUES ( 'otavio14@prontoar', 'otavio6589', 'pediatra', 5.149, 81314141414, 1);

INSERT INTO administrador (login, senha, cargo, salario, contato, id_endereco) VALUES ( 'paulo15@prontoar', 'paulo9632', 'otorrino', 3.984, 81415151515, 1);

INSERT INTO administrador (login, senha, cargo, salario, contato, id_endereco) VALUES ( 'queiros16@prontoar', 'queiros14789', 'recpcionista', 2.932, 81516161616, 1);

INSERT INTO administrador (login, senha, cargo, salario, contato, id_endereco) VALUES ( 'renata17@prontoar', 'renata2132', 'psicóloga', 3.164, 81617171717, 1);

INSERT INTO administrador (login, senha, cargo, salario, contato, id_endereco) VALUES ('santos18@prontoar', 'santos2121', 'fisioterapeuta', 5.188, 81718181818, 1);

INSERT INTO administrador ( login, senha, cargo, salario, contato, id_endereco) VALUES ( 'thiago19@prontoar', 'thiago1236', 'massoterapeuta', 4.963, 81819191919, 1);

INSERT INTO administrador (login, senha, cargo, salario, contato, id_endereco) VALUES ( 'valesca20@prontoar', 'val741', 'recpcionista', 2.958, 81920202020, 1);

INSERT INTO administrador (login, senha, cargo, salario, contato, id_endereco) VALUES ( 'xande21@prontoar', 'xandao789', 'serviços gerais', 3.789, 81121212121, 1);

INSERT INTO administrador (login, senha, cargo, salario, contato, id_endereco) VALUES ( 'zelda22@prontoar', 'zeldamelo6957', 'secretaria', 5.968, 81222222222, 1);

INSERT INTO administrador (login, senha, cargo, salario, contato, id_endereco) VALUES ('antonio23@prontoar', 'antonio963', 'psiquiatra' ,35.368, 81023232323, 1);

INSERT INTO administrador (login, senha, cargo, salario, contato, id_endereco) VALUES ( 'bernardo24@prontoar', 'bernardo147', 'otorrino', 5.753, 81324242424, 1);

INSERT INTO administrador (login, senha, cargo, salario, contato, id_endereco) VALUES ( 'caio25@prontoar', 'caio357', 'recpcionista', 2.368, 81425252525, 1);

INSERT INTO administrador (login, senha, cargo, salario, contato, id_endereco) VALUES ( 'danilo26@prontoar', 'danilo159', 'contabilidade', 6.568, 81526262626, 1);

INSERT INTO administrador (login, senha, cargo, salario, contato, id_endereco) VALUES ( 'erika27@prontoar', 'erika965', 'psicóloga', 5.568, 81627272727, 1);

INSERT INTO administrador (login, senha, cargo, salario, contato, id_endereco) VALUES ( 'fernanda28@prontoar', 'fernanda2568', 'contabilidade', 6.518, 81728282828, 1);

INSERT INTO administrador (login, senha, cargo, salario, contato, id_endereco) VALUES ( 'gilvonte29@prontoar', 'gil9592', 'secretaria', 4.568, 81829292929, 1);

INSERT INTO administrador (login, senha, cargo, salario, contato, id_endereco) VALUES ( 'helena30@prontoar', 'helena149', 'fisioterapeuta', 5.568, 81930303030, 1);

INSERT INTO administrador (login, senha, cargo, salario, contato, id_endereco) VALUES ( 'italo31@prontoar', 'italo126', 'supervisor', 3.951, 81031313131, 1);

INSERT INTO administrador ( login, senha, cargo, salario, contato, id_endereco) VALUES ( 'joana32@prontoar', 'joana9627', 'contabilidade', 6.568, 81132323232, 1);

INSERT INTO administrador ( login, senha, cargo, salario, contato, id_endereco) VALUES ( 'lucas33@prontoar', 'lucas6314', 'secretário', 7.695, 81233333333, 1);

INSERT INTO administrador ( login, senha, cargo, salario, contato, id_endereco) VALUES ( 'matheus34@prontoar', 'matheus9584', 'psicologo', 2.568, 81334343434, 1);

INSERT INTO administrador ( login, senha, cargo, salario, contato, id_endereco) VALUES ( 'natalia35@prontoar', 'natalia569', 'fisioterapeuta', 4.288, 81435353535, 1);

INSERT INTO administrador ( login, senha, cargo, salario, contato, id_endereco) VALUES ( 'oto36@prontoar', 'oto187', 'serviço gerais', 4.715, 81536363636, 1);

INSERT INTO administrador ( login, senha, cargo, salario, contato, id_endereco) VALUES ( 'patricia37@prontoar', 'patricia5598', 'supervisor', 3.989, 81637373737, 1);

INSERT INTO administrador (login, senha, cargo, salario, contato, id_endereco) VALUES ( 'queila38@prontoar', 'queila3893', 'ottorino', 6.794, 81738383838, 1);

INSERT INTO administrador (login, senha, cargo, salario, contato, id_endereco) VALUES ('rubens39@prontoar', 'rubens3026', 'psiquiatra', 5.398, 81839393939, 1);

INSERT INTO administrador (login, senha, cargo, salario, contato, id_endereco) VALUES ( 'silva40@prontoar', 'silva5697', 'pediatra', 3.984, 81940404040, 1);

INSERT INTO administrador (login, senha, cargo, salario, contato, id_endereco) VALUES ( 'tatiana41@prontoar', 'tati954', 'recpcionista', 2.932, 81141414141, 1);

INSERT INTO administrador (login, senha, cargo, salario, contato, id_endereco) VALUES ( 'ulisses42@prontoar', 'ulisses2132', 'psicologo', 3.164, 81042424242, 1);

INSERT INTO administrador (login, senha, cargo, salario, contato, id_endereco) VALUES ('xamã43@prontoar', 'xama794', 'fisioterapeuta', 5.188, 81243434343, 1);

INSERT INTO administrador (login, senha, cargo, salario, contato, id_endereco) VALUES ( 'zenildo44@prontoar', 'zenildo1236', 'massoterapeuta', 4.963, 81344444444, 1);

INSERT INTO administrador (login, senha, cargo, salario, contato, id_endereco) VALUES ('adalberto45@prontoar', 'berto741', 'recpcionista', 2.958, 81445454545, 1);

INSERT INTO administrador ( login, senha, cargo, salario, contato, id_endereco) VALUES ( 'buarque46@prontoar', 'buarque789', 'serviços gerais', 3.789, 81546464646, 1);

INSERT INTO administrador (login, senha, cargo, salario, contato, id_endereco) VALUES ('cleiton47@prontoar', 'cleitonmelo6957', 'secretário', 5.968, 81647474747, 1);

INSERT INTO administrador (login, senha, cargo, salario, contato, id_endereco) VALUES ( 'debora48@prontoar', 'debora148', 'psiquiatra', 5.368, 81748484848, 1);

INSERT INTO administrador (login, senha, cargo, salario, contato, id_endereco) VALUES ( 'elida49@prontoar', 'elida324', 'psicólogo', 5.753, 81849494949, 1);

INSERT INTO administrador (login, senha, cargo, salario, contato, id_endereco) VALUES ( 'franklin50@prontoar', 'franklin963', 'massoterapeuta', 6.368, 81950505050, 1);

-- 11-Médico

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('63996', 'medico63996@exemplo.com', 'senha63996', 'Médico 1', '49', '81 988738982', 'Pediatra', '77.45', 1,  39);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('35854', 'medico35854@exemplo.com', 'senha35854', 'Médico 2', '53', '81 988734587', 'Dermatologista', '92.86', 2, 38);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('38819', 'medico38819@exemplo.com', 'senha38819', 'Médico 3', '34', '81 988732860', 'Cardiologista', '55.87', 3, 45);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('40801', 'medico40801@exemplo.com', 'senha40801', 'Médico 4', '46', '81 988739260', 'Psiquiatra', '78.03', 4, 19);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('83836', 'medico83836@exemplo.com', 'senha83836', 'Médico 5', '57', '81 988735220', 'Neurologista', '89.75', 5,  36);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('51102', 'medico51102@exemplo.com', 'senha51102', 'Médico 6', '30', '81 988739865', 'Cardiologista', '83.20', 6, 18);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('40208', 'medico40208@exemplo.com', 'senha40208', 'Médico 7', '55', '81 988738206', 'Pediatra', '79.77', 7, 7);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('84415', 'medico84415@exemplo.com', 'senha84415', 'Médico 8', '45', '81 988736468', 'Oftalmologista', '79.02', 8,  2);
INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('58879', 'medico58879@exemplo.com', 'senha58879', 'Médico 9', '29', '81 988738774', 'Clínico Geral', '55.80', 9, 19);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('19483', 'medico19483@exemplo.com', 'senha19483', 'Médico 10', '30', '81 988733187', 'Cardiologista', '79.96', 10, 5);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('47735', 'medico47735@exemplo.com', 'senha47735', 'Médico 11', '33', '81 988731510', 'Dermatologista', '92.20', 11, 17);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('60730', 'medico60730@exemplo.com', 'senha60730', 'Médico 12', '27', '81 988732013', 'Pediatra', '92.51', 12, 6);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('55656', 'medico55656@exemplo.com', 'senha55656', 'Médico 13', '64', '81 988735788', 'Dermatologista', '94.77', 13, 39);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('97614', 'medico97614@exemplo.com', 'senha97614', 'Médico 14', '51', '81 988731153', 'Neurologista', '83.33', 14,  13);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('71939', 'medico71939@exemplo.com', 'senha71939', 'Médico 15', '47', '81 988738942', 'Ortopedista', '73.60', 15, 9);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('96764', 'medico96764@exemplo.com', 'senha96764', 'Médico 16', '35', '81 988735035', 'Neurologista', '92.51', 16, 30);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador,  id_endereco) 
            VALUES ('97041', 'medico97041@exemplo.com', 'senha97041', 'Médico 17', '34', '81 988731641', 'Neurologista', '63.74', 17, 10);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('73824', 'medico73824@exemplo.com', 'senha73824', 'Médico 18', '31', '81 988735480', 'Psiquiatra', '76.79', 18, 49);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('21285', 'medico21285@exemplo.com', 'senha21285', 'Médico 19', '55', '81 988732491', 'Dermatologista', '86.83', 19, 23);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('90512', 'medico90512@exemplo.com', 'senha90512', 'Médico 20', '27', '81 988738787', 'Ortopedista', '67.23', 20, 9);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('78807', 'medico78807@exemplo.com', 'senha78807', 'Médico 21', '30', '81 988738268', 'Ortopedista', '88.24', 21, 45);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('44920', 'medico44920@exemplo.com', 'senha44920', 'Médico 22', '36', '81 988737325', 'Ginecologista', '70.97', 22, 46);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('80583', 'medico80583@exemplo.com', 'senha80583', 'Médico 23', '40', '81 988735016', 'Cardiologista', '76.38', 23, 4);
INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('67137', 'medico67137@exemplo.com', 'senha67137', 'Médico 24', '40', '81 988736878', 'Neurologista', '53.20', 24, 41);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('53180', 'medico53180@exemplo.com', 'senha53180', 'Médico 25', '58', '81 988739983', 'Neurologista', '58.19', 25, 25);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('83203', 'medico83203@exemplo.com', 'senha83203', 'Médico 26', '39', '81 988734957', 'Neurologista', '74.01', 26, 32);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('51860', 'medico51860@exemplo.com', 'senha51860', 'Médico 27', '52', '81 988733219', 'Clínico Geral', '54.71', 27, 12);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('60533', 'medico60533@exemplo.com', 'senha60533', 'Médico 28', '56', '81 988733047', 'Endocrinologista', '98.95', 28, 23);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('24446', 'medico24446@exemplo.com', 'senha24446', 'Médico 29', '25', '81 988736026', 'Ortopedista', '67.46', 29, 22);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('76604', 'medico76604@exemplo.com', 'senha76604', 'Médico 30', '63', '81 988736262', 'Ortopedista', '99.35', 30, 45);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('14786', 'medico14786@exemplo.com', 'senha14786', 'Médico 31', '46', '81 988732268', 'Ginecologista', '89.63', 31, 14);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('32629', 'medico32629@exemplo.com', 'senha32629', 'Médico 32', '31', '81 988733625', 'Endocrinologista', '59.84', 32, 12);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('64775', 'medico64775@exemplo.com', 'senha64775', 'Médico 33', '33', '81 988732155', 'Psiquiatra', '59.98', 33, 43);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('34806', 'medico34806@exemplo.com', 'senha34806', 'Médico 34', '59', '81 988735243', 'Dermatologista', '91.24', 34, 49);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('64925', 'medico64925@exemplo.com', 'senha64925', 'Médico 35', '51', '81 988734850', 'Ortopedista', '68.85', 35, 17);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('23011', 'medico23011@exemplo.com', 'senha23011', 'Médico 36', '50', '81 988733087', 'Pediatra', '91.68', 36, 43);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('77090', 'medico77090@exemplo.com', 'senha77090', 'Médico 37', '63', '81 988738550', 'Ortopedista', '66.92', 37, 24);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('83892', 'medico83892@exemplo.com', 'senha83892', 'Médico 38', '54', '81 988739293', 'Psiquiatra', '87.24', 38, 38);
INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('10787', 'medico10787@exemplo.com', 'senha10787', 'Médico 39', '50', '81 988735461', 'Oftalmologista', '74.21', 39, 35);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('79157', 'medico79157@exemplo.com', 'senha79157', 'Médico 40', '40', '81 988736672', 'Dermatologista', '70.39', 40, 35);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('33551', 'medico33551@exemplo.com', 'senha33551', 'Médico 41', '51', '81 988734341', 'Ortopedista', '51.09', 41, 7);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
          VALUES ('30641', 'medico30641@exemplo.com', 'senha30641', 'Médico 42', '36', '81 988732120', 'Cardiologista', '59.38', 42, 25);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('85345', 'medico85345@exemplo.com', 'senha85345', 'Médico 43', '26', '81 988734256', 'Ortopedista', '56.46', 43, 35);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('64422', 'medico64422@exemplo.com', 'senha64422', 'Médico 44', '25', '81 988735286', 'Dermatologista', '76.92', 44, 35);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('37814', 'medico37814@exemplo.com', 'senha37814', 'Médico 45', '47', '81 988738738', 'Pediatra', '86.70', 45, 11);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('53196', 'medico53196@exemplo.com', 'senha53196', 'Médico 46', '65', '81 988733906', 'Oftalmologista', '54.21', 46, 24);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('23654', 'medico23654@exemplo.com', 'senha23654', 'Médico 47', '43', '81 988734377', 'Ortopedista', '54.04', 47, 10);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('16768', 'medico16768@exemplo.com', 'senha16768', 'Médico 48', '36', '81 988732393', 'Dermatologista', '61.31', 48, 42);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('66701', 'medico66701@exemplo.com', 'senha66701', 'Médico 49', '50', '81 988732355', 'Cardiologista', '72.49', 49, 42);

INSERT INTO medico (crm, login, senha, nome, idade, contato, cargo, salario, id_administrador, id_endereco) 
            VALUES ('95928', 'medico95928@exemplo.com', 'senha95928', 'Médico 50', '53', '81 988736660', 'Dermatologista', '67.88', 50, 26);


-- 1-Paciente

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('617.483.421-26', 'Daniel', 'M', 45, 'daniel1@prontoar', 'daniel123', 1, 1);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('185.327.555-77', 'Daniela', 'F', 46, 'daniela2@prontoar', 'daniela123', 2, 2);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('266.106.441-95', 'Mario', 'M', 26, 'mario3@prontoar', 'mario123', 3, 3);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('477.761.457-34', 'Fábio', 'M', 33, 'fabio4@prontoar', 'fabio123', 4, 4);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('857.739.753-00', 'Moisés', 'M', 8, 'moises5@prontoar', 'moises123', 5, 5);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('111.215.448-51', 'Thomás', 'M', 19, 'thomas6@prontoar', 'thomas123', 6, 6);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('121.819.113-98', 'Vanessa', 'F', 24, 'vanessa7@prontoar', 'vanessa123', 7, 7);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('210.398.175-80', 'Fabiana', 'F', 28, 'fabiana8@prontoar', 'fabiana123', 8, 8);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('847.384.583-88', 'Joelma', 'F', 40, 'joelma9@prontoar', 'joelma123', 9, 9);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('405.838.378-08', 'Marcos', 'M', 30, 'marcos10@prontoar', 'marcos123', 10, 10);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('452.869.330-50', 'João', 'M', 30, 'joao11@prontoar', 'joao123', 11, 11);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('014.598.481-87', 'Antônio', 'M', 15, 'antonio12@prontoar', 'antonio123', 12, 12);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('495.527.173-10', 'Letícia', 'F', 20, 'leticia13@prontoar', 'leticia123', 13, 13);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('617.457.142-43', 'Viola', 'F', 52, 'viola14@prontoar', 'viola123', 14, 14);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('684.291.911-86', 'Sabrina', 'F', 25, 'sabrina15@prontoar', 'sabrina123', 15, 15);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('876.478.834-29', 'Fernando', 'M', 25, 'fernando16@prontoar', 'fernando123', 16, 16);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('789.858.962-96', 'Facundo', 'M', 27, 'facundo17@prontoar', 'facundo123', 17, 17);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('364.678.890-96', 'Vagner', 'M', 38, 'vagner18@prontoar', 'vagner123', 18, 18);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('675.464.885-67', 'Luciano', 'M', 23, 'luciano19@prontoar', 'luciano123', 19, 19);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('598.088.655-93', 'Patrícia', 'F', 30, 'patricia20@prontoar', 'patricia123', 20, 20);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('818.096.842-18', 'Eduardo', 'M', 31, 'eduardo21@prontoar', 'eduardo123', 21, 21);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('324.600.648-29', 'Edina', 'F', 72, 'edina22@prontoar', 'edina123', 22, 22);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('474.928.425-46', 'Merida', 'F', 64, 'merida23@prontoar', 'merida123', 23, 23);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('701.237.549-33', 'Dalva', 'F', 80, 'dalva24@prontoar', 'dalva123', 24, 24);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('657.111.725-81', 'Gabriel', 'M', 30, 'Gabriel25@prontoar', 'gabriel123', 25, 25);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('756.233.428-50', 'Gabriela', 'F', 13, 'Gabriela26@prontoar', 'gabriela123', 26, 26);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('544.246.872-01', 'Maria', 'F', 24, 'maria27@prontoar', 'maria123', 27, 27);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('680.863.065-85', 'Davi', 'M', 4, 'davi28@prontoar', 'davi123', 28, 28);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('517.840.257-04', 'Miguel', 'M', 33, 'miguel29@prontoar', 'miguel123', 29, 29);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('316.092.987-64', 'Helena', 'F', 27, 'helena30@prontoar', 'helena123', 30, 30);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('135.852.085-25', 'Alice', 'F', 2, 'alice31@prontoar', 'alice123', 31, 31);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('331.759.738-09', 'Amanda', 'F', 20, 'amanda32@prontoar', 'amanda123', 32, 32);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('146.795.967-75', 'Sophia', 'F', 10, 'sophia33@prontoar', 'sophia123', 33, 33);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('344.489.783-97', 'Valentina', 'F', 12, 'valentina34@prontoar', 'valentina123', 34, 34);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('731.617.716-05', 'Valéria', 'F', 21, 'valeria35@prontoar', 'valeria123', 35, 35);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('066.778.755-04', 'Laura', 'F', 21, 'laura36@prontoar', 'laura123', 36, 36);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('233.754.854-68', 'Vanderson', 'M', 34, 'vanderson37@prontoar', 'vanderson123', 37, 37);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('043.412.161-47', 'Samuel', 'M', 9, 'samuel38@prontoar', 'samuel123', 38, 38);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('441.255.514-30', 'Samuca', 'M', 13, 'samuca39@prontoar', 'samuca123', 39, 39);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('181.626.604-37', 'Emma', 'F', 16, 'emma40@prontoar', 'emma123', 40, 40);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('863.631.588-34', 'Noah', 'M', 19, 'noah41@prontoar', 'noah123', 41, 41);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('032.142.689-45', 'Jacob', 'M', 25, 'jacob42@prontoar', 'jacob123', 42, 42);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('172.273.774-31', 'Olivia', 'F', 38, 'olivia43@prontoar', 'olivia123', 43, 43);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('411.446.646-08', 'Mércia', 'F', 62, 'merida44@prontoar', 'merida123', 44, 44);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('408.181.108-30', 'Francisco', 'M', 66, 'francisco45@prontoar', 'francisco123', 45, 45);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('661.748.432-03', 'Fernando', 'M', 66, 'fernando46@prontoar', 'fernando123', 46, 46);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('222.441.854-00', 'Fábio', 'M', 43, 'fabio47@prontoar', 'fabio123', 47, 47);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('682.867.132-57', 'Ava', 'F', 6, 'ava48@prontoar', 'ava123', 48, 48);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('675.123.868-18', 'Mia', 'F', 15, 'mia49@prontoar', 'mia123', 49, 49);

INSERT INTO paciente (cpf, nome, sexo, idade, login, senha, id_administrador, id_endereco) VALUES ('165.653.715-04', 'Emily', 'F', 26, 'emily50@prontoar', 'emily123', 50, 50);


-- 2-Prontuário

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES (36.5, 'Dor de cabeça', 'Paracetamol 1g 8/8 horas', 12.0, 'Nenhuma', 'nao', 'normal', 'nao');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES (37.5, 'Dores abdominais', 'Ibuprofeno 400mg', 12.8, 'Nenhum', 'não', 'grave', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES (36.9, 'Tosse seca', 'Polaramine 500mg', 13.8, 'Nenhum', 'não', 'estável', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES (37.8, 'Febre e dor de cabeça', 'Paracetamol 750mg', 11.7, 'Nenhum', 'não', 'grave', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES  (36.5, 'Dor de garganta', 'Amoxicilina 500mg', 12.0, 'Nenhum', 'não', 'normal', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES  (36.7, 'Dores no corpo', 'Ibuprofeno 400mg', 11.7, 'Nenhum', 'não', 'estável', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES  (38.0, 'Febre alta', 'Dipirona 500mg', '125x75', 'Nenhum', 'não', 'grave', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES (36.6, 'Dor de cabeça', 'Paracetamol 750mg', 12.8, 'Nenhum', 'não', 'normal', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES (37.2, 'Náuseas e vômitos', 'Ondansetrona 8mg',13.8, 'Nenhum', 'não', 'estável', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES   (36.8, 'Tontura e mal estar', 'Dipirona 500mg', 12.7, 'Nenhum', 'não', 'estável', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES  (37.3, 'Dor lombar', 'Dipirona 500mg', 12.8, 'Nenhum', 'não', 'normal', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES   (37.9, 'Diarreia', 'Hioscina 10mg', 12.7, 'Nenhum', 'não', 'estável', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES   (36.5, 'Coceira e irritação na pele', 'Hidrocortisona 1%', 11.7, 'Nenhum', 'não', 'estável', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES   (38.2, 'Tosse e coriza', 'Histamin', 13.8, 'Nenhum', 'não', 'grave', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES  (37.4, 'Dor de ouvido', 'Cerumin 8ml', 12.8, 'Nenhum', 'não', 'normal', 'não');



INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES (36.5, 'Dor de cabeça', 'Paracetamol 1g 8/8 horas', 11.0, 'Nenhuma', 'sim', 'normal', 'nao');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES (37.5, 'Dores abdominais', 'Ibuprofeno 400mg', 13.8, 'Nenhum', 'não', 'grave', 'sim');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES (36.9, 'Tosse seca', 'Polaramine 500mg', 12.8, 'Nenhum', 'sim', 'estável', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES (37.8, 'Febre e dor de cabeça', 'Paracetamol 750mg', 10.7, 'Nenhum', 'sim', 'grave', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES  (36.5, 'Dor de garganta', 'Amoxicilina 500mg', 12.0, 'Nenhum', 'não', 'grave', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES  (36.7, 'Dores no corpo', 'Ibuprofeno 400mg', 11.7, 'Nenhum', 'não', 'normal', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES  (38.0, 'Febre alta', 'Dipirona 500mg', 12.5, 'Nenhum', 'não', 'normal', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES (36.6, 'Dor de cabeça', 'Paracetamol 750mg', 12.8, 'Nenhum', 'não', 'gravel', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES (37.2, 'Náuseas e vômitos', 'Ondansetrona 8mg',13.8, 'Nenhum', 'não', 'grave', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES   (36.8, 'Tontura e mal estar', 'Dipirona 500mg', 12.7, 'Nenhum', 'não', 'normal', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES  (37.3, 'Dor lombar', 'Dipirona 500mg', 12.8, 'Nenhum', 'não', ’estavel’, 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES   (37.9, 'Diarreia', 'Hioscina 10mg', 12.7, 'Nenhum', 'não', 'normall', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES   (36.5, 'Coceira e irritação na pele', 'Hidrocortisona 1%', 11.7, 'Nenhum', 'não', 'grave', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES   (38.2, 'Tosse e coriza', 'Histamin', 13.8, 'Nenhum', 'não', 'normal', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES  (37.4, 'Dor de ouvido', 'Cerumin 8ml', 12.8, 'Nenhum', 'não', 'estavel', 'não');



INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES (36.5, 'Dor de cabeça', 'Paracetamol 1g 8/8 horas', 13.0, 'Nenhuma', 'nao', 'normal', 'nao');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES (37.5, 'Dores abdominais', 'Ibuprofeno 400mg', 14.8, 'Nenhum', 'não', 'grave', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES (36.9, 'Tosse seca', 'Polaramine 500mg', 15.8, 'Nenhum', 'não', 'estável', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES (37.8, 'Febre e dor de cabeça', 'Paracetamol 750mg', 13.7, 'Nenhum', 'não', 'grave', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES  (36.5, 'Dor de garganta', 'Amoxicilina 500mg', 14.0, 'Nenhum', 'não', 'normal', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES  (36.7, 'Dores no corpo', 'Ibuprofeno 400mg', 13.7, 'Nenhum', 'não', 'estável', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES  (38.0, 'Febre alta', 'Dipirona 500mg', 12.0, 'Nenhum', 'não', 'grave', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES (36.6, 'Dor de cabeça', 'Paracetamol 750mg', 10.8, 'Nenhum', 'não', 'normal', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES (37.2, 'Náuseas e vômitos', 'Ondansetrona 8mg',11.8, 'Nenhum', 'não', 'estável', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES   (36.8, 'Tontura e mal estar', 'Dipirona 500mg', 10.7, 'Nenhum', 'não', 'estável', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES  (37.3, 'Dor lombar', 'Dipirona 500mg', 10.8, 'Nenhum', 'não', 'normal', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES   (37.9, 'Diarreia', 'Hioscina 10mg', 10.7, 'Nenhum', 'não', 'estável', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES   (36.5, 'Coceira e irritação na pele', 'Hidrocortisona 1%', 12.7, 'Nenhum', 'não', 'estável', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES   (38.2, 'Tosse e coriza', 'Histamin', 14.8, 'Nenhum', 'não', 'grave', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES  (37.4, 'Dor de ouvido', 'Cerumin 8ml', 11.8, 'Nenhum', 'não', 'normal', 'não');



INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES  (36.3, 'Dor lombar', 'Dipirona 500mg', 10.8, 'Nenhum', 'não', 'normal', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES   (36.9, 'Diarreia', 'Hioscina 10mg', 10.7, 'Nenhum', 'sim', 'estável', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES   (34.5, 'Coceira e irritação na pele', 'Hidrocortisona 1%', 12.7, 'Nenhum', 'não', 'estável', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES   (37.2, 'Tosse e coriza', 'Histamin', 14.8, 'Nenhum', 'não', 'grave', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES  (36.4, 'Dor de ouvido', 'Cerumin 8ml', 11.8, 'Nenhum', 'não', 'normal', 'não');
INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES  (38.4, 'Dor de garganta', 'Cerumin 8ml', 11.8, 'Nenhum', 'não', 'normal', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES  (37.8, 'Dor de ouvido', 'Cerumin 8ml', 11.8, 'Nenhum', 'não', 'normal', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES  (36.4, 'Dor no joelho', 'Cerumin 8ml', 11.8, 'Nenhum', 'não', 'normal', 'não');

INSERT INTO prontuario (temperatura, queixas, prescicoes, pressao_arterial, ocorrencias, portador_deficiencia, estado_clinico, portador_doenca_transmissivel) VALUES  (39.0, 'Dor no peito', 'Cerumin 8ml', 11.8, 'Nenhum', 'não', 'normal', 'não');




-- 3-consulta

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) 
VALUES ('2023-05-02', 1, 1, 1);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-02', 2, 2, 2);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-03', 3, 3, 3);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-04', 4, 4, 4);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-05', 5, 5, 5);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-06', 6, 6, 6);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-07', 7, 7, 7);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-08', 8, 8, 8);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-09', 9, 9, 9);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-10', 10, 10, 10);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-11', 11, 11, 11);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-12', 12, 12, 12);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-13', 13, 13, 13);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-14', 14, 14, 14);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-15', 15, 15, 15);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-16', 16, 16, 16);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-17', 17, 17, 17);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-18', 18, 18, 18);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-19', 19, 19, 19);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-20', 20, 20, 20);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-21', 21, 21, 21);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-22', 22, 22, 22);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-23', 23, 23, 23);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-24', 24, 24, 24);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-25', 25, 25, 25);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-26', 26, 26, 26);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-27', 27, 27, 27);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-28', 28, 28, 28);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-06-30', 29, 29, 29);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-09-30', 30, 30, 30);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-02', 31, 31, 31);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-03', 32, 32, 32);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-04', 33, 33, 33);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-05', 34, 34, 34);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-06', 35, 35, 35);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-07', 36, 36, 36);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-08', 37, 37, 37);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-09', 38, 38, 38);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-10', 39, 39, 39);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-01', 40, 40, 40);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-03', 41, 41, 41);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-05', 42, 42, 42);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-07', 43, 43, 43);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-09', 44, 44, 44);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-11', 45, 45, 45);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-13', 46, 46, 46);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-15', 47, 47, 47);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-17', 48, 48, 48);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-19', 49, 49, 49);

INSERT INTO consulta (data_consulta, id_paciente, id_medico, id_prontuario) VALUES ('2023-05-21', 50, 50, 50);

-- 9-unidade_saude

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES ('11111111111111', 'clinica');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES  ('22222222222222', 'hospital');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES  ('33333333333333', 'consultorio');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES   ('44444444444444', 'clinica');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES   ('55555555555555', 'hospital');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES   ('66666666666666', 'consultorio');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES  ('77777777777777', 'clinica');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES  ('88888888888888', 'hospital');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES   ('99999999999999', 'consultorio');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES    ('00000000000000', 'clinica');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES   ('12121212121212', 'hospital');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES   ('23232323232323', 'consultorio');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES   ('34343434343434', 'clinica');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES    ('45454545454545', 'hospital');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES  ('56565656565656', 'consultorio');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES   ('67676767676767', 'clinica');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES  ('78787878787878', 'hospital');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES  ('89898989898989', 'consultorio');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES  ('90909090909090', 'clinica');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES   ('01010101010101', 'hospital');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES   ('11111111111112', 'consultorio');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES  ('22222222222223', 'clinica');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES  ('33333333333334', 'hospital');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES  ('44444444444445', 'consultorio');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES ('55555555555556', 'clinica');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES  ('66666666666667', 'hospital');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES   ('77777777777778', 'consultorio');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES  ('88888888888889', 'clinica');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES  ('99999999999990', 'hospital');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES  ('00000000000001', 'consultorio');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES  ('12121212121213', 'clinica');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES  ('23232323232324', 'hospital');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES  ('34343434343435', 'consultorio');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES  ('45454545454546', 'clinica');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES  ('56565656565657', 'hospital');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES  ('67676767676768', 'consultorio');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES  ('78787878787879', 'clinica');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES   ('89898989898980', 'hospital');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES  ('90909090909091', 'consultorio');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES  ('01010101010102', 'clinica');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES   ('11111111111114', 'hospital');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES  ('22222222222225', 'consultorio');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES  ('33333333333336', 'clinica');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES  ('44444444444447', 'hospital');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES   ('55555555555558', 'consultorio');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES  ('66666666666669', 'clinica');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES  ('77777777777770', 'hospital');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES  ('88888888888881', 'consultorio');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES  ('99999999999992', 'clinica');

INSERT INTO unidade_saude (cnpj, tipo_unidade)
VALUES  ('77777777777771', 'hospital');


-- 4-médico_utiliza_unidade

INSERT INTO medico_utiliza_unidade(id_medico, id_unidade) VALUES (1, 1);

INSERT INTO medico_utiliza_unidade(id_medico, id_unidade) VALUES (2, 2);  

INSERT INTO medico_utiliza_unidade (id_medico, id_unidade) VALUES (3, 3);

INSERT INTO medico_utiliza_unidade(id_medico, id_unidade) VALUES  (4, 4);

INSERT INTO medico_utiliza_unidade(id_medico, id_unidade) VALUES (5, 5);  

INSERT INTO medico_utiliza_unidade (id_medico, id_unidade) VALUES (6, 6);

INSERT INTO medico_utiliza_unidade(id_medico, id_unidade) VALUES  (7, 7);

INSERT INTO medico_utiliza_unidade(id_medico, id_unidade) VALUES (8, 8);  

INSERT INTO medico_utiliza_unidade (id_medico, id_unidade) VALUES (9, 9);

INSERT INTO medico_utiliza_unidade(id_medico, id_unidade) VALUES  (10, 10);

INSERT INTO medico_utiliza_unidade(id_medico, id_unidade) VALUES (11, 11);  

INSERT INTO medico_utiliza_unidade (id_medico, id_unidade) VALUES (12, 12);

INSERT INTO medico_utiliza_unidade(id_medico, id_unidade) VALUES  (13, 13);

INSERT INTO medico_utiliza_unidade(id_medico, id_unidade) VALUES (14, 14);  

INSERT INTO medico_utiliza_unidade (id_medico, id_unidade) VALUES (15, 15);

INSERT INTO medico_utiliza_unidade(id_medico, id_unidade) VALUES  (16, 16);

INSERT INTO medico_utiliza_unidade(id_medico, id_unidade) VALUES (17, 17);  

INSERT INTO medico_utiliza_unidade (id_medico, id_unidade) VALUES (18, 18);

INSERT INTO medico_utiliza_unidade(id_medico, id_unidade) VALUES  (19, 19);

INSERT INTO medico_utiliza_unidade(id_medico, id_unidade) VALUES (20, 20);  

INSERT INTO medico_utiliza_unidade (id_medico, id_unidade) VALUES (21, 21);

INSERT INTO medico_utiliza_unidade(id_medico, id_unidade) VALUES  (22, 22);

INSERT INTO medico_utiliza_unidade(id_medico, id_unidade) VALUES (23, 23);  

INSERT INTO medico_utiliza_unidade (id_medico, id_unidade) VALUES (24, 24);

INSERT INTO medico_utiliza_unidade(id_medico, id_unidade) VALUES  (25, 25);

INSERT INTO medico_utiliza_unidade(id_medico, id_unidade) VALUES (26, 16);  

INSERT INTO medico_utiliza_unidade (id_medico, id_unidade) VALUES (27, 27);

INSERT INTO medico_utiliza_unidade(id_medico, id_unidade) VALUES  (28, 28);

INSERT INTO medico_utiliza_unidade(id_medico, id_unidade) VALUES (29, 29);  

INSERT INTO medico_utiliza_unidade (id_medico, id_unidade) VALUES (30, 30);

INSERT INTO medico_utiliza_unidade(id_medico, id_unidade) VALUES  (31, 31);

INSERT INTO medico_utiliza_unidade(id_medico, id_unidade) VALUES (32, 32);  

INSERT INTO medico_utiliza_unidade (id_medico, id_unidade) VALUES (33, 33);

INSERT INTO medico_utiliza_unidade(id_medico, id_unidade) VALUES  (34, 34);

INSERT INTO medico_utiliza_unidade(id_medico, id_unidade) VALUES (35, 35);  

INSERT INTO medico_utiliza_unidade (id_medico, id_unidade) VALUES (36, 36);

INSERT INTO medico_utiliza_unidade(id_medico, id_unidade) VALUES  (37, 37);

INSERT INTO medico_utiliza_unidade(id_medico, id_unidade) VALUES (38, 38);  

INSERT INTO medico_utiliza_unidade (id_medico, id_unidade) VALUES (39, 39);

INSERT INTO medico_utiliza_unidade(id_medico, id_unidade) VALUES  (40, 40);

INSERT INTO medico_utiliza_unidade(id_medico, id_unidade) VALUES (41, 41);  

INSERT INTO medico_utiliza_unidade (id_medico, id_unidade) VALUES (42, 42);

INSERT INTO medico_utiliza_unidade(id_medico, id_unidade) VALUES  (43, 43);

INSERT INTO medico_utiliza_unidade(id_medico, id_unidade) VALUES (44, 44);  

INSERT INTO medico_utiliza_unidade (id_medico, id_unidade) VALUES (45, 45);

INSERT INTO medico_utiliza_unidade(id_medico, id_unidade) VALUES  (46, 46);

INSERT INTO medico_utiliza_unidade(id_medico, id_unidade) VALUES (47, 47);  

INSERT INTO medico_utiliza_unidade (id_medico, id_unidade) VALUES (48, 48);

INSERT INTO medico_utiliza_unidade(id_medico, id_unidade) VALUES  (49, 49);

INSERT INTO medico_utiliza_unidade(id_medico, id_unidade) VALUES (50, 50); 



-- 5-paciente_utiliza_unidade

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (10,10);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (7,7);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (14,14);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (12,12);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (5,5);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (9,9);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (27,27);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (18,18);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (4,4);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (13,13);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (29,29);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (27,27);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (14,14);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (19,19);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (23,23);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (25,25);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (14,14);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (15,15);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (17,17);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (21,21);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (35,35);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (36,36);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (39,39);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (3,3);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (16,16);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (22,22);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (40,40);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (18,18);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (48,48);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (26,26);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (7,7);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (27,27);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (24,24);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (55,55);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (30,30);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (29,29);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (32,32);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (45,45);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (28,28);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (36,36);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (1,1);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (34,34);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (10,10);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (48,48);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (50,50);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (17,17);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (39,39);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (4,4);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (22,22);

INSERT  INTO paciente_utiliza_unidade (id_paciente, id_unidade) VALUES (37,37);

-- 6-admin_utiliza_unidade

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (1, 1);


INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (2, 2);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (3, 3);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (4, 4);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (5, 5);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (6, 6);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (7, 7);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (8, 8);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (9, 9);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (10, 10);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (11, 11);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (12, 12);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (13, 13);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (14, 14);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (15, 15);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (16, 16);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (17, 17);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (18, 18);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (19, 19);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (20, 20);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (21, 21);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (22, 22);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (23, 23);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (24, 24);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (25, 25);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (26, 26);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (27, 27);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (28, 28);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (29, 29);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (30, 30);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (31, 31);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (32, 32);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (33, 33);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (34, 34);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (35, 35);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (36, 36);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (37, 37);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (38, 38);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (39, 39);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (40, 40);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (41, 41);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (42, 42);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (43, 43);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (44, 44);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (45, 45);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (46, 46);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (47, 47);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (48, 48);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (49, 49);

INSERT INTO admin_utiliza_unidade (id_administrador, id_unidade)
VALUES (50, 50);

-- 7-unidade_promove_consulta

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (1, 1);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (2, 2);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (3, 3);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (4, 4);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (5, 5);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (6, 6);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (7, 7);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (8, 8);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (9, 9);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (10, 10);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (11, 11);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (12, 12);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (13, 13);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (14, 14);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (15, 15);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (16, 16);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (17, 17);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (18, 18);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (19, 19);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (20, 20);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (21, 21);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (22, 22);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (23, 23);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (24, 24);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (25, 25);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (26, 26);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (27, 27);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (28, 28);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (29, 29);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (30, 30);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (31, 31);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (32, 32);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (33, 33);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (34, 34);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (35, 35);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (36, 36);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (37, 37);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (38, 38);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (39, 39);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (40, 40);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (41, 41);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (42, 42);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (43, 43);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (44, 44);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (45, 45);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (46, 46);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (47, 47);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (48, 48);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (49, 49);

INSERT INTO unidade_promove_consulta (id_unidade_saude, id_consulta)
VALUES (50, 50);
