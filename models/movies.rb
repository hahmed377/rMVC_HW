class Movie

  attr_accessor(:id, :title, :description, :year_released, :img_url)

  def self.open_connection
    conn = PG.connect(dbname: "movie")
  end

  def save
    conn = Movie.open_connection

    if (!self.id)
      sql = "INSERT INTO movie (title, description, year_released, img_url) VALUES ('#{self.title}', '#{self.description}','#{self.year_released}','#{self.img_url}')"
    else
      sql = "UPDATE movie SET title='#{self.title}', description='#{self.description}', year_released='#{self.year_released}', img_url='#{self.img_url}' WHERE id = #{self.id}"
    end
    conn.exec(sql)
  end

  def self.all
    conn = self.open_connection

    sql = "SELECT id, title, description, year_released, img_url FROM movie ORDER BY id"

    results = conn.exec(sql)

    movies = results.map do |result|
      self.hydrate(result)
    end
    movies
  end

  def self.find(id)
    conn = self.open_connection
    sql = "SELECT * FROM movie WHERE id=#{id} LIMIT 1"
    movies_result = conn.exec(sql)
    movie = self.hydrate(movies_result[0])
    movie
  end


  def self.destory(id)

    conn = self.open_connection
    sql = "DELETE FROM movie WHERE id=#{id}"
    conn.exec(sql)

  end

  def self.hydrate(movie_data)
    movie = Movie.new

    movie.id = movie_data["id"]
    movie.title = movie_data["title"]
    movie.description = movie_data["description"]
    movie.year_released = movie_data["year_released"]
    movie.img_url = movie_data["image"]

    movie
  end

end
