SE novaclin
SHOW TABLES
 
CREATE TABLE recepcionista(
idRecepcionista INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nomeRecepcionista VARCHAR(50) NOT NULL,
loginRecepcionista VARCHAR(20) NOT NULL,
senha CHAR(6) NOT NULL,
celular CHAR(11)  NULL,
cpf CHAR(11) NOT NULL
);
CREATE TABLE paciente(
idPaciente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
cel CHAR(11) NOT NULL,
dataNascimento DATETIME NOT NULL,
email VARCHAR(50) NULL,
logradouro VARCHAR (30) NOT NULL,
numero VARCHAR(6) NOT NULL,
complemento VARCHAR(10) NULL,
cidade VARCHAR(20) NOT NULL,
cep CHAR(8) NULL,
observações VARCHAR(100)
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
senha CHAR(6) NOT NULL

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
statusExame VARCHAR(10) NOT NULL,consultaconsulta
resultado VARCHAR(200) NULL,
dataRetiradaExane DATETIME NULL,
dataPrevisaoEntrega DATETIME NULL,
CONSTRAINT Fk_exameconsulta FOREIGN KEY(idConsulta)
REFERENCES consulta(idConsulta)
);

ALTER TABLE recepcionista 
ADD loginRecepcionista VARCHAR(20) NOT NULL;

ALTER TABLE paciente 
ADD estado CHAR(2) NOT NULL;

);

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

/*Atividade 3 /*

/*1- Buscar nome do médico, nome da especialidade, e crm de todos os médicos cuja especialidade seja “Cardiologista”*/
SELECT m.nome AS nome_medico, e.nomeEspecialidade AS especialidade, m.crm
FROM medico m
JOIN especialidade e ON m.IdEspecialidade = e.idEspecialidade
WHERE e.nomeEspecialidade = 'Cardiologista';

/*2- Buscar quantos pacientes a clínica possui por cidade.*/
SELECT cidade, COUNT(*) AS num_pacientes
FROM paciente
GROUP BY cidade;

/*3- Buscar a data de todas as consultas, nome do médico e o nome do paciente, em ordem cronológica.*/
SELECT c.dataHoraConsulta, m.nome AS nome_medico, p.nome AS nome_paciente
FROM consulta c
JOIN medico m ON c.idMedico = m.idMedico
JOIN paciente p ON c.idPaciente = p.idPaciente
ORDER BY c.dataHoraConsulta;

/*4- Buscar o nome do paciente, celular, email, e a data da consulta de todos os pacientes com consulta marcada, desde que vivam em Santos.*/

SELECT p.nome, p.cel, p.email, c.dataHoraConsulta
FROM paciente p
JOIN consulta c ON p.idPaciente = c.idPaciente
WHERE p.cidade = 'Santos';

/*5- Buscar todos os pacientes que tenham com a letra "P" no nome. */
SELECT *
FROM paciente
WHERE nome LIKE '%P%';

/*6- Buscar o nome do médico, a data da consulta, o nome do paciente e a especialidade do médico de todas as consultas de determinado dia (escolhido por você), em ordem alfabética.*/
SELECT m.nome AS nome_medico, c.dataHoraConsulta, p.nome AS nome_paciente, e.nomeEspecialidade AS especialidade
FROM consulta c
JOIN medico m ON c.idMedico = m.idMedico
JOIN paciente p ON c.idPaciente = p.idPaciente
JOIN especialidade e ON m.IdEspecialidade = e.idEspecialidade
WHERE DATE(c.dataHoraConsulta) = '2024-06-30'
ORDER BY m.nome;

/*7- Buscar o nome dos médicos e sua especialidade, apenas dos médicos com CRM de SP.*/

SELECT m.nome AS nome_medico, e.nomeEspecialidade AS especialidade
FROM medico m
JOIN especialidade e ON m.IdEspecialidade = e.idEspecialidade
WHERE m.crm LIKE '%SP%';


/*8- Buscar a data da consulta que está mais longe na clínica. */

SELECT MAX(dataHoraConsulta) AS data_mais_longe
FROM consulta;

/*9- Buscar quantos médicos a clínica possui por especialidade.*/

SELECT e.nomeEspecialidade AS especialidade, COUNT(*) AS num_medicos
FROM medico m
JOIN especialidade e ON m.IdEspecialidade = e.idEspecialidade
GROUP BY e.nomeEspecialidade;


