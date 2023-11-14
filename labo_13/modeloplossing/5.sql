CREATE VIEW GamesOpOndersteundePlatformen
AS
SELECT Titel, Naam
FROM Releases INNER JOIN Games
ON Releases.Games_Id = Games.Id
INNER JOIN Platformen
ON Releases.Platformen_Id = Platformen.Id;

CREATE VIEW GamesZonderPlatform
AS
SELECT Titel
FROM Games
WHERE Games.Id NOT IN (SELECT Games_Id FROM Releases);

CREATE VIEW PlatformenZonderGames
AS
SELECT Naam FROM Platformen
WHERE Platformen.Id NOT IN (SELECT Platformen_Id FROM Releases);

-- dit is niet de enige mogelijkheid
-- je kan ook left en right join combineren
-- maar in het geval van een veel-op-veel relatie is nogal een breinbreker
CREATE VIEW GamesOpPlatformen
AS
SELECT Titel, Naam
FROM GamesOpOndersteundePlatformen
UNION ALL
SELECT Titel, 'Platform niet meer ondersteund'
FROM GamesZonderPlatform
UNION ALL
SELECT 'Geen games voor dit platform', Naam
FROM PlatformenZonderGames;