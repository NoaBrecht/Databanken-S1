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

-- oefening 1
CREATE TABLE FestivalEdities (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    TitelEditie VARCHAR(45),
    StartDatum DATE,
    EindDatum DATE
);
CREATE TABLE Artiesten (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Naam VARCHAR(100),
    Genre ENUM('pop', 'hardstyle', 'techno', 'Electropop', 'Deep House','trance',  'rock', 'country', 'electronic', 'hip hop', 'r&b') NOT NULL,
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

-- Oefening 2	
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
(4, 60.00, 3, 'Mia Anderson', 1),
(6, 120.00, 4, 'Oliver White', 1),
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
(12, 360.00, 5, 'Mia White', 1);

-- oefening 3
SELECT
    tv.AantalTickets,
    tv.TotaalPrijs,
    tt.Naam AS TicketType,
    tt.Prijs AS TicketPrijs,
    tv.KoperNaam,
    fe.TitelEditie AS FestivalTitel,
    fe.StartDatum AS FestivalStartDatum,
    fe.EindDatum AS FestivalEindDatum
FROM
    TicketVerkoop tv
JOIN
    TicketTypes tt ON tv.TicketType_Id = tt.Id
JOIN
    FestivalEdities fe ON tv.FestivalEdities_Id = fe.Id;

-- oefening 4
-- Deze query toont de klanten die meer tickets dan het gemiddelde aantal hebben gekocht.

SELECT
    tv.AantalTickets,
    tv.TotaalPrijs,
    tt.Naam AS TicketType,
    tt.Prijs AS TicketPrijs,
    tv.KoperNaam,
    fe.TitelEditie AS FestivalTitel,
    fe.StartDatum AS FestivalStartDatum,
    fe.EindDatum AS FestivalEindDatum
FROM
    TicketVerkoop tv
JOIN
    TicketTypes tt ON tv.TicketType_Id = tt.Id
JOIN
    FestivalEdities fe ON tv.FestivalEdities_Id = fe.Id
WHERE
    tv.AantalTickets > (
        -- Subquery: Bereken het gemiddelde aantal tickets gekocht
        SELECT AVG(AantalTickets)
        FROM TicketVerkoop
    );


-- oefening 05

SELECT
    COUNT(*) AS AantalNummers
FROM
    Songs as s
JOIN
    Artiesten as a ON s.Artiesten_Id = a.Id
WHERE
    a.Herkomst != 'BE';

-- oefening 06 
SELECT
    fe.Id AS EditieId,
    fe.TitelEditie AS EditieTitel,
    fe.StartDatum AS EditieStartDatum,
    fe.EindDatum AS EditieEindDatum
FROM
    FestivalEdities as fe
LEFT JOIN
    DagIndelingen di ON fe.Id = di.FestivalEdities_Id
WHERE
    di.Id IS NULL;


-- oefening 07

SELECT
    di.StartOptreden AS StartDatumOptreden,
    a.Naam AS ArtiestNaam
FROM
    DagIndelingen as di
JOIN
    Artiesten a ON di.Artiesten_Id = a.Id
JOIN
    FestivalEdities fe ON di.FestivalEdities_Id = fe.Id
WHERE
    fe.TitelEditie = 'Epic Beats Festival'
ORDER BY
    di.StartOptreden;


-- Oefening 08
SELECT
    Titel
FROM
    Songs
WHERE
    Titel IN ('I\'m Still Standing', 'SUMMER TIME SADNESS HARDSTYLE', 'Umbrella');
