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
INSERT INTO paciente(nome,cpf,dataNascimento,email,Logradouro,cel,numero,complemento,cidade,estado,cep)
VALUES ('Donald','91706452028','2006-02-09','Donald_@gmail.com','Evaristo da veiga','13971295788','11','Casa','Santos','SP','67898765')
 
INSERT INTO paciente(nome,cpf,dataNascimento,email,Logradouro,cel,numero,complemento,cidade,estado,cep)
VALUES ('Margarida','78940287300','2000-10-01','Margarida88@gmail.com','Rua das Flores','13981756834','21','apartamento','Sao Vicente','SP','56789287')
 
INSERT INTO paciente(nome,cpf,dataNascimento,email,Logradouro,cel,numero,complemento,cidade,estado,cep)
VALUES ('Patinhas','43318576084','1998-03-10','Pato@gmail.com','Nove de abril','13998937863','66','Casa','Santos','SP','67829034')
 
INSERT INTO paciente(nome,cpf,dataNascimento,email,Logradouro,cel,numero,complemento,cidade,estado,cep)
VALUES ('Huguinho','11549545017','2009-12-04','Hugo1@gmail.com','Rua quatro','13980262561','88','Apartamento','Cubatão','SP','28910239')
 
INSERT INTO paciente(nome,cpf,dataNascimento,email,Logradouro,cel,numero,complemento,cidade,estado,cep)
VALUES ('Luizinho','68510451095','2010-06-07','Luiz@gmail.com','Rua Moreira','13988665469','10','Apartamento','Praia Grande','SP','56782912')
 
INSERT INTO paciente(nome,cpf,dataNascimento,email,Logradouro,cel,numero,complemento,cidade,estado,cep)
VALUES ('Zezinho','73965509047','2005-08-06','zezinho@gmail.com','Rua da Cruz','32975649321','55','Casa','São João del Rei','MG','7890234')
 
INSERT INTO paciente(nome,cpf,dataNascimento,email,Logradouro,cel,numero,complemento,cidade,estado,cep)
VALUES ('Mickey','58884334039','1994-01-11','Mickey@gmail.com','Rua Boa Vista','21981142271','20','Apartamento','Rio de Janeiro','RJ','67289182')
 
INSERT INTO paciente(nome,cpf,dataNascimento,email,Logradouro,cel,numero,complemento,cidade,estado,cep)
VALUES ('Minie','30507409060','2001-05-07','Minie12@gmail.com','Rua 13 de maio','11972822392','23','Casa','São Paulo','SP','8920398')

);

INSERT INTO recepcionista(nomeRecepcionista,loginRecepcionista,senha,celular,cpf)
VALUES ('Chico Bento','chicobento.senaclin','chico001','13996020743','60539551082')
 
INSERT INTO recepcionista(nomeRecepcionista,loginRecepcionista,senha,celular,cpf)
VALUES ('Franjinha','franjinha.senaclin','7829012a','13987529725','21165291070')
 
INSERT INTO recepcionista(nomeRecepcionista,loginRecepcionista,senha,celular,cpf)
VALUES ('Cebolinha','cebolinha.senaclin','cebola92','13981228103','57908408095')

);

INSERT INTO medico(nome,crm,login,senha,idEspecialidade)
VALUES ('Pardal','765544SP','pardal_med.senaclin','892092','Cardiologista')

INSERT INTO medico(nome,crm,login,senha,idEspecialidade)
VALUES ('Mônica','768880SP','monica_med.senaclin','890316','Ortopedista')

INSERT INTO medico(nome,crm,login,senha,idEspecialidade)
VALUES ('Zé Carioca','165544RJ','zeca_med.senaclin','789402','Clínico Geral')

INSERT INTO medico(nome,crm,login,senha,idEspecialidade)
VALUES ('Magali','265544SP','magali_med.senaclin','3892037','Gastroenterologista')

INSERT INTO medico(nome,crm,login,senha,idEspecialidade)
VALUES ('Horácio','365544MG','horacio_med.senaclin','384902','Otorrinolaringologista')
 
);
UPDATE Paciente
SET logradouro = 'Avenida Paulista, 123, ap 45'
WHERE nome = 'Minie';

);
UPDATE Paciente
SET cel = '21987654321'
WHERE nome = 'Mickey';

);
SELECT dataHoraConsulta
FROM Consulta
ORDER BY dataHoraConsulta ASC;
); 
SELECT *
FROM medico;
); 
SELECT DISTINCT cidade
FROM Paciente
ORDER BY cidade ASC;
); 
SELECT nome, cel, email
FROM Paciente
ORDER BY nome ASC;
);
UPDATE Medico
SET crm = '765544SP'
WHERE nome = 'Pardal';

