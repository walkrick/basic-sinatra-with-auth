require "sinatra"
require "rack-flash"

require "./lib/user_database"

class App < Sinatra::Application
  enable :sessions
  use Rack::Flash

  def initialize
    super
    @user_database = UserDatabase.new
  end

  get "/" do
    erb :home
  end

  get "/registration" do
    erb :registration
  end

  post "/registration" do
    flash[:notice] = "Thank you for registering"
    @user_database.insert({username: params[:name], password: params[:password]})
    redirect "/"
  end

  # post "/" do
  #   flash[:login] = "Welcome," + params[:name]
  #   redirect "/"
  #
  # end
end