/*10- Buscar o nome, celular e email de todos os pacientes que começam com a letra “D” em ordem alfabética.*/

SELECT nome, cel, email
FROM paciente
WHERE nome LIKE 'D%'
ORDER BY nome;

/*11- Buscar todos os exames, bem como quem foi o médico que solicitou e a data do exame, em ordem cronológica (por data). */

SELECT e.nomeExame, m.nome AS medico_solicitante, ex.dataHoraExame
FROM exame ex
JOIN consulta c ON ex.idConsulta = c.idConsulta
JOIN medico m ON c.idMedico = m.idMedico
JOIN especialidade e ON m.IdEspecialidade = e.idEspecialidade
ORDER BY ex.dataHoraExame;

/*12- Buscar o nome do médico, o crm e a data da consulta, de todos os médicos, ainda que não possuam consultas.*/

SELECT m.nome AS nome_medico, m.crm, c.dataHoraConsulta
FROM medico m
LEFT JOIN consulta c ON m.idMedico = c.idMedico
ORDER BY m.nome;

/*13-Buscar o nome de todos os pacientes, celular, email e data da consulta em ordem alfabética. Trazer os pacientes ainda que não possuam consultas.*/

SELECT p.nome, p.cel, p.email, c.dataHoraConsulta
FROM paciente p
LEFT JOIN consulta c ON p.idPaciente = c.idPaciente
ORDER BY p.nome;

/*14- Buscar o nome de todos os pacientes, logradouro, número e complemento apenas dos moradores que moram em São Paulo, em ordem alfabética.*/

SELECT nome, logradouro, numero, complemento
FROM paciente
WHERE cidade = 'São Paulo'
ORDER BY nome;

/*15- Buscar a data de todas as consultas, o nome do recepcionista que marcou, o nome do
paciente, o nome do médico, a especialidade do médico e o celular do paciente em ordem
cronológica invertida.*/

SELECT c.dataHoraConsulta, rec.nome AS nome_recepcionista, p.nome AS nome_paciente, m.nome AS nome_medico, e.nomeEspecialidade AS especialidade_medico, p.cel AS celular_paciente
FROM consulta c
JOIN recepcionista rec ON c.idRecepcionista = rec.idRecepcionista
JOIN paciente p ON c.idPaciente = p.idPaciente
JOIN medico m ON c.idMedico = m.idMedico
JOIN especialidade e ON m.IdEspecialidade = e.idEspecialidade
ORDER BY c.dataHoraConsulta DESC;

/*Desafio - É possível realizar? Justifique:*/
/*Sim,Ela envolve múltiplas junções (joins) entre várias tabelas (consulta, recepcionista, paciente, medico e especialidade), 
onde os relacionamentos são bem definidos através de chaves estrangeiras. A ordenação é feita de forma decrescente pela coluna dataHoraConsulta.*/

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

            /*Atividade 4*/

/*1- Criar uma view que traga nome e contatos (telefones e pacientes) em ordem alfabética: */

CREATE VIEW vw_nome_contatos AS
SELECT nome, cpf AS telefone, cel AS celular
FROM paciente
ORDER BY nome;
SELECT * FROM vw_nome_contatos;
DROP VIEW vw_nome_contatos;

/*2- Criar uma view que traga a quantidade de consultas arupadas por especialidade:*/
CREATE VIEW vw_qtde_consultas_por_especialidade AS
SELECT e.nomeEspecialidade AS especialidade, COUNT(c.idConsulta) AS quantidade_consultas
FROM consulta c
JOIN medico m ON c.idMedico = m.idMedico
JOIN especialidade e ON m.IdEspecialidade = e.idEspecialidade
GROUP BY e.nomeEspecialidade;

SELECT * FROM vw_qtde_consultas_por_especialidade;

/*3- Criar uma procedure que permita saber quantos médicos possuímos por especialidade:*/

CREATE PROCEDURE sp_quantidade_medicos_por_especialidade(IN nomeEspecialidade VARCHAR(30))
    SELECT COUNT(*) AS quantidade_medicos
    FROM medico m
    JOIN especialidade e ON m.IdEspecialidade = e.idEspecialidade
    WHERE e.nomeEspecialidade = nomeEspecialidade;


