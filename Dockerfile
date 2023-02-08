FROM ruby:3.0.2

RUN mkdir /cashregister_backend
WORKDIR /cashregister_backend

RUN gem install bundler