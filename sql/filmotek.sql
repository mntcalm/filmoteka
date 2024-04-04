CREATE TABLE films (id SERIAL PRIMARY KEY, film_name VARCHAR(255), janre_id INT, release_date DATE, rejiser_id int, descript TEXT, rate FLOAT, poster VARCHAR(255), user_id INT);
CREATE TABLE janre (id SERIAL PRIMARY KEY, janr VARCHAR(255));
CREATE TABLE rejis (id SERIAL PRIMARY KEY, rejiser VARCHAR(255));
CREATE TABLE users (id SERIAL PRIMARY KEY, user_name VARCHAR(255) UNIQUE, passwd VARCHAR(255), role_id INT, locked BOOLEAN);
CREATE TABLE user_type (Id SERIAL PRIMARY KEY, u_type VARCHAR(255));

ALTER TABLE films ADD CONSTRAINT ordering FOREIGN KEY (janre_id) REFERENCES janre (Id);
ALTER TABLE films ADD CONSTRAINT regisr FOREIGN KEY (rejiser_id) REFERENCES rejis(Id) ON DELETE SET NULL;
ALTER TABLE films ADD CONSTRAINT usering FOREIGN KEY (user_id) REFERENCES users (Id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE users ADD CONSTRAINT utyping FOREIGN KEY (role_id) REFERENCES user_type (Id);

\copy janre (id, janr) FROM '/home/calltop/daa_python_film/filmotek/sql/janre.csv' with (format csv,header false, delimiter ',');
\copy rejis (id, rejiser) FROM '/home/calltop/daa_python_film/filmotek/sql/rejis.scv' with (format csv,header false, delimiter ',');
\copy user_type (id, u_type) FROM '/home/calltop/daa_python_film/filmotek/sql/user_type.csv' with (format csv,header false, delimiter ',');
\copy users (id, user_name, passwd, role_id, locked) FROM '/home/calltop/daa_python_film/filmotek/sql/users.csv' with (format csv,header false, delimiter ',');
\COPY films (id, film_name, janre_id, release_date, rejiser_id, descript, rate, poster, user_id) FROM '/home/calltop/daa_python_film/filmotek/sql/films.csv' WITH (FORMAT csv,header false, delimiter ',');

SELECT setval(pg_get_serial_sequence('rejis', 'id'), (SELECT MAX(id) FROM rejis));
SELECT setval(pg_get_serial_sequence('user_type', 'id'), (SELECT MAX(id) FROM user_type));
SELECT setval(pg_get_serial_sequence('films', 'id'), (SELECT MAX(id) FROM films));
SELECT setval(pg_get_serial_sequence('users', 'id'), (SELECT MAX(id) FROM users));
SELECT setval(pg_get_serial_sequence('janre', 'id'), (SELECT MAX(id) FROM janre));