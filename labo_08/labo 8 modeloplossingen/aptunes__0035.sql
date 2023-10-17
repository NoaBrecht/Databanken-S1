CREATE TABLE GebruikerHeeftAlbum(
Gebruikers_Id INT NOT NULL, 
Albums_Id INT NOT NULL, 
DatumToevoeging DATETIME NOT NULL,
CONSTRAINT fk_GebruikerHeeftAlbum_Gebruikers FOREIGN KEY (Gebruikers_Id) REFERENCES Gebruikers(Id),
CONSTRAINT fk_GebruikerHeeftAlbum_Albums FOREIGN KEY (Albums_Id) REFERENCES Albums(Id));