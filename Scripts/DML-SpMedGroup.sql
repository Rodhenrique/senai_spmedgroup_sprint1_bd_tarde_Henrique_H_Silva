--USANDO A TABELA 
 USE SpMedGroup;

 --INSERIDO DADOS DO TipoUsuario
INSERT INTO TipoUsuario(Titulo)
VALUES('Cliente'),
('Medico'),
('Administrador');

--INSERIDO DADOS DA Situacao
INSERT INTO Situacao(Titulo)
VALUES('Agendada'),
('Cancelada'),
('Realizada');


--INSERIDO DADOS DA Especialidade

INSERT INTO Especialidade(Titulo)
VALUES('Pediatria'),
('Psiquiatria'),
('Urologia'),
('Cardiologia'),
('Cirurgia geral'),
('Cirurgia plástica'),
('Medico geral'),
('Dermatologia'),
('Otorrinolaringologia');

--INSERIDO DADOS DA Instituicao
INSERT INTO Instituicao(NomeFantasia,CNPJ,HorarioAbertura,HorarioFechamento,RazaoSocial,Endereco)
VALUES('SpMedGroup','1234567891012','8:00:00','20:00:00','grupo medico.Ltda','Alameda Barão de Limeria,539');

--INSERIDO DADOS DOS MEDICOS 
INSERT INTO Medico(Nome,Senha,Email,Telefone,Endereco,IdTipoUsuario,IdEspecialidade)
VALUES('paulo lucas oliveira','paulo123','oliveira@gmail.com','11-2651-5782','rua passos dourados,2422',2,5),
('pedro alves cabral','pedro123','cabral@gmail.com','11-2121-3232','rua eldorado,222',2,4),
('veronica alves rattin','veronica123','veronica@gmail.com','11-2431-3432','rua catalon,422',2,9),
('sueli cardoso cabral','sueli123','sueli@gmail.com','11-5521-3652','rua passos do oeste,622',2,1),
('carmen alves madri','carmen123','carmen@gmail.com','11-2541-3652','rua caçador,922',2,2),
('carlão soares silva','carlao123','carlao@gmail.com','11-2565-3345','rua zona dois,122',2,7);

--INSERIDO DADOS DOS Usuarios 
INSERT INTO Usuario(Nome,DataNascimento,Telefone,CPF,RG,Email,Senha,Endereco,IdTipoUsuario)
VALUES('Administrador','01/01/0001','12-3233-3233','00000-0','000000-x','admin@admin.com','admin123','não informando',3),
('maria do doria','02/04/2002','12-3343-8873','3232343','434343-x','maria@gmail.com','maria123','rua da doriana',1),
('joao da lapa','07/09/1990','12-5453-3893','33828232','334343-x','joao@gmail.com','joao123','av.da lapa',1),
('pedro borda sol','12/04/1988','12-3273-9833','3324345','3236565-x','pedro@gmail.com','pedro123','av barão do fuzil',1),
('zelo mario silva','05/03/2001','12-3433-3233','34343','9584545-x','zelo@gmail.com','zelo123','rua do estiligue',1);

--INSERIDO DADOS DAS CONSULTAS 
INSERT INTO Consulta(Descricao,DataDaConsulta,IdUsuario, IdMedico,IdSituacao,IdInstituicao)
VALUES('sem nada','29/01/2016 12:30:00',1,2,1,1),
('foi bom essa consulta','21/01/2020 12:30:00',2,2,1,1),
('jogou minecraft consulta toda','30/01/2016 12:30:00',3,4,2,1),
('quase jogou fogo em mim','14/03/2019 12:30:00',4,5,3,1),
('hoje acordei','10/01/2012 12:30:00',5,6,3,1);

