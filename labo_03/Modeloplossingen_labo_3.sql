-- Oefening 1
set sql_safe_updates = 0;
delete
from Liedjes
where AantalVerkocht < 2000;
set sql_safe_updates = 1;

-- Oefening 2
set sql_safe_updates = 0;
update Geboortes
set GewichtInKilogram = 2.8
where Voornaam = 'Thijs' and Familienaam = 'Verbeeck';
set sql_safe_updates = 1;

-- Oefening 3
set sql_safe_updates = 0;
update Liedjes
set AantalVerkocht = 10 * AantalVerkocht;
set sql_safe_updates = 1;

-- Oefening 4
set sql_safe_updates = 0;
update Geboortes
set Familienaam = concat(substring(Familienaam, 1, 1), '.');
set sql_safe_updates = 1;

-- Oefening 5
select Artiest
from Liedjes
where Artiest like '%E%';

-- Oefening 6
select *
from Geboortes
where TijdstipGeboorte < '1996-01-01 00:00:00' and GewichtInKilogram <= 3;

-- Oefening 7
select Titel
from Liedjes
where not (Titel like '%O%'); -- mag ook met NOT LIKE

-- Oefening 8
select concat(Artiest, ' - ', Titel, '.mp3') as Filenaam
from Liedjes;
