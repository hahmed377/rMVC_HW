class MovieController < Sinatra::Base
# Sets the root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

# sets the view directory correctly
  set :views, Proc.new { File.join(root, 'Views')}
  # this will set the configure that will allow the user to make changes while development without reset the reset.
  set :public, Proc.new {File.join(root, "Public")}
  configure :development do
    register Sinatra::Reloader
  end



  get "/" do
    @title = "Hanad's movies"
    @movies = Movie.all
    erb :'movies/index'
  end

  get "/new" do
    @title = "New"
    @movie = Movie.new
    erb :'movies/new'
  end

  # this will display a specific movies by calling a specific id number.
  get "/:id" do
    id = params[:id].to_i
    @movie = Movie.find(id)
    erb :'movies/show'
  end

  post "/" do
    movie = Movie.new
    movie.title = params[:title]
    movie.description = params[:description]
    movie.year_released = params[:year_released]
    movie.img_url = params[:img_url]
    movie.save
    redirect "/"
  end

  put "/:id" do
    id = params[:id].to_i

    movie = Movie.find(id)
    movie.title = params[:title]
    movie.description = params[:description]
    movie.year_released = params[:year_released]
    movie.img_url = params[:img_url]
    movie.save
    redirect "/"
  end

  delete "/:id" do
    id = params[:id].to_i
    $movies = Movie.destory(id)
    redirect "/"
  end

  get "/:id/edit" do
    @title = "Edit"
    id = params[:id].to_i
    @movie = Movie.find(id)
    erb :'movies/edit'

  end
end
