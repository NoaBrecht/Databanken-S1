use ApDB;
alter table Nummers
add column Artiesten_Id int,
add constraint fk_Nummers_Artiesten foreign key (Artiesten_Id) references Artiesten(Id);
