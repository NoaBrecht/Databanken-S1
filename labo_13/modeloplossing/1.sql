CREATE VIEW AuteursBoeken
AS
SELECT CONCAT(Voornaam, ' ', Familienaam) AS Auteur, Titel
FROM Publicaties
INNER JOIN Boeken
ON Boeken_Id = Boeken.Id
INNER JOIN Personen 
ON Personen_Id = Personen.Id;