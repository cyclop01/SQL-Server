Create database Venda;

create table Produtos(id integer not null identity(1,1),
			nome char(40),
			fabricante char(40),
			quantidade int, 
			vlunitario float, 
			tipo varchar(50));

insert into Produtos(nome, fabricante, quantidade, vlunitario, tipo)
values('Notebook Pavilon7000','HP',15,1200.00,'Eletronico');

insert into Produtos(nome, fabricante, quantidade, vlunitario, tipo)
values('Macbook Pro 7','Apple',7,5200.00,'Eletronico');

insert into Produtos(nome, fabricante, quantidade, vlunitario, tipo)
values('Dell Inspiron 9000','Dell',20,3200.00,'Eletronico');

insert into Produtos(nome, fabricante, quantidade, vlunitario, tipo)
values('SSD Kingston 987','Kingston',35,400.66,'Eletronico');

create view view1 as select nome, fabricante, quantidade vlunitario, tipo from Produtos where vlunitario > 499;

select * from Produtos;
select * from view1; 

alter view view1 as select nome, fabricante, quantidade, vlunitario as 'Valor Unitario', tipo from Produtos where vlunitario > 499;
 
use Jogadores;
select * from Estado;

create view view2 as 
select 
J.IDJogadores,J.nomeJogador,J.Idade,J.IDTimeJ,
T.IDTime,T.nomeTime, T.IDCidade IDCidadeT, 
C.ContadorEstado,C.IDCidade as IDCidadeC, C.IDEstado as IDEstadoC, 
E.IDEstado IDEstadoE, E.IDPais IDPaisE, E.nomeEstado, E.UF
from Cidade C, Estado E, Pais P, Jogadores J, Time T 
Where C.IDEstado = E.IDEstado
And E.IDPais = P.IDPais
And T.IDCidade = C.IDCidade
And T.IDTime = J.IDTime;

select * from view2;

alter view view2 as 
select 
J.IDJogadores,J.nomeJogador,J.Idade,J.IDTime IDTimeJ,
T.IDTime,T.nomeTime, T.IDCidade IDCidadeT, 
C.ContadorEstado,C.IDCidade as IDCidadeC, C.IDEstado as IDEstadoC, 
E.IDEstado IDEstadoE, E.IDPais IDPaisE, E.nomeEstado, E.UF
from Cidade C, Estado E, Pais P, Jogadores J, Time T 
Where C.IDEstado = E.IDEstado
And E.IDPais = P.IDPais
And T.IDCidade = C.IDCidade
And T.IDTime = J.IDTime;

select * from view2;

create view view3 as 
select P.IDPais
from Pais p;

create view view4 as
Select * from view2 
inner join view3 on view2.IDPaisE = view3.IDPais; 

select * from view4;

Select * from Cidade;

--pais mais populoso, nome e qtd de pessoas
Select Pais.nomePais,view5.IDPais,
		Select(MAX(view5.n_hab) from view5 group by view5.IDPais)
from view5
inner join Pais on view5.IDPais = Pais.IDPais
group by Pais.nomePais;

select sum(C.numHabitantes) n_hab, Sum(X.numHabitantes) n_habX, P.IDPais FROM Cidade C
	inner join Estado E on C.IDEstado = E.IDEstado
	inner join Pais P on E.IDPais = P.IDPais	
	inner join Cidade X on X.IDCidade = C.IDCidade
	inner join Estado Y on Y.IDEstado = X.IDEstado
	inner join Pais Z on Y.IDPais = Z.IDPais
	group by P.IDPais 
having sum((C.numHabitantes)) = min((X.numHabitantes));

select * from view5;

select * from view6;

create view view6 as 
Select MAX(view5.n_hab) maior  from view5;

create view view7 as
Select view5.n_hab, view5.IDPais from view5 
inner join view6 on view6.maior = view5.n_hab;

select * from view7;

use Jogadores;
-- 29/03

--[1]
Create view iView1 as
select Time.nomeTime Time, Jogadores.nomeJogador Jogador
from Jogadores 
inner join Time on Time.IDTime = Jogadores.IDTime;
Select * from iView1;
--[2]
Create view iView2 as
select Time.IDTime, Jogadores.IDJogadores Jogador
from Jogadores 
inner join Time on Time.IDTime = Jogadores.IDTime;
Select * from iView2;
--[3]
Create view iView3 as
select Time.nomeTime from Time 
inner join iView2 on Time.IDTime = iView2.IDTime
group by Time.nomeTime; 
Select * from iView3;
--[4]
Create view iView4 as
select * from iView1 
where iView1.Jogador like 'C%';
Select * from iView4;
--[5]
Create view iView5 as
select Jogadores.nomeJogador, Jogadores.Idade, Time.nomeTime Time
from Jogadores 
inner join Time on Time.IDTime = Jogadores.IDTime
Where Time.nomeTime like 'Barcelona';
Select * from iView5;
--[6]
Create view iView6 as
select AVG(Time.IDTime)media,Sum(Time.IDTime)soma,Count(Time.IDTime)contador
from Time;
Select * from iView6;
--[7]
Create view iView7 as
select Jogadores.nomeJogador Jogador,Time.nomeTime Time, Jogadores.Idade
from Jogadores 
inner join Time on Time.IDTime = Jogadores.IDTime
where Jogadores.Idade in(Select max(Idade) from Jogadores);
Select * from iView7;
--[8]
Create view iView8 as
select Jogadores.nomeJogador Jogador,Time.nomeTime Time, Jogadores.Idade
from Jogadores 
inner join Time on Time.IDTime = Jogadores.IDTime
where Jogadores.Idade in(Select min(Idade) from Jogadores);
Select * from iView8;
--[9]
Create view iView9 as
Select * from iView7
union all
Select * from iView8;
Select * from iView9;
--[10]
Alter view iView10 as
select Time.nomeTime Time, Jogadores.nomeJogador, iif(Jogadores.Idade > 18,'Maior de idade','Menor de idade')Maior
from Jogadores
inner join Time on Time.IDTime = Jogadores.IDTime;
--order by Time.nomeTime, Jogadores.nomeJogador;
Select * from iView10;
--[11]
alter view iView1 as
select Time.nomeTime Time, Jogadores.nomeJogador, Jogadores.Idade
from Jogadores
inner join Time on Time.IDTime = Jogadores.IDTime;
--12
drop view iView2;





 
