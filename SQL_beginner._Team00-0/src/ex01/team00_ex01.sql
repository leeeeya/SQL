SELECT * FROM all_tours
WHERE total_cost = (SELECT MIN(total_cost) FROM all_tours)
    OR total_cost = (SELECT MAX(total_cost) FROM all_tours)
ORDER BY 1, 2;