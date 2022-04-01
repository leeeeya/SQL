SELECT person.name, count(visit_date) as count_of_visits
FROM person_visits
JOIN person on person_visits.person_id = person.id
GROUP BY person.name
ORDER BY 2 DESC
LIMIT 5;