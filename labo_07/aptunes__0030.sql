use ApDB;
insert into Albums(Titel)
(select distinct Album from Nummers);
