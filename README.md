SHOW WARNINGS
CREATE TABLE paciente(
idPaciente int PRIMARY KEY NOT NULL ,
nome VARCHAR(50) NOT NULL,
cpf CHAR(11)  NOT NULL UNIQUE ,
cel CHAR(11) NOT NULL,
email VARCHAR(30) NULL ,
logradouro VARCHAR(30) NULL,
numero VARCHAR(6) NULL,
complemento VARCHAR(10) NULL,
cidade VARCHAR(20) NULL,
cep CHAR(8)NULL,
oberservacoes VARCHAR(100) NULL
);
 
CREATE TABLE recepcionista(
idRecepcionista INT NOT NULL PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE ,
login VARCHAR(20) NOT NULL UNIQUE ,
senha CHAR(6) NOT NULL,
celular CHAR(11) NULL
);
 
CREATE TABLE especialidade(
idEspecialidade INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nomeEspecialidade VARCHAR(30) NOT NULL
);

CREATE TABLE medico(
idMedico INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
IdEspecialidade INT NOT NULL,
nome VARCHAR(50) NOT NULL,
crm CHAR(8) NOT NULL,
login VARCHAR(20) NOT NULL,
senha CHAR(6) NOT NULL,
CONSTRAINT Fk_MedicoEspecialidade FOREIGN KEY(idEspecialidade)
REFERENCES especialidade(idEspecialidade)
);
CREATE TABLE consulta(
idConsulta INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
idPaciente INT NOT NULL,
idRecepcionista INT NOT NULL,
idMedico INT NOT NULL,
dataHoraConsulta DATETIME NOT NULL,
sintomas VARCHAR(200) NULL,
prescricao VARCHAR(200) NULL,
CONSTRAINT Fk_ConsultaPaciente FOREIGN KEY(idPaciente)
REFERENCES paciente(idPaciente),
CONSTRAINT Fk_ConsultaRecepcionista FOREIGN KEY(idRecepcionista)
REFERENCES recepcionista(idRecepcionista),
CONSTRAINT Fk_ConsultaMedico FOREIGN KEY(idMedico)
REFERENCES medico(idMedico)
);
CREATE TABLE exame(
idExame INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
idConsulta INT NOT NULL,
dataHoraExame DATETIME NOT NULL,
nomeExame VARCHAR(30) NOT NULL,
statusExame VARCHAR(10) NOT NULL,
resultado VARCHAR(200) NULL,
dataRetiradaExane DATETIME NULL,
dataPrevisaoEntrega DATETIME NULL,
CONSTRAINT Fk_exameconsulta FOREIGN KEY(idConsulta)
REFERENCES consulta(idConsulta)
);
 
ALTER TABLE paciente
ADD estado CHAR(2) NOT NULL;
SHOW TABLES
 
SELECT * FROM paciente
SELECT * FROM recepcionista
SELECT * FROM especialidade
SELECT * FROM medico
SELECT * FROM consulta
SELECT * FROM exame
 
/*questão 1-Inserir de forma implícita 8 pacientes*/
INSERT INTO paciente
VALUES (1,'Donald','12345678901','98872773211' ,'donaldduck@gmail.com','rua luiz cunha','123','ap2','Santos','87654321','rua perigosa', 'SP'),
    (2,'Margarida','09876543212','988728808' ,'margarida@gmail.com','rua morgan cunha','321','ap3','São Vicente','12345678','rua segura', 'SP'),
    (3,'Patinhas','54637281901 ','988704605' ,'	patinhas@gmail.com','rua pedro cunha','222','ap4','Santos','22187635','', 'SP'),
    (4,'Huguinho','98735102811' ,' 83209864571','huguinho@gmail,com','rua don pedro','111','ap5','Cubatão','09872144','' ,'SP'),
    (5,'Luizinho','03761528391 ',' 92823716273','luizinho@gmail,com','rua macaco prego','333','ap6','Praia Grande','99999999','', 'SP'),
    (6,'Zezinho',' 93726615229',' 8372716382','zezinho@gmail.com','rua bras cubas','342','ap7','São João del Rei','09182771','', 'MG'),
    (7,'Mickey','12334455667 ','827193936541 ','mickey@gmail.com','rua jeffrey ','444','ap8','Rio de Janeiro','32919999','', 'RJ'),
    (8,'Minie','00998877665 ','8273621823931 ','minie@gmail.com','casa da minie','555','','São Paulo','01112333','', 'SP');
 
