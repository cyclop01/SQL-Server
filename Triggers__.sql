Create database Funcionario;
Use Funcionario;
create table Funcionario(nro_funcionario int not null,
						ultimo_nome varchar(50),
						primeiro_nome varchar(50),
						ramal varchar(6),
						email varchar(50),
						nro_gerente int not null,
						cargo varchar(50)
						primary key(nro_funcionario));

insert into Funcionario values(1055,'SOUZA','PEDRO',123,'email@padrao',999,'Analista'),
							  (1056,'PEREIRA','ANTONIO',124,'email@padrao',999,'Comprador'),
							  (1057,'SILVA','CARLOS',125,'email@padrao',999,'Analista'),
							  (1058,'SILVA','ANDRE',126,'email@padrao',999,'Comprador')

create table Auditoria(id int not null identity,
						nro_funcionario int not null,
						ultimo_nome varchar(50),
						dt_modificacao datetime,
						acao varchar(50)
						primary key(id));

CREATE TRIGGER atualiza_funcionario on Funcionario
FOR UPDATE AS 
BEGIN
	INSERT INTO Auditoria(acao, nro_funcionario, ultimo_nome, dt_modificacao) 
	VALUES('UPDATE',(select nro_funcionario from deleted),(select ultimo_nome from deleted),GETDATE())	
END;
							  
UPDATE Funcionario set ultimo_nome = 'SILVA'
where nro_funcionario = 1056;

Select * from Auditoria;
Select * from Auditoria where nro_funcionario = 1056;

CREATE TRIGGER insere_funcionario on Funcionario
FOR INSERT AS 
BEGIN
	INSERT INTO Auditoria(acao, nro_funcionario, ultimo_nome, dt_modificacao) 
	VALUES('INSERT',(select nro_funcionario from inserted),(select ultimo_nome from inserted),GETDATE())	
END;

Insert Into Funcionario Values(1059,'OLIVEIRA','LUCAS',127,'email@padrao',999,'Estagiario');

Select * from Auditoria;

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~DESAFIO~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--Criar uma trigger para permitir a exclusao do pais sem erros
Alter TRIGGER Excluir_Pais on Pais
INSTEAD OF DELETE AS 
BEGIN
	declare @varIDPais int;
	--declare @varIDEstado int

	Select @varIDPais = IDPais from deleted;
	--set @varIDEstado = (Select IDEstado from Estado where IDPais =  @varIDPais)
	
	Delete from Cidade where IDEstado in(Select IDEstado from Estado where IDPais =  @varIDPais)
	Delete from Estado where IDPais =  @varIDPais
END;

Delete from Pais where IDPais = 3;
Delete from Cidade where IDCidade = 1;

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~EstruturaBD~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
Create database ListaTriggers; 
create table Time(IDTime integer, nomeTime varchar(30), totalJogadores char(30) primary key(IDTime));
alter table Time add IDCidade Integer;
create table Jogadores(IDJogadores integer not null, 
						nomeJogador varchar(30),
						Idade integer,
						anoNascimento integer,
						maiorIdade char(1),
						CPF numeric(11),
						IDTime integer);
Alter Table Jogadores add Primary key(IDJogadores);
Alter Table Jogadores add Foreign key(IDTime) references Time(IDTime);
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Triggers~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
--[1]
CREATE TRIGGER Auto_Incremento on Time
INSTEAD OF INSERT AS 
BEGIN
	declare @ID int;
	declare @totalJogadores int;
	declare @nomeTime varchar(30);
	declare @idCidade int;
		
	Select @ID = (Count(*)+1) from Time;
	Select @nomeTime = nomeTime, @totalJogadores = totalJogadores, @idCidade = IDCidade from inserted ;
	
	INSERT INTO Time(IDTime, nomeTime, totalJogadores, IDCidade) Values(@ID, @nomeTime, @totalJogadores, @idCidade) ;
END;
--[2]
CREATE TRIGGER Auto_Incremento_Jogador on Jogadores
INSTEAD OF INSERT AS 
BEGIN
	declare @ID int;
	declare @nomeJogador varchar(30);
	declare @Idade int;
	declare @anoNascimento int;
	declare @maiorIdade char(1);
	declare @CPF numeric(11);
	declare @IDTime int;
		
	Select @ID = (Count(*)+1) from Jogadores;
	Select @nomeJogador = nomeJogador, @Idade = Idade, @anoNascimento = anoNascimento, @maiorIdade =  maiorIdade, @CPF = CPF, @IDTime = IDTime from inserted ;
	
	INSERT INTO Jogadores(IDJogadores,nomeJogador, Idade, anoNascimento, maiorIdade, CPF, IDTime) Values(@ID, @nomeJogador, @Idade, @anoNascimento, @maiorIdade, @CPF, @IDTime) ;
