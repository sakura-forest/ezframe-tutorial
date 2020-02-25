FROM ruby:2.5.1
ENV LANG C.UTF-8

RUN apt-get update -qq && apt-get install -y build-essential && rm -rf /var/lib/apt/lists/*
RUN useradd -m appuser
RUN gem install bundler

RUN mkdir /work
WORKDIR /work
# RUN git clone git@github.com:sakura-forest/ezframe-tutorial.git
RUN git clone https://github.com/sakura-forest/ezframe-tutorial.git
WORKDIR /work/ezframe-tutorial/02_address_book
RUN bundle install --path vendor/bundle
RUN bundle exec rackup --port 3001
