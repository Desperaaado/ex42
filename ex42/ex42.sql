CREATE TABLE person (
    id INTEGER PRIMARY KEY,
    fname TEXT,
    lname TEXT,
    age INTEGER
);

CREATE TABLE pet (
    id INTEGER PRIMARY KEY,
    name TEXT,
    breed TEXT,
    age INTEGER,
    dead INTEGER
);

CREATE TABLE person_pet (
    person_id INTEGER,
    pet_id INTEGER
);

INSERT INTO person (id, fname, lname, age)
    VALUES (0, 'yx', 'xiao', 26);
INSERT INTO pet (id, name, breed, age, dead)
    VALUES (0, 'Peppa', 'pig', 2, 0);
INSERT INTO pet (id, name, breed, age, dead)
    VALUES (1, 'WALL-E', 'robot', 500, 1);
INSERT INTO pet (id, name, breed, age, dead)
    VALUES (2, 'noname', 'tea', 5, 1);
INSERT INTO person (id, fname, lname, age)
    VALUES (1, 'hole', 'ass', 999);
INSERT INTO person_pet (person_id, pet_id)
    VALUES (0, 0);
INSERT INTO person_pet (person_id, pet_id)
    VALUES (0, 1);
INSERT INTO person_pet (person_id, pet_id)
    VALUES (1, 2);

SELECT * FROM person;
UPDATE person SET fname = 'yuxiang' WHERE id in (
    SELECT person.id FROM person, pet, person_pet
    WHERE
    person_pet.person_id = person.id AND
    person_pet.pet_id = pet.id AND
    pet.name = 'Peppa'
);
SELECT * FROM person;

INSERT INTO person (id, fname, lname, age)
    VALUES (0, 'bb', 'aa', 27);  /*This should fail.*/
INSERT OR REPLACE INTO person (id, fname, lname, age)
    VALUES (0, 'bb', 'aa', 27); 
REPLACE INTO person (id, fname, lname, age)
    VALUES (0, 'yx', 'xiao', 26); 
SELECT * FROM person;

UPDATE person SET fname = 'aabbccdd' WHERE id = 1;
SELECT * FROM person;

SELECT * FROM pet;
UPDATE pet SET dead = 'DECEASED' WHERE dead = 1;
SELECT * FROM pet;

UPDATE pet SET dead = 1 WHERE dead = 'DECEASED';
SELECT * FROM pet WHERE dead = 1;
DELETE FROM pet WHERE dead = 1;
INSERT INTO pet (id, name, breed, age, dead)
    VALUES (1, 'WALL-E', 'robot', 500, 1);
INSERT INTO pet  (id, name, breed, age, dead)
    VALUES (2, 'noname', 'tea', 5, 1);
SELECT * FROM pet WHERE dead = 1;

SELECT * FROM pet;
DELETE FROM pet WHERE id IN (
    SELECT pet.id FROM person, pet, person_pet
    WHERE
    person_pet.person_id = person.id AND
    person_pet.pet_id = pet.id AND
    person.lname = 'xiao'
);
SELECT * FROM pet;
SELECT * FROM person_pet;
DELETE FROM person_pet WHERE pet_id NOT IN (
    SELECT id FROM pet
);
SELECT * FROM person_pet;

