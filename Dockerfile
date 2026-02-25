# FROM ruby:3.2-slim
# WORKDIR /app
# COPY Gemfile Gemfile.lock ./
# RUN bundle install
# COPY . .
# EXPOSE 4567
# CMD ["ruby", "app.rb", "-e", "production"]


# Source : https://github.com/tongueroo/sinatra/blob/master/Dockerfile
FROM ruby:3.0.2

WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install --system
ADD . /app
RUN bundle install --system
EXPOSE 4567
CMD ["ruby", "app.rb", "-e", "production"]
