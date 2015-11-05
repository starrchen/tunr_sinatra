require "bundler/setup"
require "pg"
require "active_record"
require "sinatra"
require "sinatra/reloader"
require "pry"

require_relative "artists_controller.rb"
require_relative "db/connection"
require_relative "models/artist"
require_relative "models/song"

# RESTful interface below

get '/' do
  erb :home
end

# End of code
# binding.pry
# puts "Fin"
