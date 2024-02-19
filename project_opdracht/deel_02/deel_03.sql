SET SQL_SAFE_UPDATES = 0;
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS DagIndelingen;
DROP TABLE IF EXISTS FestivalEdities;
DROP TABLE IF EXISTS Artiesten;
DROP TABLE IF EXISTS Songs;
DROP TABLE IF EXISTS TicketTypes;
DROP TABLE IF EXISTS TicketVerkoop;
SET SQL_SAFE_UPDATES = 1;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE FestivalEdities (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    TitelEditie VARCHAR(45),
    StartDatum DATE,
    EindDatum DATE
);
CREATE TABLE Artiesten (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Naam VARCHAR(100),
    Genre ENUM('pop', 'hardstyle', 'techno', 'Electropop', 'Deep House','trance',  'rock', 'country', 'electronic', 'hip hop', 'r&b','rap') NOT NULL,
    Herkomst VARCHAR(2)
);
CREATE TABLE DagIndelingen (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    StartOptreden DATETIME,
    Artiesten_Id INT,
    FestivalEdities_Id INT,
    FOREIGN KEY (Artiesten_Id) REFERENCES Artiesten(Id),
    FOREIGN KEY (FestivalEdities_Id) REFERENCES FestivalEdities(Id)
);
CREATE TABLE Songs (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Titel VARCHAR(100),
    Artiesten_Id INT,
    FOREIGN KEY (Artiesten_Id) REFERENCES Artiesten(Id)
);
CREATE TABLE TicketTypes (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Naam VARCHAR(50),
    Prijs DECIMAL(10, 2),
    FestivalEdities_Id INT,
    FOREIGN KEY (FestivalEdities_Id) REFERENCES FestivalEdities(Id)
);

CREATE TABLE TicketVerkoop (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    AantalTickets INT,
    TotaalPrijs DECIMAL(10, 2),
    TicketType_Id INT,
    KoperNaam VARCHAR(100),
    FestivalEdities_Id INT,
    FOREIGN KEY (TicketType_Id) REFERENCES TicketTypes(Id),
    FOREIGN KEY (FestivalEdities_Id) REFERENCES FestivalEdities(Id)
);
INSERT INTO Artiesten (Naam, Genre, Herkomst)
VALUES
('Elton John', 'pop', 'UK'),
('Sick Legend', 'hardstyle', NULL),
('Rihanna', 'pop', 'US'),
('Em Beihold', 'pop', 'US'),
('Lost Frequencies', 'Deep House', 'BE'),
('Stromae', 'Electropop', 'BE'),
('Adele', 'pop', 'UK'),
('Calvin Harris', 'electronic', 'UK'),
('Billie Eilish', 'pop', 'US'),
('Armin van Buuren', 'trance', 'NL'),
('Taylor Swift', 'country', 'US'),
('Avicii', 'electronic', 'SE'),
('Ed Sheeran', 'pop', 'UK'),
('David Guetta', 'electronic', 'FR'),
('Lady Gaga', 'pop', 'US'),
('The Weeknd', 'r&b', 'CA'),
('Marshmello', 'electronic', 'US'),
('Dua Lipa', 'pop', 'UK'),
('Drake', 'hip hop', 'CA'),
('Katy Perry', 'pop', 'US'),
('Martin Garrix', 'electronic', 'NL'),
('Beyoncé', 'r&b', 'US'),
('Coldplay', 'rock', 'UK'),
('Ariana Grande', 'pop', 'US'),
('George Michael', 'pop', 'UK');

INSERT INTO FestivalEdities (TitelEditie, StartDatum, EindDatum)
VALUES
('Summer Jam', '2023-07-15', '2023-07-17'),
('Electro Fusion', '2023-09-05', '2023-09-07'),
('Harmony Fest', '2023-06-20', '2023-06-22'),
('Epic Beats Festival', '2023-08-10', '2023-08-12'),
('Techno Extravaganza', '2023-10-01', '2023-10-03');


INSERT INTO DagIndelingen (StartOptreden, Artiesten_Id, FestivalEdities_Id)
VALUES
('2023-08-16 19:30:00', 2, 1),
('2023-08-16 20:45:00', 3, 1),
('2023-08-16 21:45:00', 4, 1),
('2023-08-16 22:45:00', 5, 1),
('2023-08-16 23:45:00', 6, 1),
('2023-08-16 23:45:00', 6, 4);


INSERT INTO Songs (Titel, Artiesten_Id)
VALUES
('Alors on danse', 6),
('Are You with Me', 5),
('I\'m Still Standing', 1),
('PART OF ME HARDSTYLE', 2),
('ANOTHER LOVE HARDSTYLE', 2),
('OUTSIDE HARDSTYLE SPED UP', 2),
('SUMMER TIME SADNESS HARDSTYLE', 2),
('EVERY TIME WE TOUCH HARDSTYLE (SPED UP)', 2),
('Umbrella', 3),
('Diamonds', 3);


