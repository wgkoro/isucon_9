FROM ruby:2.6.0

RUN mkdir /app

COPY . /app

WORKDIR /app/ruby

RUN gem install bundler
RUN bundle install

