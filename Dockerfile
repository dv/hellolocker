FROM phusion/passenger-ruby22:0.9.15

# Enable passenger
RUN rm -f /etc/service/nginx/down

# Setup Rails app
WORKDIR /home/app

ADD Gemfile Gemfile.lock ./
RUN bundle

ADD . /home/app
RUN bundle exec whenever --update-crontab
