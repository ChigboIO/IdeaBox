#require "bundler"
require "sinatra"
require "sinatra/base"
require "sinatra/activerecord"
require "active_record"
require "sinatra/reloader" if :development
require "sinatra/flash"
require "byebug" if :development
#require "sessions"
#require_relative "controllers/auth"
#require "sinatra/activerecord/rake"
#Bundler.require :default, (ENV["RACK_ENV"] || "development").to_sym

class App < Sinatra::Base
	#helpers ApplicationHelper

  # set folder for templates to ../views, but make the path absolute
  set :views, File.expand_path('../../views', __FILE__)

  set :public_folder, File.expand_path('../../../public', __FILE__)

  enable :sessions

  # don't enable logging when running tests
  configure :production, :development do
    #enable :logging
    register Sinatra::Flash
  end
  configure :development do
  	register Sinatra::Reloader
  end

end

#Dir[File.dirname(__FILE__) + "/config/*.rb"].each { |file| require file }