CALL sp_quantidade_medicos_por_especialidade('Cardiologista');

/*4- Criar uma procedure para resetar todas as senhas dos médicos para DOCTOR:*/
CREATE PROCEDURE sp_resetar_senhas_medicos()
    UPDATE medico
    SET senha = 'DOCTOR';

CALL sp_resetar_senhas_medicos();

SELECT * FROM medico

/*5- Criar uma procedure para alterar as informações de paciente:*/
CREATE PROCEDURE puAlterarInfoPaciente(
    IN p_nome VARCHAR(50),
    IN p_logradouro VARCHAR(30),
    IN p_numero VARCHAR(6),
    IN p_complemento VARCHAR(10),
    IN p_cidade VARCHAR(20),
    IN p_cpf CHAR(11)
)

    UPDATE paciente
    SET logradouro = p_logradouro,
        numero = p_numero,
        complemento = p_complemento,
        cidade = p_cidade
    WHERE cpf = p_cpf AND nome = p_nome;

CALL puAlterarInfoPaciente('Minie', 'nova rua', '456', 'ap10', 'São Paulo', '00998877665');

SELECT * FROM paciente 

/* Atualizar Donald */
UPDATE paciente
SET nome = 'Donald',
    cpf = '12345678901',
    cel = '98872773211',
    email = 'donaldduck@gmail.com',
    logradouro = 'rua luiz cunha',
    numero = '123',
    complemento = 'ap2',
    cidade = 'Santos',
    cep = '87654321',
    oberservacoes = 'rua perigosa',
    estado = 'SP'
WHERE idPaciente = 1;

/* Atualizar Margarida */
UPDATE paciente
SET nome = 'Margarida',
    cpf = '09876543212',
    cel = '988728808',
    email = 'margarida@gmail.com',
    logradouro = 'rua morgan cunha',
    numero = '321',
    complemento = 'ap3',
    cidade = 'São Vicente',
    cep = '12345678',
    oberservacoes = 'rua segura',
    estado = 'SP'
WHERE idPaciente = 2;

/* Atualizar Patinhas */
UPDATE paciente
SET nome = 'Patinhas',
    cpf = '54637281901',
    cel = '988704605',
    email = 'patinhas@gmail.com',
    logradouro = 'rua pedro cunha',
    numero = '222',
    complemento = 'ap4',
    cidade = 'Santos',
    cep = '22187635',
    oberservacoes = '',
    estado = 'SP'
WHERE idPaciente = 3;

/* Atualizar Huguinho */
UPDATE paciente
SET nome = 'Huguinho',
    cpf = '98735102811',
    cel = '83209864571',
    email = 'huguinho@gmail,com',
    logradouro = 'rua don pedro',
    numero = '111',
    complemento = 'ap5',
    cidade = 'Cubatão',
    cep = '09872144',
    oberservacoes = '',
    estado = 'SP'
WHERE idPaciente = 4;

/* Atualizar Luizinho */
UPDATE paciente
SET nome = 'Luizinho',
    cpf = '03761528391',
    cel = '92823716273',
    email = 'luizinho@gmail,com',
    logradouro = 'rua macaco prego',
    numero = '333',
    complemento = 'ap6',
    cidade = 'Praia Grande',
    cep = '99999999',
    oberservacoes = '',
    estado = 'SP'
WHERE idPaciente = 5;

/* Atualizar Zezinho */
UPDATE paciente
SET nome = 'Zezinho',
    cpf = '93726615229',
    cel = '8372716382',
    email = 'zezinho@gmail.com',
    logradouro = 'rua bras cubas',
    numero = '342',
    complemento = 'ap7',
    cidade = 'São João del Rei',
    cep = '09182771',
    oberservacoes = '',
    estado = 'MG'
WHERE idPaciente = 6;

/* Atualizar Mickey */
UPDATE paciente
SET nome = 'Mickey',
    cpf = '12334455667',
    cel = '827193936541',
    email = 'mickey@gmail.com',
    logradouro = 'rua jeffrey',
    numero = '444',
    complemento = 'ap8',
    cidade = 'Rio de Janeiro',
    cep = '32919999',
    oberservacoes = '',
    estado = 'RJ'
WHERE idPaciente = 7;

