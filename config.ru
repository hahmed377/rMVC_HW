require 'sinatra'
require 'sinatra/contrib'
# changes the file without restarting the whole server
require 'sinatra/reloader' if development?
require 'pry'
require 'pg'
require_relative "./models/movies.rb"
# require_relative "./public/style.css"
require_relative "./controllers/movie_controllers.rb"
require 'Rack'
# information goes into the body of the request
# get is request word
use Rack::Reloader
use Rack::MethodOverride
# this will direct the request to the correct controller
run MovieController
