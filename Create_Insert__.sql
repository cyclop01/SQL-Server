Create Database IBGE;

USE IBGE;

Create Table Pais(IDPais integer not null, nomePais varchar(50));
Alter Table Pais add Primary key(IDPais);

Create Table Estado(IDEstado integer not null, IDPais integer not null, nomeEstado varchar(50));
Alter Table Estado add Primary key(IDEstado);
Alter Table Estado add Foreign key(IDPais) references Pais(IDPais);
Alter Table Estado add UF char(2);

Create Table Cidade(IDCidade integer not null, IDEstado integer not null, nomeCidade varchar(50), numHabitantes integer);
Alter Table  Cidade add Primary key(IDCidade);
Alter Table Cidade add Foreign key(IDEstado) references Estado(IDEstado);
Alter Table Cidade add ContadorEstado integer;


Select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'Cidade';
Select * from Pais; Select * from Estado;Select * from Cidade;

--Inserindo 3 Paises
Insert into Pais values(1,'Brasil');
Insert into Pais values(2,'Canada');
Insert into Pais values(3,'Mexico');

--Inserindo 3 Estados para cada Pais
Insert into Estado values(1,1,'Sao Paulo','SP');
Insert into Estado values(2,1,'Minas Gerais','MG');
Insert into Estado values(3,1,'Parana','PR');

Insert into Estado values(4,2,'Yukon','YK');
Insert into Estado values(5,2,'Quebec','QB');
Insert into Estado values(6,2,'Ontario','OT');

Insert into Estado values(7,3,'Baja California','BC');
Insert into Estado values(8,3,'Chihuahua','CH');
Insert into Estado values(9,3,'Nuevo Leon','NL');

--Inserindo 3 Cidades para cada Estado

--SP
Insert into Cidade values(1,1,'Campinas',1000000,null);
Insert into Cidade values(2,1,'Pedreira',45000,null);
Insert into Cidade values(3,1,'Serra Negra',25000,null);
--MG
Insert into Cidade values(4,2,'Ouro Fino',33000,null);
Insert into Cidade values(5,2,'Monte Siao',21000,null);
Insert into Cidade values(6,2,'Pocos de Caldas',148000,null);
--PR
Insert into Cidade values(7,3,'Quinta do Sol',5000,null);
Insert into Cidade values(8,3,'Ponta Grossa',300000,null);
Insert into Cidade values(9,3,'Curitiba',1800000,null);
--YK
Insert into Cidade values(10,4,'Beaver Creek',103,null);
Insert into Cidade values(11,4,'Mayo',226,null);
Insert into Cidade values(12,4,'Whitehorse',23000,null);
--QB
Insert into Cidade values(13,5,'Montreal',1700000,null);
Insert into Cidade values(14,5,'Joliette',17000,null);
Insert into Cidade values(15,5,'Pikogan',791,null);
--OT
Insert into Cidade values(16,6,'Aurora',40000,null);
Insert into Cidade values(17,6,'Napanee',15000,null);
Insert into Cidade values(18,6,'Ajax',90000,null);
--BC
Insert into Cidade values(19,7,'Tijuana',1500000,null);
Insert into Cidade values(20,7,'Insenada',600000,null);
Insert into Cidade values(21,7,'Mexicali',900000,null);
--CH
Insert into Cidade values(22,8,'La Cruz',4000,null);
Insert into Cidade values(23,8,'Juarez',1300000,null);
Insert into Cidade values(24,8,'Buenaventura',494,null);
--NL
Insert into Cidade values(25,9,'Santiago',37000,null);
Insert into Cidade values(26,9,'Guadalupe',700000,null);
Insert into Cidade values(27,9,'Linares',71000,null);

