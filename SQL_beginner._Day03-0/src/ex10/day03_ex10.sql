INSERT INTO person_order
VALUES ((SELECT MAX(id) FROM person_order) + 1,
        (SELECT id FROM person WHERE name = 'Denis'),
        (SELECT id FROM pizzeria WHERE name = 'Dominos'),
        '2022-02-24');

INSERT INTO person_order
VALUES ((SELECT MAX(id) FROM person_order) + 1,
        (SELECT id FROM person WHERE name = 'Irina'),
        (SELECT id FROM pizzeria WHERE name = 'Dominos'),
        '2022-02-24');