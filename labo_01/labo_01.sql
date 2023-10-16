use 2324M_VDBNOA;
drop table if exists Boeken;
create table Boeken (Titel varchar(100), Uitgeverij varchar(100), Jaartal smallint unsigned);



-- we willen uitdrukken dat het boek 50 jaar geleden is verschenen
-- maar we willen het rekenwerk niet zelf doen!
insert into Boeken (Titel, Uitgeverij, Jaartal) values ("Fabels", "Editions Minuit", 2021-50);