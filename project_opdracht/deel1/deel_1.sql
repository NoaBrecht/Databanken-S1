SELECT * FROM 2324M_VDBNOA.Dagindelingen;DROP TABLE IF EXISTS Artiesten;
DROP TABLE IF EXISTS Songs;
DROP TABLE IF EXISTS Dagindelingen;
DROP TABLE IF EXISTS Tickets;
DROP TABLE IF EXISTS Medewerkers;

/* OPGAVE 1: CREATE-script voor de eerste 3 tabellen */

CREATE TABLE IF NOT EXISTS Artiesten (
    Naam VARCHAR(100) NOT NULL,
    Genre ENUM('pop', 'hardstyle', 'techno', 'Electropop', 'Deep House') NOT NULL,
    OprichtingsJaar DATE NOT NULL,
    KeerGespeeld INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Songs (
    ArtiestNaam VARCHAR(100) NOT NULL,
    Titel VARCHAR(100) NOT NULL,
    Duurtijd INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Dagindelingen (
    dag DATE NOT NULL,
    startuur TIME NOT NULL,
    ArtiestNaam VARCHAR(100) NOT NULL
);

/* OPGAVE 2: CREATE-script voor de 2 eigen tabellen */

CREATE TABLE IF NOT EXISTS Tickets (
    ticket_id INT PRIMARY KEY AUTO_INCREMENT,
    ticket_type VARCHAR(255) NOT NULL,
    prijs DECIMAL(10, 2) NOT NULL,
    beschikbaar_aantal INT
);

CREATE TABLE IF NOT EXISTS Medewerkers (
    medewerker_id INT PRIMARY KEY AUTO_INCREMENT,
    naam VARCHAR(255) NOT NULL,
    functie VARCHAR(255),
    contactgegevens VARCHAR(255)
);

/* OPGAVE 3: De tabellen opvullen met gegevens */

INSERT INTO Artiesten (Naam, Genre, OprichtingsJaar, KeerGespeeld)
VALUES
('Elton John', 'pop', '1947-03-25', 0),
('Sick Legend', 'hardstyle', '2022-01-01', 3),
('Rihanna', 'pop', '1988-02-20', 6),
('Em Beihold', 'pop', '2017-01-01', 2),
('Lost Frequencies', 'Deep House', '1993-11-30', 4),
('Stromae', 'Electropop', '1985-03-12', 5);

INSERT INTO Songs (ArtiestNaam, Titel, Duurtijd)
VALUES
('Stromae', 'Alors on danse', 220),
('Lost Frequencies', 'Are You with Me', 194),
('Elton John', 'I\'m Still Standing', 203),
('Sick Legend', 'PART OF ME HARDSTYLE', 132),
('Sick Legend', 'ANOTHER LOVE HARDSTYLE', 106),
('Sick Legend', 'OUTSIDE HARDSTYLE SPED UP', 137),
('Sick Legend', 'SUMMER TIME SADNESS HARDSTYLE', 105),
('Sick Legend', 'EVERY TIME WE TOUCH HARDSTYLE (SPED UP)', 4000),
('Rihanna', 'Umbrella', 220),
('Rihanna', 'Diamonds', 198);

INSERT INTO Medewerkers (naam, functie, contactgegevens)
VALUES
('John Doe', 'Beveiliging', '+32 123456789'),
('Jane Doe', 'Kassa', '+32 987654321'),
('Robert Smith', 'Logistiek', '+32 456123789'),
('Mary Johnson', 'Artiestenbegeleiding', '+32 789456123'),
('Michael Brown', 'Catering', '+32 321987654'),
('Susan Wilson', 'EHBO', '+32 654789321');

INSERT INTO Dagindelingen (dag, startuur, ArtiestNaam)
VALUES
('2023-08-16', '19:30:00', 'Sick Legend'),
('2023-08-16', '20:45:00', 'Rihanna'),
('2023-08-16', '21:45:00', 'Em Beihold'),
('2023-08-16', '22:45:00', 'Lost Frequencies'),
('2023-08-16', '23:45:00', 'Stromae');

INSERT INTO Tickets (ticket_type, prijs, beschikbaar_aantal)
VALUES
('Standaard Ticket', 50.00, 1000),
('VIP Ticket', 150.00, 500),
('Studententicket', 30.00, 300),
('Familieticket', 120.00, 200),
('Early Bird Ticket', 40.00, 750);

/* VRAAG 4: Schrijf 2 select queries waar minstens een WHERE- en een ORDER BY-clausule in staat. */

-- Query 1
SELECT Naam, OprichtingsJaar
FROM Artiesten
WHERE Genre = 'pop'
ORDER BY OprichtingsJaar;

-- Query 2
SELECT Titel, Duurtijd
FROM Songs
WHERE Duurtijd > 200
ORDER BY Duurtijd DESC;

/* VRAAG 5: Schrijf een query die op zoek gaat naar liedjes waarvan de titel een bepaald stukje tekst bevat */

SELECT Titel
FROM Songs
WHERE Titel LIKE '%standing%';

/* VRAAG 6: Schrijf een query die een kolom toevoegt aan de tabel met Artiesten, om de herkomst van de band vast te leggen met twee tekst-tekens (bv. BE voor België, NL voor Nederland, etc.). */

SET SQL_SAFE_UPDATES = 0;

ALTER TABLE Artiesten
ADD Herkomst CHAR(2);

UPDATE Artiesten
SET Herkomst = 'US'
WHERE Naam LIKE ('Em Beihold');
SET SQL_SAFE_UPDATES = 1;

/* VRAAG 7: Schrijf een query die voor alle Artiesten waarvoor de herkomst nog niet ingevuld werd (= NULL) de waarde 'BE' wordt ingevuld. */

SET SQL_SAFE_UPDATES = 0;
UPDATE Artiesten
SET Herkomst = 'BE'
WHERE Herkomst IS NULL;
SET SQL_SAFE_UPDATES = 1;

/* VRAAG 8: Schrijf een query die de titel en de duurtijd van de songs toont, maar enkel voor de songs waarvan de titel minimaal 20 teksttekens bevat. */

SELECT Titel, Duurtijd
FROM Songs
WHERE LENGTH(Titel) >= 20;

/* VRAAG 9: Schrijf een query die alle genres van artiesten bij elkaar groepeert en een overzicht geeft van hoeveel artiesten er zijn van een bepaald genre. */

SELECT Genre, COUNT(*) AS 'Aantal artiesten per Genre'
FROM Artiesten
GROUP BY Genre;

/* Schrijf een query die per artiest toont wat de som is van de duurtijd van al zijn liedjes (tip: 
groeperen). Toon enkel die artiesten waarvan de naam de letter ‘a’ NIET bevat, en die minstens 
1000 seconden aan liedjes in de database hebben. Voeg een passende sortering toe.

*/
SELECT ArtiestNaam, SUM(Duurtijd) AS TotaleDuurtijd
FROM Songs
GROUP BY ArtiestNaam
HAVING ArtiestNaam NOT LIKE '%a%' AND TotaleDuurtijd >= 1000
ORDER BY TotaleDuurtijd DESC;

