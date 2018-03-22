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