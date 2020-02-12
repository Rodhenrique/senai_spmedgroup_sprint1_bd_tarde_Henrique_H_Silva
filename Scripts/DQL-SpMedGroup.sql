--USANDO O BANCO DE DADOS

USE SpMedGroup;


SELECT * FROM Usuario;
SELECT * FROM TipoUsuario;
SELECT * FROM Consulta;
SELECT * FROM Especialidade;
SELECT * FROM Medico;
SELECT * FROM Instituicao;

--USANDO O INNER JOIN PARA VINCULAR AS TABELAS 

--vincular a tabela de prontuário com a de consultas

SELECT Usuario.Nome,DataDaConsulta,CPF,RG
FROM Consulta
INNER JOIN Usuario ON Usuario.IdUsuario = Consulta.IdUsuario
WHERE Usuario.IdTipoUsuario = 1;

--vincular a tabela de prontuários com a de consultas e médicos

SELECT Usuario.Nome as Paciente,Usuario.Telefone,DataDaConsulta,CPF,RG,Medico.Nome as NomeDoMedico
FROM Consulta
INNER JOIN Usuario ON Usuario.IdUsuario = Consulta.IdUsuario
INNER JOIN Medico ON Medico.IdMedico = Consulta.IdMedico
WHERE Usuario.IdTipoUsuario = 1;

--vincular a tabela de médicos com a tabela de especialidades

SELECT Nome,Email,Telefone,Especialidade.Titulo
FROM Medico
INNER JOIN Especialidade ON Medico.IdEspecialidade = Especialidade.IdEspecialidade;

--vincular a tabela de médicos com a tabela de clínicas

SELECT Medico.Nome as Medico,Medico.Email as EmailDoMedico,Medico.Telefone,Especialidade.Titulo as Especialidade,Instituicao.NomeFantasia,Instituicao.CNPJ,Instituicao.Endereco
FROM Consulta
INNER JOIN Medico ON Medico.IdMedico = Consulta.IdMedico
INNER JOIN Instituicao ON Instituicao.IdInstituicao = Consulta.IdInstituicao
INNER JOIN Especialidade ON Medico.IdEspecialidade = Especialidade.IdEspecialidade;


--CALCULAR A IDADE DO USUARIO PELA DATA DE NASCIMENTO
SELECT Nome,CPF,RG,Endereco,DATEDIFF(YEAR,DataNascimento,GETDATE()) as Idade from Usuario
WHERE IdTipoUsuario = 1;

--CONVERTER DATA DE NASCIMENTO DO USUARIO
SELECT Nome,CONVERT(varchar, DataNascimento, 101) as DataDeNascimento FROM Usuario
WHERE IdTipoUsuario = 1;

--FUNCTION PARA RETORNAR MEDICOS DA MESMA ESPERCIALIDADE 

	GO
	CREATE FUNCTION EspecialidadeMedico(@MedicoEspecialidade int)
	RETURNS TABLE
	AS 
	RETURN SELECT Medico.Nome,Medico.Telefone,Medico.Email,Especialidade.Titulo
	FROM Medico
	INNER JOIN Especialidade ON Especialidade.IdEspecialidade = Medico.IdMedico
	WHERE Medico.IdEspecialidade = @MedicoEspecialidade
	GO

	SELECT * FROM EspecialidadeMedico(2);

--CRIAR PROCEDURE QUE RETORNAR IDADE DO USURIO DE UMA DETERMINADA STORED PROCEDURE
GO
CREATE PROCEDURE PegarIdade
AS
SELECT Nome,CPF,RG,Email,DATEDIFF(YEAR,DataNascimento,GETDATE()) as Idade from Usuario
WHERE IdTipoUsuario = 1;
GO

EXECUTE PegarIdade;

--TRIGGER QUE RETORNAR AS IDADES SEMPRE QUE DAR INSERT E RETORNAR A QUANTIDADE DE USUARIOS QUANDO DELETAR

GO
CREATE TRIGGER MostrarIdade
ON Usuario
AFTER INSERT
AS
BEGIN
    DECLARE
    @VALOR  INT 

  SELECT Nome,CPF,RG,Email,DATEDIFF(YEAR,DataNascimento,GETDATE()) as Idade from Usuario
  WHERE IdTipoUsuario = 1;

END
GO

INSERT INTO Usuario(Nome,DataNascimento,Telefone,CPF,RG,Email,Senha,Endereco,IdTipoUsuario)
VALUES('joao mario da doria','02/05/2012','12-8743-8873','39982343','4349873-x','joaomario@gmail.com','maria123','rua da star wars',1);

GO
CREATE TRIGGER DeletouUsuario
ON Usuario
AFTER DELETE
AS
BEGIN

  SELECT Nome,CPF,RG,Email,DATEDIFF(YEAR,DataNascimento,GETDATE()) as Idade from Usuario
  WHERE IdTipoUsuario = 1;

END
GO

DELETE FROM Usuario
WHERE IdUsuario = 6;

