DROP TABLE IF EXISTS
	PERSON,
	ACTION,
	ANIMAL,
	SOUND,
	PERSON_ACTION,
	ANIMAL_ACTION
	CASCADE;



CREATE TABLE PERSON(
	id serial  PRIMARY KEY,
	name text NOT NULL,
	age smallint NOT NULL
					CHECK(age>0)
);

CREATE TABLE ANIMAL(
	id serial PRIMARY KEY,
	name text NOT NULL
);

CREATE TABLE ACTION(
	id serial PRIMARY KEY,
	name text NOT NULL
);

CREATE TABLE SOUND(
	id serial PRIMARY KEY,
	name text NOt NULL,
	person_id INTEGER REFERENCES PERSON(id) ON DELETE SET NULL,
	animal_id INTEGER REFERENCES ANIMAL(id) ON DELETE SET NULL
);

CREATE TABLE PERSON_ACTION(
	id serial PRIMARY KEY,
	action_id INTEGER REFERENCES ACTION(id) ON DELETE CASCADE,
	person_id INTEGER REFERENCES PERSON(id) ON DELETE CASCADE
);
CREATE TABLE ANIMAL_ACTION(
	id serial PRIMARY KEY,
	action_id INTEGER REFERENCES ACTION(id) ON DELETE CASCADE,
	animal_id INTEGER REFERENCES ANIMAL(id) ON DELETE CASCADE
);

INSERT INTO PERSON(name, age)
VALUES
	('Tina', 17),
	('Daniel', 14),
	('ALEX', 20);

INSERT INTO ANIMAL(name)
VALUES
	('sloth'),
	('seabird'),
	('lizard');
	
INSERT INTO ACTION(name)
VALUES
	('wait'),
	('stop'),
	('appear'),
	('watch');

INSERT INTO PERSON_ACTION(action_id, person_id)
VALUES
	(1,1),
	(1,2),
	(3,3);

INSERT INTO ANIMAL_ACTION(action_id, animal_id)
VALUES
	(3,3),
	(1,2);
	
INSERT INTO SOUND(name, person_id, animal_id)
VALUES
	('chirping', 1, 1),
	('rustling', 3, 2);
	