INSERT INTO TicketTypes (Naam, Prijs, FestivalEdities_Id)
VALUES
('Standaard', 25.00, 1),
('VIP', 50.00, 2),
('Camping', 15.00, 1),
('Studentenkorting', 20.00, 1),
('Vroege Vogel', 30.00, 1);


INSERT INTO TicketVerkoop (AantalTickets, TotaalPrijs, TicketType_Id, KoperNaam, FestivalEdities_Id)
VALUES
(10, 250.00, 1, 'Emma Wilson', 1),
(5, 250.00, 2, 'Lucas Garcia', 1),
(8, 120.00, 3, 'Ava Lee', 1),
(3, 60.00, 4, 'Liam Taylor', 1),
(12, 360.00, 5, 'Olivia Martin', 1),
(15, 375.00, 1, 'Noah Davis', 1),
(7, 350.00, 2, 'Sophie Thomas', 1),
(4, 60.00, 3, 'Mia Anderson', 2),
(6, 120.00, 4, 'Oliver White', 2),
(9, 270.00, 5, 'Isabella Rodriguez', 1),
(20, 500.00, 1, 'James Wilson', 1),
(10, 500.00, 2, 'Ava Johnson', 1),
(15, 225.00, 3, 'Jackson Brown', 1),
(8, 160.00, 4, 'Sophie Miller', 1),
(10, 300.00, 5, 'Liam Garcia', 1),
(6, 150.00, 1, 'Emma Smith', 1),
(12, 600.00, 2, 'Noah Taylor', 1),
(8, 120.00, 3, 'Olivia Davis', 1),
(5, 100.00, 4, 'Lucas Martin', 1),
(12, 360.00, 5, 'Mia White', 1),
(12, 360.00, 5, 'Mia White', 2),
(12, 360.00, 5, 'Mia White', 3); 

-- OEFENING 1
-- We laten de klant zien hoeveel elke editie heeft opgebracht.
SELECT * from opbrengstpereditie;

/*CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `opbrengstpereditie` AS
    SELECT 
        `festivaledities`.`TitelEditie` AS `TitelEditie`,
        SUM(`ticketverkoop`.`TotaalPrijs`) AS `TotalRevenue`
    FROM
        (`ticketverkoop`
        JOIN `festivaledities` ON ((`ticketverkoop`.`FestivalEdities_Id` = `festivaledities`.`Id`)))
    GROUP BY `festivaledities`.`Id`
    */

-- OEFENING 2
CALL TotaalOpbrengstperticket(4);

/*CREATE PROCEDURE TotaalOpbrengstperticket(IN ticketTypeId INT)
BEGIN
    SELECT TicketTypes.Naam AS TicketType, SUM(TicketVerkoop.AantalTickets) AS TotalTicketsSold
    FROM TicketVerkoop
    JOIN TicketTypes ON TicketVerkoop.TicketType_Id = TicketTypes.Id
    WHERE TicketTypes.Id = ticketTypeId
    GROUP BY TicketTypes.Id;
END*/


-- OEFENING 3
CALL newArtistAndSong('Aexcit', 'Electropop', 'US', 'Ladadadida');
CALL newArtistAndSong('Snoop Dogg', 'rap', 'US', 'Still Dre');

/*
CREATE DEFINER=`root`@`localhost` PROCEDURE `newArtistAndSong`(
    IN artistName VARCHAR(100),
    IN artistGenre ENUM('pop', 'hardstyle', 'techno', 'Electropop', 'Deep House','trance',  'rock', 'country', 'electronic', 'hip hop', 'r&b','rap'),
    IN artistOrigin VARCHAR(2),
    IN songTitle VARCHAR(100)
)
BEGIN
    DECLARE artistId INT;
    INSERT INTO Artiesten (Naam, Genre, Herkomst)
    VALUES (artistName, artistGenre, artistOrigin);
    SET artistId = LAST_INSERT_ID();
    INSERT INTO Songs (Titel, Artiesten_Id)
    VALUES (songTitle, artistId);
END
*/

-- oefening 4

SELECT CalculateAverageSongLengthByGenre('pop') AS AverageSongLengthForPop;

/*
CREATE DEFINER=`root`@`localhost` FUNCTION `CalculateAverageSongLengthByGenre`( genreParam ENUM('pop', 'hardstyle', 'techno', 'Electropop', 'Deep House','trance',  'rock', 'country', 'electronic', 'hip hop', 'r&b')) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE avgLength DECIMAL(10, 2);

    -- Calculate the average length of songs for the specified genre
    SELECT AVG(LENGTH(Songs.Titel)) INTO avgLength
    FROM Songs
    JOIN Artiesten ON Songs.Artiesten_Id = Artiesten.Id
    WHERE Artiesten.Genre = genreParam;

    -- If there are no songs in the specified genre, set avgLength to 0
    IF avgLength IS NULL THEN
        SET avgLength = 0.00;
    END IF;

    RETURN avgLength;
END
*/