CREATE VIEW TakenVerdeling
AS
SELECT Voornaam, COALESCE(Omschrijving, 'Geen taak toegewezen') AS Omschrijving
FROM Leden LEFT join Taken
ON Leden.Id = Taken.Leden_Id
UNION ALL
SELECT 'Geen lid toegewezen', Omschrijving
FROM Leden RIGHT JOIN Taken
ON Leden.Id = Taken.Leden_Id
WHERE Leden_Id IS NULL;

/* OF:
SELECT Voornaam, COALESCE(Omschrijving, 'Geen taak toegewezen') AS Omschrijving
FROM Leden LEFT join Taken
ON Leden.Id = Taken.Leden_Id
UNION ALL
SELECT 'Geen lid toegewezen', Omschrijving
FROM Taken
WHERE Leden_Id IS NULL;
*/