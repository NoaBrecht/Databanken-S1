use ApDB;

-- debug script 1
drop table if exists Boeken;
create table Boeken (Titel varchar(100), Uitgeverij varchar(100), Jaartal smallint unsigned);
insert into Boeken (Titel, Uitgeverij, Jaartal) values ('Fabels', 'Editions Minuit', 2021-50);

-- debug script 2
use ApDB;
-- schrijfwijze van select is geen probleem
SeLeCT Titel from Boeken;

-- debug script 3
insert into Boeken values ("De geschiedenis van Rock 'n Roll", 'De Hasque', 2011);
drop table if exists Liedjes;
-- tinyint was te klein
CREATE TABLE Liedjes(Titel VARCHAR(100), Duurtijd int);
-- het liedje duurt vijf minuten
-- de kolommen hoeven er niet te staan als we ze allemaal invullen
insert into Liedjes values ("Ain't talkin' 'bout Love", 5 * 60);

-- vraag 2
create table Boeken (
Titel varchar(50),
JaarUitgave int
);

-- vraag 3
create table Kunstwerken (
Auteur varchar(100),
Titel varchar(100),
Waarde float
);

-- vraag 4
insert into Kunstwerken (Auteur, Titel, Waarde)
values
('Pablo Picasso', 'Guernica', 2000000),
('Auguste Rodin', 'De Denker', 1000000),
('Leonardo Da Vinci', 'Mona Lisa', 2000000);