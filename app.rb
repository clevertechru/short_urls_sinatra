require './dependencies'

class App < Sinatra::Base
  set :root, File.dirname(__FILE__)

  DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/#{Sinatra::Application.environment}.sqlite")
  Dir['./app/models/*.rb'].sort.each { |file| require file }
  DataMapper.finalize

  (Dir['./app/helpers/*.rb'].sort + Dir['./app/controllers/*/*.rb'].sort).each { |file| require file }

  set :haml, {format: :html5, attr_wrapper: '"'}

end



