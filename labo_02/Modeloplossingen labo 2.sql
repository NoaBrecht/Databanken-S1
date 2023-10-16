-- Opdracht 1
create table Liedjes (
Artiest varchar(100),
Titel varchar(100),
AantalVerkocht int,
ReleaseJaar int
);

create table Geboortes (
Voornaam varchar(100),
Familienaam varchar(100),
TijdstipGeboorte datetime,
GewichtInKilogram float
);

create table Huisdieren (
Naam varchar(100),
Diersoort varchar(100),
Leeftijd int
);

-- Opdracht 2
insert into Liedjes (Artiest, AantalVerkocht, Titel, ReleaseJaar)
values
("Ghost", 35000, "Call Me Little Sunshine", 2021),
("Led Zeppelin", 1000000, "Stairway to Heaven", 1973),
("Jack Broadbent", 1000, "Woman", 2015),
("Larkin Poe", 15000, "Tom Devil", 2013);

insert into Geboortes (Voornaam, Familienaam, TijdstipGeboorte, GewichtInKilogram)
values
("Adnane", "Lazaar", "1973-07-13 08:11:25", 4.1),
("Dilara", "El Farisi", "1999-10-25 06:11:13", 3.7),
("Mehmet", "Cetinel", "1995-04-01 15:58:50", 2.9),
("Thijs", "Verbeeck", "1990-08-15 19:23:12", 2.7);

insert into Huisdieren (Naam, Diersoort, Leeftijd)
values
('Misty', 'Hond', 9),
('Ming', 'Hond', 11),
('Rambo', 'Kat', 16);

-- Opdracht 3
drop table Huisdieren;

-- Opdrach 4
select Voornaam, Familienaam, GewichtInKilogram 
from Geboortes 
where GewichtInKilogram >= 3 
order by GewichtInKilogram;

-- Opdracht 5
select Titel, Artiest, AantalVerkocht
from Liedjes
where AantalVerkocht >= 5000
order by AantalVerkocht desc;