use ApDB;
alter table Nummers
drop column Artiest;
alter table Nummers
change Artiesten_Id Artiesten_Id int not null;
/* eigenlijk kan dit ook in één instructie,
 * maar dat behoort niet tot de leerstof
 * dat zou zijn:
 * alter table Nummers drop column Artiest, change Artiesten_Id Artiesten_Id int not null;
 * kan zelfs nog korter, maar opnieuw: geen leerstof
 * alter table Nummers drop column Artiest, modify Artiesten_Id int not null;
 */
