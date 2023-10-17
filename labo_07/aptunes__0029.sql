use ApDB;
/* Hier noemen we de kolom "Titel" in plaats van "Album".
 * Dat komt omdat de betekenis dan duidelijker is.
 * "Albums.Album" zou niet zo veel zeggen als "Albums.Titel".
 */
create table Albums (Titel varchar(100) not null,
Id int auto_increment primary key);
