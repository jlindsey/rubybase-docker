# DOCKER-VERSION: 0.10.0
FROM phusion/baseimage
env DEBIAN_FRONTEND noninteractive

# Install basic things
RUN apt-get update
RUN apt-get -yq install build-essential libssl-dev libreadline-gplv2-dev \
  libxml2-dev libxslt1-dev libpq-dev git-core

# Install rbenv
RUN git clone https://github.com/sstephenson/rbenv.git /root/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build
ENV PATH /root/.rbenv/bin:/root/.rbenv/shims:$PATH

# Instally Ruby (+ gems)
RUN rbenv install 2.1.0 && rm -rf /tmp/*
RUN rbenv global 2.1.0
RUN gem install bundler --no-ri --no-rdoc
RUN rbenv rehash

# Clean up
RUN apt-get autoremove -y && apt-get clean
RUN rm -rf /tmp/*

