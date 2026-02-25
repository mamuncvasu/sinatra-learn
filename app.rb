require 'sinatra'
# require 'securerandom'
# set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }

# set :sessions, :domain => 'mamuns.dev' # only session kaj korbe


get '/' do
  # 'Hello world!'
  "Hello World - Auto-reloaded!"
end

# Layout
get '/posts' do
  erb :index, :layout => :post
end

not_found do
  '<h1> This is nowhere to be found.</h1>'
end
error do
  'Sorry there was a nasty error'
end
error 403 do
  'Access forbidden'
end
error 400..510 do
  'Boom'
end
