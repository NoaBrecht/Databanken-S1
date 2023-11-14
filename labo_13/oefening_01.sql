DROP VIEW IF EXISTS AuteursBoeken;
CREATE VIEW AuteursBoeken
AS
SELECT personen.Voornaam, " ",personen.Familienaam as "Autheur", boeken.titel as "Titel"

/*INNER JOIN Leden ON Leden.Id = Taken.Leden_Id;*/