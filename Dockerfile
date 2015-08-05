FROM phusion/passenger-ruby22:0.9.15

# Enable passenger
RUN rm -f /etc/service/nginx/down

# Setup Rails app
WORKDIR /home/app

RUN rm /etc/nginx/sites-enabled/default
ADD deploy/docker/nginx/rails-env.conf  /etc/nginx/main.d
ADD deploy/docker/nginx/hellolocker.com /etc/nginx/sites-enabled/hellolocker.com


ADD Gemfile Gemfile.lock ./
RUN bundle

ADD . /home/app
RUN bundle exec whenever --update-crontab
