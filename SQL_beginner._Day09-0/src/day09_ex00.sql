SET TIMEZONE = 'Europe/Moscow';

CREATE TABLE person_audit
(
    created timestamp with time zone not null default now() ,
    type_event char(1) not null default 'I' ,
    row_id bigint not null,
    name varchar not null,
    age integer not null default 10,
    gender varchar default 'female' not null ,
    address varchar
);

alter table person_audit add constraint ch_gender check ( gender in ('female','male') );
alter table person_audit add constraint ch_type_event check ( type_event in ('I', 'U', 'D'));

INSERT INTO person_audit(row_id, name, age, gender, address)
(SELECT * FROM person);

CREATE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER AS $$
  BEGIN
    INSERT INTO person_audit( row_id, name, age, gender, address)
    VALUES (NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
    RETURN NEW;
  END;
$$ LANGUAGE plpgsql ;

CREATE TRIGGER trg_person_insert_audit
AFTER INSERT on person
FOR EACH ROW
EXECUTE PROCEDURE fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');