/*questão 2-Inserir de forma explícita 3 recepcionistas*/
INSERT INTO recepcionista (idRecepcionista, nome, cpf, login, senha, celular)
VALUES 
(1, 'Chico Bento', '11111111111', 'chicobento.senaclin', '123456', '99999999999'),
(2, 'Franjinha', '22222222222', 'franjinha.senaclin', '123456', '11111111111'),
(3, 'Cebolinha', '33333333333', 'cebolinha.senaclin', '123456', '88888888888');
 
/*questão 3-Inserir de forma explícita 5 especialidades.
Para facilitar, utilize a forma reduzida para realizar vários inserts de uma única
vez, como visto em nossos encontros.*/
INSERT INTO especialidade (nomeEspecialidade)
VALUES 
('Cardiologista'),
('Otorrinolaringologista'),
('Clínico Geral'),
('Gastroenterologista'),
('Ortopedista');
 
/*questão 4-Inserir de forma implícita 5 médicos*/
INSERT INTO medico (IdEspecialidade, nome, crm, login, senha)
VALUES 
(1, 'Pardal', '765544SP', 'pardal_med.senaclin', '123456'),
(5, 'Mônica', '768880SP', 'monica_med.senaclin', '123456'),
(3, 'Zé Carioca', '165544RJ', 'zeca_med.senaclin', '123456'),
(4, 'Magali', '265544SP', 'magali_med.senaclin', '123456'),
(2, 'Horácio', '365544MG', 'horacio_med.senaclin', '123456');
 
/*questão 5- Inserir de forma explícita uma consulta para cada médico
Dados conforme abaixo, demais dados livres. Atenção para colocar
datas de consultas posteriores a data de hoje.*/
INSERT INTO consulta (idPaciente, idRecepcionista, idMedico, dataHoraConsulta, sintomas, prescricao)
VALUES 
(1, 1, 1, '2024-06-25 10:00:00', 'Febre', 'Repouso'),
(2, 1, 2, '2024-06-26 11:00:00', 'Dor no joelho', 'Anti-inflamatório'),
(3, 1, 3, '2024-06-27 12:00:00', 'Dor abdominal', 'Exames'),
(7, 2, 4, '2024-06-28 13:00:00', 'Dor de estômago', 'Dieta'),
(8, 2, 5, '2024-06-29 14:00:00', 'Dor de ouvido', 'Medicação');
 
/*questão 6-Inserir mais duas consultas ao Patinhas
Dados conforme abaixo, demais dados livres. Atenção para colocar
datas de consultas posteriores a data de hoje.*/
INSERT INTO consulta (idPaciente, idRecepcionista, idMedico, dataHoraConsulta, sintomas, prescricao)
VALUES 
(3, 1, 1, '2024-06-30 15:00:00', 'Dor no peito', 'Eletrocardiograma'),
(3, 1, 2, '2024-07-01 16:00:00', 'Dor nas costas', 'Raio-X coluna');
 
/*questão 7-.Inserir um exame para cada consulta do Patinhas criada no item anterior (6)*/
INSERT INTO exame (idConsulta, dataHoraExame, nomeExame, statusExame)
VALUES 
(3, '2024-06-30 15:30:00', 'Eletrocardiograma', 'Pendente'),
(5, '2024-07-01 16:30:00', 'Raio-X Coluna', 'Pendente');
 
/*questão 8-Remarcar (Atualizar) a consulta do Donald para a mesma data porém, 2hs mais tarde.*/
UPDATE consulta
SET dataHoraConsulta = DATE_ADD(dataHoraConsulta, INTERVAL 2 HOUR)
WHERE idConsulta = 1;
 
/*questão 9-A Minie mudou de endereço mas não mudou de cidade (logradouro, numero e
complemento). Realize a alteração dos dados.*/
UPDATE paciente
SET logradouro = 'nova rua', numero = '456', complemento = 'ap10'
WHERE nome = 'Minie';
 
