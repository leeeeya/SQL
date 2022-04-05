CREATE FUNCTION fnc_trg_person_delete_audit() RETURNS TRIGGER AS $person_audit$
    BEGIN
        INSERT INTO person_audit(type_event, row_id, name, age, gender, address)
        VALUES ('D', OLD.*);
        RETURN OLD;
    END;
$person_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_delete_audit AFTER DELETE ON person
FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;