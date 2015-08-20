require "sinatra/base"
# pull in the helpers and controllers
Dir.glob('./app/{helpers,controllers,models}/*.rb').each { |file| require file }

#require './app.rb'
map('/') {run HomeController}
map('/auth') { run AuthController}
map('/ideas') { run IdeasController}
map('/members') { run MembersController}
#run App