Create Table Cidade2(IDCidade integer not null, IDEstado integer not null, nomeCidade varchar(50), numHabitantes integer);
Alter Table Cidade2 add ContadorEstado integer;

Select * from Cidade2;
Insert Into Cidade2 Select * from Cidade;

Insert Into Cidade2(IDCidade,IDEstado,nomeCidade,numHabitantes)
Select IDCidade,IDEstado,nomeCidade,numHabitantes from Cidade;

begin tran
Update Cidade2 Set nomeCidade = 'EstivaGerbi' Where IDCidade = 5;
Delete from Cidade2 Where IDCidade = 5;
rollback tran
commit tran

Select GETDATE();

Select * from Cidade2 where IDCidade Between 5 and 10;

Select * from Cidade2 where IDCidade in(6,10);

Select * from Cidade2 where IDCidade not in(6,10);

Select * from Cidade2 where IDCidade = 10 and IDCidade = 6;

Select * From Estado Order by 3 desc;

Select * from Cidade order by 2,4,1 desc;

Select * From Pais Where nomePais like ('%l');