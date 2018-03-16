--retorna a qtd de habitantes por estado
SELECT E.nomeEstado,
	(SELECT SUM(C.NumHabitantes) 
	 FROM Cidade C
	 WHERE C.IDEstado = E.IDEStado) Total
FROM Estado E

select * from cidade

-- com nome do pais
SELECT E.nomeEstado,
	(SELECT SUM(C.NumHabitantes) 
	 FROM Cidade C
	 WHERE C.IDEstado = E.IDEStado) Total,
		(SELECT P.nomePais
		FROM Pais P
		WHERE P.IDpais = E.IDPais)
FROM Estado E

SELECT *
FROM (SELECT TOP 10 * 
	  FROM Cidade) 
AS Vcity

SELECT *
FROM (SELECT top 10 * 
	  FROM Cidade) 
AS Vcity

SELECT E.nomeEstado,
	(SELECT SUM(C.NumHabitantes) 
	 FROM Cidade C
	 WHERE C.IDEstado = E.IDEStado) Total
FROM Estado E
ORDER BY Total desc

-- 5 mais populosas cidades
SELECT *
FROM (SELECT top 5 nomeCidade, NumHabitantes 
	  FROM Cidade) 
AS Vcity
ORDER BY Vcity.NumHabitantes DESC

--retorna cidades onde o estado não tem o codigo de pais com o pais começando com bra

SELECT * 
FROM Cidade C
WHERE C.IDEstado NOT IN (
	SELECT E.IDEstado
	FROM Estado E INNER JOIN  Pais P
	ON E.IDPais = P.IDpais
	WHERE P.nomePais LIKE ('Bra%'))


SELECT * 
FROM Cidade C
WHERE C.IDEstado NOT IN (
	SELECT E.IDEstado
	FROM Estado E INNER JOIN  Pais P
	ON E.IDPais = P.IDpais
	AND P.nomePais LIKE ('Bra%'))