/*questão 10-O Mickey mudou o celular, realize a alteração.*/
UPDATE paciente
SET cel = '999888777'
WHERE nome = 'Mickey';
 
/*questão 11-O Patinhas não poderá comparecer na consulta com o Ze Carioca. Realize a exclusão da
mesma no sistema. Foi possível? Justifique.*/
DELETE FROM consulta
WHERE idPaciente = 3 AND idMedico = 3;
/*motivo do erro*/
/*Esta operação pode falhar devido a uma restrição de chave estrangeira. A consulta do Patinhas com Zé Carioca pode estar referenciada em outras tabelas (por exemplo, na tabela exame através da chave estrangeira idConsulta). Antes de excluir, seria necessário remover as dependências nesses registros relacionados*/
 
/*questão 12-Realize a exclusão da Dr Mônica da tabela Medico. Foi possível? Justifique.*/
DELETE FROM medico
WHERE nome = 'Mônica';
/*Não é possível excluir a médica Mônica diretamente devido a restrições de chave estrangeira. Ela pode estar associada a consultas na tabela consulta ou a exames na tabela exame. Para excluir, primeiro seria necessário remover todas as dependências relacionadas a ela nessas tabelas.*/
 
/*questão 13-Exibir a data de todas as consultas em ordem cronológica, da que está mais próxima para a
que está mais longe.*/
SELECT dataHoraConsulta
FROM consulta
ORDER BY dataHoraConsulta;
 
/*questão 14-Exibir todos os dados da tabela médico.*/
SELECT * FROM medico;
 
/*questão 15-Exibir apenas as cidades em que a clínica possui pacientes, em ordem alfabética.*/
SELECT DISTINCT cidade
FROM paciente
ORDER BY cidade;
 
/*questão 16-Exibir nome, celular e e-mail de todos os pacientes da clínica, em ordem alfabética.*/
SELECT nome, cel, email
FROM paciente
ORDER BY nome;
 
/*questão 17-Atualizar apenas o CRM do Dr.Pardal que foi cadastrado errado no sistema.*/
UPDATE medico
SET crm = '765544SP'
WHERE nome = 'Pardal';
 
/*questão 18-Resetar a senha de todos os médicos do sistema para o padrão "DOCTOR".*/
UPDATE medico
SET senha = 'DOCTOR';
 
/*questão 19-Exibir apenas o nome do médico e seu CRM, dos médicos registrados em SP, tudo isto em
ordem alfabética.*/
SELECT nome, crm
FROM medico
WHERE crm LIKE '%SP%'
ORDER BY nome;
 
/*questão 20-Exibir nome e celular de todos os pacientes que vivem em Santos e possuem nome
iniciando com a letra P.*/
SELECT nome, cel
FROM paciente
WHERE cidade = 'Santos' AND nome LIKE 'P%'
ORDER BY nome;
 
 
/*desafio- Exibir o nome, logradouro, numero e cidade de todos os pacientes que moram em
casa, em ordem alfabética.*/
SELECT nome, logradouro, numero, cidade
FROM paciente
WHERE logradouro LIKE '%casa%'
ORDER BY nome;
 
/*Buscar nome do médico, nome da especialidade, e crm de todos os médicos cuja especialidade 
seja “Cardiologista”*/
SELECT nome,idEspecialidade, crm
FROM medico
WHERE idEspecialidade LIKE '%Cardiologista'

/*Buscar quantos pacientes a clínica possui por cidade*/
SELECT cidade, COUNT(*) AS num_pacientes
FROM paciente
GROUP BY cidade;
 
/*Buscar a data de todas as consultas, nome do médico e o nome do paciente, em ordem 
cronológica*/
SELECT dataHoraConsulta, idmedico, idpaciente 
FROM consulta
ORDER BY dataHoraConsulta;

 
/*Buscar o nome do paciente, celular, email, e a data da consulta de todos os pacientes com 
consulta marcada, desde que vivam em Santos*/
SELECT p.nome, p.cel, p.email, c.dataHoraConsulta
 FROM paciente p JOIN consulta c ON p.idPaciente = c.idPaciente 
 WHERE p.cidade = 'Santos';


 
/*Buscar todos os pacientes que tenham com a letra "P" no nome*/
SELECT nome
FROM paciente 
WHERE nome LIKE 'P%'
 
