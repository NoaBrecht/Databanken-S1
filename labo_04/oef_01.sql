CREATE table if not exists Games(
Titel varchar(100),
Releasedatum datetime,
Genre varchar(20),
Uitgever varchar(100));

INSERT INTO Games (Titel, Releasedatum, Genre, Uitgever)
VALUES
    ('The Diofield Chronicle', '2022-09-22', 'strategy', 'Square Enix'),
    ('Beacon Pines', '2022-09-22', 'adventure', NULL),
    ('Mario vs. Rabbids: Sparks of Hope', '2022-10-21', 'strategy', 'Ubisoft');
