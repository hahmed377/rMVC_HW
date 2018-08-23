class MovieController < Sinatra::Base
# Sets the root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

# sets the view directory correctly
  set :views, Proc.new { File.join(root, 'Views')}




configure :development do
  register Sinatra::Reloader
end


  $movies = [{
    id:0,
    title: "Ant-Man and Wasp",
    description: "this is the first movie"
    },
    {
      id:1,
      title: "Incredibles 2",
      description: "this is the second movie"
    },
      {
        id:2,
        title: "The spy who dumped me",
        description: "this is the third movie"
      },
      {
        id:3,
        title: "Mamma Mia! Here we go",
        description: "this is the fourth movie"
        }
      ]


  get "/" do
    @title = "Hanad's movies"
    @movies = $movies
    erb :'movies/index'
  end

  get "/new" do
    @title = "New"
    @movie = {
      id: "",
      title: "",
      description: ""
    }
    erb :'movies/new'


  end

  # this will display a specific movies by calling a specific id number.
  get "/:id" do
    id = params[:id].to_i
    @movie = $movies[id]

    erb :'movies/show'
  end

  post "/" do
    new_movies = {
      id: $movies.length,
      title: params[:title],
      description: params[:description]
    }
    $movies.push(new_movies)
    redirect "/"
  end

  put "/:id" do
    id = params[:id].to_i
    movie = $movies[id]
    movie[:title] = params[:title]
    movie[:description] = params[:description]
    $movies[id] = movie

    redirect "/"

  end

  delete "/:id" do
    id = params[:id].to_i
    $movies.delete_at(id)
    redirect "/"
  end

  get "/:id/edit" do
    @title = "Edit"
    id = params[:id].to_i
    @movie = $movies[id]
    erb :'movies/edit'

  end






end