END;

select * from Time;
--posso passar qualquer idtime, a trigger corrige
Insert into Time values(12,'Barcelona',30,1);
Insert into Time values(32,'Real Madrid',30,2);
Insert into Time values(123,'PSG',32,3);

select * from Jogadores;
Insert into Jogadores(IDJogadores,nomeJogador,Idade,anoNascimento) values(1,'Lionel Messi',30,1973);
Insert into Jogadores(IDJogadores,nomeJogador,Idade,anoNascimento) values(2,'Paulinho',29,1974);
Insert into Jogadores(IDJogadores,nomeJogador,Idade,anoNascimento) values(3,'Coutinho',25,1970);

Insert into Jogadores(IDJogadores,nomeJogador,Idade,anoNascimento)values(4,'Cristiano Ronaldo',33,1980);
Insert into Jogadores(IDJogadores,nomeJogador,Idade,anoNascimento,CPF) values(5,'Bale',28,2002,1);
Insert into Jogadores(IDJogadores,nomeJogador,Idade,anoNascimento)  values(6,'Marcelo',29,1983);

Insert into Jogadores values(7,'Neymar',26,3);
Insert into Jogadores values(8,'Cavani',31,3);
Insert into Jogadores values(9,'Thiago Silva',33,3);

drop trigger Auto_Incremento_Jogador;
--[3]
CREATE TRIGGER Idade_Jogador on Jogadores
INSTEAD OF INSERT AS 
BEGIN
	declare @ID int;
	declare @nomeJogador varchar(30);
	declare @Idade int;
	declare @anoNascimento int;
	declare @maiorIdade char(1);
	declare @CPF numeric(11);
	declare @IDTime int;
		
	Select @ID = (Count(*)+1) from Jogadores;
	Select @anoNascimento = (select anoNascimento from inserted);
	Select @Idade = year(GETDATE()) -  @anoNascimento;
	Select @nomeJogador = nomeJogador, @maiorIdade =  maiorIdade, @CPF = CPF, @IDTime = IDTime from inserted ;
	
	INSERT INTO Jogadores(IDJogadores,nomeJogador, Idade, anoNascimento, maiorIdade, CPF, IDTime) Values(@ID, @nomeJogador, @Idade, @anoNascimento, @maiorIdade, @CPF, @IDTime) ;
END;
drop trigger Idade_Jogador;
--[4]
CREATE TRIGGER MaiordeIdade on Jogadores
INSTEAD OF INSERT AS 
BEGIN
	declare @ID int;
	declare @nomeJogador varchar(30);
	declare @Idade int;
	declare @anoNascimento int;
	declare @maiorIdade char(1);
	declare @CPF numeric(11);
	declare @IDTime int;
		
	Select @ID = (Count(*)+1) from Jogadores;
	Select @anoNascimento = (select anoNascimento from inserted);
	Select @Idade = year(GETDATE()) -  @anoNascimento;
	Select @maiorIdade = iif(@Idade>18,'s','n');
	Select @nomeJogador = nomeJogador, @CPF = CPF, @IDTime = IDTime from inserted ;
	
	INSERT INTO Jogadores(IDJogadores,nomeJogador, Idade, anoNascimento, maiorIdade, CPF, IDTime) Values(@ID, @nomeJogador, @Idade, @anoNascimento, @maiorIdade, @CPF, @IDTime) ;
END;
drop trigger MaiordeIdade;
--[5]
CREATE alter TRIGGER TemCPF on Jogadores
INSTEAD OF Insert AS 
BEGIN
	declare @ID int;
	declare @nomeJogador varchar(30);
	declare @Idade int;
	declare @anoNascimento int;
	declare @maiorIdade char(1);
	declare @CPF numeric(11);
	declare @IDTime int;
		
	Select @ID = (Count(*)+1) from Jogadores;
	Select @anoNascimento = (select anoNascimento from inserted);
	Select @Idade = year(GETDATE()) -  @anoNascimento;
	Select @maiorIdade = iif(@Idade>18,'s','n');
	Select @CPF = CPF from inserted;
	if (Select CPF from Jogadores WHERE CPF = @CPF) > 0
		begin 
			 print'CPF JA CADASTRADO';
		end
	else
		begin
			print'CPF OK'
		end
	Select @nomeJogador = nomeJogador, @IDTime = IDTime from inserted ;
	
	INSERT INTO Jogadores(IDJogadores,nomeJogador, Idade, anoNascimento, maiorIdade, CPF, IDTime) Values(@ID, @nomeJogador, @Idade, @anoNascimento, @maiorIdade, @CPF, @IDTime) ;
END;
--[6]
DISABLE TRIGGER Jogadores.Idade_Jogador on Jogadores;