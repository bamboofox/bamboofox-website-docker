FROM ruby:2.4.0
MAINTAINER bamboofox <nctucscbamboofox@gmail.com>

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN apt-get install -y imagemagick libmysqlclient-dev

RUN mkdir /home/bamboofox
COPY ./bamboofox-website /home/bamboofox/bamboofox-website
WORKDIR /home/bamboofox/bamboofox-website

RUN bundle install
RUN rake db:migrate

CMD rails server
