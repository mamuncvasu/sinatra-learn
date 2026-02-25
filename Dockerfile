# Source  : https://hub.docker.com/_/ruby
FROM ruby:4.0.1
# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1
WORKDIR /sinatra-app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
CMD ["ruby", "app.rb", "-e", "production", "-p", "4567"]

#Build
## docker build -t sinatra-app .
## Run
## docker run --name sinatra-app1 -p 4567:4567 -d sinatra-app:latest
