DROP TABLE IF EXISTS movie;

CREATE TABLE movie (

  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  description TEXT,
  year_released VARCHAR(255),
  img_url TEXT

);

INSERT INTO movie (title , description, year_released, img_url) VALUES ('Ant-Man and Wasp' , 'this is the first movie','2018','https://nerdist.com/wp-content/uploads/2018/07/ant-man-and-the-wasp-spoilers.jpg');
INSERT INTO movie (title , description, year_released, img_url) VALUES ('Incredibles 2' , 'this is the second movie','2018', 'https://static.goldderby.com/wp-content/uploads/2018/06/Incredibles-2-Pixar-620x360.jpg');
INSERT INTO movie (title , description, year_released, img_url) VALUES ('The spy who dumped me' , 'this is the third movie','year_released', 'https://cdn.flickeringmyth.com/wp-content/uploads/2018/06/Spy-Who-Dumped-Me-UK-poster-600x450.jpg');
INSERT INTO movie (title , description, year_released, img_url) VALUES ('Mamma Mia! Here we go' , 'this is the fourth movie','year_released', 'https://www.hertfordtheatre.com/system/expressionengine/third_party/eventmanager/images/normals/mama_mia_quad.jpg');
