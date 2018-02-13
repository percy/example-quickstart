FROM gcr.io/percy-dev/github-enterprise-test:latest

ADD . /app/src
WORKDIR /app/src

CMD ruby /app/src/visual-tests.rb
