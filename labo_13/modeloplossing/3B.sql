CREATE VIEW GemiddeldeRatings
AS
SELECT Boeken_Id, AVG(Rating) AS 'Rating'
FROM Reviews
GROUP BY Boeken_Id;