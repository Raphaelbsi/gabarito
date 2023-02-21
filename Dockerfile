FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN mkdir /gabarito

WORKDIR /gabarito

COPY Gemfile /myapp/Gemfile

COPY Gemfile.lock /gabarito/Gemfile.lock

RUN bundle install

COPY . /gabarito/

