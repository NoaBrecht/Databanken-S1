SET sql_safe_updates = 0;
UPDATE ApDB.AuteursBoeken
SET Titel = 'Pet Cemetery'
WHERE Titel = 'Pet Sematary';
SET sql_safe_updates = 1;

-- Een update werkt niet voor Steven / Stephen King omdat CONCAT gebruikt wordt
-- Het systeem kan de aangeleverde naam niet eenduidig herleiden tot een kolom in de tabel Personen.
-- Volgend statement zal dus NIET lukken.
UPDATE AuteursBoeken
SET Auteur = 'Steven King'
WHERE Auteur = 'Stephen King';
