/*
LUCAS OLIVEIRA DE JESUS - Laboratorio BD
*/

--Estruturando Banco
create table Time(IDTime integer, nomeTime varchar(30) primary key(IDTime));

create table Jogadores(IDJogadores integer, 
						nomeJogador varchar(30),
						Idade integer,
						IDTime integer);
Alter Table Jogadores add Primary key(IDJogadores);
Alter Table Jogadores add Foreign key(IDTime) references Time(IDTime);

Insert into Time values(1,'Barcelona');
Insert into Time values(2,'Real Madrid');
Insert into Time values(3,'PSG');

Insert into Jogadores values(1,'Lionel Messi',30,1);
Insert into Jogadores values(2,'Paulinho',29,1);
Insert into Jogadores values(3,'Coutinho',25,1);

Insert into Jogadores values(4,'Cristiano Ronaldo',33,2);
Insert into Jogadores values(5,'Bale',28,2);
Insert into Jogadores values(6,'Marcelo',29,2);

Insert into Jogadores values(7,'Neymar',26,3);
Insert into Jogadores values(8,'Cavani',31,3);
Insert into Jogadores values(9,'Thiago Silva',33,3);
--[1]
select * from Time;
--[2]
select nomeJogador, Idade from Jogadores;
--[3]
select * from Jogadores;
--[4]
select nomeJogador, Idade from Jogadores 
inner join Time on Jogadores.IDTime = Time.IDTime
where Time.nomeTime like '%A%';
--[5]
select nomeJogador, Idade, nomeTime from Jogadores 
inner join Time on Jogadores.IDTime = Time.IDTime
where Time.nomeTime = 'Mogi-Mirim Futebol Clube'
order by Idade desc;
--[6]
select AVG(Idade)'Media de idade por time', Time.nomeTime from Jogadores 
inner join Time on Jogadores.IDTime = Time.IDTime
group by Jogadores.IDTime, Time.nomeTime;
--[7]
Select Count(IDTime) 'Quantidade de times cadastrados' from Time;
--[8]
Select Count(IDJogadores) Jogadores, nomeTime Time from Jogadores
inner join Time on Jogadores.IDTime = Time.IDTime
group by Time.IDTime, nomeTime 
order by Time.IDTime;
--[9]
Select Jogadores.Idade, Count(Jogadores.Idade) Quantidade, Time.nomeTime from Jogadores
inner join Time on Jogadores.IDTime = Time.IDTime
group by Jogadores.Idade, Time.nomeTime
order by 3; 
--[10]
select  nomeTime, nomeJogador, Idade from Jogadores 
inner join Time on Jogadores.IDTime = Time.IDTime
order by Idade desc;
--[11]
select nomeJogador, Idade, nomeTime from Jogadores 
inner join Time on Jogadores.IDTime = Time.IDTime
where Time.nomeTime like 'Mogi%';
--[12]
select Time.nomeTime, (AVG(Jogadores.Idade)/Count(Jogadores.IDJogadores)) from Jogadores
inner join Time on Jogadores.IDTime = Time.IDTime
group by Time.nomeTime, Time.IDTime
order by Time.IDTime;
--[13]
select Time.nomeTime, AVG(Jogadores.Idade) IdadeMedia from Jogadores
inner join Time on Jogadores.IDTime = Time.IDTime
group by Time.nomeTime, Time.IDTime
having AVG(Jogadores.Idade) > 30
order by Time.IDTime;
--[14]
Insert into Time values(4,'Manchester');
select nomeJogador, Idade, nomeTime from Time 
left join Jogadores on Jogadores.IDTime = Time.IDTime
order by Idade desc;

/*
1 - Selecione todos os campos da tabela time.
2 - Selecione os campos nome jogador e idade da tabela jogadores.
3 - Selecione todos os campos da tabela de jogadores.
4 - Selecione os campos nome jogador e idade da tabela de jogadores e o nome do time
da tabela de time permitindo filtro por qualquer parte do nome do time que contenha ‘A’.
5 – Selecione o nome do jogador, idade, e nome do time dos jogadores filtrando somente
a time “Mogi Mirim Futebol Clube” em ordem decrescente de Idade.
6 - Selecione a média de idade dos jogadores por time.
7 - Selecione a quantidade de time cadastradas na tabela de time.
8 - Selecione a quantidade de jogadores cadastrados por time ordenado por time.
9 - Selecione o time e um contador por idade dos jogadores em ordem por time.
10 - Selecione o time, nome do jogadores e idade em ordem por idade decrescente.
11 - Selecione nome de jogador, idade e time filtrando nome jogador que pertença aos
times começados com Mogi.
12 – Selecione o time do jogador e a média de idade dividido por número de registros.
Ordene a consulta por IDTime.
13 – Selecione o time e a idade média dos jogadores, filtrar a média de idade maior de 30
anos. Ordene a consulta por nome do time.
14 – Selecione todos os times e jogadores mesmo que o time não tenho jogador
cadastrado.
*/





