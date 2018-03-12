Select * from Pais 
inner join Estado on Pais.IDPais = Estado.IDPais
inner join Cidade on Cidade.IDEstado = Estado.IDEstado;

--OU

Select * from Cidade, Estado, Pais
where Pais.IDPais = Estado.IDEstado
and Estado.IDEstado = Cidade.IDCidade;

Insert into Pais values(4,'Alemanha');

Select * from Pais left Join Estado on Pais.IDPais = Estado.IDPais
where Estado.IDPais is null;

Select * from Pais right Join Estado on Pais.IDPais = Estado.IDPais
where Estado.IDPais is null;

Select * from Estado right Join Pais on Pais.IDPais = Estado.IDPais
where Estado.IDPais is null;

Select * from Pais full outer join Estado on Pais.IDPais = Estado.IDPais
where Pais.IDPais is null and Estado.IDEstado is null;

--Self Join 
--Serve para fazer join entre campos da mesma tabela
create table Func(IDFunc integer, Nome char(30), Superior integer);

Insert into Func values(1,'Sergio',2);
Insert into Func values(2,'Gilberto',3);
Insert into Func values(3,'Glauco',4);
Insert into Func values(4,'Lucas',5);
Insert into Func values(5,'Fulano',null);

Select  B.Nome Funcionario , A.Nome Superior from Func A inner join Func B
on B.Superior = A.IDFunc ;
-- fim Self Join

Select Count(*) from Pais P Inner Join Estado E
on E.IDPais = P.IDPais;

Select P.nomePais Pais from Pais P Inner Join Estado E, Count(*) 'Quantidade de Estados Cadastrados'
on E.IDPais = P.IDPais
Group by P.nomePais, P.IDPais;

--Aqui ele conta todos os registros, nesse caso retorna Alemanha com um estado cadastrado, mesmo nao tendo.
Select P.nomePais , Count(*) 'Quantidade de Estados Cadastrados' from Pais P Left Join Estado E
on E.IDPais = P.IDPais
Group by P.nomePais;

Insert into Estado values(10,1,'Acre','AC');
Delete from Estado where IDEstado = 10;

--Aqui ele conta todos apenas registros onde estado contem pais
Select P.nomePais , Count(E.IDEstado) 'Quantidade de Estados Cadastrados' 
from Pais P Left Join Estado E
on E.IDPais = P.IDPais
Group by P.nomePais;

--
Select Count(*) Contador, Sum(e.IDPais)Soma, Avg(e.IDPais)Media, MAX(p.IDPais)Maximo, min(e.IDPais)Minimo
from Pais P Left Join Estado E
on E.IDPais = P.IDPais;

Select Count(*) Contador, Sum(p.IDPais)Soma, Avg(p.IDPais)Media, MAX(p.IDPais)Maximo, min(p.IDPais)Minimo
from Pais P Inner Join Estado E
on E.IDPais = P.IDPais;

Select Count(*) Contador, Sum(p.IDPais)Soma, Avg(p.IDPais) Media, MAX(p.IDPais)Maximo, min(p.IDPais)Minimo
from Pais P;

Select count(p.IDPais) contador, p.nomePais
from Pais p left join Estado e 
on P.IDPais = E.IDPais
group by p.nomePais
having COUNT(P.IDPais)>1;

Select nomePais from Pais
union
Select nomeEstado from Estado

Select nomePais from Pais
union all
Select nomePais from Pais