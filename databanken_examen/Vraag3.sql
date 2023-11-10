/*3.1*/
SELECT * from sprinttijden
WHERE  tijd <= 15 AND Leeftijd <= 20 or tijd < 30 AND Leeftijd >=80;

/*3.2*/
select round(Tijd) as 'afgeronde tijd'
from sprinttijden
where tijd <=30
order by round(Tijd)