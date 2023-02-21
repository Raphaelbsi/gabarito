FROM ruby:latest

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN mkdir /gabarito

WORKDIR /gabarito

COPY Gemfile /gabarito/Gemfile

COPY Gemfile.lock /gabarito/Gemfile.lock

RUN bundle install

COPY . /gabarito/

