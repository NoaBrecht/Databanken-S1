use ApDB;
/* Van waar nu "Naam" in plaats van "Artiest"?
 * Dat komt omdat je de nieuwe tabel al "Artiesten" noemt.
 * "Artiesten.Naam" heeft een duidelijkere betekenis dan "Artiesten.Artiest".
 */
create table Artiesten(
Naam varchar(100) not null,
Id int auto_increment primary key);
