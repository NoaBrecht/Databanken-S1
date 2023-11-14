CREATE VIEW AuteursBoekenRatings
AS
SELECT Auteur, Titel, Rating
FROM AuteursBoeken
INNER JOIN GemiddeldeRatings
ON AuteursBoeken.Boeken_Id = GemiddeldeRatings.Boeken_Id; -- let op: ditmaal geen ....Id = ..._Id