CREATE TABLE LiedjeOpAlbum(
Liedjes_Id INT NOT NULL, 
Albums_Id INT NOT NULL, 
Tracknummer INT,
CONSTRAINT fk_LiedjeOpAlbum_Liedjes FOREIGN KEY (Liedjes_Id) REFERENCES Liedjes(Id),
CONSTRAINT fk_LiedjeOpAlbum_Albums FOREIGN KEY (Albums_Id) REFERENCES Albums(Id));