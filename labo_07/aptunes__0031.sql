use ApDB;
alter table Albums
add column Artiesten_Id int,
add constraint fk_Albums_Artiesten foreign key (Artiesten_Id) references Artiesten(Id);
