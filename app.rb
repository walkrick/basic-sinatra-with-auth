require "sinatra"
require "./lib/user_database"

class App < Sinatra::Application
  def initialize
    super
    @user_database = UserDatabase.new
  end

  get "/" do
    "Hello, world"
  end
end
