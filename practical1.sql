DROP DATABASE IF EXISTS tele_sales;
CREATE DATABASE IF NOT EXISTS tele_sales; 
USE tele_sales;


select*from lindoprac;


SELECT User, Date, Count(Number) AS CountOfNumber
FROM 
lindoprac
GROUP BY 
User, Date
;

SELECT lindoprac.Number, Count(lindoprac.Number) AS CountOfNumber
FROM lindoprac
GROUP BY lindoprac.Number
ORDER BY Count(lindoprac.Number) DESC;

SELECT User,Result, Count(Number) AS CountOfNumber, Date, Number
FROM lindoprac
GROUP BY User, Result, Date , Number
ORDER BY Count(Number) DESC;

SELECT lindoprac.User, Date(Date) as mydate, Round(COUNT(Result)/
    (SELECT COUNT(Result)
      FROM lindoprac)*100, 1) AS Percentage
FROM lindoprac
WHERE ((lindoprac.Result)="Answered")
Group by lindoprac.User, Date(Date) ;

SELECT Number, Count(Number) AS CountOfNumber
FROM lindoprac
GROUP BY Number
ORDER BY Count(Number) DESC
Limit 10;

SELECT lindoprac.User, Date(Date) as mydate, Count(lindoprac.Number) AS CountOfNumber,
case
                when Count(lindoprac.Number) < 100 then 'Less than 100 dials'
                else 'More than 100 dials'
END AS Dials
FROM 
lindoprac
GROUP BY 
lindoprac.User, Date(Date) 
;

select
User,
Date,
min(Time) as starttime,
max(Time) as endtime,
round((max(Time)- min(Time))) as duration
from
lindoprac
Group by User, Date;