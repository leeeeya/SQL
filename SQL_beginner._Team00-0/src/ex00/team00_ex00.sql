CREATE VIEW first_move AS
    (SELECT concat(node1, ',', node2) as route,
            node1, node2, cost as added_cost, cost as res_sum
            FROM costs
            WHERE node1 = 'A');

CREATE VIEW all_tours AS
(WITH RECURSIVE ways AS
        (SELECT DISTINCT node1 as route, node1, node2, cost, cost AS sum
        FROM costs
        WHERE node1 = 'A'
        UNION
        SELECT DISTINCT concat(add.route, ',', basic.node1) as route, basic.node1, basic.node2,
               basic.cost, basic.cost + add.sum AS sum
        FROM costs as basic
        JOIN ways as add on add.node2 = basic.node1
        where length(route) < 7 AND add.node1 != basic.node2)
SELECT sum as total_cost,  concat('{', route, ',', node2, '}') as tour
FROM ways
WHERE length(route) = 7 AND node2 = 'A');

SELECT *
FROM all_tours
WHERE total_cost = (SELECT MIN(total_cost) FROM all_tours)
ORDER BY 1, 2;
