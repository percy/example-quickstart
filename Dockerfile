FROM ruby:latest

ADD . /app/src
WORKDIR /app/src

RUN bundle install

CMD ruby /app/src/visual-tests.rb
