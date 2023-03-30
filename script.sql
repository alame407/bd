DROP TYPE IF EXISTS DIFFICULTY CASCADE;
DROP TABLE IF EXISTS
	society,
	city,
	task,
	culture,
	barrier,
	society_have_culture,
	society_have_task
	CASCADE;
CREATE TYPE DIFFICULTY AS ENUM ('easy', 'normal', 'hard');
CREATE TABLE society(
    id serial PRIMARY KEY,
	name text NOT NULL
);
CREATE TABLE city(
	id serial PRIMARY KEY,
	name text NOT NULL UNIQUE,
	id_society INTEGER REFERENCES society(id) ON DELETE SET NULL
);
CREATE TABLE task(
	id serial PRIMARY KEY,
	name text NOT NULL UNIQUE,
	difficulty DIFFICULTY
);
CREATE TABLE culture(
	id serial PRIMARY KEY,
	name text NOT NULL UNIQUE
);
CREATE TABLE barrier(
	id serial PRIMARY KEY,
	name text NOT NULL UNIQUE,
	id_city INTEGER REFERENCES city(id) ON DELETE CASCADE NOT NULL 
);
CREATE TABLE society_have_culture(
	id serial PRIMARY KEY,
	id_society INTEGER REFERENCES society(id) ON DELETE CASCADE NOT NULL,
	id_culture INTEGER REFERENCES culture(id) ON DELETE CASCADE NOT NULL 
);
CREATE TABLE society_have_task(
	id serial PRIMARY KEY,
	id_society INTEGER REFERENCES society(id) ON DELETE CASCADE NOT NULL,
	id_task INTEGER REFERENCES task(id) ON DELETE CASCADE NOT NULL 
);
INSERT INTO society(name)
VALUES
	('Diaspor society'),
	('Liz society');
INSERT INTO city(name, id_society)
VALUES
	('Diaspor',1),
	('Liz',2);
INSERT INTO task(name, difficulty)
VALUES
	('save culture', 'normal'),
	('combine culture', 'hard');
INSERT INTO culture(name)
VALUES
	('Diaspor culture'),
	('Liz culture');
INSERT INTO barrier(name, id_city)
VALUES
	('Diaspor barrier', 1),
	('Liz barrier', 2);
INSERT INTO society_have_task(id_society, id_task)
VALUES
	(1,2),
	(2,1);
INSERT INTO society_have_culture(id_society,id_culture)
VALUES
	(1,1),
	(2,2);