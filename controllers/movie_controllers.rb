class MovieController < Sinatra::Base
# Sets the root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

# sets the view directory correctly
  set :views, Proc.new { File.join(root, 'Views')}
  # this will set the configure that will allow the user to make changes while development without reset the reset.
  configure :development do
    register Sinatra::Reloader
  end
#
  $movies = [{
    id: 0,
    title: "Ant-Man and Wasp",
    description: "this is the first movie",
    image: "https://nerdist.com/wp-content/uploads/2018/07/ant-man-and-the-wasp-spoilers.jpg"

    },
    {
      id: 1,
      title: "Incredibles 2",
      description: "this is the second movie",
      image: "https://static.goldderby.com/wp-content/uploads/2018/06/Incredibles-2-Pixar-620x360.jpg"
    },
      {
        id:2,
        title: "The spy who dumped me",
        description: "this is the third movie",
        image: "https://cdn.flickeringmyth.com/wp-content/uploads/2018/06/Spy-Who-Dumped-Me-UK-poster-600x450.jpg"
      },
      {
        id:3,
        title: "Mamma Mia! Here we go",
        description: "this is the fourth movie",
        image: "https://www.hertfordtheatre.com/system/expressionengine/third_party/eventmanager/images/normals/mama_mia_quad.jpg"
        }]

  get "/" do
    @title = "Hanad's movies"
    @movies = Movie.all
    erb :'movies/index'
  end

  get "/new" do
    @title = "New"
    @movie = Post.new
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
    post.title = params[:title]
    post.description = params[:description]
    post.save
    redirect "/"
  end

  put "/:id" do
    id = params[:id].to_i

    movie = Movie.find(id)
    movie.title = params[:title]
    movie.description = params[:description]
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
