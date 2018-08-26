DROP TABLE IF EXISTS movie;

CREATE TABLE movie (

  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  description TEXT

);

INSERT INTO movie (title , description) VALUES ('Movie 1' , 'description 1');
INSERT INTO movie (title , description) VALUES ('Movie 2' , 'description 2');
INSERT INTO movie (title , description) VALUES ('Movie 3' , 'description 3');
INSERT INTO movie (title , description) VALUES ('Movie 4' , 'description 4');
