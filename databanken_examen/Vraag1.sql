/*OEFENING 1*/
CREATE TABLE IF NOT EXISTS Klanten (
id INT PRIMARY KEY AUTO_INCREMENT,
Naam VARCHAR(45));

CREATE TABLE IF NOT EXISTS Bestelbons (
id INT PRIMARY KEY AUTO_INCREMENT,
Klanten_id INT,
CONSTRAINT fk_BestelBons_Klanten FOREIGN KEY (Klanten_id)
REFERENCES Klanten(id)
);

CREATE TABLE IF NOT EXISTS BestellingenVoorEenProduct (
id INT PRIMARY KEY AUTO_INCREMENT,
AantalVanProduct TINYINT,
Bestelbons_id INT,
Producten_id INT,
CONSTRAINT fk_BestellingenVoorEenProduct_Bestelbons FOREIGN KEY (Bestelbons_id)
REFERENCES Bestelbons(id),
CONSTRAINT fk_BestellingenVoorEenProduct_Producten FOREIGN KEY (Producten_id)
REFERENCES Producten(id)
);

CREATE TABLE IF NOT EXISTS Producten (
id INT PRIMARY KEY AUTO_INCREMENT,
Omschrijving varchar(45),
Basisprijs INT);

/* INSERTS */
INSERT INTO Klanten ( Naam )
VALUES
('Vincent'),
('Peter'),
('Erwin');

INSERT INTO PRODUCTEN ( Omschrijving, Basisprijs)
values
('Boek',10),
('Zeep',1),
('Kanarie',7),
('Modelauto',24),
('Modelvliegtuig',30);

INSERT INTO Bestelbons ( Klanten_id )
values
(1),
(2),
(2),
(3),
(3);

INSERT INTO BestellingenVoorEenProduct ( Bestelbons_id,AantalVanProduct, Producten_id )
values
(1, 3, 1),
(1, 1, 2),
(2, 2, 1),
(3, 2, 3),
(4, 1, 4),
(4, 1, 5);

/* Controle voor oefening 1*/
select Klanten.Naam as 'Klant', Bestelbons.Id as 'Bestelbon',
Producten.Omschrijving as 'Soort item',
BestellingenVoorEenProduct.AantalVanProduct as 'Aantal items',
Basisprijs
from Producten inner join BestellingenVoorEenProduct
on Producten.Id = Producten_Id
inner join Bestelbons
on Bestelbons.Id = Bestelbons_Id 
inner join Klanten
on Klanten_Id = Klanten.Id;