ALTER VIEW AuteursBoeken
AS
SELECT CONCAT(Voornaam, ' ', Familienaam) AS Auteur,
	Titel, Boeken_Id -- Boeken.Id as Boeken_Id is even goed, want Boeken_Id = Boeken.Id volgens JOIN
FROM Publicaties
INNER JOIN Boeken
ON Boeken_Id = Boeken.Id
INNER JOIN Personen
ON Personen_Id = Personen.Id;