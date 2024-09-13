use olypic;

# List all olympic data
SELECT * FROM olypic.`athletes new`;

# Total number of participants
SELECT count(code) as participants FROM olypic.`athletes new`;

# Total Number of particiaprts per country 
SELECT country, count(code) AS participants
FROM olypic.`athletes new`
Group by country
Order by participants desc;

# Total number of Female and Male
SELECT 
SUM(CASE WHEN gender= 'Male' THEN 1 ELSE 0 END ) as  Male,
SUM(CASE WHEN gender= 'Female' THEN 1 ELSE 0 END) as Female
FROM olypic.`athletes new`;

# Total number of function
# change the column name to activities as function is reserved keyword
ALTER TABLE olypic.`athletes new`
RENAME COLUMN `function` TO activities;
SELECT activities, COUNT(code) AS total_count
FROM olypic.`athletes new`
GROUP BY activities;

# What is the average height and weight 
SELECT  avg(height) as Avgheight, avg(weight) as Avgweight
FROM olypic.`athletes new`;

# Which participant is the tallest and which is the heaviest, and from which countries do they come?

(SELECT 'Talllest' AS Tallest , name_short, height, weight,country 
FROM  olypic.`athletes new`
Order by height Desc
Limit 1) Union All 
(SELECT 'Heaviest' AS Heaviest, name_short , height,weight,country
FROM olypic.`athletes new`
Order by weight Desc
limit 1);

# Which is the oldest and youngest participant and from which countries do they come?
(SELECT 'Oldest' As Oldest,name_short,birth_date,TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) AS age,country FROM  olypic.`athletes new`
Order by birth_date asc
limit 1)
union all 
(SELECT 'Youngest'  AS younger,name_short,birth_date,TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) AS age,country FROM  olypic.`athletes new`
Order by birth_date desc
limit 1);

# Total number partici[ating for other countries 