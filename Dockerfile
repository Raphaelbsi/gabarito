FROM ruby:latest

RUN apt-get update -qq && apt-get install -y build-essential yarn libpq-dev nodejs

RUN mkdir /gabarito

WORKDIR /gabarito

COPY Gemfile /gabarito/Gemfile

COPY Gemfile.lock /gabarito/Gemfile.lock

RUN bundle install

ADD . /gabarito

