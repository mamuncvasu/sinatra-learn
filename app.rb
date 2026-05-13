require 'sinatra'
require 'sinatra/reloader'
# require 'securerandom'
# set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }

# set :sessions, :domain => 'mamuns.dev' # only session kaj korbe
set :environment, :production

get '/' do
  # 'Hello world!'
  erb :index
end

# using default layout
get '/posts' do
  erb :index
  # erb :index, :layout => :post
end

# using post_layout which use tailwind
get '/htmx' do
  erb :index_tailwind, :layout => :post_layout
end

not_found do
  '<h1> This is nowhere to be found.</h1>'
end
error do
  'Sorry there was a nasty error'
end
