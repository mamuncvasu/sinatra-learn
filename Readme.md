# Sinatra Learn in -- Classic not Modular

## Hello World [ advanced: rerun gem diye auto restart]

    1) gem install rackup puma sinatra
    or, create Gemfile > bundle add rackup puma sinatra 
    2) create app.rb
          require 'sinatra'
          get '/' do
            'Hello world!'
          end
    
    3) ruby app.rb   or, ruby app.rb -e production
    
## Enable Sessions [ default : true ] --ok

    1) set :sessions, true
    2) enable  :sessions
    
## Enable Logging  [ default : true ] -- ok 
    
    1) set :logging, true  
    2) enable  :sessions, logging
    
 
## Enable Session and session security

    1) create random number: ruby -e "require 'securerandom'; puts SecureRandom.hex(64)"
    2) save as a key in .bashrc : 
    
        echo "export SESSION_SECRET=0d99dce1c3e838e19ed5fe70be19d5cd5f9e743cf5c78523a58355acc4edd3f0bbe3ea8e47c65b679212993a149eac5c4e3ac98da18b05799ed70ac29ac8efc2" >> ~/.bashrc
        
    3) call from app: 
    
        require 'securerandom'
        set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }
    
## config in 2 ways : set vs enable/disable
      
      way 01 : simple and short
      
          enable  :sessions, :logging
          disable :dump_errors, :some_custom_option
          
      way 02 : simple but verbose
      
          set :sessions, true
          set :logging, true
          set :dump_errors, false
          set :some_custom_option, false
          
## Enable/Disable attack protection [ session enable korle auto true]

    set :protection, :session => true
    
## Error route

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

## Layouts and templates
      
      1) in app.rb
            get '/' do
              erb :index
              #erb :index, :layout => :post
            end
            
      2) create default layout: views/layout.erb (like rails layouts)
          <html><%= yield %></html> 
            
      3) Create views file using that template: views/index.erb
      
              <img src="/image/1.jpg" class="img-fluid" alt="...">
              <h1> Welcome to Sinatra </h1>
      
## Htmx integration
## Static file directory [ edit : app.rb ] [ default : public]

    1) set :public_folder, '/var/www'   # "/var/www" folder
    2) set :public_folder, Proc.new { File.join(root, "static") }  # "static" folder
    
## Static file/ Image integration [actual=public/img..., url=/img]
    1) create and save image to: public/image/1.jpg
    2) call that image from UI:
          <img src="/image/1.jpg" class="img-fluid" alt="...">
    
## Tailwind CSS in public folder
    
## raw CRUD
## Active record/ orm CRUD
## Attachments
## session bind for domain : mamuns.dev
      way 01: run in production mode 
      way 02: set :sessions, :domain => 'mamuns.dev'

## htpps/ssl with puma 

## Set Production env --ok

    way 01 : ruby app.rb -e production | APP_ENV=production ruby app.rb
    Way 02: using app.rb
            set :environment, :production
            
## Auto ip/hostname bind  
      way 01: ruby app.rb -o 0.0.0.0 
      way 02: using app.rb 
            set :bind, '0.0.0.0'
            
##  Run Puma server  in multiple thread
## Run sinatra with rackup [ Problem :  env always development]
    1) create : config.ru
        require './app'
        run Sinatra::Application

    2) rackup -p 4567 
    
## Middleware [ https://sinatrarb.com/intro.html#rack-middleware ]

## Server run kore detach korbo kivabe?

## Dockerfile for dockerize

    1) create Dockerfile:
      # Source  : https://hub.docker.com/_/ruby
      FROM ruby:4.0.1
      RUN bundle config --global frozen 1
      WORKDIR /sinatra-app
      COPY Gemfile Gemfile.lock ./
      RUN bundle install
      COPY . .
      CMD ["ruby", "app.rb", "-e", "production", "-p", "4567"]
      
    2) docker build -t sinatra-app .       # image name "sinatra-app"
    3) docker run --name sinatra-app1 -p 4567:4567 -d sinatra-app:latest  # container name "sinatra-app1"
