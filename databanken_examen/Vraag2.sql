/*
Geef voor elk van de posities (A, B, C en D) aan of de multipliciteit 1 of 1..* moet zijn. Noteer 
deze oplossing in commentaar in je scriptbestand.
A: 1
B: 1
C: veel
D: veel
*/

/*Noteer in commentaar in je scriptbestand welke (primaire en/of vreemde) sleutelkolommen 
je aan elke tabel moet toevoegen.

STUDENTEN
student Id primare sleutel

Inschrijving
student id vreemde sleutel
inschrijving id primaire sleutel

Sportactiviteiten
inschrijving id vreemde sleutel
activiteit id primaire sleutel
*/


/*Schrijf ten slotte een script dat veronderstelt dat al deze sleutelkolommen aanwezig zijn, en  
de gegevens uit de tabellen toont zoals in de voorbeeldtabel aan het begin van deze opgave. */

select studenten.Voornaam as 'student', sportactiviteiten.Activiteitnaam as 'Sportactiviteit', Inschrijving.DatumInschrijving as 'Ingeschreven'
from 