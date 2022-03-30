CREATE INDEX idx_person_name on person(name);
Set enable_seqscan to off;

EXPLAIN ANALYSE
SELECT upper(name)
FROM person;