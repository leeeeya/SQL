SELECT address,
       ROUND(MAX(age) - MIN(age) / MAX(age), 2) as formula,
       ROUND(SUM(age) / count(age), 2) as average,
       MAX(age) - (MIN(age) / MAX(age)) > SUM(age) / count(age) as comparison
FROM person
GROUP BY address
ORDER BY address;

