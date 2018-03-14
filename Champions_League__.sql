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


select * from Jogadores;