/* Atualizar Minie */
UPDATE paciente
SET nome = 'Minie',
    cpf = '00998877665',
    cel = '8273621823931',
    email = 'minie@gmail.com',
    logradouro = 'casa da minie',
    numero = '555',
    complemento = '',
    cidade = 'São Paulo',
    cep = '01112333',
    oberservacoes = '',
    estado = 'SP'
WHERE idPaciente = 8;

/*6- Criar uma procedure para inserir uma consulta na clínica.*/
CREATE PROCEDURE piInserirConslta(
    IN p_idPaciente INT,
    IN p_idRecepcionista INT,
    IN p_idMedico INT,
    IN p_dataHoraConsulta DATETIME,
    IN p_sintomas VARCHAR(200),
    IN p_prescricao VARCHAR(200)
)
    INSERT INTO consulta (idPaciente, idRecepcionista, idMedico, dataHoraConsulta, sintomas, prescricao)
    VALUES (p_idPaciente, p_idRecepcionista, p_idMedico, p_dataHoraConsulta, p_sintomas, p_prescricao);

CALL piInserirConslta(3, 1, 1, '2024-06-30 15:00:00', 'Dor no peito', 'Eletrocardiograma');
CALL piInserirConslta(3, 1, 2, '2024-07-01 16:00:00', 'Dor nas costas', 'Raio-X coluna');

SELECT * FROM consulta

/*7-Criar uma procedure para excluir um exame do sistema. (Obs - Sabemos que na prática
deveremos utilizar a exclusão lógica). */
CREATE PROCEDURE pd_DelExame(
    IN p_idExame INT
)
    DELETE FROM exame
    WHERE idExame = p_idExame;

CALL pd_DelExame(3); /*ID do exame a ser deletado é 3*/
SELECT * FROM exame

/*8- Criar uma procedure que liste a data da consulta e o nome do paciente de acordo com
o nome do médico. Aqui, listaremos a agenda do médico. Execute a procedure. */

CREATE PROCEDURE ps_AgendaMedico(
    IN p_nomeMedico VARCHAR(50)
)

    SELECT c.dataHoraConsulta, p.nome AS nome_paciente
    FROM consulta c
    JOIN medico m ON c.idMedico = m.idMedico
    JOIN paciente p ON c.idPaciente = p.idPaciente
    WHERE m.nome = p_nomeMedico
    ORDER BY c.dataHoraConsulta;

CALL ps_AgendaMedico ('Zé Carioca');

/*9- Criar um mecanismo para trazer a quantidade de médicos que a clínica possui por
especialidade. Execute o mecanismo.*/

CREATE PROCEDURE ps_MedicoEspecialidade()
    SELECT e.nomeEspecialidade AS especialidade, COUNT(*) AS quantidade_medicos
    FROM medico m
    JOIN especialidade e ON m.IdEspecialidade = e.idEspecialidade
    GROUP BY e.nomeEspecialidade;
CALL ps_MedicoEspecialidade ();

/*10-Criar uma procedure que liste a data da consulta, o celular do paciente e a
especialidade da consulta de acordo com o nome do paciente informado, mas em
ordem cronológica. Neste caso estaremos verificando todas as consultas do paciente. */

CREATE PROCEDURE ps_pacienteEspecialidadeConsulta(
    IN p_nomePaciente VARCHAR(50)
)
    SELECT c.dataHoraConsulta, p.cel AS celular_paciente, e.nomeEspecialidade AS especialidade
    FROM consulta c
    JOIN medico m ON c.idMedico = m.idMedico
    JOIN paciente p ON c.idPaciente = p.idPaciente
    JOIN especialidade e ON m.IdEspecialidade = e.idEspecialidade
    WHERE p.nome = p_nomePaciente
    ORDER BY c.dataHoraConsulta;

CALL ps_pacienteEspecialidadeConsulta('Minie');

/*desafio- Criar uma procedure que sirva para atualizar a data de uma consulta. A procedure
deve receber ID da consulta e a data e hora para a qual queremos trocar.*/

CREATE PROCEDURE pu_alterarDataConsulta(
    IN p_idConsulta INT,
    IN p_newDateTime DATETIME
)
    UPDATE consulta
    SET dataHoraConsulta = p_newDateTime
    WHERE idConsulta = p_idConsulta;

CALL pu_alterarDataConsulta (1, '2024-06-25 12:00:00'); 
SELECT * FROM consulta