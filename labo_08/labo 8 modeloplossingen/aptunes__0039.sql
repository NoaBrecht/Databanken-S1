CREATE TABLE GebruikerHeeftLiedje(
Gebruikers_Id INT NOT NULL, 
Liedjes_Id INT NOT NULL, 
Favoriet INT NOT NULL,
CONSTRAINT fk_GebruikerHeeftLiedje_Gebruikers FOREIGN KEY (Gebruikers_Id) REFERENCES Gebruikers(Id),
CONSTRAINT fk_GebruikerHeeftLiedje_Albums FOREIGN KEY (Liedjes_Id) REFERENCES Liedjes(Id));