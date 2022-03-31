ALTER TABLE person_discounts
ADD CONSTRAINT ch_nn_person_id check(person_id is not NULL);

ALTER TABLE person_discounts
ADD CONSTRAINT ch_nn_pizzeria_id check(pizzeria_id is not NULL);

ALTER TABLE person_discounts
ADD CONSTRAINT ch_nn_discount check(discount_percentage is not NULL);

ALTER TABLE person_discounts
   ALTER  discount_percentage SET DEFAULT 0;

ALTER TABLE person_discounts
ADD CONSTRAINT ch_range_discount
    check ((discount_percentage >= 0 AND discount_percentage <= 100));
