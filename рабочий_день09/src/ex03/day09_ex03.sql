DROP TRIGGER trg_person_delete_audit ON person;
DROP TRIGGER trg_person_insert_audit ON person;
DROP TRIGGER trg_person_update_audit ON person;
DROP FUNCTION fnc_trg_person_delete_audit();
DROP FUNCTION fnc_trg_person_insert_audit();
DROP FUNCTION fnc_trg_person_update_audit();
TRUNCATE person_audit;

CREATE FUNCTION fnc_trg_person_audit() RETURNS TRIGGER AS $person_audit$
    BEGIN
        IF (TG_OP = 'INSERT') THEN
            INSERT INTO person_audit(row_id, name, age, gender, address)
            VALUES (NEW.*);
            RETURN NEW;
        ELSEIF (TG_OP = 'UPDATE') THEN
            INSERT INTO person_audit(type_event, row_id, name, age, gender, address)
            VALUES ('U', OLD.*);
            RETURN OLD;
        ELSEIF (TG_OP = 'DELETE') THEN
            INSERT INTO person_audit(type_event, row_id, name, age, gender, address)
            VALUES ('D', OLD.*);
            RETURN OLD;
        END IF;
        RETURN NULL;
    END;
$person_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_audit AFTER INSERT OR DELETE OR UPDATE ON person
FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_audit();

INSERT INTO person(id, name, age, gender, address)
VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;