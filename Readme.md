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
## Htmx integration
## Static file directory [ edit : app.rb ] [ default : public]

    1) set :public_folder, '/var/www'   # "/var/www" folder
    2) set :public_folder, Proc.new { File.join(root, "static") }  # "static" folder
    
## Tailwind CSS in public folder
    
## raw CRUD
## Active record/ orm CRUD
## session bind for domain : mamuns.dev
      way 01: run in production mode 
      way 02: set :sessions, :domain => 'mamuns.dev'

## htpps/ssl with puma 
## Auto rerun server in development  -- not tested yet

    1)gem install shotgun
    2)shotgun app.rb  
    
    or,
    1)gem install rerun
    2)rerun ruby app.rb
   
    
## Set Production env --ok

    way 01 : ruby app.rb -e production | APP_ENV=production ruby app.rb
    Way 02: using app.rb
            set :environment, :production
            
## Auto ip/hostname bind  
      way 01: ruby app.rb -o 0.0.0.0 
      way 02: using app.rb 
            set :bind, '0.0.0.0'
##  Run Puma server  in multiple thread
## Middleware [ https://sinatrarb.com/intro.html#rack-middleware ]
## Dockerfile for dockerize