/*Buscar o nome do médico, a data da consulta, o nome do paciente e a especialidade do médico 
de todas as consultas de determinado dia (escolhido por você), em ordem alfabética.*/
SELECT m.nome AS nome_medico, c.dataHoraConsulta, p.nome AS nome_paciente, e.nomeEspecialidade AS especialidade
FROM consulta c
JOIN medico m ON c.idMedico = m.idMedico
JOIN paciente p ON c.idPaciente = p.idPaciente
JOIN especialidade e ON m.IdEspecialidade = e.idEspecialidade
WHERE DATE(c.dataHoraConsulta) = '2024-06-30'
ORDER BY m.nome;


/*Buscar o nome dos médicos e sua especialidade, apenas dos médicos com CRM de SP*/
SELECT nome,idEspecialidade,crm
FROM medico 
WHERE crm LIKE '%SP'

/*Buscar a data da consulta que está mais longe na clínica*/
SELECT MAX(dataHoraConsulta) AS data_mais_longe
FROM consulta;

/*Buscar quantos médicos a clínica possui por especialidade*/
SELECT especialidade, COUNT(*) 
AS quantidade_medicos FROM medico
GROUP BY especialidade;

/*Buscar o nome, celular e email de todos os pacientes que começam com a letra “D” em ordem 
alfabética*/
SELECT nome,cel,email
FROM paciente 
WHERE nome LIKE '%D'
ORDER BY nome;

/*Buscar todos os exames, bem como quem foi o médico que solicitou e a data do exame, em 
ordem cronológica (por DATA) */
SELECT e.nome_exame, m.nome_medico, e.data_exame FROM exames e JOIN medicos m ON e.id_medico = m.id_medico ORDER BY e.data_exame;

 /*Buscar o nome do médico, o crm e a data da consulta, de todos os médicos, ainda que não 
possuam consultas  */
SELECT m.nome, m.crm, c.dataHoraConsulta 
FROM medico m 
LEFT JOIN consulta c ON m.idMedico = c.idMedico;


/*Buscar o nome de todos os pacientes, celular, email e data da consulta em ordem alfabética. 
Trazer os pacientes ainda que não possuam consultas */

SELECT p.nome, p.cel, p.email, c.dataHoraConsulta
FROM paciente p
LEFT JOIN consulta c ON p.idPaciente = c.idPaciente
ORDER BY p.nome;

/*Buscar o nome de todos os pacientes, logradouro, número e complemento apenas dos 
moradores que moram em São Paulo, em ordem alfabética */
SELECT nome, logradouro, numero, complemento
FROM paciente
WHERE cidade = 'São Paulo'
ORDER BY nome;

/* Buscar a data de todas as consultas, o nome do recepcionista que marcou, o nome do
paciente, o nome do médico, a especialidade do médico e o celular do paciente em ordem
cronológica invertida.*/

SELECT c.dataHoraConsulta, rec.nome AS nome_recepcionista, p.nome AS nome_paciente, m.nome AS nome_medico, e.nomeEspecialidade AS especialidade_medico, p.cel AS celular_paciente
FROM consulta c
JOIN recepcionista rec ON c.idRecepcionista = rec.idRecepcionista
JOIN paciente p ON c.idPaciente = p.idPaciente
JOIN medico m ON c.idMedico = m.idMedico
JOIN especialidade e ON m.IdEspecialidade = e.idEspecialidade
ORDER BY c.dataHoraConsulta DESC;

/*Relatório a) - Quantas consultas cada médico realizou na clínica:*/
SELECT m.nome AS nome_medico, COUNT(c.idConsulta) AS num_consultas
FROM medico m
LEFT JOIN consulta c ON m.idMedico = c.idMedico
GROUP BY m.nome;

/*Relatório b) - Quantas consultas foram realizadas por especialidade:*/
SELECT e.nomeEspecialidade AS especialidade_medico, COUNT(c.idConsulta) AS num_consultas
FROM consulta c
JOIN medico m ON c.idMedico = m.idMedico
JOIN especialidade e ON m.IdEspecialidade = e.idEspecialidade
GROUP BY e.nomeEspecialidade;
