DROP TABLE IF EXISTS movie;

CREATE TABLE movie (

  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  description TEXT,
  year_released VARCHAR(255),
  img_url TEXT

);

INSERT INTO movie (title , description, year_released, img_url) VALUES ('Movie 1' , 'description 1','year_released','img_url');
INSERT INTO movie (title , description, year_released, img_url) VALUES ('Movie 2' , 'description 2','year_released', 'img_url');
INSERT INTO movie (title , description, year_released, img_url) VALUES ('Movie 3' , 'description 3','year_released', 'img_url');
INSERT INTO movie (title , description, year_released, img_url) VALUES ('Movie 4' , 'description 4','year_released', 'img_url');
