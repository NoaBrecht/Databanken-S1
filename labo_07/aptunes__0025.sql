use ApDB;
insert into Artiesten(Naam)
(select distinct Artiest from Nummers);
